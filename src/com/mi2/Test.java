package com.mi2;

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

        Boolean bo1 = false;
        Boolean bo2 = null;
        String str = null;

        test(bo1);
        test(bo2);
        test(str);
    }

    public static void test (Object obj){
        System.out.println(obj instanceof Boolean);
    }
}
