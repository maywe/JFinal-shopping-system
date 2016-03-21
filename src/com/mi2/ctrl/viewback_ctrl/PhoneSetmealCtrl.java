package com.mi2.ctrl.viewback_ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseViewBackController;
import com.base.vo.ErrorVo;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Page;
import com.mi2.interceptor.LoginBackInterceptor;
import com.mi2.model.GoodsSmallType;
import com.mi2.model.PhoneSetmeal;

import java.math.BigDecimal;

/**
 * 手机套餐管理
 *
 * @author ChenMW 2016-03-21 17:00
 */
@RouteBind(path="/phoneSetmealCtrl")
@Before(LoginBackInterceptor.class)
public class PhoneSetmealCtrl extends BaseViewBackController {

    @Override
    public void showRequest() {
        this.setAttr("command","showRequest");
        PhoneSetmeal phoneSetmeal = PhoneSetmeal.dao.findById(this.getModel(PhoneSetmeal.class).getPhoneSetmealId());
        this.setAttr("phoneSetmeal", phoneSetmeal);

        //手机类型
        GoodsSmallType goodsSmallType = new GoodsSmallType();
        goodsSmallType.setGoodsBigTypeId(BigDecimal.valueOf(1));
        this.setAttr("goodsSmallTypeList", GoodsSmallType.dao.getAllData(goodsSmallType));

        this.render(VIEW_BACK_PATH+"/goodsManage/phoneSetmealDialog.jsp");
    }

    @Override
    public void addRequest() {
        this.setAttr("command","addRequest");
        //手机类型
        GoodsSmallType goodsSmallType = new GoodsSmallType();
        goodsSmallType.setGoodsBigTypeId(BigDecimal.valueOf(1));
        this.setAttr("goodsSmallTypeList", GoodsSmallType.dao.getAllData(goodsSmallType));
        this.render(VIEW_BACK_PATH+"/goodsManage/phoneSetmealDialog.jsp");
    }

    @Override
    public Boolean addData() {
        PhoneSetmeal phoneSetmeal = new PhoneSetmeal();
        phoneSetmeal._setAttrs(this.getModel(PhoneSetmeal.class)).save();
        this.renderJson(new ErrorVo(0,"新增手机套餐成功!"));
        return true;
    }

    @Override
    public void updateRequest() {
        PhoneSetmeal phoneSetmeal = PhoneSetmeal.dao.findById(this.getModel(PhoneSetmeal.class).getPhoneSetmealId());
        this.setAttr("phoneSetmeal", phoneSetmeal);
        this.setAttr("command","updateRequest");
        //手机类型
        GoodsSmallType goodsSmallType = new GoodsSmallType();
        goodsSmallType.setGoodsBigTypeId(BigDecimal.valueOf(1));
        this.setAttr("goodsSmallTypeList", GoodsSmallType.dao.getAllData(goodsSmallType));

        this.render(VIEW_BACK_PATH+"/goodsManage/phoneSetmealDialog.jsp");
    }

    @Override
    public Boolean updateData() {
        PhoneSetmeal phoneSetmeal = new PhoneSetmeal();
        phoneSetmeal._setAttrs(this.getModel(PhoneSetmeal.class)).update();
        this.renderJson(new ErrorVo(0,"修改手机套餐成功!"));
        return true;
    }

    @Override
    public Boolean deleteData() {
        this.getModel(PhoneSetmeal.class).delete();
        this.renderJson(new ErrorVo(0,"删除手机套餐成功!"));
        return true;
    }

    @Override
    public void getDataByPage() {
        PhoneSetmeal phoneSetmeal = this.getModel(PhoneSetmeal.class);
        this.setAttr("phoneSetmeal",phoneSetmeal);
        //手机类型
        GoodsSmallType goodsSmallType = new GoodsSmallType();
        goodsSmallType.setGoodsBigTypeId(BigDecimal.valueOf(1));
        this.setAttr("goodsSmallTypeList", GoodsSmallType.dao.getAllData(goodsSmallType));
        Page pageUtil = PhoneSetmeal.dao.getAllDataByPage(this.getParaToInt("pageNumber",pageNumber),this.getParaToInt("pageSize",pageSize),phoneSetmeal);
        this.setAttr(PAGE_UTIL,pageUtil);
        this.renderJsp(VIEW_BACK_PATH+"/goodsManage/phoneSetmealList.jsp");
    }

    @Override
    public void getAllData() {

    }
}
