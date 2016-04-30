package com.mi2.ctrl.viewback_ctrl;

import com.base.annotation.RouteBind;
import com.base.ctrl.BaseViewBackController;
import com.base.util.DateUtils;
import com.base.vo.ErrorVo;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Page;
import com.mi2.interceptor.LoginBackInterceptor;
import com.mi2.model.UsersOrders;

import java.math.BigDecimal;

/**
 * 网站订单管理
 *
 * @author ChenMW 2016-04-25 21:51
 */
@RouteBind(path="/webOrderCtrl")
@Before(LoginBackInterceptor.class)
public class WebOrderCtrl extends BaseViewBackController {

    @Override
    public void showRequest() {
        this.setAttr("command","showRequest");
        UsersOrders usersOrders = this.getModel(UsersOrders.class);
        this.setAttr("usersOrders",UsersOrders.dao.getAllData(usersOrders).get(0));
        this.render(VIEW_BACK_PATH+"/orderManage/webOrderShowDialog.jsp");
    }

    @Override
    public void addRequest() {
    }

    @Override
    public Boolean addData() {
        return false;
    }

    @Override
    public void updateRequest() {
        this.setAttr("command","updateRequest");
        UsersOrders usersOrders = this.getModel(UsersOrders.class);
        this.setAttr("usersOrders",UsersOrders.dao.getAllData(usersOrders).get(0));
        this.render(VIEW_BACK_PATH+"/orderManage/webOrderDialog.jsp");
    }

    @Override
    public Boolean updateData() {
        UsersOrders uo = this.getModel(UsersOrders.class);
        if(BigDecimal.valueOf(2).compareTo(uo.getOrdersStatus())==0){
            //正在配货
            uo.set("PREPARE_GOODS_TIME", DateUtils.thisSqlTimestamp()).update();
        }else if(BigDecimal.valueOf(3).compareTo(uo.getOrdersStatus())==0){
            //已出库
            uo.set("DELIVER_GOODS_TIME", DateUtils.thisSqlTimestamp()).update();
        }else if(BigDecimal.valueOf(4).compareTo(uo.getOrdersStatus())==0){
            //已收货
            uo.set("TAKE_GOODS_TIME", DateUtils.thisSqlTimestamp()).update();
        }else{
            this.renderJson(new ErrorVo(1,"您存在异常操作，系统不受理，请您注意!"));
            return false;
        }
        this.renderJson(new ErrorVo(0,"更新网站订单状态成功!"));
        return true;
    }

    @Override
    public Boolean deleteData() {
        return false;
    }

    @Override
    public void getDataByPage() {
        UsersOrders usersOrders = new UsersOrders();
        usersOrders.put("search_key",this.getPara("search_key"));
        usersOrders.put("search_orders_status",this.getPara("search_orders_status"));
        usersOrders.put("search_orders_time1",this.getPara("search_orders_time1"));
        usersOrders.put("search_orders_time2",this.getPara("search_orders_time2"));
        Page pageUtil = UsersOrders.dao.getAllDataByPage(this.getParaToInt("pageNumber",pageNumber),this.getParaToInt("pageSize",pageSize),usersOrders);
        this.setAttr("usersOrders",usersOrders);
        this.setAttr(PAGE_UTIL,pageUtil);
        this.renderJsp(VIEW_BACK_PATH+"/orderManage/webOrderList.jsp");
    }

    @Override
    public void getAllData() {

    }

}
