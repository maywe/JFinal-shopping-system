package com.mi2.ctrl.viewfront_ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseViewFrontController;
import com.base.util.DateUtils;
import com.base.vo.ErrorVo;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.mi2.interceptor.LoginFrontInterceptor;
import com.mi2.model.PhoneSetmeal;
import com.mi2.model.UsersShopcarSetmealGoods;
import com.mi2.model.UsersShoppingcar;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * 用户购物车操作控制器
 *
 * @author ChenMW 2016-04-18 13:45
 */
@RouteBind(path="/userShoppingCartCtrl")
@Before(LoginFrontInterceptor.class)
public class UserShoppingCartCtrl extends BaseViewFrontController {

    public Boolean updateCartGoods(){
        String command = this.getPara("command");
        UsersShoppingcar usc = new UsersShoppingcar();
        usc.setUserFrontId(this.getLoginUserFront().getUserFrontId());
        //usc.setLastUpdateDate(new Date());
        usc.put("LAST_UPDATE_DATE",DateUtils.thisSqlTime());
        if("updateSelectAllPay".equals(command)){
            usc.setIsSelectPay(this.getPara("is_select_pay"));
            usc.batchUpdateFrontUserCartGoods(usc);
        }else if("updateSelectItemPay".equals(command)){
            usc.setUsersShoppingId(BigDecimal.valueOf(Long.valueOf(this.getPara("users_shopping_id"))));
            usc.setIsSelectPay(this.getPara("is_select_pay"));
            usc.update();
        }else if("updateShoppingNum".equals(command)){
            usc.setUsersShoppingId(BigDecimal.valueOf(Long.valueOf(this.getPara("users_shopping_id"))));
            usc.setShoppingNum(BigDecimal.valueOf(Long.valueOf(this.getPara("shopping_num"))));
            usc.update();
        }
        this.renderJson(new ErrorVo(0,"更新成功!"));
        return true;
    }

    public Boolean deleteCartGoods(){
        new UsersShoppingcar().deleteUserCartGoodsById(BigDecimal.valueOf(Long.valueOf(this.getPara("users_shopping_id"))));
        this.initUserShoppingCart();
        return true;
    }

    public void getCartSumGoodsNum(){
        BigDecimal goods_sum = UsersShoppingcar.dao.getCartSumGoodsNum(this.getLoginUserFront().getUserFrontId());
        this.renderJson(goods_sum);
    }

    //加入购物车
    public Boolean addUserShoppingCart(){
        String command = this.getPara("command");
        //商品编号
        BigDecimal goodsId = this.getParaToBigDecimal("goods_id");
        //手机商品编号
        BigDecimal phoneGoodsId = this.getParaToBigDecimal("phone_goods_id");

        UsersShoppingcar usc = new UsersShoppingcar();
        usc.setShoppingNum(BigDecimal.ONE);
        usc.put("SHOPPING_TIME",DateUtils.thisSqlTime());
        //usc.setShoppingTime(new Date());
        usc.setIsSelectPay("0");
        usc.setUserFrontId(this.getLoginUserFront().getUserFrontId());
        usc.setGoodsColorId(this.getParaToBigDecimal("goods_color_id"));

        if(goodsId!=null){
            //1、普通商品加入购物车
            usc.setGoodsId(goodsId);
            usc.setAdaptPhoneTypeId(this.getParaToBigDecimal("adapt_phone_type_id"));
            usc.saveOrUpdate(usc);
        }else if(phoneGoodsId!=null){
            //2、手机商品加入购物车
            usc.setPhoneGoodsId(phoneGoodsId);
            usc.saveOrUpdate(usc);

            //3、手机套餐加入购物车
            BigDecimal phone_setmeal_id = this.getParaToBigDecimal("phone_setmeal_id");
            if(phone_setmeal_id!=null){
                PhoneSetmeal ps = PhoneSetmeal.dao.findById(phone_setmeal_id);
                UsersShoppingcar uscPhoneSetmeal = new UsersShoppingcar();
                uscPhoneSetmeal.setPhoneSetmealId(phone_setmeal_id);
                uscPhoneSetmeal.setShoppingNum(BigDecimal.ONE);
                uscPhoneSetmeal.setIsSelectPay("0");
                uscPhoneSetmeal.setUserFrontId(this.getLoginUserFront().getUserFrontId());
                uscPhoneSetmeal.setAdaptPhoneTypeId(ps.getGoodsSmallTypeId());
                String isSave = uscPhoneSetmeal.saveOrUpdate(uscPhoneSetmeal);
                //手机套餐商品编号列表
                if("save".equals(isSave)){
                    String phoneSetmeal_goodsIds_goodsNums_goodsColorIds = this.getPara("phoneSetmeal_goodsIds_goodsNums_goodsColorIds");
                    String[] ussgRecords = phoneSetmeal_goodsIds_goodsNums_goodsColorIds.split(",");
                    List<Record> ussgList = new ArrayList<>();
                    for(int i=0;i<ussgRecords.length;i++){
                        String[] ussgRecord = ussgRecords[i].split("_");
                        UsersShopcarSetmealGoods ussg = new UsersShopcarSetmealGoods();
                        ussg.setUsersShoppingId(uscPhoneSetmeal.getUsersShoppingId());
                        ussg.setGoodsId(BigDecimal.valueOf(Long.valueOf(ussgRecord[0])));
                        ussg.setGoodsNum(BigDecimal.valueOf(Long.valueOf(ussgRecord[1])));
                        ussg.setGoodsColorId(BigDecimal.valueOf(Long.valueOf(ussgRecord[2])));
                        ussg.setAdaptPhoneTypeId(ps.getGoodsSmallTypeId());
                        Record record = new Record();
                        record.setColumns(ussg);
                        ussgList.add(record);
                    }
                    Db.batchSave(UsersShopcarSetmealGoods.TABLE_NAME,ussgList,ussgList.size());
                }
            }
        }
        if("ajax".equals(command)){
            this.renderJson(new ErrorVo(0,"加入购物车成功!"));
        }else{
            this.initUserShoppingCart();
        }
        return true;
    }

    public void initUserShoppingCart(){
        BigDecimal userFrontId = this.getLoginUserFront().getUserFrontId();
        UsersShoppingcar usc = new UsersShoppingcar();
        usc.setUserFrontId(userFrontId);
        this.setAttr("phoneGoodsList",UsersShoppingcar.dao.getPhoneGoodsAllData(usc));
        this.setAttr("phoneSetmealGoodsList",UsersShoppingcar.dao.getPhoneSetmealGoodsAllData(usc));
        this.setAttr("otherGoodsList",UsersShoppingcar.dao.getOtherGoodsAllData(usc));
        this.render(VIEW_FRONT_PATH+"/userCenter/userShoppingCar.jsp");
    }
}
