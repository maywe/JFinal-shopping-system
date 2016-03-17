package com.mi2.ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseController;
import com.base.vo.ErrorVo;
import com.mi2.model.UsersBackstage;

import java.util.List;

/**
 * 前后台登录控制器
 *
 * @author ChenMW 2016-02-17 16:44
 */
@RouteBind(path="/loginCtrl")
public class LoginCtrl extends BaseController{

    //后台登录
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

    //后台安全退出
    public void loginOutBack(){
        this.getSession().invalidate();
        this.renderJson(new ErrorVo(99,"退出登录成功!"));
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
