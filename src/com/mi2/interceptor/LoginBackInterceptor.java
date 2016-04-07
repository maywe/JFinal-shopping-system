package com.mi2.interceptor;

import com.base.ctrl.BaseController;
import com.base.interceptor.BaseInterceptor;
import com.base.vo.ErrorVo;
import com.jfinal.aop.Invocation;

import javax.servlet.http.HttpSession;

/**
 * 管理后台用户登录拦截器
 */
public class LoginBackInterceptor extends BaseInterceptor{

	public void doIntercept(Invocation inv){
		HttpSession session = inv.getController().getRequest().getSession(false);
		if (null==session || null==session.getAttribute(BaseController.LOGIN_BACK_USER)) {
			System.out.println("getActionKey="+inv.getControllerKey());
			//判断请求是否是ajax请求
			String requestType = inv.getController().getRequest().getHeader("X-Requested-With");
			if(null == requestType){
				inv.getController().render(BaseController.VIEW_BACK_PATH+"/login.html");
			}else{
				inv.getController().renderJson(new ErrorVo(99,"请您先登录!"));
			}
		}else {
			inv.invoke();
		}
	}
}