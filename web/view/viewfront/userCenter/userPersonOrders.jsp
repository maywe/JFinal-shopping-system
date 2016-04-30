<%@ page import="com.base.util.DateUtils" %>
<%@ page import="com.mi2.model.UsersOrders" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="user-person-orders">
    <div class="user-orders-header">
        <div class="title">
            <h2 class="m-t">我的订单</h2>
        </div>
        <div class="row order-filter-box">
            <div class="col-xs-9">
                <ul class="filter-list clearfix">
                    <li class="${empty usersOrders.orders_status?'active':''}" onclick="activeFun(this)" style="padding: 0;">
                        <a href="javascript:;" onclick="ordersSearchFormSubmit('')">全部有效订单</a>
                    </li>
                    <li class="${not empty usersOrders.orders_status?'active':''}" style="border-right: none;" onclick="activeFun(this)">
                        <a href="javascript:;" onclick="ordersSearchFormSubmit('4')">待收货${empty userSumNotReceivedOrderNum?'':'('}${empty userSumNotReceivedOrderNum?'':userSumNotReceivedOrderNum}${empty userSumNotReceivedOrderNum?'':')'}</a>
                    </li>
                </ul>
            </div>
            <div class="col-xs-3">
                <form id="ordersSearchForm" class="order-search-form search-form" method="post">
                    <div class="input-group search-group">
                        <input value="${usersOrders.orders_search_keys}" name="orders_search_keys" class="form-control search-input border-radius-0" type="search" placeholder="商品名称、订单编号">
                        <input value="${usersOrders.orders_status}" name="orders_status" type="hidden">
                        <span onclick="ordersSearchFormSubmit()" class="input-group-addon search-btn border-radius-0"><i class="fa fa-search"></i></span>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="user-orders-body">
        <c:forEach items="${pageUtil.list}" var="data">
            <div class="orders-item" style="${data.orders_status==4?'':'border: 1px solid rgb(255,103,0);'}">
                <div class="order-status">
                    ${data.orders_status==1?"已付款":""}
                    ${data.orders_status==2?"正在配货":""}
                    ${data.orders_status==3?"已发货":""}
                    ${data.orders_status==4?"交易成功":""}
                </div>
                <div class="row order-detail-head">
                    <div class="col-xs-8 caption-info">
                        <%--
                        <fmt:formatDate value="${data.orders_time}" pattern="yyyy-mm-dd hh24:mi:ss"/>
                         ${data.orders_time}
                        --%>
                        <%
                            UsersOrders usersOrders_1= (UsersOrders)pageContext.getAttribute("data");
                        %>
                        <c:if test="${data.orders_status==0}">
                            <%=DateUtils.oracleSqlTimestampToStr(usersOrders_1.get("orders_time"))%>
                        </c:if>
                        <c:if test="${data.orders_status==1}">
                            <%=DateUtils.oracleSqlTimestampToStr(usersOrders_1.get("pay_time"))%>
                        </c:if>
                        <c:if test="${data.orders_status==2}">
                            <%=DateUtils.oracleSqlTimestampToStr(usersOrders_1.get("prepare_goods_time"))%>
                        </c:if>
                        <c:if test="${data.orders_status==3}">
                            <%=DateUtils.oracleSqlTimestampToStr(usersOrders_1.get("deliver_goods_time"))%>
                        </c:if>
                        <c:if test="${data.orders_status==4}">
                            <%=DateUtils.oracleSqlTimestampToStr(usersOrders_1.get("take_goods_time"))%>
                        </c:if>
                        <span class="sep">|</span>
                        ${data.name}
                        <span class="sep">|</span>
                        订单号：
                        <a onclick="getUserOrderDetailPage('${data.orders_id}')" href="javascript:;">${data.user_orders_id}</a>
                        <span class="sep">|</span>
                        在线支付
                    </div>
                    <div class="col-xs-4 caption-price">
                        订单金额：
                        <span class="num">${data.payment_money}</span>
                        元
                    </div>
                </div>
                <div class="order-detail-body">
                    <div class="order-detail-box">
                        <c:forEach items="${data.phoneGoodsList}" var="pg">
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
                        <c:forEach items="${data.otherGoodsList}" var="og">
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
                        <div class="order-actions">
                            <a onclick="getUserOrderDetailPage('${data.orders_id}')" class="btn btn-sm btn-orange" href="javascript:;">订单详情</a>
                            <a class="btn btn-sm btn-grey" href="javascript:;">申请售后</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <div id="ordersPaginationBox" class="pagination-box clearfix" pageNumber="${pageUtil.pageNumber}" pageSize="${pageUtil.pageSize}" totalPage="${pageUtil.totalPage}" totalRow="${pageUtil.totalRow}"></div>
    </div>
</div>
<script type="text/javascript">
    $(function(){
        $('#ordersPaginationBox').initPaginationData('selectOrderPageNumber');
    });

    function ordersSearchFormSubmit(orders_status){
        var $ordersSearchForm = $('#ordersSearchForm');
        if(orders_status!=undefined){
            $ordersSearchForm.find('input[name="orders_status"]').val(orders_status);
        }
        getTargetPage(null,'getMyOrdersPage',$ordersSearchForm.formToJson());
    }

    //选择分页项
    function selectOrderPageNumber(pageNumber){
        var param = $('#ordersSearchForm').formToJson();
        param.pageNumber = pageNumber;
        getTargetPage(null,'getMyOrdersPage',param);
    }

    //获取订单详情
    function getUserOrderDetailPage(orders_id){
        var param = {};
        param.orders_id = orders_id;
        getTargetPage(null,'getUserOrderDetailPage',param);
    }
</script>
