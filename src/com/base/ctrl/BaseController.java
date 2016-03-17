package com.base.ctrl;

import com.jfinal.core.Controller;
import com.jfinal.render.JsonRender;
import org.apache.log4j.Logger;


/**
 * 基础Controller
 */
public abstract class BaseController extends Controller {

	public static final String VIEW_BACK_PATH = "/view/viewback";
	public static final String LOGIN_BACK_USER = "usersBackstage";
	public static final String VIEW_FRONT_PATH = "/view/viewfront";
	public static final String LOGIN_FRONT_USER = "";

	public static final String PAGE_UTIL = "pageUtil";

	protected Logger logger = Logger.getLogger(this.getClass());
	protected Integer pageNumber = 1;
	protected Integer pageSize = 50;

	/**
	 *  判断浏览器类型
	 */
	protected void renderJsonToBrowser(Object json){
		String agent = getRequest().getHeader("User-Agent");
		if(agent.contains("MSIE"))
			this.render(new JsonRender(json).forIE());
		else{
			this.render(new JsonRender(json));
		}
	}

	/**
	 * 定义Ctrl类所需实现的最基本的增，删除，改查的方法,在用户的请求中，
	 * 如果调用该接口中的方法，都需要经过用户权限验证会被最终调用
	 */
	public abstract void showRequest();
	public abstract void addRequest();
	public abstract Boolean addData();
	public abstract void updateRequest();
	public abstract Boolean updateData();
	public abstract Boolean deleteData();
	public abstract void getDataByPage();
	public abstract void getAllData();
}
