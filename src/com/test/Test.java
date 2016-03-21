package com.test;

import com.mi2.model.Goods;

import java.lang.reflect.Field;
import java.util.List;

/**
 * 测试类
 *
 * @author ChenMW 2016-03-07 0:27
 */
public class Test {
    public static void main(String [] args){
        /*
        String regex = "((?!.*Request.*).*save.*|(?!.*Request.*).*update.*|(?!.*Request.*).*add.*|(?!.*Request.*).*delete.*)";
        System.out.println("saveRequest".matches(regex));
        System.out.println("saveAequest".matches(regex));
        System.out.println();
        System.out.println("updateRequest".matches(regex));
        System.out.println("updateAequest".matches(regex));
        System.out.println();
        System.out.println("addRequest".matches(regex));
        System.out.println("addAequest".matches(regex));
        System.out.println();
        System.out.println("deleteRequest".matches(regex));
        System.out.println("deleteAequest".matches(regex));
        */

        /*
        Boolean bo1 = false;
        Boolean bo2 = null;
        String str = null;

        test(bo1);
        test(bo2);
        test(str);

        MyBaseModelGenerator m = new MyBaseModelGenerator("","");
        MyBaseModelGenerator m2 = new MyBaseModelGenerator("","","");
*/
        //getAllData(null);

        String str = "2";
        Goods g = new Goods();
        g.setGoodsName("fff");
        testStr(str,g);
        System.out.println(str);
        System.out.println(g.getGoodsName());
    }


    public static void testStr(String str,Goods g){
        str = "123";
        g.setGoodsName("2222");
    }

    public static void test (Object obj){
        System.out.println(obj instanceof Boolean);
    }


    public static List<Goods> getAllData(Goods t){

        try {
            t.getClass().newInstance();
            t.getClass().getDeclaredFields();
            Field field = t.getClass().getField("TABLE_NAME");
            System.out.println(field.get(t));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
