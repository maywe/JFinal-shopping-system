package com.base.ctrl;

/**
 * 后台控制器公共父类
 * BaseViewBackController
 */
public abstract class BaseViewBackController extends BaseController {
	/**
	 * 定义后台Ctrl类所需实现的最基本的增，删除，改查的公共方法
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
