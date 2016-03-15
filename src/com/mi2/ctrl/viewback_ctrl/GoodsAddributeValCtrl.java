package com.mi2.ctrl.viewback_ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseController;
import com.base.ctrl.IMethodController;
import com.base.vo.ErrorVo;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Page;
import com.mi2.interceptor.LoginBackInterceptor;
import com.mi2.model.GoodsAddribute;
import com.mi2.model.GoodsAddributeVal;

/**
 * 商品小类型管理
 *
 * @author ChenMW 2016-03-14 22:52
 */
@RouteBind(path="/goodsAddributeValCtrl")
@Before(LoginBackInterceptor.class)
public class GoodsAddributeValCtrl extends BaseController implements IMethodController {

    @Override
    public void showRequest() {
        this.setAttr("command","showRequest");
        GoodsAddributeVal goodsAddributeVal = this.getModel(GoodsAddributeVal.class);
        this.setAttr("goodsAddributeVal", GoodsAddributeVal.dao.findById(goodsAddributeVal.getGoodsAddributeValId()));
        this.setAttr("goodsAddributeList", GoodsAddribute.dao.getAllData(null));
        this.render(VIEW_BACK_PATH+"/goodsManage/goodsAddributeValDialog.jsp");
    }

    @Override
    public void addRequest() {
        this.setAttr("command","addRequest");
        this.setAttr("goodsAddributeList", GoodsAddribute.dao.getAllData(null));
        this.render(VIEW_BACK_PATH+"/goodsManage/goodsAddributeValDialog.jsp");
    }

    @Override
    public Boolean addData() {
        new GoodsAddributeVal()._setAttrs(this.getModel(GoodsAddributeVal.class)).save();
        this.renderJson(new ErrorVo(0,"新增商品属性值成功!"));
        return true;
    }

    @Override
    public void updateRequest() {
        this.setAttr("command","updateRequest");
        this.setAttr("goodsAddributeList", GoodsAddribute.dao.getAllData(null));
        GoodsAddributeVal goodsAddributeVal = this.getModel(GoodsAddributeVal.class);
        this.setAttr("goodsAddributeVal", GoodsAddributeVal.dao.findById(goodsAddributeVal.getGoodsAddributeValId()));
        this.render(VIEW_BACK_PATH+"/goodsManage/goodsAddributeValDialog.jsp");
    }

    @Override
    public Boolean updateData() {
        new GoodsAddributeVal()._setAttrs(this.getModel(GoodsAddributeVal.class)).update();
        this.renderJson(new ErrorVo(0,"修改商品属性值成功!"));
        return true;
    }

    @Override
    public Boolean deleteData() {
        try{
            new GoodsAddributeVal()._setAttrs(this.getModel(GoodsAddributeVal.class)).delete();
            this.renderJson(new ErrorVo(0,"删除商品属性值成功!"));
            return true;
        }catch (Exception e){
            e.printStackTrace();
            this.renderJson(new ErrorVo(1,"删除失败，商品属性值正在使用，不能删除!"));
            if(logger.isDebugEnabled()){
                logger.debug("删除失败，商品属性值正在使用，不能删除!",e);
            }
            return false;
        }
    }

    @Override
    public void getDataByPage() {
        GoodsAddributeVal goodsAddributeVal = this.getModel(GoodsAddributeVal.class);
        Page pageUtil = GoodsAddributeVal.dao.getAllDataByPage(this.getParaToInt("pageNumber",pageNumber),this.getParaToInt("pageSize",pageSize),goodsAddributeVal);
        this.setAttr("goodsAddributeVal",goodsAddributeVal);
        this.setAttr("goodsAddributeList", GoodsAddribute.dao.getAllData(null));
        this.setAttr(PAGE_UTIL,pageUtil);
        this.renderJsp(VIEW_BACK_PATH+"/goodsManage/goodsAddributeValList.jsp");
    }

    @Override
    public void getAllData() {

    }
}
