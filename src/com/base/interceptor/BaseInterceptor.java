package com.base.interceptor;


import com.base.util.IdGeneraterUtils;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

/**
 * 基础拦截器父类
 */
public abstract class BaseInterceptor implements Interceptor {
	protected static IdGeneraterUtils idGenerater = new IdGeneraterUtils();
	public void intercept(Invocation inv) {
		doIntercept(inv);
	}
	public abstract void doIntercept(Invocation inv);
}