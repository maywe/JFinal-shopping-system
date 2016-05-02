package com.mi2.ctrl.viewback_ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseViewBackController;
import com.base.util.DateUtils;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Record;
import com.mi2.interceptor.LoginBackInterceptor;
import com.mi2.model.*;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 后台主框架控制器
 *
 * @author ChenMW 2016-02-22 17:00
 */
@RouteBind(path="/mainCtrl")
@Before(LoginBackInterceptor.class)
public class MainCtrl extends BaseViewBackController {

    //进入后台
    public void goViewBack(){
        UsersBackstage usersBackstage = this.getSessionAttr(LOGIN_BACK_USER);
        if("remember_me".equals(usersBackstage.getStr("remember_me"))) {
            this.setCookie("sysUserName",usersBackstage.getSysUserName(),1000,"/");
            this.setCookie("sysUserPassword",usersBackstage.getSysUserPassword(),1000,"/");
            this.setCookie("sysImg",usersBackstage.getImg(),1000,"/");
        }
        this.render(VIEW_BACK_PATH+"/main.html");
    }

    //获取后台初始化导航树的数据
    public void initNavTree(){
        //用户菜单数据
        UsersBackstage usersBackstage = this.getSessionAttr(LOGIN_BACK_USER);
        List<SysMenu> userMenuList = SysMenu.dao.getUserMenuList(usersBackstage.getRoleGroupId());
        //主页显示数据
        Map<String,Object> data = new HashMap<>();
        data.put("usersBackstage",usersBackstage);
        data.put("userMenuList",userMenuList);
        this.renderJson(data);
    }

    //系统初始化home页
    public void initHomePage(){
        Record baseRecord = new Record();
        //获取网站用户总数
        baseRecord.set("user_sum",UsersFront.dao.getSumUserNum());
        //获取商品库存总量和销售总量
        Goods g = Goods.dao.getSumGoodsStockAndSales();
        PhoneVersion pv = PhoneVersion.dao.getSumPhoneGoodsStockAndSales();
        baseRecord.set("goods_sum_stock", BigDecimal.valueOf(Long.valueOf(g.get("goods_sum_stock",0)+"")).add(BigDecimal.valueOf(Long.valueOf(pv.get("goods_sum_stock",0)+""))));
        baseRecord.set("goods_sum_sales", BigDecimal.valueOf(Long.valueOf(g.get("goods_sum_sales",0)+"")).add(BigDecimal.valueOf(Long.valueOf(pv.get("goods_sum_sales",0)+""))));
        //获取订单总量和成交总金额
        UsersOrders uo =UsersOrders.dao.getSumOrderNumAndMoney();
        baseRecord.set("order_sum", BigDecimal.valueOf(Long.valueOf(uo.get("order_sum",0)+"")));
        baseRecord.set("order_sum_money", Double.valueOf(uo.get("order_sum_money",0)+""));

        //获取商品销量按照商品小类别汇总
        List<Goods> gList = Goods.dao.getGoodsSalesBySmallTypeSum();
        List<PhoneVersion> pvList = PhoneVersion.dao.getPhoneGoodsSalesBySmallTypeSum();
        String goods_small_type_names = "";
        String goods_small_type_stocks = "";
        for(int i=0,size=gList.size();i<size;i++){
            if(i==size-1){
                goods_small_type_names += gList.get(i).get("goods_small_type_name");
                goods_small_type_stocks += gList.get(i).get("goods_small_type_stock");
            }else {
                goods_small_type_names += gList.get(i).get("goods_small_type_name") + ",";
                goods_small_type_stocks += gList.get(i).get("goods_small_type_stock") + ",";
            }
        }
        for(int i=0,size=pvList.size();i<size;i++){
            if(i==size-1){
                goods_small_type_names += pvList.get(i).get("goods_small_type_name");
                goods_small_type_stocks += pvList.get(i).get("goods_small_type_stock");
            }else if(i==0){
                goods_small_type_names += "," + pvList.get(i).get("goods_small_type_name") + ",";
                goods_small_type_stocks += "," + pvList.get(i).get("goods_small_type_stock") + ",";
            }else {
                goods_small_type_names += pvList.get(i).get("goods_small_type_name") + ",";
                goods_small_type_stocks += pvList.get(i).get("goods_small_type_stock") + ",";
            }
        }
        baseRecord.set("goods_small_type_names",goods_small_type_names);
        baseRecord.set("goods_small_type_stocks",goods_small_type_stocks);

        //获取日订单量按照每天汇总
        List<UsersOrders> uoList = UsersOrders.dao.getOrderTurnoverByOrderTime();
        String day_orders_times = "";
        String day_orders_nums = "";
        for(int i=0,size=uoList.size();i<size;i++){
            if(i<size-1) {
                day_orders_times += DateUtils.utilDateToStr(uoList.get(i).getDate("day_orders_times"),DateUtils.DATE) + ",";
                day_orders_nums += uoList.get(i).get("day_orders_nums") + ",";
            }else{
                day_orders_times += DateUtils.utilDateToStr(uoList.get(i).getDate("day_orders_times"),DateUtils.DATE);
                day_orders_nums += uoList.get(i).get("day_orders_nums");
            }
        }
        baseRecord.set("day_orders_times",day_orders_times);
        baseRecord.set("day_orders_nums",day_orders_nums);

        //查询缺货商品信息
        baseRecord.set("outStockOtherGoodsList",Goods.dao.getOutStockGoods());
        baseRecord.set("outStockPhoneGoodsList",PhoneGoodsView.dao.getOutStockPhoneGoods());

        this.setAttr("baseRecord",baseRecord);
        this.renderJsp(VIEW_BACK_PATH+"/home.jsp");
    }

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

    }

    @Override
    public void getAllData() {

    }
}
