package com.base.util;

import com.jfinal.kit.StrKit;

import java.util.regex.Pattern;

/**
 * 字符串处理工具类
 *
 * @author ChenMW 2016-04-13 19:47
 */
public class StringUtils {

    //判断是否存在以某某结尾的匹配
    public static String isExistEndWithMatches(String str,String ...suffixs){
        if(StrKit.isBlank(str)){
            return null;
        }
        for(String suffix : suffixs){
            if(str.endsWith(suffix)){
                return suffix;
            }
        }
        return null;
    }

    //判断是否为数字
    public static boolean isNumber(String ...strs){
        Pattern pattern = Pattern.compile("[0-9]*");
        for(String str : strs){
            if(StrKit.isBlank(str)||!pattern.matcher(str).matches()){
                return false;
            }
        }
        return true;
    }
}
