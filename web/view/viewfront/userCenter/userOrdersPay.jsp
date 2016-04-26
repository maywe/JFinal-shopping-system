<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width,initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" name="viewport">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <link rel="shortcut icon" type="image/ico" href="${pageContext.request.contextPath}/images/mi-logo-36.png">
    <title>小米官网-支付订单</title>
    <link href="${pageContext.request.contextPath}/css/common/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/font-awesome.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/awesome-bootstrap-checkbox.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/common.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/viewfront/mi-common.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/viewfront/mi-userOrdersPay.css" type="text/css" rel="stylesheet">

    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/bootstrap.min.js"></script>
    <!-- 浏览器兼容 bsie js 补丁只在IE6中才执行 -->
    <!--[if lte IE 6]>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/bootstrap-ie.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/html5shiv.min.js"></script>
    <![endif]-->
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/common.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/viewfront/mi-common.js"></script>
</head>
<body class="myBody">
<div class="div-center-width-1290">
    <%@ include file="./../include/mi-topPage.jsp" %>
    <div class="myContainer-context">
        <div class="myContainer-context-top-title">
            <div class="orders-pay-head">
                <a class="logo" title="小米官网" href="${pageContext.request.contextPath}/"></a>
                <h3 class="logo-title">支付订单</h3>
                <p class="logo-desc"></p>
            </div>
        </div>
        <div class="orders-pay-body">
            <div class="user-orders-pay-info-box">
                <div class="row orders-info">
                    <div class="col-xs-2 display-table">
                        <div class="display-table-cell">
                            <i class="glyphicon glyphicon-ok-circle info-ok"></i>
                        </div>
                    </div>
                    <div class="col-xs-8 order-title">
                        <h2 class="title">订单提交成功！去付款咯～</h2>
                        <p id="J_deliverDesc" class="order-time">
                            现在支付，预计2-4天送达
                        </p>
                        <p class="order-time">
                            请在赶紧完成支付, 超时后将取消订单哦～
                        </p>
                    </div>
                    <div class="col-xs-2 order-money">
                        <p class="total">
                            应付总额：
                            <span class="money">
                                <em>${usersOrders.payment_money}</em>元
                            </span>
                        </p>
                    </div>
                </div>
                <div class="row orders-details-info">
                    <div class="col-xs-2"></div>
                    <div class="col-xs-10">
                        <div class="item">
                            <span class="title">订单&nbsp;&nbsp;&nbsp;&nbsp;号：</span>
                            <span class="content">
                                <span class="order-num">${usersOrders.user_orders_id}</span>
                            </span>
                        </div>
                        <div class="item">
                            <span class="title">收货信息：</span>
                            <span class="content">${usersOrders.name} ${usersOrders.telephone} ${usersOrders.orders_address}</span>
                        </div>
                        <div class="item">
                            <span class="title">配送方式：</span>
                            <span class="content">${usersOrders.dc_way}</span>
                        </div>
                        <div class="item">
                            <span class="title">配送时间：</span>
                            <span class="content">${usersOrders.dc_time}</span>
                        </div>
                        <div class="item">
                            <span class="title">发票信息：</span>
                            <span class="content">${usersOrders.receipt_type}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row orders-pay-actions">
            <div class="col-xs-8 section-left"></div>
            <div class="col-xs-4 section-right">
                <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/initGoodsPurchase.action" class="btn btn-lg btn-grey border-radius-0">继续购物</a>
                <a href="${pageContext.request.contextPath}/userCenterCtrl/initUserCenter.action?command=getMyOrdersPage" class="btn btn btn-orange btn-lg border-radius-0">去个人中心</a>
            </div>
        </div>
    </div>
    <%@ include file="./../include/mi-bottomPage.jsp" %>
</div>
<script type="text/javascript">
    $(function(){

    });
</script>
</body>
</html>
