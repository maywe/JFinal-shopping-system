package com.base.ctrl;

import com.jfinal.core.Controller;
import com.jfinal.render.JsonRender;
import org.apache.log4j.Logger;


/**
 * 基础Controller
 */
public abstract class BaseController extends Controller {

	//1、前后台视图路径
	public static final String VIEW_BACK_PATH = "/view/viewback";
	public static final String VIEW_FRONT_PATH = "/view/viewfront";

	//2、前后台用户登录用户信息Session名称
	public static final String LOGIN_BACK_USER = "usersBackstage";
	public static final String LOGIN_FRONT_USER = "";

	//3、前后台上传下载路径
	public static final String UPLOAD_PATH = "/upload";
	public static final String DOWNLOAD_PATH = "/download";

	//4、商品图片保存路径
	public static final String UPLOAD_IMAGES_PHONE_PATH = "/images/phone";
	public static final String UPLOAD_IMAGES_PHONE_ACCESSORIES_PATH = "/images/phone_accessories";
	public static final String UPLOAD_IMAGES_LIFE_PATH = "/images/life";

	//5、前后台分页参数
	public static final String PAGE_UTIL = "pageUtil";
	protected Integer pageNumber = 1;
	protected Integer pageSize = 50;

	//6、前后台日志记录
	protected Logger logger = Logger.getLogger(this.getClass());


	//7、前后台公用方法
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
}
