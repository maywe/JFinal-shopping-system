package com.mi2.ctrl.viewback_ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseController;
import com.base.vo.ErrorVo;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Page;
import com.mi2.interceptor.LoginBackInterceptor;
import com.mi2.model.GoodsBigType;

/**
 * 商品大类型管理
 *
 * @author ChenMW 2016-03-14 22:52
 */
@RouteBind(path="/goodsBigTypeCtrl")
@Before(LoginBackInterceptor.class)
public class GoodsBigTypeCtrl extends BaseController {

    @Override
    public void showRequest() {
        this.setAttr("command","showRequest");
        GoodsBigType goodsBigType = this.getModel(GoodsBigType.class);
        this.setAttr("goodsBigType", GoodsBigType.dao.findById(goodsBigType.getGoodsBigTypeId()));
        this.render(VIEW_BACK_PATH+"/goodsManage/goodsBigTypeDialog.jsp");
    }

    @Override
    public void addRequest() {
        this.setAttr("command","addRequest");
        this.render(VIEW_BACK_PATH+"/goodsManage/goodsBigTypeDialog.jsp");
    }

    @Override
    public Boolean addData() {
        new GoodsBigType()._setAttrs(this.getModel(GoodsBigType.class)).save();
        this.renderJson(new ErrorVo(0,"新增大商品类型成功!"));
        return true;
    }

    @Override
    public void updateRequest() {
        this.setAttr("command","updateRequest");
        GoodsBigType goodsBigType = this.getModel(GoodsBigType.class);
        this.setAttr("goodsBigType", GoodsBigType.dao.findById(goodsBigType.getGoodsBigTypeId()));
        this.render(VIEW_BACK_PATH+"/goodsManage/goodsBigTypeDialog.jsp");
    }

    @Override
    public Boolean updateData() {
        new GoodsBigType()._setAttrs(this.getModel(GoodsBigType.class)).update();
        this.renderJson(new ErrorVo(0,"修改大商品类型成功!"));
        return true;
    }

    @Override
    public Boolean deleteData() {
        try{
            new GoodsBigType()._setAttrs(this.getModel(GoodsBigType.class)).delete();
            this.renderJson(new ErrorVo(0,"删除大商品类型成功!"));
            return true;
        }catch (Exception e){
            e.printStackTrace();
            this.renderJson(new ErrorVo(1,"删除失败，大商品类型正在使用，不能删除!"));
            if(logger.isDebugEnabled()){
                logger.debug("删除失败，大商品类型正在使用，不能删除!",e);
            }
            return false;
        }
    }

    @Override
    public void getDataByPage() {
        GoodsBigType goodsBigType = this.getModel(GoodsBigType.class);
        Page pageUtil = GoodsBigType.dao.getAllDataByPage(this.getParaToInt("pageNumber",pageNumber),this.getParaToInt("pageSize",pageSize),goodsBigType);
        this.setAttr("goodsBigType",goodsBigType);
        this.setAttr(PAGE_UTIL,pageUtil);
        this.renderJsp(VIEW_BACK_PATH+"/goodsManage/goodsBigTypeList.jsp");
    }

    @Override
    public void getAllData() {

    }
}
