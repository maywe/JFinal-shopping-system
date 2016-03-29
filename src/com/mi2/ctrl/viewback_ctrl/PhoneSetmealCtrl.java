package com.mi2.ctrl.viewback_ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseViewBackController;
import com.base.vo.ErrorVo;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Page;
import com.mi2.interceptor.LoginBackInterceptor;
import com.mi2.model.GoodsSmallType;
import com.mi2.model.PhoneSetmeal;
import com.mi2.model.PhoneSetmealDetail;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

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

        PhoneSetmealDetail psd = new PhoneSetmealDetail();
        psd.setPhoneSetmealId(phoneSetmeal.getPhoneSetmealId());
        this.setAttr("phoneSetmealGoodsList",PhoneSetmealDetail.dao.getAllData(psd));

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
        //1、获取套餐基本信息和套餐详情信息
        PhoneSetmeal phoneSetmeal = this.getModel(PhoneSetmeal.class);
        List<Map<String,String>> phoneSetmealGoodsList = this.getParaToList("phoneSetmealGoodsList");
        //2、解析信息保存套餐基本信息
        long goodsNumSum = 0;
        double goodsNewPriceSum = 0;
        for(Map<String,String> map : phoneSetmealGoodsList){
            int goodsNum = Integer.parseInt(map.get("goods_num"));
            double goodsNewPrice = Double.valueOf(map.get("goods_new_price"));
            goodsNumSum += goodsNum;
            goodsNewPriceSum += goodsNum*goodsNewPrice;
        }
        phoneSetmeal.setSetmealGoodsNum(BigDecimal.valueOf(goodsNumSum));
        phoneSetmeal.setSaveMoney(BigDecimal.valueOf(goodsNewPriceSum).subtract(phoneSetmeal.getSetmealPrice()));
        phoneSetmeal.save();
        //3、更新套餐详情信息
        new PhoneSetmealDetail().batchSave(phoneSetmeal.getPhoneSetmealId(),phoneSetmealGoodsList);

        this.renderJson(new ErrorVo(0,"新增手机套餐成功!"));
        return true;
    }

    @Override
    public void updateRequest() {
        PhoneSetmeal phoneSetmeal = PhoneSetmeal.dao.findById(this.getModel(PhoneSetmeal.class).getPhoneSetmealId());
        this.setAttr("phoneSetmeal", phoneSetmeal);
        this.setAttr("command","updateRequest");

        PhoneSetmealDetail psd = new PhoneSetmealDetail();
        psd.setPhoneSetmealId(phoneSetmeal.getPhoneSetmealId());
        this.setAttr("phoneSetmealGoodsList",PhoneSetmealDetail.dao.getAllData(psd));

        //手机类型
        GoodsSmallType goodsSmallType = new GoodsSmallType();
        goodsSmallType.setGoodsBigTypeId(BigDecimal.valueOf(1));
        this.setAttr("goodsSmallTypeList", GoodsSmallType.dao.getAllData(goodsSmallType));

        this.render(VIEW_BACK_PATH+"/goodsManage/phoneSetmealDialog.jsp");
    }

    @Override
    public Boolean updateData() {
        //1、获取套餐基本信息和套餐详情信息
        PhoneSetmeal phoneSetmeal = this.getModel(PhoneSetmeal.class);
        List<Map<String,String>> phoneSetmealGoodsList = this.getParaToList("phoneSetmealGoodsList");
        //2、解析信息更新套餐基本信息
        long goodsNumSum = 0;
        double goodsNewPriceSum = 0;
        for(Map<String,String> map : phoneSetmealGoodsList){
            int goodsNum = Integer.parseInt(map.get("goods_num"));
            double goodsNewPrice = Double.valueOf(map.get("goods_new_price"));
            goodsNumSum += goodsNum;
            goodsNewPriceSum += goodsNum*goodsNewPrice;
        }
        phoneSetmeal.setSetmealGoodsNum(BigDecimal.valueOf(goodsNumSum));
        phoneSetmeal.setSaveMoney(BigDecimal.valueOf(goodsNewPriceSum).subtract(phoneSetmeal.getSetmealPrice()));
        phoneSetmeal.update();
        //3、更新套餐详情信息
        new PhoneSetmealDetail().batchUpdate(phoneSetmeal.getPhoneSetmealId(),phoneSetmealGoodsList);

        this.renderJson(new ErrorVo(0,"修改手机套餐成功!"));
        return true;
    }

    @Override
    public Boolean deleteData() {
        PhoneSetmeal phoneSetmeal = this.getModel(PhoneSetmeal.class);
        new PhoneSetmealDetail().batchDelete(phoneSetmeal.getPhoneSetmealId());
        phoneSetmeal.delete();
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
