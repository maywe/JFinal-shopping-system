<%@ page import="com.base.util.DateUtils" %>
<%@ page import="com.mi2.model.UsersOrders" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="user-person-orders-detail">
    <div class="user-orders-detail-header">
        <div class="title">
            <h2 class="m-t">订单详情</h2>
        </div>
        <div class="row more">
            <div class="col-xs-6">
                <h4 class="subtitle">订单号：${usersOrders.user_orders_id}</h4>
            </div>
            <div class="col-xs-6">
                <div class="order-actions">
                    <a class="btn btn-sm btn-grey" href="javascript:;">申请售后</a>
                </div>
            </div>
        </div>
    </div>
    <div class="user-orders-detail-body">
        <div class="order-detail">
            <div class="order-summary">
                <div class="order-status">
                    ${usersOrders.orders_status==1?"已付款":""}
                    ${usersOrders.orders_status==2?"正在配货":""}
                    ${usersOrders.orders_status==3?"已发货":""}
                    ${usersOrders.orders_status==4?"交易成功":""}
                </div>
                <div class="order-progress">
                    <ul class="progress-list clearfix">
                        <%
                            UsersOrders usersOrders_1= (UsersOrders)request.getAttribute("usersOrders");
                        %>
                        <li class="step step-first ${usersOrders.orders_status>=0?'step-done':''} ${usersOrders.orders_status==0?'step-active':''}">
                            <div class="progress">
                                <span class="text">下单</span>
                            </div>
                            <div class="info"><%=DateUtils.oracleSqlTimestampToStr(usersOrders_1.get("orders_time"))%></div>
                        </li>
                        <li class="step ${usersOrders.orders_status>=1?'step-done':''} ${usersOrders.orders_status==1?'step-active':''}">
                            <div class="progress">
                                <span class="text">付款</span>
                            </div>
                            <div class="info"><%=DateUtils.oracleSqlTimestampToStr(usersOrders_1.get("pay_time"))%></div>
                        </li>
                        <li class="step ${usersOrders.orders_status>=2?'step-done':''} ${usersOrders.orders_status==2?'step-active':''}">
                            <div class="progress-box">
                                <div class="progress">
                                    <span class="text">配货</span>
                                </div>
                            </div>
                            <div class="info"><%=DateUtils.oracleSqlTimestampToStr(usersOrders_1.get("prepare_goods_time"))%></div>
                        </li>
                        <li class="step ${usersOrders.orders_status>=3?'step-done':''} ${usersOrders.orders_status==3?'step-active':''}">
                            <div class="progress">
                                <span class="text">出库</span>
                            </div>
                            <div class="info"><%=DateUtils.oracleSqlTimestampToStr(usersOrders_1.get("deliver_goods_time"))%></div>
                        </li>
                        <li class="step step-last ${usersOrders.orders_status>=4?'step-done':''} ${usersOrders.orders_status==4?'step-active':''}">
                            <div class="progress">
                                <span class="text">交易成功</span>
                            </div>
                            <div class="info"><%=DateUtils.oracleSqlTimestampToStr(usersOrders_1.get("take_goods_time"))%></div>
                        </li>
                    </ul>
                </div>
                <div class="order-goods-list">
                    <c:forEach items="${usersOrders.phoneGoodsList}" var="pg">
                        <div class="row">
                            <div class="col-xs-2 display-table order-detail-img">
                                <div class="display-table-cell">
                                    <a target="_blank" href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id==${data.goods_small_type_id}">
                                        <img width="80" height="80" alt="${pg.goods_small_type_name} ${pg.phone_model_name} ${pg.phone_version_name} ${pg.goods_color_name}" src="${pageContext.request.contextPath}${pg.goods_color_img_url}?width=80&height=80">
                                    </a>
                                </div>
                            </div>
                            <div class="col-xs-10 display-table">
                                <div class="display-table-cell">
                                    <div class="name">
                                        <a target="_blank" href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=${pg.goods_small_type_id}">${pg.goods_small_type_name} ${pg.phone_model_name} ${pg.phone_version_name} ${pg.goods_color_name}</a>
                                    </div>
                                    <div class="price">${pg.cost_price}元 × ${pg.cost_num}</div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <c:forEach items="${usersOrders.otherGoodsList}" var="og">
                        <div class="row">
                            <div class="col-xs-2 display-table order-detail-img">
                                <div class="display-table-cell">
                                    <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/initGoodsPurchase.action?filterGoodsSmallTypeId=${og.goods_small_type_id}" target="_blank">
                                        <img alt="${og.goods_name} ${og.goods_color_name}" src="${pageContext.request.contextPath}${og.goods_color_img_url}?width=80&height=80" width="80" height="80">
                                    </a>
                                </div>
                            </div>
                            <div class="col-xs-10 display-table">
                                <div class="display-table-cell">
                                    <div class="name">
                                        <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/initGoodsPurchase.action?filterGoodsSmallTypeId=${og.goods_small_type_id}" target="_blank"> ${og.goods_name} ${og.goods_color_name} </a>
                                    </div>
                                    <div class="price">${og.cost_price}元 × ${og.cost_num}</div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="order-detail-info">
                <h4 class="title">收货信息</h4>
                <ul class="info">
                    <li>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：${usersOrders.name}</li>
                    <li>联系电话：${usersOrders.telephone}</li>
                    <li>收货地址：${usersOrders.orders_address}</li>
                </ul>
            </div>
            <div class="order-detail-info">
                <h4 class="title">支付方式及送货时间</h4>
                <ul class="info">
                    <li>支付方式：在线支付</li>
                    <li>送货时间：${usersOrders.dc_time}</li>
                </ul>
            </div>
            <div class="order-detail-info">
                <h4 class="title">发票信息</h4>
                <ul class="info">
                    <li>发票类型：${usersOrders.receipt_type}</li>
                    <li>发票内容：购买商品明细</li>
                    <li>发票抬头：个人</li>
                </ul>
            </div>
            <div class="row order-detail-total">
                <div class="col-xs-9"></div>
                <div class="col-xs-3 money-box">
                    <ul>
                        <li class="clearfix">
                            <label>商品件数：</label>
                            <span class="orangeColor">${usersOrders.goods_sum}件</span>
                        </li>
                        <li class="clearfix">
                            <label>金额合计：</label>
                            <span class="orangeColor">${usersOrders.sum_money}元</span>
                        </li>
                        <li class="clearfix">
                            <label>活动优惠：</label>
                            <span class="orangeColor">-${usersOrders.discount_amount}元</span>
                        </li>
                        <li class="clearfix">
                            <label>运&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;费：</label>
                            <span class="orangeColor">${usersOrders.goods_freight}元</span>
                        </li>
                        <li class="clearfix total-price">
                            <label>应付总额：</label>
                            <span class="orangeColor">${usersOrders.payment_money}元</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

</script>
