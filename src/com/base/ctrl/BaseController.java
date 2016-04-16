package com.base.ctrl;

import com.base.util.BeanUtils;
import com.jfinal.core.Controller;
import com.jfinal.render.JsonRender;
import org.apache.log4j.Logger;

import java.util.*;


/**
 * 基础Controller
 */
public abstract class BaseController extends Controller {

	//1、前后台视图路径
	public static final String VIEW_BACK_PATH = "/view/viewback";
	public static final String VIEW_FRONT_PATH = "/view/viewfront";

	//2、前后台用户登录用户信息Session名称
	public static final String LOGIN_BACK_USER = "usersBackstage";
	public static final String LOGIN_FRONT_USER = "usersFront";

	//3、前后台上传下载路径
	public static final String UPLOAD_PATH = "/upload";
	public static final String DOWNLOAD_PATH = "/download";

	//4、商品图片保存路径
	public static final String UPLOAD_IMAGES_PHONE_PATH = "/images/goods/phone";
	public static final String UPLOAD_IMAGES_OTHER_PATH = "/images/goods/other";

	//5、用户图片保存路径
	public static final String UPLOAD_IMAGES_USERS_BACK_PATH = "/images/users/back";
	public static final String UPLOAD_IMAGES_USERS_FRONT_PATH = "/images/users/front";


	//5、前后台分页参数
	public static final String PAGE_UTIL = "pageUtil";
	protected Integer pageNumber = 1;
	protected Integer pageSize = 30;

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

	protected Map<Integer,Map<String, String>> getParaToMapList(String name){
		Map<Integer,Map<String, String>> mapList = new HashMap<>();
		Enumeration<String> e = this.getParaNames();
		if (e.hasMoreElements()) {
			while (e.hasMoreElements()) {
				String ename = e.nextElement();
				if (ename.startsWith(name)&&ename.contains("[")){
					int index = Integer.parseInt(ename.substring(ename.indexOf("[")+1,ename.indexOf("]")));
					String key = ename.substring(ename.lastIndexOf("[")+1,ename.lastIndexOf("]"));
					String value = this.getPara(ename);
					Map<String, String> map = mapList.get(index);
					if(null==map || map.isEmpty()){
						map = new HashMap<>();
						map.put(key,value);
						mapList.put(index,map);
					}else{
						mapList.get(index).put(key,value);
					}
				}
			}
		}
		return mapList;
	}

	protected List<Map<String,String>> getParaToList(String name){
		List<Map<String, String>> list = new ArrayList<>();
		Map<Integer,Map<String, String>> mapList = this.getParaToMapList(name);
		for(Map.Entry<Integer, Map<String, String>> entry : mapList.entrySet()){
			list.add(entry.getValue());
		}
		return list;
	}

	protected <M> List<M> getParaToModelList(String name,Class<M> modelClass){
		List<M> list = new ArrayList<>();
		Map<Integer,Map<String, String>> mapList = this.getParaToMapList(name);
		for (Map.Entry<Integer, Map<String, String>> entry : mapList.entrySet()) {
			list.add(BeanUtils.setMapValuesToModel(entry.getValue(),modelClass));
		}
		return list;
	}
}

