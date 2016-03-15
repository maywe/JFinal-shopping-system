package com.mi2.ctrl.viewback_ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseController;
import com.jfinal.aop.Before;
import com.mi2.interceptor.LoginBackInterceptor;
import com.mi2.model.SysMenu;
import com.mi2.model.UsersBackstage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 后台主框架控制器
 *
 * @author ChenMW 2016-02-22 17:00
 */
@RouteBind(path="/mainCtrl")
@Before(LoginBackInterceptor.class)
public class MainCtrl extends BaseController{

    //进入后台
    public void goViewBack(){
        UsersBackstage usersBackstage = this.getSessionAttr(LOGIN_BACK_USER);
        if("remember_me".equals(usersBackstage.getStr("remember_me"))) {
            this.setCookie("sysUserName",usersBackstage.getSysUserName(),1000,"/");
            this.setCookie("sysUserPassword",usersBackstage.getSysUserPassword(),1000,"/");
            this.setCookie("sysImg",usersBackstage.getIMG(),1000,"/");
        }
        this.render(VIEW_BACK_PATH+"/main.html");
    }

    //获取后台初始化数据
    public void initViewBack(){
        //用户菜单数据
        UsersBackstage usersBackstage = this.getSessionAttr(LOGIN_BACK_USER);
        List<SysMenu> userMenuList = SysMenu.dao.getUserMenuList(usersBackstage.getRoleGroupId());
        //主页显示数据
        Map<String,Object> data = new HashMap<>();
        data.put("usersBackstage",usersBackstage);
        data.put("userMenuList",userMenuList);
        this.renderJson(data);
    }
}
