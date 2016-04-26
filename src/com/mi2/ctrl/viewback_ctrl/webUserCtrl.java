package com.mi2.ctrl.viewback_ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseViewBackController;
import com.base.vo.ErrorVo;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.upload.UploadFile;
import com.mi2.interceptor.LoginBackInterceptor;
import com.mi2.model.UsersFront;

/**
 * 网站用户管理
 *
 * @author ChenMW 2016-04-25 21:51
 */
@RouteBind(path="/webUserCtrl")
@Before(LoginBackInterceptor.class)
public class WebUserCtrl extends BaseViewBackController {

    @Override
    public void showRequest() {
        this.setAttr("command","showRequest");
        UsersFront usersFront = this.getModel(UsersFront.class);
        this.setAttr("usersFront",UsersFront.dao.findById(usersFront.getUserFrontId()));
        this.render(VIEW_BACK_PATH+"/usersManage/webUserDialog.jsp");
    }

    @Override
    public void addRequest() {
        this.setAttr("command","addRequest");
        this.render(VIEW_BACK_PATH+"/usersManage/webUserDialog.jsp");
    }

    @Override
    public Boolean addData() {
        UsersFront usersFront = this.getModel(UsersFront.class);
        if(UsersFront.dao.getAllData(usersFront).size()>0){
            this.renderJson(new ErrorVo(1,"该账户已被注册!"));
            return false;
        }
        new UsersFront()._setAttrs(usersFront).save();
        this.renderJson(new ErrorVo(0,"新增网站用户成功!"));
        return true;
    }

    public Boolean addFilesData(){
        UploadFile uploadFile = this.getFile("usersFrontImg",UPLOAD_IMAGES_USERS_FRONT_PATH);
        UsersFront usersFront = getModel(UsersFront.class);
        usersFront.setImg(UPLOAD_PATH + UPLOAD_IMAGES_USERS_FRONT_PATH + "/" + uploadFile.getFileName());
        usersFront.save();
        this.renderJson(new ErrorVo(0,"新增网站用户成功!"));
        return true;
    }

    @Override
    public void updateRequest() {
        this.setAttr("command","updateRequest");
        UsersFront usersFront = this.getModel(UsersFront.class);
        this.setAttr("usersFront",UsersFront.dao.findById(usersFront.getUserFrontId()));
        this.render(VIEW_BACK_PATH+"/usersManage/webUserDialog.jsp");
    }

    @Override
    public Boolean updateData() {
        UsersFront ub = new UsersFront();
        ub._setAttrs(this.getModel(UsersFront.class)).update();
        this.renderJson(new ErrorVo(0,"更新网站用户成功!"));
        return true;
    }

    public Boolean updateFilesData(){
        UploadFile uploadFile = this.getFile("usersFrontImg",UPLOAD_IMAGES_USERS_FRONT_PATH);
        UsersFront usersFront = getModel(UsersFront.class);
        usersFront.setImg(UPLOAD_PATH + UPLOAD_IMAGES_USERS_FRONT_PATH + "/" + uploadFile.getFileName());
        usersFront.update();
        this.renderJson(new ErrorVo(0,"更新网站用户成功!"));
        return true;
    }

    @Override
    public Boolean deleteData() {
        try{
            new UsersFront()._setAttrs(this.getModel(UsersFront.class)).delete();
            this.renderJson(new ErrorVo(0,"删除用户成功!"));
            return true;
        }catch (Exception e){
            e.printStackTrace();
            this.renderJson(new ErrorVo(1,"删除失败，用户正在使用，不能删除!"));
            if(logger.isDebugEnabled()){
                logger.debug("删除失败，角色正在使用，不能删除!",e);
            }
            return false;
        }
    }

    @Override
    public void getDataByPage() {
        UsersFront usersFront = this.getModel(UsersFront.class);
        usersFront.put("search_key",this.getPara("search_key"));
        Page pageUtil = UsersFront.dao.getAllDataByPage(this.getParaToInt("pageNumber",pageNumber),this.getParaToInt("pageSize",pageSize),usersFront);
        this.setAttr("usersFront",usersFront);
        this.setAttr(PAGE_UTIL,pageUtil);
        this.renderJsp(VIEW_BACK_PATH+"/usersManage/webUserList.jsp");
    }

    @Override
    public void getAllData() {

    }

}
