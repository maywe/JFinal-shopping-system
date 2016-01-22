package com.base.ctrl;

import java.util.ArrayList;
import java.util.List;

/**
 * 这是一个类
 * @author ChenMW
 */
public class Hello {
    private String name;
    private int age;

    public void par(boolean arg){
        System.out.println(arg);
        int[] a = new int[]{1,2,3};
        for (int i = 0; i < a.length; i++) {
            System.out.println(i);
            System.out.println(i);
        }

        List<Object> arr = new ArrayList<>();
        arr.add(1);
        for (int i = arr.size() - 1; i >= 0; i--) {
            System.out.println(arr.get(i));
        }


        //Test t = new Test();
        //Test t = new Test();

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }


}
