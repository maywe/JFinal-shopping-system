package com.mi2.ctrl.viewfront_ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseViewFrontController;

@RouteBind(path="/")
public class IndexCtrl extends BaseViewFrontController {

	public void index(){
		this.render(VIEW_FRONT_PATH+"/index.jsp");
	}

}
