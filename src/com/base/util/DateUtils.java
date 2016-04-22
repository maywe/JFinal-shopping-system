package com.base.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * Util_Date.java: 日期格式转换工具类
 * @author CMW
 *
 */
public class DateUtils {

	//时间格式:年
	public static final String YEAR="yyyy";
	//时间格式:月
	public static final String MONTH="MM";
	//时间格式:日
	public static final String DAY="dd";
	//时间格式:年-月
	public static final String YEAR_MONTH="yyyy-MM";
	//时间格式:年-月-日
	public static final String DATE="yyyy-MM-dd";
	//时间格式: 年-月-日   时:分:秒
	public static final String DATE_TIME="yyyy-MM-dd HH:mm:ss";
	//时间格式:年月日时分秒
	public static final String DATE_TIME1="yyyyMMddHHmmss";
	//时间格式:年月日
	public static final String DATE_TIME2="yyyyMMdd";

	//时间格式:时分秒
	public static final String DATE_TIME4="HHmmss";

	//时间格式:时
	public static final String HOUR="HH";
	//时间格式:分
	public static final String MINUTE="mm";
	//时间格式:时:分:秒
	public static final String TIME="HH:mm:ss";
	//时间格式:月-日  时:分
	public static final String DATE_TIME3="MM-dd HH:mm";




	//将java.util.Date日期转换为固定格式的字符串
	public static String utilDateToStr(java.util.Date date,String pattern){

		//日期格式化类
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);

		return sdf.format(date);

	}

	public static java.util.Date thisUtilTime(){
		return strToUtilDate(utilDateToStr(thisTime(),DATE_TIME),DATE_TIME);
	}

	public static java.sql.Date thisSqlTime(){
		return java.sql.Date.valueOf(DateUtils.utilDateToStr(thisTime(),DATE));
	}


	//将java.sql.Date日期转换为固定格式的字符串
	public static String sqlDateToStr(java.sql.Date date,String pattern){
		//日期格式化类
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		return sdf.format(date);
	}


	//将字符串转换strDate为java.util.Date类型
	public static java.util.Date strToUtilDate(String strDate,String pattern){
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		try {
			//解析字符串的文本，生成 Date。
			Date date = sdf.parse(strDate);
			//返回
			return date;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}


	//将字符串strDate转换为java.sql.Date类型
	public static java.sql.Date strToSqlDate(String strDate,String pattern){
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		try {
			//util格式时间
			java.util.Date utilDate =  sdf.parse(strDate);
			//将util格式时间转化为sql格式的时间
			java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
			return sqlDate;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}


	//将java.util.Date类型的日期转换为java.util.Date类型的日期
	public static java.sql.Date utilDateToSqlDate(java.util.Date date,String pattern){
		String str = utilDateToStr(date,pattern);
		return strToSqlDate(str,pattern);
	}


	//将java.sql.Date类型的日期转换为java.util.Date类型的日期
	public static java.util.Date sqlDateToUtilDate(java.sql.Date date,String pattern){
		String str = sqlDateToStr(date,pattern);
		return strToUtilDate(str,pattern);
	}

	public static java.util.Date thisTime(){
		//获取当前系统时间
		return new Date();
	}

}


