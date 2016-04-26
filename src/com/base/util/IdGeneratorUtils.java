package com.base.util;

import java.util.Date;

/**
 * id生成器
 */
public class IdGeneratorUtils {

	//生成订单编号
	public static String generatorOrderId(){
		return "DD"+new Date().getTime()+"";
	}
}
