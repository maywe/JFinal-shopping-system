package com.base.ctrl;

/**
 * 此类中定义Ctrl类所需实现的最基本的增，删除，改查的方法,在用户的请求中，
 * 如果调用该接口中的方法，都需要经过用户权限验证会被最终调用
 * Created by ChenMW on 2016-03-02.
 */
public interface IMethodController {
    void showRequest();
    void addRequest();
    Boolean addData();
    void updateRequest();
    Boolean updateData();
    Boolean deleteData();
    void getDataByPage();
    void getAllData();
}