package com.mi2.ctrl.ctrl_viewfront;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseController;

@RouteBind(path="/")
public class IndexCtrl extends BaseController {

	public void index(){
		this.render("view/viewback/login.html");
	}
}
