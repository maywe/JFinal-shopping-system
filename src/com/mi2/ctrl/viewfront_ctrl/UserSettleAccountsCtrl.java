package com.mi2.ctrl.viewfront_ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseViewFrontController;
import com.base.util.DateUtils;
import com.base.util.IdGeneratorUtils;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.mi2.interceptor.LoginFrontInterceptor;
import com.mi2.model.UsersDeliveryAddress;
import com.mi2.model.UsersOrders;
import com.mi2.model.UsersOrdersDetail;
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
    @Before(Tx.class)
    public Boolean goSettleAccounts(){
        //生成主订单信息
        UsersDeliveryAddress uda = UsersDeliveryAddress.dao.findById(this.getParaToBigDecimal("users_delivery_address_id"));
        UsersOrders usersOrders = this.getModel(UsersOrders.class);
        usersOrders.setUserOrdersId(IdGeneratorUtils.generatorOrderId());
        usersOrders.setUserFrontId(this.getLoginUserFront().getUserFrontId());
        usersOrders.put("ORDERS_TIME", DateUtils.thisSqlTime());
        usersOrders.setOrdersAddress(uda.getProvince()+" "+uda.getCity()+" "+uda.getCounty()+" "+uda.getStreet());
        usersOrders.setName(uda.getName());
        usersOrders.setTelephone(uda.getTelephone());
        usersOrders.setOrdersStatus(BigDecimal.ONE);
        usersOrders.save();
        //生成订单商品详情
        new UsersOrdersDetail().batchSaveOrdersDetail(usersOrders);
        //更新商品的库存和已售数量
        UsersShoppingcar usersShoppingcar = new UsersShoppingcar();
        usersShoppingcar.updateGoodsStockAndSalesNum(usersOrders.getUserFrontId());
        //删除用户购物车的已支付的商品
        usersShoppingcar.deleteUserCartPayGoods(usersOrders.getUserFrontId());

        this.setAttr("usersOrders",usersOrders);
        this.renderJsp(VIEW_FRONT_PATH+"/userCenter/userOrdersPay.jsp");
        return true;
    }
}
