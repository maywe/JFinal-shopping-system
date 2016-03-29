package com.base.util;

import com.jfinal.plugin.activerecord.Model;

import java.io.Reader;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.Map;

/**
 * bean工具类，反射
 *
 * @author ChenMW 2016-03-03 9:39
 */
public class BeanUtils {

    public static <T> T setMapValuesToModel(Class<T> cls,Map<String ,Object> paramValues) {
        try {
            //1、传入cls的类类型进行实例化
            T obj = cls.newInstance();
            if (!(obj instanceof Model)) {
                throw new IllegalArgumentException("getModel only support class of Model, using getBean for other class.");
            }

            //2、获得该类所有的方法，并且遍历
            Method methods[] = cls.getSuperclass().getDeclaredMethods();
            //Method methods[] = cls.getMethods();
            for(Method m : methods){
                //3、选出VO对象中set开头的方法
                String methodName = m.getName();
                if(methodName.startsWith("set")){

				/*
				 	确定方法的三个一致：参数个数，参数类型，参数顺序
					在反射调用方法，不能保证从Map中取出来的值与方法的参数类型完全一致，
					会产生argument type mismatch 参数类型不匹配的错误
					所以这里需要判断方法的参数类型，将Map中取出来的值转成匹配的数据类型
					m.invoke(obj, value);
				*/

                    //4、判断传入参数的个数和类型，保证合法参数正确的映射进VO对象
                    //获取参数列表类型
                    Class parameterTypes[] = m.getParameterTypes();
                    //判断set方法的参数合理性
                    if(parameterTypes != null && parameterTypes.length == 1){

                        //将方法命中的set去掉,得到方法名的后半段（就是我们的列名，然后把后半段全部转换成小写,也就是map中的键）
                        //String key = methodName.replace("set", "");
                        //String mapKey = key.replace(key.charAt(0),(char)(key.charAt(0)+32));
                        String mapKey = methodName.replace("set","").toUpperCase();
                        //通过 键（在这里就是列名）把相应的 值 取出（把列名所对应的值取出）
                        Object mapValue = null;
                        for(String key : paramValues.keySet()){
                            if(mapKey.equals(key.replace("_","").toUpperCase())){
                                mapValue = paramValues.get(key);
                                break;
                            }
                        }

                        //获取set方法参数的类型名
                        String methodParamTypeName = parameterTypes[0].getName();

                        //当键所对应的值不为空时
                        if(mapValue != null){
                            //5、判断参数的类型，处理map中的值并映射进VO中

                            //当判断set方法参数的类型为String类型时
                            if(methodParamTypeName.equals("java.lang.String")){
                                //判断map中取出的值是否为oracle.sql.CLOB类型
                                if(mapValue instanceof oracle.sql.CLOB){
                                    oracle.sql.CLOB clob =(oracle.sql.CLOB)mapValue;
                                    Reader reader = null;
                                    try {
                                        //获得字符流
                                        reader = clob.getCharacterStream();
                                        char[] cbuf = new char[1024];
                                        int len =-1;
                                        //字符串缓存类
                                        StringBuffer sb = new StringBuffer();
                                        while((len = reader.read(cbuf))!= -1){
                                            String str = new String(cbuf,0,len);
                                            sb.append(str);
                                        }
                                        m.invoke(obj,sb.toString());
                                    } catch (SQLException e) {
                                        e.printStackTrace();
                                    } finally{
                                        Release.close(reader);
                                    }
                                }else{
                                    //将值映射进vo
                                    m.invoke(obj, mapValue.toString());
                                }

                                //当判断set方法参数的类型为int类型时
                            }else if(methodParamTypeName.equals("int") || methodParamTypeName.equals("java.lang.Integer")){

                                if(mapValue instanceof String){

                                    if(mapValue.toString().matches("[0-9]+")){
                                        m.invoke(obj, Integer.parseInt(mapValue.toString()));
                                    }

                                }else if(mapValue instanceof Integer ){
                                    m.invoke(obj, mapValue);
                                }else if (mapValue instanceof BigDecimal){
                                    //强转
                                    BigDecimal bg = (BigDecimal)mapValue;
                                    m.invoke(obj,bg.intValue());
                                }

                                //当判断set方法参数的类型为double类型时
                            }else if(methodParamTypeName.equals("double") || methodParamTypeName.equals("java.lang.Double")){

                                if(mapValue instanceof String){
                                    if(mapValue.toString().matches("[0-9]+([.][0-9]+)?")){
                                        m.invoke(obj, Double.valueOf(mapValue.toString()));
                                    }
                                }else if(mapValue instanceof Double){
                                    m.invoke(obj, mapValue);
                                }else if (mapValue instanceof BigDecimal){
                                    //强转
                                    BigDecimal bg = (BigDecimal)mapValue;
                                    m.invoke(obj,bg.doubleValue());
                                }

                                //当判断set方法参数的类型为float类型时
                            }else if(methodParamTypeName.equals("float") || methodParamTypeName.equals("java.lang.Float")){

                                if(mapValue instanceof String){
                                    if(mapValue.toString().matches("[0-9]+([.][0-9]+)?")){
                                        m.invoke(obj, Float.valueOf(mapValue.toString()));
                                    }
                                }else if(mapValue instanceof Float){
                                    m.invoke(obj, mapValue);
                                }else if (mapValue instanceof BigDecimal){
                                    //强转
                                    BigDecimal bg = (BigDecimal)mapValue;
                                    m.invoke(obj,bg.floatValue());
                                }
                                //当判断set方法参数的类型为java.util.Date类型时
                            }else if(methodParamTypeName.equals("java.util.Date")){

                                if(mapValue instanceof String){
                                    if(mapValue.toString().matches("[0-9]{4}([ ]|[-])[0-1][0-9]([ ]|[-])[0-3][0-9]")){
                                        m.invoke(obj, DateUtils.strToUtilDate(String.valueOf(mapValue), DateUtils.DATE));
                                    }
                                }else if(mapValue instanceof java.util.Date){
                                    m.invoke(obj, mapValue);
                                }else if(mapValue instanceof java.sql.Date ){
                                    //强转
                                    java.sql.Date utilDate = (java.sql.Date)mapValue;
                                    //util.Date转成utilDate
                                    java.util.Date Sdate = new java.util.Date(utilDate.getTime());
                                    m.invoke(obj,Sdate);
                                }

                                //当判断set方法参数的类型为java.sql.Date类型时
                            }else if(methodParamTypeName.equals("java.sql.Date")){
                                if(mapValue instanceof String){
                                    if(mapValue.toString().matches("[0-9]{4}([ ]|[-])[0-1][0-9]([ ]|[-])[0-3][0-9]")){
                                        m.invoke(obj, DateUtils.strToSqlDate(String.valueOf(mapValue), DateUtils.DATE));
                                    }
                                }else if(mapValue instanceof java.sql.Date){
                                    m.invoke(obj, mapValue);
                                }else if(mapValue instanceof java.util.Date ){
                                    //强转
                                    java.util.Date utilDate = (java.util.Date)mapValue;
                                    //util.Date转成sqlDate
                                    java.sql.Date Sdate = new java.sql.Date(utilDate.getTime());
                                    m.invoke(obj,Sdate);
                                }

                                //当判断set方法参数的类型为java.sql.Timestamp类型时
                            }else if(methodParamTypeName.equals("java.sql.Timestamp")){

                                if(mapValue instanceof java.sql.Timestamp){
                                    m.invoke(obj, mapValue);
                                }
                                if(mapValue instanceof java.sql.Date){
                                    m.invoke(obj, DateUtils.strToSqlDate(String.valueOf(mapValue), DateUtils.DATE_TIME));
                                }
                                //当判断set方法参数的类型为boolean/java.lang.Boolean类型时
                            }else if(methodParamTypeName.equals("boolean") || methodParamTypeName.equals("java.lang.Boolean")){
                                //如果是字符串，就判断equals true false
                                if(mapValue instanceof String){
                                    if (mapValue.equals("true")){
                                        m.invoke(obj,true);
                                    }else if (mapValue.equals("false")){
                                        m.invoke(obj,false);
                                    }
                                }else if (mapValue instanceof Boolean){
                                    m.invoke(obj,mapValue);
                                }
                            }
                        }
                    }
                }
            }
            return obj;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public static <T> T setMapValuesToModel(Map<String,String> paramValues,Class<T> cls){
        try{
            //1、传入cls的类类型进行实例化
            T obj = cls.newInstance();
            if (!(obj instanceof Model)) {
                throw new IllegalArgumentException("getModel only support class of Model, using getBean for other class.");
            }
            //2、获得该类所有的方法，并且遍历
            Method methods[] = cls.getSuperclass().getDeclaredMethods();
            //Method methods[] = cls.getDeclaredMethods();
            for(Method m : methods){
                //3、选出VO对象中set开头的方法
                String methodName = m.getName();
                if(methodName.startsWith("set")){
                    /*
                        确定方法的三个一致：参数个数，参数类型，参数顺序
                        在反射调用方法，不能保证从Map中取出来的值与方法的参数类型完全一致，
                        会产生argument type mismatch 参数类型不匹配的错误
                        所以这里需要判断方法的参数类型，将Map中取出来的值转成匹配的数据类型
                        m.invoke(obj, value);
                    */
                    //4、判断传入参数的个数和类型，保证合法参数正确的映射进VO对象
                    Class parameterTypes[] = m.getParameterTypes();
                    if(parameterTypes != null && parameterTypes.length == 1){
                        String mapKey = methodName.replace("set","").toUpperCase();
                        String mapValue = null;
                        for(String key : paramValues.keySet()){
                            if(mapKey.equals(key.replace("_","").toUpperCase())){
                                mapValue = paramValues.get(key);
                                break;
                            }
                        }
                        String methodParamTypeName = parameterTypes[0].getName();
                        if(mapValue != null){
                            if(methodParamTypeName.equals("java.lang.String")){
                                m.invoke(obj, mapValue);
                            }else if(methodParamTypeName.equals("java.math.BigDecimal")){
                                if(mapValue.matches("[0-9]+([.][0-9]+)?")){
                                    m.invoke(obj, BigDecimal.valueOf(Long.valueOf(mapValue)));
                                }
                            }else if(methodParamTypeName.equals("int") || methodParamTypeName.equals("java.lang.Integer")){
                                if(mapValue.matches("[0-9]+")){
                                    m.invoke(obj, Integer.parseInt(mapValue));
                                }
                            }else if(methodParamTypeName.equals("double") || methodParamTypeName.equals("java.lang.Double")){
                                if(mapValue.matches("[0-9]+([.][0-9]+)?")){
                                    m.invoke(obj, Double.valueOf(mapValue));
                                }
                            }else if(methodParamTypeName.equals("float") || methodParamTypeName.equals("java.lang.Float")){
                                if(mapValue.matches("[0-9]+([.][0-9]+)?")){
                                    m.invoke(obj, Float.valueOf(mapValue));
                                }
                            }else if(methodParamTypeName.equals("java.util.Date")){
                                if(mapValue.matches("[0-9]{4}([ ]|[-])[0-1][0-9]([ ]|[-])[0-3][0-9]")){
                                    m.invoke(obj, DateUtils.strToUtilDate(mapValue, DateUtils.DATE));
                                }
                            }else if(methodParamTypeName.equals("java.sql.Date")){
                                if(mapValue.matches("[0-9]{4}([ ]|[-])[0-1][0-9]([ ]|[-])[0-3][0-9]")){
                                    m.invoke(obj, DateUtils.strToSqlDate(mapValue, DateUtils.DATE));
                                }
                            }else if(methodParamTypeName.equals("java.sql.Timestamp")){
                                m.invoke(obj, DateUtils.strToSqlDate(mapValue, DateUtils.DATE_TIME));
                            }else if(methodParamTypeName.equals("boolean") || methodParamTypeName.equals("java.lang.Boolean")){
                                if (mapValue.equals("true")){
                                    m.invoke(obj,true);
                                }else if (mapValue.equals("false")){
                                    m.invoke(obj,false);
                                }
                            }
                        }
                    }
                }
            }
            return obj;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
