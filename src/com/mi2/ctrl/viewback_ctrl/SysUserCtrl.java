package com.mi2.ctrl.viewback_ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseViewBackController;
import com.base.util.DateUtils;
import com.base.util.Release;
import com.base.vo.ErrorVo;
import com.jfinal.aop.Before;
import com.jfinal.kit.PathKit;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.upload.UploadFile;
import com.mi2.interceptor.LoginBackInterceptor;
import com.mi2.model.SysRoleGroup;
import com.mi2.model.UsersBackstage;
import sun.misc.BASE64Decoder;

import java.io.File;
import java.io.FileOutputStream;

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

    public void updateUserImageUploadRequest(){
        UsersBackstage usersBackstage = this.getSessionAttr(LOGIN_BACK_USER);
        this.setAttr("usersBackstage",usersBackstage);
        this.renderJsp(VIEW_BACK_PATH+"/sysManage/sysUserImageUploadDialog.jsp");
    }

    public Boolean updateUserImageUploadData(){
        String sysUserImageData = this.getPara("sysUserImageData");
        String imgPath = PathKit.getWebRootPath()+UPLOAD_PATH+UPLOAD_IMAGES_USERS_BACK_PATH;
        String imgName = "user_back_"+ DateUtils.thisTime().getTime()+".png";
        File imgFile = this.saveToImgByStr(sysUserImageData,imgPath,imgName);
        if(null==imgFile){
            this.renderJson(new ErrorVo(1,"更新头像失败!"));
            return false;
        }
        UsersBackstage usersBackstage = this.getSessionAttr(LOGIN_BACK_USER);
        usersBackstage.setImg(UPLOAD_PATH+UPLOAD_IMAGES_USERS_BACK_PATH+"/"+imgFile.getName());
        usersBackstage.update();
        this.renderJson(new ErrorVo(0,"更新头像成功!"));
        return true;
    }

    private File saveToImgByStr(String imgStr,String imgPath,String imgName) {
        //可以是任何图片格式.jpg,.png等
        File imgFile = new File(imgPath,imgName);
        if (StrKit.notBlank(imgStr, imgPath, imgName)) {
            //对字节数组字符串进行Base64解码并生成图片
            FileOutputStream fos= null;
            try {
                byte b[] = new BASE64Decoder().decodeBuffer(imgStr);
                for (int i = 0; i < b.length; i++) {
                    // 调整异常数据
                    if (b[i] < 0) {
                        b[i] += 256;
                    }
                }
                fos = new FileOutputStream(imgFile);
                fos.write(b);
                fos.flush();
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }finally {
                Release.close(fos);
            }
        }
        return imgFile;
    }
}
