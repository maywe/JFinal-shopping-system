package com.mi2.ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseController;
import com.base.plugin.MyCaptchaRender;
import com.base.vo.ErrorVo;
import com.jfinal.aop.Before;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.render.CaptchaRender;
import com.mi2.model.UsersBackstage;
import com.mi2.model.UsersFront;

import java.util.List;

/**
 * 前后台登录控制器
 *
 * @author ChenMW 2016-02-17 16:44
 */
@RouteBind(path="/loginCtrl")
public class LoginCtrl extends BaseController{

    //1、后台登录
    public void loginInBack(){
        UsersBackstage usersBackstage = this.getModel(UsersBackstage.class);
        List<UsersBackstage> usersBackstageList = UsersBackstage.dao.getAllData(usersBackstage);
        if(usersBackstageList.size()==0) {
            this.renderJson(new ErrorVo(1, "用户名或密码错误!"));
            return;
        }
        if(usersBackstageList.get(0).getSysUserPassword().equals(usersBackstage.getSysUserPassword())){
            if(!usersBackstageList.get(0).getStatus().equals("0")){
                this.renderJson(new ErrorVo(2,"该用户已被冻结,请联系客服!"));
                return;
            }
            if("remember_me".equals(this.getPara("remember_me"))){
                usersBackstageList.get(0).put("remember_me","remember_me");
            }
            this.setSessionAttr(LOGIN_BACK_USER,usersBackstageList.get(0));
            this.renderJson(new ErrorVo(0,"登录成功!"));
        }else{
            this.renderJson(new ErrorVo(1,"用户名或密码错误!"));
        }
    }

    //2、后台安全退出
    public void loginOutBack(){
        this.getSession().setAttribute(LOGIN_BACK_USER,null);
        this.renderJson(new ErrorVo(99,"退出登录成功!"));
    }

    //3、前台登录
    public void loginInFront(){
        UsersFront usersFront = this.getModel(UsersFront.class);
        List<UsersFront> usersFrontList = UsersFront.dao.getAllData(usersFront);
        if(usersFrontList.size()==0) {
            this.setAttr("errorMessage","用户名或密码错误!");
            this.renderJsp(VIEW_FRONT_PATH+"/login.jsp");
            return;
        }
        if(usersFrontList.get(0).getLoginName().equals(usersFront.getLoginName())){
            if(!usersFrontList.get(0).getUserStatus().equals("0")){
                this.setAttr("errorMessage","您的账户已被冻结,请联系客服!");
                this.renderJsp(VIEW_FRONT_PATH+"/login.jsp");
                return;
            }
            this.setSessionAttr(LOGIN_FRONT_USER,usersFrontList.get(0));
            this.forwardAction("/");
        }else{
            this.setAttr("errorMessage","用户名或密码错误!");
            this.renderJsp(VIEW_FRONT_PATH+"/login.jsp");
        }
    }

    //4、前台安全退出
    public void loginOutFront(){
        this.getSession().setAttribute(LOGIN_FRONT_USER,null);
        this.renderJsp(VIEW_FRONT_PATH+"/login.jsp");
    }

    //5、生成验证码
    public void generatorCaptcha(){
        this.render(new MyCaptchaRender());
    }

    //6、用户注册
    @Before(Tx.class)
    public Boolean registerFrontUser(){
        if(CaptchaRender.validate(this,"imageCodeVal")){
            this.setAttr("errorMessage","验证码不正确!");
            return false;
        }
        UsersFront usersFront = this.getModel(UsersFront.class);
        if(null==usersFront || StrKit.isBlank(usersFront.getLoginName())){
            this.setAttr("errorMessage","用户名不能为空!");
            return false;
        }
        List<UsersFront> usersFrontList = UsersFront.dao.getAllData(usersFront);
        if(usersFrontList.size()>0){
            this.setAttr("errorMessage","该用户名已被注册!");
            return false;
        }
        return true;
    }
}
