package com.mi2.ctrl.viewback_ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseViewBackController;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Page;
import com.mi2.interceptor.LoginBackInterceptor;
import com.mi2.model.GoodsSmallType;
import com.mi2.model.PhoneModel;

import java.math.BigDecimal;

/**
 * 手机型号管理
 *
 * @author ChenMW 2016-03-21 17:00
 */
@RouteBind(path="/phoneModelCtrl")
@Before(LoginBackInterceptor.class)
public class PhoneModelCtrl extends BaseViewBackController {

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
        PhoneModel phoneModel = this.getModel(PhoneModel.class);
        this.setAttr("phoneModel",phoneModel);
        //手机类型
        GoodsSmallType goodsSmallType = new GoodsSmallType();
        goodsSmallType.setGoodsBigTypeId(BigDecimal.valueOf(1));
        this.setAttr("goodsSmallTypeList", GoodsSmallType.dao.getAllData(goodsSmallType));
        Page pageUtil = PhoneModel.dao.getAllDataByPage(this.getParaToInt("pageNumber",pageNumber),this.getParaToInt("pageSize",pageSize),phoneModel);
        this.setAttr(PAGE_UTIL,pageUtil);
        this.renderJsp(VIEW_BACK_PATH+"/goodsManage/phoneModelList.jsp");
    }

    @Override
    public void getAllData() {

    }
}
