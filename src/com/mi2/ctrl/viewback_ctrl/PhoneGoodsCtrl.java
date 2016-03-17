package com.mi2.ctrl.viewback_ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseController;
import com.base.vo.ErrorVo;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Page;
import com.mi2.interceptor.LoginBackInterceptor;
import com.mi2.model.GoodsAddribute;

/**
 * 商品属性管理
 *
 * @author ChenMW 2016-03-14 22:52
 */
@RouteBind(path="/phoneGoodsCtrl")
@Before(LoginBackInterceptor.class)
public class PhoneGoodsCtrl extends BaseController {

    @Override
    public void showRequest() {
        this.setAttr("command","showRequest");
        GoodsAddribute goodsAddribute = this.getModel(GoodsAddribute.class);
        this.setAttr("goodsAddribute", GoodsAddribute.dao.findById(goodsAddribute.getGoodsAddributeId()));
        this.render(VIEW_BACK_PATH+"/goodsManage/goodsAddributeDialog.jsp");
    }

    @Override
    public void addRequest() {
        this.setAttr("command","addRequest");
        this.render(VIEW_BACK_PATH+"/goodsManage/goodsAddributeDialog.jsp");
    }

    @Override
    public Boolean addData() {
        new GoodsAddribute()._setAttrs(this.getModel(GoodsAddribute.class)).save();
        this.renderJson(new ErrorVo(0,"新增商品属性成功!"));
        return true;
    }

    @Override
    public void updateRequest() {
        this.setAttr("command","updateRequest");
        GoodsAddribute goodsAddribute = this.getModel(GoodsAddribute.class);
        this.setAttr("goodsAddribute", GoodsAddribute.dao.findById(goodsAddribute.getGoodsAddributeId()));
        this.render(VIEW_BACK_PATH+"/goodsManage/goodsAddributeDialog.jsp");
    }

    @Override
    public Boolean updateData() {
        new GoodsAddribute()._setAttrs(this.getModel(GoodsAddribute.class)).update();
        this.renderJson(new ErrorVo(0,"修改商品属性成功!"));
        return true;
    }

    @Override
    public Boolean deleteData() {
       return null;
    }

    @Override
    public void getDataByPage() {
        GoodsAddribute goodsAddribute = this.getModel(GoodsAddribute.class);
        Page pageUtil = GoodsAddribute.dao.getAllDataByPage(this.getParaToInt("pageNumber",pageNumber),this.getParaToInt("pageSize",pageSize),goodsAddribute);
        this.setAttr("goodsAddribute",goodsAddribute);
        this.setAttr(PAGE_UTIL,pageUtil);
        this.renderJsp(VIEW_BACK_PATH+"/goodsManage/goodsAddributeList.jsp");
    }

    @Override
    public void getAllData() {

    }
}
