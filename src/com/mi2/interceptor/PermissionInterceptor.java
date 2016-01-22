package com.mi2.interceptor;

import com.base.interceptor.BaseInterceptor;
import com.base.util.IdGeneraterUtil;
import com.base.vo.SessionManager;
import com.jfinal.aop.Invocation;
import org.apache.log4j.Logger;

import java.util.HashSet;
import java.util.Set;

/**
 * 管理用户后台权限验证拦截器
 */
public class PermissionInterceptor extends BaseInterceptor{
	public Logger log=Logger.getLogger(this.getClass());
	protected static IdGeneraterUtil idGenerater = new IdGeneraterUtil();
	
	private static final Set<String> excludedActionKeys = new HashSet<String>();
	 
	  public static void addExcludedActionKey(String actionKey) {
		  excludedActionKeys.add(actionKey);
	  }
	  
	/** 获取当前系统操作人 */
	public void doIntercept(Invocation inv){
		if (!excludedActionKeys.contains(inv.getActionKey())) {
			if (inv.getController().getRequest().getSession(false) != null && inv.getController().getRequest().getSession().getAttribute("SessionVO") != null) {
				SessionManager.setSessionManger(inv.getController().getRequest());
			}
			if(inv.getController().getRequest().getSession(false)!=null && inv.getController().getRequest().getSession(false).getAttribute("SessionVO")==null){
				inv.getController().renderJson("{\"err\":9}");
	    		inv.getController().getRequest().getSession().invalidate();
	    		return;
			}
			if(inv.getController().getSession(false)==null || inv.getController().getSession().getAttribute("SessionVO")==null){
				//session中不存在值或不存在"sessionVO"对象,则表示已超时
   	   		    inv.getController().renderJson("{\"err\":9}");
	    		inv.getController().getRequest().getSession().invalidate();
	    		return;
	       }
	    }
	    inv.invoke();
	}
}