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
    <title>小米官网-商品结算</title>
    <link href="${pageContext.request.contextPath}/css/common/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/font-awesome.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/awesome-bootstrap-checkbox.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/common.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/viewfront/mi-common.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/viewfront/mi-userSettleAccounts.css" type="text/css" rel="stylesheet">

    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/bootstrap.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/PCASClass.js"></script>
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
            <div class="settle-accounts-head">
                <a class="logo" title="小米官网" href="${pageContext.request.contextPath}/"></a>
                <h3 class="logo-title">确认订单</h3>
                <p class="logo-desc">温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算。</p>
            </div>
        </div>
        <div class="settle-accounts-body">
            <div class="user-address-box">
                <div class="user-address-title">收货地址</div>
                <div class="user-address-body clearfix">
                    <c:forEach items="${usersDeliveryAddressList}" var="uda">
                        <div onclick="selectUserAddress(this,'${uda.users_delivery_address_id}')" class="user-address-item">
                            <dl>
                                <dt class="m-b clearfix">
                                    <span class="user-address-tag">${uda.address_label}</span>
                                    <em class="user-name">${uda.name}</em>
                                </dt>
                                <dd class="user-tel">${uda.telephone}</dd>
                                <dd class="user-address">
                                    ${uda.province} ${uda.city} ${uda.county}
                                    <br>
                                    ${uda.street}
                                </dd>
                            </dl>
                            <div class="row actions">
                                <div class="col-xs-6 user-address-delete">
                                    <a href="${pageContext.request.contextPath}/userSettleAccountsCtrl/deleteUserAddressData.action?usersDeliveryAddress.users_delivery_address_id=${uda.users_delivery_address_id}">删除</a>
                                </div>
                                <div class="col-xs-6 user-address-update">
                                    <a data-whatever="修改收货地址" data-backdrop="static" data-toggle="modal" href="${pageContext.request.contextPath}/userSettleAccountsCtrl/updateUserAddressRequest.action?usersDeliveryAddress.users_delivery_address_id=${uda.users_delivery_address_id}" data-target="#pop_modal_sm">修改</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="user-address-item">
                        <div class="user-add-address display-table">
                            <div class="display-table-cell text-center">
                                <a data-whatever="增加收货地址" data-backdrop="static" data-toggle="modal" href="${pageContext.request.contextPath}/userSettleAccountsCtrl/addUserAddressRequest.action" data-target="#pop_modal_sm">
                                    <i class="fa fa-plus-circle"></i><br>
                                    <span>添加新地址</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row section-options">
                <div class="col-xs-2 display-table">
                    <div class="display-table-cell section-header">
                        <h4>
                            支付方式
                        </h4>
                    </div>
                </div>
                <div class="col-xs-10 display-table">
                    <div class="display-table-cell section-body active">
                        在线支付 （支持支付宝、银联、财付通、小米钱包等）
                    </div>
                </div>
            </div>
            <div class="row section-options">
                <div class="col-xs-2 display-table">
                    <div class="display-table-cell section-header">
                        <h4>
                            配送方式
                        </h4>
                    </div>
                </div>
                <div class="col-xs-10 display-table">
                    <div class="display-table-cell section-body active">
                        快递配送
                    </div>
                </div>
            </div>
            <div class="row section-options">
                <div class="col-xs-2 display-table">
                    <div class="display-table-cell section-header">
                        <h4>
                            配送时间
                        </h4>
                    </div>
                </div>
                <div class="col-xs-10 display-table">
                    <div onclick="selectDCTime(this)" class="display-table-cell section-body active">
                        <span>
                            不限送货时间（周一至周日）
                        </span>
                    </div>
                    <div onclick="selectDCTime(this)" class="display-table-cell section-body">
                        <span>
                            工作日送货（周一至周五）
                        </span>
                    </div>
                    <div onclick="selectDCTime(this)" class="display-table-cell section-body">
                        <span>
                            双休日、假日送货（周六至周日）
                        </span>
                    </div>
                </div>
            </div>
            <div class="row section-options">
                <div class="col-xs-2 display-table">
                    <div class="display-table-cell section-header">
                        <h4>
                            发票
                        </h4>
                    </div>
                </div>
                <div class="col-xs-10 display-table">
                    <div onclick="selectReceiptType(this)" class="display-table-cell section-body active">
                        <span>
                            电子发票（非纸质）
                        </span>
                    </div>
                    <div onclick="selectReceiptType(this)" class="display-table-cell section-body">
                        <span>
                            普通发票（纸质）
                        </span>
                    </div>
                    <div class="display-table-cell section-body">
                        <span style="border: none;"></span>
                    </div>
                </div>
            </div>

            <div class="user-goods-box">
                <div class="user-goods-title">商品列表及优惠</div>
                <div class="user-goods-body">
                    <c:set var="goodsNum" value="0"></c:set>
                    <c:set var="goodsSumMoney" value="0"></c:set>
                    <c:set var="discountAmount" value="0"></c:set>
                    <c:forEach items="${phoneGoodsList}" var="pg">
                        <c:set var="goodsNum" value="${goodsNum+pg.shopping_num}"></c:set>
                        <c:set var="goodsSumMoney" value="${goodsSumMoney+pg.phone_now_price*pg.shopping_num}"></c:set>
                        <div class="row user-goods-row">
                            <div class="col-xs-2 col-img display-table">
                                <div class="display-table-cell">
                                    <img alt="${pg.goods_small_type_name} ${pg.phone_model_name} ${pg.phone_version_name} ${pg.goods_color_name}" width="40" height="40" src="${pageContext.request.contextPath}${pg.goods_color_img_url}?width=40&height=40">
                                </div>
                            </div>
                            <div class="col-xs-4 col-name display-table">
                                <div class="display-table-cell">
                                    ${pg.goods_small_type_name} ${pg.phone_model_name} ${pg.phone_version_name} ${pg.goods_color_name}
                                </div>
                            </div>
                            <div class="col-xs-2 col-price-num display-table">
                                <div class="display-table-cell">
                                    ${pg.phone_now_price}元 x ${pg.shopping_num}
                                </div>
                            </div>
                            <div class="col-xs-2 col-source display-table">
                                <div class="display-table-cell">
                                    ${pg.phone_stock>0?"有货":"缺货"}
                                </div>
                            </div>
                            <div class="col-xs-2 col-total display-table">
                                <div class="display-table-cell">
                                    <span class="orangeColor">${pg.phone_now_price*pg.shopping_num}元</span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <c:forEach items="${phoneSetmealGoodsList}" var="psg">
                        <c:set var="goodsNum" value="${goodsNum+psg.shopping_num}"></c:set>
                        <c:set var="goodsSumMoney" value="${goodsSumMoney+psg.setmeal_price*psg.shopping_num}"></c:set>
                        <c:set var="discountAmount" value="${discountAmount+psg.save_money}"></c:set>
                        <div class="row user-goods-row">
                            <div class="col-xs-2 col-img display-table">
                                <div class="display-table-cell">
                                    <img alt="${psg.goods_small_type_name} ${psg.phone_setmeal_name}" width="40" height="40" src="${pageContext.request.contextPath}${psg.setmeal_preview_image}?width=40&height=40">
                                </div>
                            </div>
                            <div class="col-xs-4 col-name display-table">
                                <div class="display-table-cell">
                                    ${psg.goods_small_type_name} ${psg.phone_setmeal_name}
                                </div>
                            </div>
                            <div class="col-xs-2 col-price-num display-table">
                                <div class="display-table-cell">
                                    ${psg.setmeal_price}元 x ${psg.shopping_num}
                                </div>
                            </div>
                            <div class="col-xs-2 col-source display-table">
                                <div class="display-table-cell">
                                    有货
                                </div>
                            </div>
                            <div class="col-xs-2 col-total display-table">
                                <div class="display-table-cell">
                                    <span class="orangeColor">${psg.setmeal_price*psg.shopping_num}元</span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <c:forEach items="${otherGoodsList}" var="og">
                        <c:set var="goodsNum" value="${goodsNum+og.shopping_num}"></c:set>
                        <c:set var="goodsSumMoney" value="${goodsSumMoney+og.goods_new_price*og.shopping_num}"></c:set>
                        <div class="row user-goods-row">
                            <div class="col-xs-2 col-img display-table">
                                <div class="display-table-cell">
                                    <img alt="${og.goods_name} ${og.goods_color_name}" width="40" height="40" src="${pageContext.request.contextPath}${og.goods_color_img_url}?width=40&height=40">
                                </div>
                            </div>
                            <div class="col-xs-4 col-name display-table">
                                <div class="display-table-cell">
                                    ${og.goods_name} ${og.goods_color_name}
                                </div>
                            </div>
                            <div class="col-xs-2 col-price-num display-table">
                                <div class="display-table-cell">
                                    ${og.goods_new_price}元 x ${og.shopping_num}
                                </div>
                            </div>
                            <div class="col-xs-2 col-source display-table">
                                <div class="display-table-cell">
                                    ${og.goods_stock>0?"有货":"缺货"}
                                </div>
                            </div>
                            <div class="col-xs-2 col-total display-table">
                                <div class="display-table-cell">
                                    <span class="orangeColor">${og.goods_new_price*og.shopping_num}元</span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="user-goods-accounts-box">
                <div class="row">
                    <div class="col-xs-8"></div>
                    <div class="col-xs-4 money-box">
                        <ul>
                            <li class="clearfix">
                                <label>商品件数：</label>
                                <span class="orangeColor">${goodsNum}件</span>
                            </li>
                            <li class="clearfix">
                                <label>金额合计：</label>
                                <span class="orangeColor">${goodsSumMoney+discountAmount}元</span>
                            </li>
                            <li class="clearfix">
                                <label>活动优惠：</label>
                                <span class="orangeColor">-${discountAmount}元</span>
                            </li>
                            <li class="clearfix">
                                <label>运费：</label>
                                <span class="orangeColor">${goodsSumMoney>100?0:10}元</span>
                            </li>
                            <li class="clearfix total-price">
                                <label>应付总额：</label>
                                <span class="orangeColor">${goodsSumMoney>100?goodsSumMoney:goodsSumMoney+10}元</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <form id="userSettleAccountsForm" class="hide" method="post" action="${pageContext.request.contextPath}/userSettleAccountsCtrl/goSettleAccounts.action">
                <input type="hidden" name="users_delivery_address_id" value="">
                <input type="hidden" name="usersOrders.dc_way" value="快递配送">
                <input type="hidden" name="usersOrders.dc_time" value="不限送货时间（周一至周日）">
                <input type="hidden" name="usersOrders.receipt_type" value="电子发票（非纸质）">
                <input type="hidden" name="usersOrders.goods_sum" value="${goodsNum}">
                <input type="hidden" name="usersOrders.sum_money" value="${goodsSumMoney+discountAmount}">
                <input type="hidden" name="usersOrders.discount_amount" value="${discountAmount}">
                <input type="hidden" name="usersOrders.goods_freight" value="${goodsSumMoney>100?0:10}">
                <input type="hidden" name="usersOrders.payment_money" value="${goodsSumMoney>100?goodsSumMoney:goodsSumMoney+10}">
            </form>
        </div>
        <div class="row settle-accounts-actions">
            <div class="col-xs-8 section-left"></div>
            <div class="col-xs-4 section-right">
                <a href="${pageContext.request.contextPath}/userShoppingCartCtrl/initUserShoppingCart.action" class="btn btn-lg btn-grey border-radius-0">返回购物车</a>
                <button id="J_settleAccounts" disabled onclick="goSettleAccounts()" class="btn btn btn-orange btn-lg border-radius-0">结算</button>
            </div>
        </div>
    </div>
    <%@ include file="./../include/mi-bottomPage.jsp" %>
</div>
<script type="text/javascript">
    $(function(){
        initModal('#pop_modal_sm');
    });

    //选择用户收货地址
    function selectUserAddress(obj,users_delivery_address_id){
        activeFun(obj);
        $('#userSettleAccountsForm').find('input[name="users_delivery_address_id"]').val(users_delivery_address_id);
        $('#J_settleAccounts').removeAttr('disabled');
    }

    //选择配送时间
    function selectDCTime(obj){
        activeFun(obj);
        $('#userSettleAccountsForm').find('input[name="usersOrders.dc_time"]').val($(obj).children('span').text());
    }
    //选择发票类型
    function selectReceiptType(obj){
        activeFun(obj);
        $('#userSettleAccountsForm').find('input[name="usersOrders.receipt_type"]').val($(obj).children('span').text());
    }

    //结算方法
    function goSettleAccounts(){
        var $userSettleAccountsForm = $('#userSettleAccountsForm');
        var users_delivery_address_id = $userSettleAccountsForm.find('input[name="users_delivery_address_id"]').val();
        if(users_delivery_address_id==""||users_delivery_address_id==undefined){
            toastr.info('请先选择你的收货地址!');
        }else{
            $userSettleAccountsForm.submit();
        }
    }
</script>
</body>
</html>
