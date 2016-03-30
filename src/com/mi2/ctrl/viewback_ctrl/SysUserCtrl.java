package com.mi2.ctrl.viewback_ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseViewBackController;
import com.base.vo.ErrorVo;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.upload.UploadFile;
import com.mi2.interceptor.LoginBackInterceptor;
import com.mi2.model.SysRoleGroup;
import com.mi2.model.UsersBackstage;

/**
 * 系统用户管理
 *
 * @author ChenMW 2016-03-07 21:51
 */
@RouteBind(path="/sysUserCtrl")
@Before(LoginBackInterceptor.class)
public class SysUserCtrl extends BaseViewBackController {

    @Override
    public void showRequest() {
        this.setAttr("command","showRequest");
        UsersBackstage usersBackstage = this.getModel(UsersBackstage.class);
        this.setAttr("sysRoleGroupList",SysRoleGroup.dao.getAllData(new SysRoleGroup()));
        this.setAttr("usersBackstage",UsersBackstage.dao.findById(usersBackstage.getUsersBackstageId()));
        this.render(VIEW_BACK_PATH+"/sysManage/sysUserDialog.jsp");
    }

    @Override
    public void addRequest() {
        this.setAttr("command","addRequest");
        this.setAttr("sysRoleGroupList",SysRoleGroup.dao.getAllData(new SysRoleGroup()));
        this.setAttr("usersBackstage",this.getModel(UsersBackstage.class));
        this.render(VIEW_BACK_PATH+"/sysManage/sysUserDialog.jsp");
    }

    @Override
    public Boolean addData() {
        new UsersBackstage()._setAttrs(this.getModel(UsersBackstage.class)).save();
        this.renderJson(new ErrorVo(0,"新增系统用户成功!"));
        return true;
    }

    public Boolean addFilesData(){
        UploadFile uploadFile = this.getFile("usersBackstageImg",UPLOAD_IMAGES_USERS_BACK_PATH);
        UsersBackstage usersBackstage = getModel(UsersBackstage.class);
        usersBackstage.setImg(UPLOAD_PATH + UPLOAD_IMAGES_OTHER_PATH + "/" + uploadFile.getFileName());
        usersBackstage.save();
        this.renderJson(new ErrorVo(0,"新增系统用户成功!"));
        return true;
    }

    @Override
    public void updateRequest() {
        this.setAttr("command","updateRequest");
        UsersBackstage usersBackstage = this.getModel(UsersBackstage.class);
        this.setAttr("usersBackstage",UsersBackstage.dao.findById(usersBackstage.getUsersBackstageId()));
        this.setAttr("sysRoleGroupList",SysRoleGroup.dao.getAllData(new SysRoleGroup()));
        this.render(VIEW_BACK_PATH+"/sysManage/sysUserDialog.jsp");
    }

    @Override
    public Boolean updateData() {
        new UsersBackstage()._setAttrs(this.getModel(UsersBackstage.class)).update();
        this.renderJson(new ErrorVo(0,"更新系统用户成功!"));
        return true;
    }

    public Boolean updateFilesData(){
        UploadFile uploadFile = this.getFile("usersBackstageImg",UPLOAD_IMAGES_USERS_BACK_PATH);
        UsersBackstage usersBackstage = getModel(UsersBackstage.class);
        usersBackstage.setImg(UPLOAD_PATH + UPLOAD_IMAGES_OTHER_PATH + "/" + uploadFile.getFileName());
        usersBackstage.update();
        this.renderJson(new ErrorVo(0,"更新系统用户成功!"));
        return true;
    }

    @Override
    public Boolean deleteData() {
        try{
            new UsersBackstage()._setAttrs(this.getModel(UsersBackstage.class)).delete();
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
        UsersBackstage usersBackstage = this.getModel(UsersBackstage.class);
        usersBackstage.put("search_key",this.getPara("search_key"));
        Page pageUtil = UsersBackstage.dao.getAllDataByPage(this.getParaToInt("pageNumber",pageNumber),this.getParaToInt("pageSize",pageSize),usersBackstage);
        this.setAttr("usersBackstage",usersBackstage);
        this.setAttr(PAGE_UTIL,pageUtil);
        this.setAttr("sysRoleGroupList",SysRoleGroup.dao.getAllData(new SysRoleGroup()));
        this.renderJsp(VIEW_BACK_PATH+"/sysManage/sysUserList.jsp");
    }

    @Override
    public void getAllData() {

    }
}
