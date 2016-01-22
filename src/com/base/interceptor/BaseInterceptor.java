package com.base.interceptor;


import com.base.util.IdGeneraterUtil;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

/**
 * 基础拦截器父类
 */
public abstract class BaseInterceptor implements Interceptor {
	protected static IdGeneraterUtil idGenerater = new IdGeneraterUtil();
	public void intercept(Invocation inv) {
		doIntercept(inv);
	}
	public abstract void doIntercept(Invocation inv);
}