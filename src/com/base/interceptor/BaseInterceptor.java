package com.base.interceptor;


import com.base.util.IdGeneratorUtils;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

/**
 * 基础拦截器父类
 */
public abstract class BaseInterceptor implements Interceptor {
	protected static IdGeneratorUtils idGenerater = new IdGeneratorUtils();
	public void intercept(Invocation inv) {
		doIntercept(inv);
	}
	public abstract void doIntercept(Invocation inv);
}