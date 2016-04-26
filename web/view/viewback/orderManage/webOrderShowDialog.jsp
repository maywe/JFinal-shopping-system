<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <i class="glyphicon glyphicon-remove font-size16"></i>
    </button>
    <img alt="弹出框" src="../../../images/back/diatopicon.png" style="vertical-align: middle">
    <span class="modal-title font-size16">查看订单信息</span>
</div>
<form id="webOrderDialogForm" class="form-horizontal" role="form">
    <div class="modal-body">
        <div class="tab-pane active">
            <fieldset>
                <legend class="m-b-xs font-size16"><span class="must-msg">1.</span>订单基本信息:</legend>
                <table class="table table-condensed table-bordered table-hover detail-table">
                    <tr>
                        <th>订单编号:</th>
                        <td>${usersOrders.user_orders_id}</td>
                        <th>订单日期:</th>
                        <td><fmt:formatDate value="${usersOrders.orders_time}" pattern="yyyy-MM-dd"/></td>
                        <th>订单状态:</th>
                        <td>
                            ${usersOrders.orders_status=="1"?"已付款":""}
                            ${usersOrders.orders_status=="2"?"正在配货":""}
                            ${usersOrders.orders_status=="3"?"已发货":""}
                            ${usersOrders.orders_status=="4"?"交易成功":""}
                        </td>
                    </tr>
                    <tr>
                        <th>收货人:</th>
                        <td>${usersOrders.name}</td>
                        <th>联系电话:</th>
                        <td>${usersOrders.telephone}</td>
                        <th>商品总件数:</th>
                        <td>${usersOrders.goods_sum}</td>
                    </tr>
                    <tr>
                        <th>订单总金额:</th>
                        <td>${usersOrders.sum_money}</td>
                        <th>活动优惠:</th>
                        <td>${usersOrders.discount_amount}</td>
                        <th>商品运费:</th>
                        <td>${usersOrders.goods_freight}</td>
                    </tr>
                    <tr>
                        <th>支付金额:</th>
                        <td>${usersOrders.payment_money}</td>
                        <th>配送方式:</th>
                        <td>${usersOrders.dc_way}</td>
                        <th>配送时间:</th>
                        <td>${usersOrders.dc_time}</td>
                    </tr>
                    <tr>
                        <th>收货地址:</th>
                        <td colspan="3">${usersOrders.orders_address}</td>
                        <th>发票类型:</th>
                        <td>${usersOrders.receipt_type}</td>
                    </tr>
                </table>
            </fieldset>
            <fieldset>
                <legend class="m-b-xs font-size16"><span class="must-msg">2.</span>订单详情信息:</legend>
                <table class="table table-condensed table-bordered table-hover detail-table">
                    <thead>
                        <tr>
                            <th>序号</th>
                            <th>预览图片</th>
                            <th>商品名称</th>
                            <th>购买数量</th>
                            <th>购买价格</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="count" value="0"></c:set>
                        <c:forEach items="${usersOrders.phoneGoodsList}" var="pg">
                            <c:set var="count" value="${count+1}"></c:set>
                            <tr>
                                <td>${count}</td>
                                <td>
                                    <img alt="预览图" width="25" height="25" src="${pageContext.request.contextPath}${pg.goods_color_img_url}?width=25&height=25"/>
                                </td>
                                <td>${pg.goods_small_type_name} ${pg.phone_model_name} ${pg.phone_version_name} ${pg.goods_color_name}</td>
                                <td>${pg.cost_num}</td>
                                <td>${pg.cost_price}</td>
                            </tr>
                        </c:forEach>
                        <c:forEach items="${usersOrders.otherGoodsList}" var="og" varStatus="status">
                            <c:set var="count" value="${count+1}"></c:set>
                            <tr>
                                <td>${count}</td>
                                <td>
                                    <img alt="预览图" width="25" height="25" src="${pageContext.request.contextPath}${og.goods_color_img_url}?width=25&height=25"/>
                                </td>
                                <td>${og.goods_name} ${og.goods_color_name}</td>
                                <td>${og.cost_num}</td>
                                <td>${og.cost_price}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </fieldset>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-xs btn-info" data-dismiss="modal">
            <i class="glyphicon glyphicon-remove font-size12"></i>
            <span>关闭</span>
        </button>
    </div>
</form>

<script type="text/javascript">


</script>
