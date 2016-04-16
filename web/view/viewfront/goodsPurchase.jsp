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
    <title>小米官网-商品购买</title>
    <link href="${pageContext.request.contextPath}/css/common/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/font-awesome.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/awesome-bootstrap-checkbox.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/toastr.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/animate.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/common.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/viewfront/mi-common.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/viewfront/mi-goodsPurchase.css" type="text/css" rel="stylesheet">
</head>
<body class="myBody">
    <div class="div-center-width-1290">
        <%@ include file="./include/mi-topNavPage.jsp" %>
        <div class="myContainer-context buy-choose-box">
            <div class="path-nav-box">
                <div class="display-table">
                    <div class="display-table-cell path-nav">
                        <a href="${pageContext.request.contextPath}/" class="home">首页</a>
                        <span>&gt;</span>
                        <a href="#" class="all-goods">全部商品</a>
                    </div>
                </div>
            </div>
            <div class="hd">
                <div class="filter-box">
                    <div class="row filter-list-row">
                        <div class="col-xs-1 filter-list-desc">商品分类：</div>
                        <div class="col-xs-11 filter-list">
                            <ul>
                                <li>
                                    <div class="row">
                                        <div class="col-xs-2 filter-list-type">手机配件系列&gt;</div>
                                        <div class="col-xs-10 filter-list-item-box">
                                            <ul class="clearfix">
                                                <c:forEach items="${phoneAccessoryTypeList}" var="pat">
                                                    <li class="filter-list-item">${pat.goods_small_type_name}</li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="row">
                                        <div class="col-xs-2 filter-list-type">小米生活系列&gt;</div>
                                        <div class="col-xs-10 filter-list-item-box">
                                            <ul class="clearfix">
                                                <c:forEach items="${miLifeTypeList}" var="mlt">
                                                    <li class="filter-list-item">${mlt.goods_small_type_name}</li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="row filter-list-row">
                        <div class="col-xs-1 filter-list-desc">匹配机型：</div>
                        <div class="col-xs-11">
                            <ul>
                                <li>
                                    <div class="row">
                                        <div class="col-xs-2 filter-list-type">小米手机系列&gt;</div>
                                        <div class="col-xs-10 filter-list-item-box">
                                            <ul class="clearfix">
                                                <c:forEach items="${phoneTypeList}" var="pt">
                                                    <li class="filter-list-item">${pt.goods_small_type_name}</li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <%--
                <ul id="J_navBar" class="pro-nav-bar clearfix">
                    <c:forEach items="${phoneSmallTypeList}" var="pst">
                        <li class="${pst.goods_small_type_id==phoneSmallType.goods_small_type_id?'active':''}">
                            <a class="${pst.goods_small_type_id==phoneSmallType.goods_small_type_id?'orangeColor':''}" href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=${pst.goods_small_type_id}">${pst.goods_small_type_name}</a>
                        </li>
                    </c:forEach>
                    <c:if test="${fn:length(phoneSmallTypeList)<10}">
                        <c:forEach begin="${fn:length(phoneSmallTypeList)+1}" end="10" step="1">
                            <li>&nbsp;</li>
                        </c:forEach>
                    </c:if>
                </ul>
                --%>
            </div>
            <div class="bd">
                <div class="row order-list-box clearfix">
                    <ul class="col-xs-6 order-list">
                        <li class="active">推荐</li>
                        <li>新品</li>
                        <li>
                            价格
                            <i class="fa fa-long-arrow-up"></i>
                        </li>
                    </ul>
                    <ul class="col-xs-6 type-list">
                        <li>
                            <div class="checkbox checkbox-orange checkbox-inline">
                                <input name="remember_me" type="checkbox" value="remember_me">
                                <label>仅显示特惠商品</label>
                            </div>
                        </li>
                        <li>
                            <div class="checkbox checkbox-orange checkbox-inline">
                                <input name="remember_me" type="checkbox" value="remember_me">
                                <label>仅显示有货商品</label>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="goods-list-box">
                    <div class="goods-list clearfix">
                        <c:forEach items="${pageUtil.list}" var="data">
                            <div class="goods-item animated">
                                <div class="goods-preview-img">
                                    <a href="#">
                                        <c:if test="${fn:length(data.goodsColorList)>0}">
                                            <c:forEach items="${data.goodsColorList}" var="gc" varStatus="status">
                                                <c:if test="${status.index==0}">
                                                    <img width="200" height="200" alt="" src="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=200&height=200">
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${fn:length(data.goodsColorList)==0}">
                                            <img width="200" height="200" alt="" src="${pageContext.request.contextPath}${data.goods_preview_image}?width=200&height=200">
                                        </c:if>
                                    </a>
                                </div>
                                <c:if test="${data.goods_big_type_id==2}">
                                    <p class="desc">适用机型：${empty data.adapt_phone_type_name?"适用于全部机型":data.adapt_phone_type_name}</p>
                                </c:if>
                                <h2 class="title">
                                    <a href="">${data.goods_name}</a>
                                </h2>
                                <p class="price">
                                    ${data.goods_new_price}元
                                    <c:if test="${data.goods_new_price<data.goods_former_price}">
                                        <del>${data.goods_former_price}元</del>
                                    </c:if>
                                </p>
                                <div class="thumbs">
                                    <div class="thumb-list">
                                        <c:forEach items="${data.goodsColorList}" var="gc" varStatus="status">
                                            <span onclick="selectGoodsColorImg(this)" data-node-id="${gc.goods_color_id}" data-img="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=200&height=200" class="${status.index==0?'active':''}">
                                                <img width="34" height="34" alt="${data.goods_name} ${gc.goods_addribute_val_name}" src="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=34&height=34">
                                            </span>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="actions clearfix">
                                    <a class="btn-like">
                                        <i class="fa fa-heart-o"></i>
                                        <span>喜欢</span>
                                    </a>
                                    <a class="btn-buy">
                                        <span>加入购物车</span>
                                        <i class="fa fa-shopping-cart"></i>
                                    </a>
                                </div>
                                <div class="flags">
                                    <c:if test="${data.goods_new_price<data.goods_former_price}">
                                        <div class="flag flag-sale-off">${data.goods_new_price*10/data.goods_former_price}折促销</div>
                                    </c:if>
                                </div>
                                <div class="notice"></div>
                            </div>
                        </c:forEach>

                    </div>
                </div>

            </div>
        </div>
        <%@ include file="./include/mi-bottomPage.jsp" %>
    </div>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/toastr.min.js"></script>
<!-- 浏览器兼容 bsie js 补丁只在IE6中才执行 -->
<!--[if lte IE 6]>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/bootstrap-ie.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/html5shiv.min.js"></script>
<![endif]-->
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/common.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/viewfront/mi-common.js"></script>
<script type="text/javascript">
    $(function(){
        var errorMessage = '${errorMessage}';
        if(errorMessage){
            toastr.info(errorMessage);
        }
        $('.goods-item').hover(function(){
            $(this).addClass('pulse');
        },function(){
            $(this).removeClass('pulse');
        });
    });

    function selectGoodsColorImg(obj){
        var $img = $(obj).parent().parent().parent().children('div.goods-preview-img').find('img');
        $img.attr('src',$(obj).data('img'));
        activeFun(obj,'active');
    }
</script>
</body>
</html>
