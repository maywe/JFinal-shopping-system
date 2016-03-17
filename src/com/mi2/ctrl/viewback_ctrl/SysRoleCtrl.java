package com.mi2.ctrl.viewback_ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseController;
import com.base.vo.ErrorVo;
import com.jfinal.aop.Before;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Page;
import com.mi2.interceptor.LoginBackInterceptor;
import com.mi2.model.SysMenu;
import com.mi2.model.SysRoleGroup;

import java.math.BigDecimal;
import java.util.List;

/**
 * 系统角色管理
 *
 * @author ChenMW 2016-03-02 16:32
 */
@RouteBind(path="/sysRoleCtrl")
@Before(LoginBackInterceptor.class)
public class SysRoleCtrl extends BaseController {

    @Override
    public void showRequest() {
        this.setAttr("command","showRequest");
        SysRoleGroup sysRoleGroup = this.getModel(SysRoleGroup.class);
        this.setAttr("sysRoleGroup",SysRoleGroup.dao.findById(sysRoleGroup.getRoleGroupId()));
        this.setAttr("sysMenuList", this.getSysMenuList(sysRoleGroup.getRoleGroupId()));
        this.render(VIEW_BACK_PATH+"/sysManage/sysRoleDialog.jsp");
    }

    @Override
    public void addRequest() {
        this.setAttr("command","addRequest");
        this.setAttr("sysMenuList",JsonKit.toJson(SysMenu.dao.getAllData(new SysMenu())));
        this.render(VIEW_BACK_PATH+"/sysManage/sysRoleDialog.jsp");
    }

    @Override
    public Boolean addData() {
        new SysRoleGroup().save(this.getModel(SysRoleGroup.class),this.getPara("menu_id"));
        this.renderJson(new ErrorVo(0,"新增角色成功!"));
        return true;
    }

    @Override
    public void updateRequest() {
        this.setAttr("command","updateRequest");
        SysRoleGroup sysRoleGroup = this.getModel(SysRoleGroup.class);
        this.setAttr("sysMenuList", this.getSysMenuList(sysRoleGroup.getRoleGroupId()));
        this.setAttr("sysRoleGroup",SysRoleGroup.dao.findById(sysRoleGroup.getRoleGroupId()));
        this.render(VIEW_BACK_PATH+"/sysManage/sysRoleDialog.jsp");
    }

    @Override
    public Boolean updateData() {
        new SysRoleGroup().update(this.getModel(SysRoleGroup.class),this.getPara("menu_id"));
        this.renderJson(new ErrorVo(0,"更新角色成功!"));
        return true;
    }

    @Override
    public Boolean deleteData() {
        try{
            new SysRoleGroup().delete(this.getModel(SysRoleGroup.class));
            this.renderJson(new ErrorVo(0,"删除角色成功!"));
            return true;
        }catch (Exception e){
            e.printStackTrace();
            this.renderJson(new ErrorVo(1,"删除失败，角色正在使用，不能删除!"));
            if(logger.isDebugEnabled()){
                logger.debug("删除失败，角色正在使用，不能删除!",e);
            }
            return false;
        }
    }

    @Override
    public void getDataByPage() {
        SysRoleGroup sysRoleGroup = this.getModel(SysRoleGroup.class);
        Page pageUtil = SysRoleGroup.dao.getAllDataByPage(this.getParaToInt("pageNumber",pageNumber),this.getParaToInt("pageSize",pageSize),sysRoleGroup);
        this.setAttr("sysRoleGroup",sysRoleGroup);
        this.setAttr(PAGE_UTIL,pageUtil);
        this.renderJsp(VIEW_BACK_PATH+"/sysManage/sysRoleList.jsp");
    }

    @Override
    public void getAllData() {

    }

    //转换系统菜单，体现当前用户可以使用哪些菜单
    private String getSysMenuList(BigDecimal roleGroupId){
        //系统菜单数据
        List<SysMenu> sysMenuList = SysMenu.dao.getAllData(new SysMenu());
        //用户菜单数据
        List<SysMenu> usersMenuList = SysMenu.dao.getUserMenuList(roleGroupId);
        for(int i=0,sysSize=sysMenuList.size();i<sysSize;i++){
            for(int j=0,userSize=usersMenuList.size();j<userSize;j++){
                if(sysMenuList.get(i).getMenuId().compareTo(usersMenuList.get(j).getMenuId())==0){
                    sysMenuList.get(i).put("ischecked",true);
                }
            }
        }
        return JsonKit.toJson(sysMenuList);
    }
}
