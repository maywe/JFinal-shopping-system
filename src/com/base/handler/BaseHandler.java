package com.base.handler;

import com.jfinal.handler.Handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 基础全局公共处理器
 *
 * @author ChenMW 2016-04-13 19:11
 */
public abstract class BaseHandler extends Handler {
    @Override
    public void handle(String target, HttpServletRequest request, HttpServletResponse response, boolean[] isHandled) {
        doHandle(target,request,response,isHandled);
    }

    public abstract void doHandle(String target, HttpServletRequest request, HttpServletResponse response, boolean[] isHandled);
}
