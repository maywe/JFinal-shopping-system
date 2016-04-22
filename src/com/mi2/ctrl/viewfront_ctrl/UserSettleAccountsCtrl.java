package com.mi2.ctrl.viewfront_ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseViewFrontController;
import com.jfinal.aop.Before;
import com.mi2.interceptor.LoginFrontInterceptor;
import com.mi2.model.UsersDeliveryAddress;
import com.mi2.model.UsersShoppingcar;

import java.math.BigDecimal;

/**
 * 用户购物车操作控制器
 *
 * @author ChenMW 2016-04-18 13:45
 */
@RouteBind(path="/userSettleAccountsCtrl")
@Before(LoginFrontInterceptor.class)
public class UserSettleAccountsCtrl extends BaseViewFrontController {

    public void initUserSettleAccounts(){
        //用户收货地址列表
        BigDecimal userFrontId = this.getLoginUserFront().getUserFrontId();
        UsersDeliveryAddress uda = new UsersDeliveryAddress();
        uda.setUserFrontId(userFrontId);
        UsersShoppingcar usc = new UsersShoppingcar();
        usc.setUserFrontId(userFrontId);
        usc.setIsSelectPay("0");
        this.setAttr("usersDeliveryAddressList",UsersDeliveryAddress.dao.getAllData(uda));
        this.setAttr("phoneGoodsList", UsersShoppingcar.dao.getPhoneGoodsAllData(usc));
        this.setAttr("phoneSetmealGoodsList",UsersShoppingcar.dao.getPhoneSetmealGoodsAllData(usc));
        this.setAttr("otherGoodsList",UsersShoppingcar.dao.getOtherGoodsAllData(usc));
        this.render(VIEW_FRONT_PATH+"/userCenter/userSettleAccounts.jsp");
    }

    public void addUserAddressRequest(){
        this.setAttr("command","addUserAddressRequest");
        this.render(VIEW_FRONT_PATH+"/userCenter/userAddressDialog.jsp");
    }

    public Boolean addUserAddressData(){
        UsersDeliveryAddress uda = this.getModel(UsersDeliveryAddress.class);
        uda.setUserFrontId(this.getLoginUserFront().getUserFrontId());
        uda.save();
        this.initUserSettleAccounts();
        return true;
    }

    public void updateUserAddressRequest(){
        this.setAttr("command","updateUserAddressRequest");
        this.setAttr("usersDeliveryAddress",UsersDeliveryAddress.dao.findById(this.getModel(UsersDeliveryAddress.class).getUsersDeliveryAddressId()));
        this.render(VIEW_FRONT_PATH+"/userCenter/userAddressDialog.jsp");
    }

    public Boolean updateUserAddressData(){
        this.getModel(UsersDeliveryAddress.class).update();
        this.initUserSettleAccounts();
        return true;
    }

    public Boolean deleteUserAddressData(){
        this.getModel(UsersDeliveryAddress.class).delete();
        this.initUserSettleAccounts();
        return true;
    }

    //结算方法
    public Boolean goSettleAccounts(){

        return true;
    }
}
