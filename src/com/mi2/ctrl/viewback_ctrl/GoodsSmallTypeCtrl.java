package com.mi2.ctrl.viewback_ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseController;
import com.base.ctrl.IMethodController;
import com.base.vo.ErrorVo;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Page;
import com.mi2.interceptor.LoginBackInterceptor;
import com.mi2.model.GoodsBigType;
import com.mi2.model.GoodsSmallType;

/**
 * 商品小类型管理
 *
 * @author ChenMW 2016-03-14 22:52
 */
@RouteBind(path="/goodsSmallTypeCtrl")
@Before(LoginBackInterceptor.class)
public class GoodsSmallTypeCtrl extends BaseController implements IMethodController {

    @Override
    public void showRequest() {
        this.setAttr("command","showRequest");
        GoodsSmallType goodsSmallType = this.getModel(GoodsSmallType.class);
        this.setAttr("goodsSmallType", GoodsSmallType.dao.findById(goodsSmallType.getGoodsSmallTypeId()));
        this.setAttr("goodsBigTypeList", GoodsBigType.dao.getAllData(null));
        this.render(VIEW_BACK_PATH+"/goodsManage/goodsSmallTypeDialog.jsp");
    }

    @Override
    public void addRequest() {
        this.setAttr("command","addRequest");
        this.setAttr("goodsBigTypeList", GoodsBigType.dao.getAllData(null));
        this.render(VIEW_BACK_PATH+"/goodsManage/goodsSmallTypeDialog.jsp");
    }

    @Override
    public Boolean addData() {
        new GoodsSmallType()._setAttrs(this.getModel(GoodsSmallType.class)).save();
        this.renderJson(new ErrorVo(0,"新增小商品类型成功!"));
        return true;
    }

    @Override
    public void updateRequest() {
        this.setAttr("command","updateRequest");
        this.setAttr("goodsBigTypeList", GoodsBigType.dao.getAllData(null));
        GoodsSmallType goodsSmallType = this.getModel(GoodsSmallType.class);
        this.setAttr("goodsSmallType", GoodsSmallType.dao.findById(goodsSmallType.getGoodsSmallTypeId()));
        this.render(VIEW_BACK_PATH+"/goodsManage/goodsSmallTypeDialog.jsp");
    }

    @Override
    public Boolean updateData() {
        new GoodsSmallType()._setAttrs(this.getModel(GoodsSmallType.class)).update();
        this.renderJson(new ErrorVo(0,"修改小商品类型成功!"));
        return true;
    }

    @Override
    public Boolean deleteData() {
        try{
            new GoodsSmallType()._setAttrs(this.getModel(GoodsSmallType.class)).delete();
            this.renderJson(new ErrorVo(0,"删除小商品类型成功!"));
            return true;
        }catch (Exception e){
            e.printStackTrace();
            this.renderJson(new ErrorVo(1,"删除失败，小商品类型正在使用，不能删除!"));
            if(logger.isDebugEnabled()){
                logger.debug("删除失败，小商品类型正在使用，不能删除!",e);
            }
            return false;
        }
    }

    @Override
    public void getDataByPage() {
        GoodsSmallType goodsSmallType = this.getModel(GoodsSmallType.class);
        Page pageUtil = GoodsSmallType.dao.getAllDataByPage(this.getParaToInt("pageNumber",pageNumber),this.getParaToInt("pageSize",pageSize),goodsSmallType);
        this.setAttr("goodsSmallType",goodsSmallType);
        this.setAttr("goodsBigTypeList", GoodsBigType.dao.getAllData(null));
        this.setAttr(PAGE_UTIL,pageUtil);
        this.renderJsp(VIEW_BACK_PATH+"/goodsManage/goodsSmallTypeList.jsp");
    }

    @Override
    public void getAllData() {

    }
}
