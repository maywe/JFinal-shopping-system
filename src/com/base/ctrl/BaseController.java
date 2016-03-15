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

	//判断浏览器类型
	protected void renderJsonToBrowser(Object json){
		String agent = getRequest().getHeader("User-Agent");
		if(agent.contains("MSIE"))
			this.render(new JsonRender(json).forIE());
		else{
			this.render(new JsonRender(json));
		}
	}
}
