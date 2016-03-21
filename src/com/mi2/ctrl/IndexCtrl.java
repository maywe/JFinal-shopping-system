package com.mi2.ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseController;

@RouteBind(path="/")
public class IndexCtrl extends BaseController {

	public void index(){
		this.render(VIEW_BACK_PATH+"/login.html");
	}

}
