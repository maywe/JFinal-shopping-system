package com.mi2.ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseController;

@RouteBind(path="/")
public class IndexCtrl extends BaseController {

	public void index(){
		this.render(VIEW_BACK_PATH+"/login.html");
	}

	@Override
	public void showRequest() {

	}

	@Override
	public void addRequest() {

	}

	@Override
	public Boolean addData() {
		return null;
	}

	@Override
	public void updateRequest() {

	}

	@Override
	public Boolean updateData() {
		return null;
	}

	@Override
	public Boolean deleteData() {
		return null;
	}

	@Override
	public void getDataByPage() {

	}

	@Override
	public void getAllData() {

	}
}
