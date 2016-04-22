package com.mi2.interceptor;

import com.base.ctrl.BaseController;
import com.base.ctrl.BaseViewFrontController;
import com.base.interceptor.BaseInterceptor;
import com.base.vo.ErrorVo;
import com.jfinal.aop.Invocation;
import com.jfinal.kit.StrKit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 管理前台用户登录拦截器
 */
public class LoginFrontInterceptor extends BaseInterceptor{

	public void doIntercept(Invocation inv){
		HttpSession session = inv.getController().getRequest().getSession(false);
		System.out.println("getActionKey="+inv.getControllerKey());
		if (null==session || null==session.getAttribute(BaseController.LOGIN_FRONT_USER)) {
			//判断请求是否是ajax请求
			String requestType = inv.getController().getRequest().getHeader("X-Requested-With");
			if(null == requestType){
				System.out.println(getRequestUrl(inv.getController().getRequest()));
				inv.getController().getRequest().getSession(true).setAttribute(BaseViewFrontController.REQUEST_URL,getRequestUrl(inv.getController().getRequest()));
				inv.getController().render(BaseController.VIEW_FRONT_PATH+"/login.jsp");
			}else{
				inv.getController().renderJson(new ErrorVo(99,"请您先登录!"));
			}
		}else {
			inv.invoke();
		}
	}

	public static String getRequestUrl(HttpServletRequest req) {
		String requestUrl = req.getRequestURL().toString();
		String queryParam = req.getQueryString();
		if (StrKit.notBlank(queryParam)) {
			requestUrl += "?" + queryParam;
		}
		return requestUrl;
	}
}