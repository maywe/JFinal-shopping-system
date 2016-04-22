package com.base.ctrl;

import com.mi2.model.UsersFront;

/**
 * 前台控制器公共父类
 * BaseViewFrontController
 */
public abstract class BaseViewFrontController extends BaseController {

    protected Integer pageSize = 32;

    public UsersFront getLoginUserFront(){
        return (UsersFront)this.getSession().getAttribute(BaseController.LOGIN_FRONT_USER);
    }

}
