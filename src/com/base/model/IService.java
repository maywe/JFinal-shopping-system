package com.base.model;

import com.jfinal.plugin.activerecord.Page;

import java.util.List;

/**
 * Service层的公共父接口，该接口中定义Service层调用dao层的通用方法
 * @author CMW
 * @param <T>
 */
public interface IService<T> {
    List<T> getAllData(T t );
    Page<T> getAllDataByPage(int pageNumber, int pageSize, T t);
}