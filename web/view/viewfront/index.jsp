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
    <title>小米官网-主页展示</title>
    <link href="${pageContext.request.contextPath}/css/common/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/font-awesome.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/toastr.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/animate.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/common.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/viewfront/mi-common.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/viewfront/mi-common-goods.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/viewfront/mi-index.css" type="text/css" rel="stylesheet">

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
</head>
<body class="myBody">
    <div class="div-center-width-1290">
        <%@ include file="./include/mi-topNavPage.jsp" %>
        <div class="myContainer-context">
            <div class="page-carousel-box clearfix">
                <div class="carousel-left">&nbsp;</div>
                <div class="carousel-center">
                    <div id="myCarousel" class="carousel slide myCarousel" data-ride="carousel">
                        <!-- 轮播指示器 -->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                            <li data-target="#myCarousel" data-slide-to="3"></li>
                            <li data-target="#myCarousel" data-slide-to="4"></li>
                            <li data-target="#myCarousel" data-slide-to="5"></li>
                            <li data-target="#myCarousel" data-slide-to="6"></li>
                        </ol>

                        <!-- 轮播内容 -->
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                <a href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=23"><img src="${pageContext.request.contextPath}/images/front/carousel/mi-carousel-mi5zx.jpg" alt="小米手机5 尊享版"></a>
                                <div class="carousel-caption"></div>
                            </div>
                            <div class="item">
                                <a href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=23"><img src="${pageContext.request.contextPath}/images/front/carousel/mi-carousel-mi5.jpg" alt="小米手机5"></a>
                                <div class="carousel-caption"></div>
                            </div>
                            <div class="item">
                                <a href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=82"><img src="${pageContext.request.contextPath}/images/front/carousel/mi-carousel-redmi3.jpg" alt="红米手机3"></a>
                                <div class="carousel-caption"></div>
                            </div>
                            <div class="item">
                                <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=202"><img src="${pageContext.request.contextPath}/images/front/carousel/mi-carousel-tv.jpg" alt="小米电视3s 48英寸"></a>
                                <div class="carousel-caption"></div>
                            </div>
                            <div class="item">
                                <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=195"><img src="${pageContext.request.contextPath}/images/front/carousel/mi-carousel-router.jpg" alt="小米路由器3"></a>
                                <div class="carousel-caption"></div>
                            </div>
                            <div class="item">
                                <a href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=22"><img src="${pageContext.request.contextPath}/images/front/carousel/mi-carousel-mi4c.jpg" alt="小米4C"></a>
                                <div class="carousel-caption"></div>
                            </div>
                            <div class="item">
                                <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/initGoodsPurchase.action?filterGoodsSmallTypeId=125"><img src="${pageContext.request.contextPath}/images/front/carousel/mi-carousel-tv3s.jpg" alt="小米电视3S"></a>
                                <div class="carousel-caption"></div>
                            </div>
                        </div>

                        <!-- 轮播控制器 -->
                        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">上一页</span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">下一页</span>
                        </a>
                    </div>
                    <div class="row myCarousel-bottom">
                        <div class="col-xs-4 text-left">
                            <a class="item" target="_blank" href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=86">
                                <img width="316" height="170" src="${pageContext.request.contextPath}/images/front/carousel/mi-carousel-bottom-minotegaddess.jpg" alt="小米Note">
                            </a>
                        </div>
                        <div class="col-xs-4 text-center">
                            <a class="item" target="_blank" href="${pageContext.request.contextPath}/goodsPurchaseCtrl/initGoodsPurchase.action?filterGoodsSmallTypeId=125">
                                <img width="316" height="170" src="${pageContext.request.contextPath}/images/front/carousel/mi-carousel-bottom-tv.jpg" alt="小米电视">
                            </a>
                        </div>
                        <div class="col-xs-4 text-right" href="">
                            <a class="item" target="_blank" href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=167">
                                <img width="316" height="170" src="${pageContext.request.contextPath}/images/front/carousel/mi-carousel-bottom-aircleaner.jpg" alt="空气净化器">
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="page-main-box">
                <div class="page-content-box">
                    <div class="box-head">
                        <h3 class="title">智能硬件</h3>
                        <div class="more-nav">
                            <a class="more-link" target="_blank" href="${pageContext.request.contextPath}/goodsPurchaseCtrl/initGoodsPurchase.action?filterGoodsSmallTypeId=128">
                                查看全部
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="goods-list-box">
                            <div class="goods-list clearfix">
                                <c:forEach items="${ZNYJ_PageUtil.list}" var="data">
                                    <div class="goods-item animated">
                                        <div class="goods-preview-img">
                                            <c:set var="t_goods_color_name" value=""></c:set>
                                            <c:set var="t_goods_color_id" value=""></c:set>
                                            <c:set var="t_goods_color_img_url" value=""></c:set>
                                            <c:if test="${fn:length(data.goodsColorList)>0}">
                                                <c:forEach items="${data.goodsColorList}" var="gc" varStatus="status">
                                                    <c:if test="${status.index==0}">
                                                        <c:set var="t_goods_color_name" value="${gc.goods_addribute_val_name}"></c:set>
                                                        <c:set var="t_goods_color_id" value="${gc.goods_color_id}"></c:set>
                                                        <c:set var="t_goods_color_img_url" value="${gc.goods_color_img_url}"></c:set>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">
                                                <img width="200" height="200" alt="" src="${pageContext.request.contextPath}${t_goods_color_img_url==""?data.goods_preview_image:t_goods_color_img_url}?width=200&height=200">
                                            </a>
                                        </div>
                                        <c:if test="${data.goods_big_type_id==2}">
                                            <p class="desc">适用机型：${empty data.adapt_phone_type_name?"适用于全部机型":data.adapt_phone_type_name}</p>
                                        </c:if>
                                        <h2 class="title">
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">${data.goods_name} ${t_goods_color_name}</a>
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
                                                <span onclick="selectGoodsColorImg(this,'${data.goods_id}','${data.adapt_phone_type_id}')" data-node-id="${gc.goods_color_id}" data-img="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=200&height=200" class="${status.index==0?'active':''}" data-title="${data.goods_name} ${gc.goods_addribute_val_name}">
                                                    <img width="34" height="34" alt="${data.goods_name} ${gc.goods_addribute_val_name}" src="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=34&height=34">
                                                </span>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="actions clearfix">
                                            <a onclick="addUserCollect(this,'${data.goods_id}')" class="btn-like" href="javascript:;">
                                                <i class="fa fa-heart-o"></i>
                                                <span>喜欢</span>
                                            </a>
                                            <c:if test="${data.goods_stock>0}">
                                                <a targetUrl="${pageContext.request.contextPath}/userShoppingCartCtrl/addUserShoppingCart.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}" onclick="addUserShoppingCart(this)" class="btn-buy" href="javascript:;">
                                                    <span>加入购物车</span>
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                            </c:if>
                                            <c:if test="${data.goods_stock<=0}">
                                                <a class="btn-buy" href="javascript:;">
                                                    <span>暂时缺货</span>
                                                    <i class="fa fa-clock-o"></i>
                                                </a>
                                            </c:if>
                                            <div class="actions-info"></div>
                                        </div>
                                        <div class="flags">
                                            <c:if test="${data.goods_new_price<data.goods_former_price}">
                                                <div class="flag flag-sale-off">${data.goods_new_price*10/data.goods_former_price}折促销</div>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="page-content-box">
                    <div class="box-head">
                        <h3 class="title">搭配</h3>
                        <div class="more-nav">
                            <ul class="tab-list clearfix">
                                <li targetId="J_DP_Hot" onmouseover="selectTabNavList(this)" class="tab-active">热门</li>
                                <li targetId="J_DP_EJ" onmouseover="selectTabNavList(this)">耳机</li>
                                <li targetId="J_DP_YDDY" onmouseover="selectTabNavList(this)">移动电源</li>
                                <li targetId="J_DP_DCCCK" onmouseover="selectTabNavList(this)">电池存储卡</li>
                            </ul>
                        </div>
                    </div>
                    <div class="box-body">
                        <div id="J_DP_Hot" class="goods-list-box">
                            <div class="goods-list clearfix">
                                <c:forEach items="${DP_Hot_PageUtil.list}" var="data">
                                    <div class="goods-item animated">
                                        <div class="goods-preview-img">
                                            <c:set var="t_goods_color_name" value=""></c:set>
                                            <c:set var="t_goods_color_id" value=""></c:set>
                                            <c:set var="t_goods_color_img_url" value=""></c:set>
                                            <c:if test="${fn:length(data.goodsColorList)>0}">
                                                <c:forEach items="${data.goodsColorList}" var="gc" varStatus="status">
                                                    <c:if test="${status.index==0}">
                                                        <c:set var="t_goods_color_name" value="${gc.goods_addribute_val_name}"></c:set>
                                                        <c:set var="t_goods_color_id" value="${gc.goods_color_id}"></c:set>
                                                        <c:set var="t_goods_color_img_url" value="${gc.goods_color_img_url}"></c:set>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">
                                                <img width="200" height="200" alt="" src="${pageContext.request.contextPath}${t_goods_color_img_url==""?data.goods_preview_image:t_goods_color_img_url}?width=200&height=200">
                                            </a>
                                        </div>
                                        <c:if test="${data.goods_big_type_id==2}">
                                            <p class="desc">适用机型：${empty data.adapt_phone_type_name?"适用于全部机型":data.adapt_phone_type_name}</p>
                                        </c:if>
                                        <h2 class="title">
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">${data.goods_name} ${t_goods_color_name}</a>
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
                                                <span onclick="selectGoodsColorImg(this,'${data.goods_id}','${data.adapt_phone_type_id}')" data-node-id="${gc.goods_color_id}" data-img="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=200&height=200" class="${status.index==0?'active':''}" data-title="${data.goods_name} ${gc.goods_addribute_val_name}">
                                                    <img width="34" height="34" alt="${data.goods_name} ${gc.goods_addribute_val_name}" src="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=34&height=34">
                                                </span>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="actions clearfix">
                                            <a onclick="addUserCollect(this,'${data.goods_id}')" class="btn-like" href="javascript:;">
                                                <i class="fa fa-heart-o"></i>
                                                <span>喜欢</span>
                                            </a>
                                            <c:if test="${data.goods_stock>0}">
                                                <a targetUrl="${pageContext.request.contextPath}/userShoppingCartCtrl/addUserShoppingCart.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}" onclick="addUserShoppingCart(this)" class="btn-buy" href="javascript:;">
                                                    <span>加入购物车</span>
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                            </c:if>
                                            <c:if test="${data.goods_stock<=0}">
                                                <a class="btn-buy" href="javascript:;">
                                                    <span>暂时缺货</span>
                                                    <i class="fa fa-clock-o"></i>
                                                </a>
                                            </c:if>
                                            <div class="actions-info"></div>
                                        </div>
                                        <div class="flags">
                                            <c:if test="${data.goods_new_price<data.goods_former_price}">
                                                <div class="flag flag-sale-off">${data.goods_new_price*10/data.goods_former_price}折促销</div>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div id="J_DP_EJ" class="goods-list-box hide">
                            <div class="goods-list clearfix">
                                <c:forEach items="${DP_EJ_PageUtil.list}" var="data">
                                    <div class="goods-item animated">
                                        <div class="goods-preview-img">
                                            <c:set var="t_goods_color_name" value=""></c:set>
                                            <c:set var="t_goods_color_id" value=""></c:set>
                                            <c:set var="t_goods_color_img_url" value=""></c:set>
                                            <c:if test="${fn:length(data.goodsColorList)>0}">
                                                <c:forEach items="${data.goodsColorList}" var="gc" varStatus="status">
                                                    <c:if test="${status.index==0}">
                                                        <c:set var="t_goods_color_name" value="${gc.goods_addribute_val_name}"></c:set>
                                                        <c:set var="t_goods_color_id" value="${gc.goods_color_id}"></c:set>
                                                        <c:set var="t_goods_color_img_url" value="${gc.goods_color_img_url}"></c:set>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">
                                                <img width="200" height="200" alt="" src="${pageContext.request.contextPath}${t_goods_color_img_url==""?data.goods_preview_image:t_goods_color_img_url}?width=200&height=200">
                                            </a>
                                        </div>
                                        <c:if test="${data.goods_big_type_id==2}">
                                            <p class="desc">适用机型：${empty data.adapt_phone_type_name?"适用于全部机型":data.adapt_phone_type_name}</p>
                                        </c:if>
                                        <h2 class="title">
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">${data.goods_name} ${t_goods_color_name}</a>
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
                                                <span onclick="selectGoodsColorImg(this,'${data.goods_id}','${data.adapt_phone_type_id}')" data-node-id="${gc.goods_color_id}" data-img="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=200&height=200" class="${status.index==0?'active':''}" data-title="${data.goods_name} ${gc.goods_addribute_val_name}">
                                                    <img width="34" height="34" alt="${data.goods_name} ${gc.goods_addribute_val_name}" src="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=34&height=34">
                                                </span>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="actions clearfix">
                                            <a onclick="addUserCollect(this,'${data.goods_id}')" class="btn-like" href="javascript:;">
                                                <i class="fa fa-heart-o"></i>
                                                <span>喜欢</span>
                                            </a>
                                            <c:if test="${data.goods_stock>0}">
                                                <a targetUrl="${pageContext.request.contextPath}/userShoppingCartCtrl/addUserShoppingCart.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}" onclick="addUserShoppingCart(this)" class="btn-buy" href="javascript:;">
                                                    <span>加入购物车</span>
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                            </c:if>
                                            <c:if test="${data.goods_stock<=0}">
                                                <a class="btn-buy" href="javascript:;">
                                                    <span>暂时缺货</span>
                                                    <i class="fa fa-clock-o"></i>
                                                </a>
                                            </c:if>
                                            <div class="actions-info"></div>
                                        </div>
                                        <div class="flags">
                                            <c:if test="${data.goods_new_price<data.goods_former_price}">
                                                <div class="flag flag-sale-off">${data.goods_new_price*10/data.goods_former_price}折促销</div>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div id="J_DP_YDDY" class="goods-list-box hide">
                            <div class="goods-list clearfix">
                                <c:forEach items="${DP_YDDY_PageUtil.list}" var="data">
                                    <div class="goods-item animated">
                                        <div class="goods-preview-img">
                                            <c:set var="t_goods_color_name" value=""></c:set>
                                            <c:set var="t_goods_color_id" value=""></c:set>
                                            <c:set var="t_goods_color_img_url" value=""></c:set>
                                            <c:if test="${fn:length(data.goodsColorList)>0}">
                                                <c:forEach items="${data.goodsColorList}" var="gc" varStatus="status">
                                                    <c:if test="${status.index==0}">
                                                        <c:set var="t_goods_color_name" value="${gc.goods_addribute_val_name}"></c:set>
                                                        <c:set var="t_goods_color_id" value="${gc.goods_color_id}"></c:set>
                                                        <c:set var="t_goods_color_img_url" value="${gc.goods_color_img_url}"></c:set>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">
                                                <img width="200" height="200" alt="" src="${pageContext.request.contextPath}${t_goods_color_img_url==""?data.goods_preview_image:t_goods_color_img_url}?width=200&height=200">
                                            </a>
                                        </div>
                                        <c:if test="${data.goods_big_type_id==2}">
                                            <p class="desc">适用机型：${empty data.adapt_phone_type_name?"适用于全部机型":data.adapt_phone_type_name}</p>
                                        </c:if>
                                        <h2 class="title">
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">${data.goods_name} ${t_goods_color_name}</a>
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
                                                <span onclick="selectGoodsColorImg(this,'${data.goods_id}','${data.adapt_phone_type_id}')" data-node-id="${gc.goods_color_id}" data-img="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=200&height=200" class="${status.index==0?'active':''}" data-title="${data.goods_name} ${gc.goods_addribute_val_name}">
                                                    <img width="34" height="34" alt="${data.goods_name} ${gc.goods_addribute_val_name}" src="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=34&height=34">
                                                </span>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="actions clearfix">
                                            <a onclick="addUserCollect(this,'${data.goods_id}')" class="btn-like" href="javascript:;">
                                                <i class="fa fa-heart-o"></i>
                                                <span>喜欢</span>
                                            </a>
                                            <c:if test="${data.goods_stock>0}">
                                                <a targetUrl="${pageContext.request.contextPath}/userShoppingCartCtrl/addUserShoppingCart.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}" onclick="addUserShoppingCart(this)" class="btn-buy" href="javascript:;">
                                                    <span>加入购物车</span>
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                            </c:if>
                                            <c:if test="${data.goods_stock<=0}">
                                                <a class="btn-buy" href="javascript:;">
                                                    <span>暂时缺货</span>
                                                    <i class="fa fa-clock-o"></i>
                                                </a>
                                            </c:if>
                                            <div class="actions-info"></div>
                                        </div>
                                        <div class="flags">
                                            <c:if test="${data.goods_new_price<data.goods_former_price}">
                                                <div class="flag flag-sale-off">${data.goods_new_price*10/data.goods_former_price}折促销</div>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div id="J_DP_DCCCK" class="goods-list-box hide">
                            <div class="goods-list clearfix">
                                <c:forEach items="${DP_DCCCK_PageUtil.list}" var="data">
                                    <div class="goods-item animated">
                                        <div class="goods-preview-img">
                                            <c:set var="t_goods_color_name" value=""></c:set>
                                            <c:set var="t_goods_color_id" value=""></c:set>
                                            <c:set var="t_goods_color_img_url" value=""></c:set>
                                            <c:if test="${fn:length(data.goodsColorList)>0}">
                                                <c:forEach items="${data.goodsColorList}" var="gc" varStatus="status">
                                                    <c:if test="${status.index==0}">
                                                        <c:set var="t_goods_color_name" value="${gc.goods_addribute_val_name}"></c:set>
                                                        <c:set var="t_goods_color_id" value="${gc.goods_color_id}"></c:set>
                                                        <c:set var="t_goods_color_img_url" value="${gc.goods_color_img_url}"></c:set>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">
                                                <img width="200" height="200" alt="" src="${pageContext.request.contextPath}${t_goods_color_img_url==""?data.goods_preview_image:t_goods_color_img_url}?width=200&height=200">
                                            </a>
                                        </div>
                                        <c:if test="${data.goods_big_type_id==2}">
                                            <p class="desc">适用机型：${empty data.adapt_phone_type_name?"适用于全部机型":data.adapt_phone_type_name}</p>
                                        </c:if>
                                        <h2 class="title">
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">${data.goods_name} ${t_goods_color_name}</a>
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
                                                <span onclick="selectGoodsColorImg(this,'${data.goods_id}','${data.adapt_phone_type_id}')" data-node-id="${gc.goods_color_id}" data-img="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=200&height=200" class="${status.index==0?'active':''}" data-title="${data.goods_name} ${gc.goods_addribute_val_name}">
                                                    <img width="34" height="34" alt="${data.goods_name} ${gc.goods_addribute_val_name}" src="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=34&height=34">
                                                </span>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="actions clearfix">
                                            <a onclick="addUserCollect(this,'${data.goods_id}')" class="btn-like" href="javascript:;">
                                                <i class="fa fa-heart-o"></i>
                                                <span>喜欢</span>
                                            </a>
                                            <c:if test="${data.goods_stock>0}">
                                                <a targetUrl="${pageContext.request.contextPath}/userShoppingCartCtrl/addUserShoppingCart.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}" onclick="addUserShoppingCart(this)" class="btn-buy" href="javascript:;">
                                                    <span>加入购物车</span>
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                            </c:if>
                                            <c:if test="${data.goods_stock<=0}">
                                                <a class="btn-buy" href="javascript:;">
                                                    <span>暂时缺货</span>
                                                    <i class="fa fa-clock-o"></i>
                                                </a>
                                            </c:if>
                                            <div class="actions-info"></div>
                                        </div>
                                        <div class="flags">
                                            <c:if test="${data.goods_new_price<data.goods_former_price}">
                                                <div class="flag flag-sale-off">${data.goods_new_price*10/data.goods_former_price}折促销</div>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="page-content-box">
                    <div class="box-head">
                        <h3 class="title">配件</h3>
                        <div class="more-nav">
                            <ul class="tab-list clearfix">
                                <li targetId="J_PJ_Hot" onmouseover="selectTabNavList(this)" class="tab-active">热门</li>
                                <li targetId="J_PJ_BHTHG" onmouseover="selectTabNavList(this)">保护套/后盖</li>
                                <li targetId="J_PJ_TM" onmouseover="selectTabNavList(this)">贴膜</li>
                                <li targetId="J_PJ_GXPJ" onmouseover="selectTabNavList(this)">个性配件</li>
                            </ul>
                        </div>
                    </div>
                    <div class="box-body">
                        <div id="J_PJ_Hot" class="goods-list-box">
                            <div class="goods-list clearfix">
                                <c:forEach items="${PJ_Hot_PageUtil.list}" var="data">
                                    <div class="goods-item animated">
                                        <div class="goods-preview-img">
                                            <c:set var="t_goods_color_name" value=""></c:set>
                                            <c:set var="t_goods_color_id" value=""></c:set>
                                            <c:set var="t_goods_color_img_url" value=""></c:set>
                                            <c:if test="${fn:length(data.goodsColorList)>0}">
                                                <c:forEach items="${data.goodsColorList}" var="gc" varStatus="status">
                                                    <c:if test="${status.index==0}">
                                                        <c:set var="t_goods_color_name" value="${gc.goods_addribute_val_name}"></c:set>
                                                        <c:set var="t_goods_color_id" value="${gc.goods_color_id}"></c:set>
                                                        <c:set var="t_goods_color_img_url" value="${gc.goods_color_img_url}"></c:set>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">
                                                <img width="200" height="200" alt="" src="${pageContext.request.contextPath}${t_goods_color_img_url==""?data.goods_preview_image:t_goods_color_img_url}?width=200&height=200">
                                            </a>
                                        </div>
                                        <c:if test="${data.goods_big_type_id==2}">
                                            <p class="desc">适用机型：${empty data.adapt_phone_type_name?"适用于全部机型":data.adapt_phone_type_name}</p>
                                        </c:if>
                                        <h2 class="title">
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">${data.goods_name} ${t_goods_color_name}</a>
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
                                                <span onclick="selectGoodsColorImg(this,'${data.goods_id}','${data.adapt_phone_type_id}')" data-node-id="${gc.goods_color_id}" data-img="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=200&height=200" class="${status.index==0?'active':''}" data-title="${data.goods_name} ${gc.goods_addribute_val_name}">
                                                    <img width="34" height="34" alt="${data.goods_name} ${gc.goods_addribute_val_name}" src="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=34&height=34">
                                                </span>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="actions clearfix">
                                            <a onclick="addUserCollect(this,'${data.goods_id}')" class="btn-like" href="javascript:;">
                                                <i class="fa fa-heart-o"></i>
                                                <span>喜欢</span>
                                            </a>
                                            <c:if test="${data.goods_stock>0}">
                                                <a targetUrl="${pageContext.request.contextPath}/userShoppingCartCtrl/addUserShoppingCart.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}" onclick="addUserShoppingCart(this)" class="btn-buy" href="javascript:;">
                                                    <span>加入购物车</span>
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                            </c:if>
                                            <c:if test="${data.goods_stock<=0}">
                                                <a class="btn-buy" href="javascript:;">
                                                    <span>暂时缺货</span>
                                                    <i class="fa fa-clock-o"></i>
                                                </a>
                                            </c:if>
                                            <div class="actions-info"></div>
                                        </div>
                                        <div class="flags">
                                            <c:if test="${data.goods_new_price<data.goods_former_price}">
                                                <div class="flag flag-sale-off">${data.goods_new_price*10/data.goods_former_price}折促销</div>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div id="J_PJ_BHTHG" class="goods-list-box hide">
                            <div class="goods-list clearfix">
                                <c:forEach items="${PJ_BHTHG_PageUtil.list}" var="data">
                                    <div class="goods-item animated">
                                        <div class="goods-preview-img">
                                            <c:set var="t_goods_color_name" value=""></c:set>
                                            <c:set var="t_goods_color_id" value=""></c:set>
                                            <c:set var="t_goods_color_img_url" value=""></c:set>
                                            <c:if test="${fn:length(data.goodsColorList)>0}">
                                                <c:forEach items="${data.goodsColorList}" var="gc" varStatus="status">
                                                    <c:if test="${status.index==0}">
                                                        <c:set var="t_goods_color_name" value="${gc.goods_addribute_val_name}"></c:set>
                                                        <c:set var="t_goods_color_id" value="${gc.goods_color_id}"></c:set>
                                                        <c:set var="t_goods_color_img_url" value="${gc.goods_color_img_url}"></c:set>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">
                                                <img width="200" height="200" alt="" src="${pageContext.request.contextPath}${t_goods_color_img_url==""?data.goods_preview_image:t_goods_color_img_url}?width=200&height=200">
                                            </a>
                                        </div>
                                        <c:if test="${data.goods_big_type_id==2}">
                                            <p class="desc">适用机型：${empty data.adapt_phone_type_name?"适用于全部机型":data.adapt_phone_type_name}</p>
                                        </c:if>
                                        <h2 class="title">
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">${data.goods_name} ${t_goods_color_name}</a>
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
                                                <span onclick="selectGoodsColorImg(this,'${data.goods_id}','${data.adapt_phone_type_id}')" data-node-id="${gc.goods_color_id}" data-img="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=200&height=200" class="${status.index==0?'active':''}" data-title="${data.goods_name} ${gc.goods_addribute_val_name}">
                                                    <img width="34" height="34" alt="${data.goods_name} ${gc.goods_addribute_val_name}" src="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=34&height=34">
                                                </span>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="actions clearfix">
                                            <a onclick="addUserCollect(this,'${data.goods_id}')" class="btn-like" href="javascript:;">
                                                <i class="fa fa-heart-o"></i>
                                                <span>喜欢</span>
                                            </a>
                                            <c:if test="${data.goods_stock>0}">
                                                <a targetUrl="${pageContext.request.contextPath}/userShoppingCartCtrl/addUserShoppingCart.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}" onclick="addUserShoppingCart(this)" class="btn-buy" href="javascript:;">
                                                    <span>加入购物车</span>
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                            </c:if>
                                            <c:if test="${data.goods_stock<=0}">
                                                <a class="btn-buy" href="javascript:;">
                                                    <span>暂时缺货</span>
                                                    <i class="fa fa-clock-o"></i>
                                                </a>
                                            </c:if>
                                            <div class="actions-info"></div>
                                        </div>
                                        <div class="flags">
                                            <c:if test="${data.goods_new_price<data.goods_former_price}">
                                                <div class="flag flag-sale-off">${data.goods_new_price*10/data.goods_former_price}折促销</div>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div id="J_PJ_TM" class="goods-list-box hide">
                            <div class="goods-list clearfix">
                                <c:forEach items="${PJ_TM_PageUtil.list}" var="data">
                                    <div class="goods-item animated">
                                        <div class="goods-preview-img">
                                            <c:set var="t_goods_color_name" value=""></c:set>
                                            <c:set var="t_goods_color_id" value=""></c:set>
                                            <c:set var="t_goods_color_img_url" value=""></c:set>
                                            <c:if test="${fn:length(data.goodsColorList)>0}">
                                                <c:forEach items="${data.goodsColorList}" var="gc" varStatus="status">
                                                    <c:if test="${status.index==0}">
                                                        <c:set var="t_goods_color_name" value="${gc.goods_addribute_val_name}"></c:set>
                                                        <c:set var="t_goods_color_id" value="${gc.goods_color_id}"></c:set>
                                                        <c:set var="t_goods_color_img_url" value="${gc.goods_color_img_url}"></c:set>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">
                                                <img width="200" height="200" alt="" src="${pageContext.request.contextPath}${t_goods_color_img_url==""?data.goods_preview_image:t_goods_color_img_url}?width=200&height=200">
                                            </a>
                                        </div>
                                        <c:if test="${data.goods_big_type_id==2}">
                                            <p class="desc">适用机型：${empty data.adapt_phone_type_name?"适用于全部机型":data.adapt_phone_type_name}</p>
                                        </c:if>
                                        <h2 class="title">
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">${data.goods_name} ${t_goods_color_name}</a>
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
                                                <span onclick="selectGoodsColorImg(this,'${data.goods_id}','${data.adapt_phone_type_id}')" data-node-id="${gc.goods_color_id}" data-img="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=200&height=200" class="${status.index==0?'active':''}" data-title="${data.goods_name} ${gc.goods_addribute_val_name}">
                                                    <img width="34" height="34" alt="${data.goods_name} ${gc.goods_addribute_val_name}" src="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=34&height=34">
                                                </span>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="actions clearfix">
                                            <a onclick="addUserCollect(this,'${data.goods_id}')" class="btn-like" href="javascript:;">
                                                <i class="fa fa-heart-o"></i>
                                                <span>喜欢</span>
                                            </a>
                                            <c:if test="${data.goods_stock>0}">
                                                <a targetUrl="${pageContext.request.contextPath}/userShoppingCartCtrl/addUserShoppingCart.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}" onclick="addUserShoppingCart(this)" class="btn-buy" href="javascript:;">
                                                    <span>加入购物车</span>
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                            </c:if>
                                            <c:if test="${data.goods_stock<=0}">
                                                <a class="btn-buy" href="javascript:;">
                                                    <span>暂时缺货</span>
                                                    <i class="fa fa-clock-o"></i>
                                                </a>
                                            </c:if>
                                            <div class="actions-info"></div>
                                        </div>
                                        <div class="flags">
                                            <c:if test="${data.goods_new_price<data.goods_former_price}">
                                                <div class="flag flag-sale-off">${data.goods_new_price*10/data.goods_former_price}折促销</div>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div id="J_PJ_GXPJ" class="goods-list-box hide">
                            <div class="goods-list clearfix">
                                <c:forEach items="${PJ_GXPJ_PageUtil.list}" var="data">
                                    <div class="goods-item animated">
                                        <div class="goods-preview-img">
                                            <c:set var="t_goods_color_name" value=""></c:set>
                                            <c:set var="t_goods_color_id" value=""></c:set>
                                            <c:set var="t_goods_color_img_url" value=""></c:set>
                                            <c:if test="${fn:length(data.goodsColorList)>0}">
                                                <c:forEach items="${data.goodsColorList}" var="gc" varStatus="status">
                                                    <c:if test="${status.index==0}">
                                                        <c:set var="t_goods_color_name" value="${gc.goods_addribute_val_name}"></c:set>
                                                        <c:set var="t_goods_color_id" value="${gc.goods_color_id}"></c:set>
                                                        <c:set var="t_goods_color_img_url" value="${gc.goods_color_img_url}"></c:set>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">
                                                <img width="200" height="200" alt="" src="${pageContext.request.contextPath}${t_goods_color_img_url==""?data.goods_preview_image:t_goods_color_img_url}?width=200&height=200">
                                            </a>
                                        </div>
                                        <c:if test="${data.goods_big_type_id==2}">
                                            <p class="desc">适用机型：${empty data.adapt_phone_type_name?"适用于全部机型":data.adapt_phone_type_name}</p>
                                        </c:if>
                                        <h2 class="title">
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">${data.goods_name} ${t_goods_color_name}</a>
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
                                                <span onclick="selectGoodsColorImg(this,'${data.goods_id}','${data.adapt_phone_type_id}')" data-node-id="${gc.goods_color_id}" data-img="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=200&height=200" class="${status.index==0?'active':''}" data-title="${data.goods_name} ${gc.goods_addribute_val_name}">
                                                    <img width="34" height="34" alt="${data.goods_name} ${gc.goods_addribute_val_name}" src="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=34&height=34">
                                                </span>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="actions clearfix">
                                            <a onclick="addUserCollect(this,'${data.goods_id}')" class="btn-like" href="javascript:;">
                                                <i class="fa fa-heart-o"></i>
                                                <span>喜欢</span>
                                            </a>
                                            <c:if test="${data.goods_stock>0}">
                                                <a targetUrl="${pageContext.request.contextPath}/userShoppingCartCtrl/addUserShoppingCart.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}" onclick="addUserShoppingCart(this)" class="btn-buy" href="javascript:;">
                                                    <span>加入购物车</span>
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                            </c:if>
                                            <c:if test="${data.goods_stock<=0}">
                                                <a class="btn-buy" href="javascript:;">
                                                    <span>暂时缺货</span>
                                                    <i class="fa fa-clock-o"></i>
                                                </a>
                                            </c:if>
                                            <div class="actions-info"></div>
                                        </div>
                                        <div class="flags">
                                            <c:if test="${data.goods_new_price<data.goods_former_price}">
                                                <div class="flag flag-sale-off">${data.goods_new_price*10/data.goods_former_price}折促销</div>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="page-content-box">
                    <div class="box-head">
                        <h3 class="title">周边</h3>
                        <div class="more-nav">
                            <ul class="tab-list clearfix">
                                <li targetId="J_ZB_Hot" onmouseover="selectTabNavList(this)" class="tab-active">热门</li>
                                <li targetId="J_ZB_YX" onmouseover="selectTabNavList(this)">音响</li>
                                <li targetId="J_ZB_FZ" onmouseover="selectTabNavList(this)">服装</li>
                                <li targetId="J_ZB_MT" onmouseover="selectTabNavList(this)">米兔</li>
                                <li targetId="J_ZB_SHZB" onmouseover="selectTabNavList(this)">生活周边</li>
                                <li targetId="J_ZB_XB" onmouseover="selectTabNavList(this)">箱包</li>
                            </ul>
                        </div>
                    </div>
                    <div class="box-body">
                        <div id="J_ZB_Hot" class="goods-list-box">
                            <div class="goods-list clearfix">
                                <c:forEach items="${ZB_Hot_PageUtil.list}" var="data">
                                    <div class="goods-item animated">
                                        <div class="goods-preview-img">
                                            <c:set var="t_goods_color_name" value=""></c:set>
                                            <c:set var="t_goods_color_id" value=""></c:set>
                                            <c:set var="t_goods_color_img_url" value=""></c:set>
                                            <c:if test="${fn:length(data.goodsColorList)>0}">
                                                <c:forEach items="${data.goodsColorList}" var="gc" varStatus="status">
                                                    <c:if test="${status.index==0}">
                                                        <c:set var="t_goods_color_name" value="${gc.goods_addribute_val_name}"></c:set>
                                                        <c:set var="t_goods_color_id" value="${gc.goods_color_id}"></c:set>
                                                        <c:set var="t_goods_color_img_url" value="${gc.goods_color_img_url}"></c:set>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">
                                                <img width="200" height="200" alt="" src="${pageContext.request.contextPath}${t_goods_color_img_url==""?data.goods_preview_image:t_goods_color_img_url}?width=200&height=200">
                                            </a>
                                        </div>
                                        <c:if test="${data.goods_big_type_id==2}">
                                            <p class="desc">适用机型：${empty data.adapt_phone_type_name?"适用于全部机型":data.adapt_phone_type_name}</p>
                                        </c:if>
                                        <h2 class="title">
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">${data.goods_name} ${t_goods_color_name}</a>
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
                                                <span onclick="selectGoodsColorImg(this,'${data.goods_id}','${data.adapt_phone_type_id}')" data-node-id="${gc.goods_color_id}" data-img="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=200&height=200" class="${status.index==0?'active':''}" data-title="${data.goods_name} ${gc.goods_addribute_val_name}">
                                                    <img width="34" height="34" alt="${data.goods_name} ${gc.goods_addribute_val_name}" src="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=34&height=34">
                                                </span>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="actions clearfix">
                                            <a onclick="addUserCollect(this,'${data.goods_id}')" class="btn-like" href="javascript:;">
                                                <i class="fa fa-heart-o"></i>
                                                <span>喜欢</span>
                                            </a>
                                            <c:if test="${data.goods_stock>0}">
                                                <a targetUrl="${pageContext.request.contextPath}/userShoppingCartCtrl/addUserShoppingCart.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}" onclick="addUserShoppingCart(this)" class="btn-buy" href="javascript:;">
                                                    <span>加入购物车</span>
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                            </c:if>
                                            <c:if test="${data.goods_stock<=0}">
                                                <a class="btn-buy" href="javascript:;">
                                                    <span>暂时缺货</span>
                                                    <i class="fa fa-clock-o"></i>
                                                </a>
                                            </c:if>
                                            <div class="actions-info"></div>
                                        </div>
                                        <div class="flags">
                                            <c:if test="${data.goods_new_price<data.goods_former_price}">
                                                <div class="flag flag-sale-off">${data.goods_new_price*10/data.goods_former_price}折促销</div>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div id="J_ZB_YX" class="goods-list-box hide">
                            <div class="goods-list clearfix">
                                <c:forEach items="${ZB_YX_PageUtil.list}" var="data">
                                    <div class="goods-item animated">
                                        <div class="goods-preview-img">
                                            <c:set var="t_goods_color_name" value=""></c:set>
                                            <c:set var="t_goods_color_id" value=""></c:set>
                                            <c:set var="t_goods_color_img_url" value=""></c:set>
                                            <c:if test="${fn:length(data.goodsColorList)>0}">
                                                <c:forEach items="${data.goodsColorList}" var="gc" varStatus="status">
                                                    <c:if test="${status.index==0}">
                                                        <c:set var="t_goods_color_name" value="${gc.goods_addribute_val_name}"></c:set>
                                                        <c:set var="t_goods_color_id" value="${gc.goods_color_id}"></c:set>
                                                        <c:set var="t_goods_color_img_url" value="${gc.goods_color_img_url}"></c:set>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">
                                                <img width="200" height="200" alt="" src="${pageContext.request.contextPath}${t_goods_color_img_url==""?data.goods_preview_image:t_goods_color_img_url}?width=200&height=200">
                                            </a>
                                        </div>
                                        <c:if test="${data.goods_big_type_id==2}">
                                            <p class="desc">适用机型：${empty data.adapt_phone_type_name?"适用于全部机型":data.adapt_phone_type_name}</p>
                                        </c:if>
                                        <h2 class="title">
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">${data.goods_name} ${t_goods_color_name}</a>
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
                                                <span onclick="selectGoodsColorImg(this,'${data.goods_id}','${data.adapt_phone_type_id}')" data-node-id="${gc.goods_color_id}" data-img="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=200&height=200" class="${status.index==0?'active':''}" data-title="${data.goods_name} ${gc.goods_addribute_val_name}">
                                                    <img width="34" height="34" alt="${data.goods_name} ${gc.goods_addribute_val_name}" src="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=34&height=34">
                                                </span>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="actions clearfix">
                                            <a onclick="addUserCollect(this,'${data.goods_id}')" class="btn-like" href="javascript:;">
                                                <i class="fa fa-heart-o"></i>
                                                <span>喜欢</span>
                                            </a>
                                            <c:if test="${data.goods_stock>0}">
                                                <a targetUrl="${pageContext.request.contextPath}/userShoppingCartCtrl/addUserShoppingCart.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}" onclick="addUserShoppingCart(this)" class="btn-buy" href="javascript:;">
                                                    <span>加入购物车</span>
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                            </c:if>
                                            <c:if test="${data.goods_stock<=0}">
                                                <a class="btn-buy" href="javascript:;">
                                                    <span>暂时缺货</span>
                                                    <i class="fa fa-clock-o"></i>
                                                </a>
                                            </c:if>
                                            <div class="actions-info"></div>
                                        </div>
                                        <div class="flags">
                                            <c:if test="${data.goods_new_price<data.goods_former_price}">
                                                <div class="flag flag-sale-off">${data.goods_new_price*10/data.goods_former_price}折促销</div>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div id="J_ZB_FZ" class="goods-list-box hide">
                            <div class="goods-list clearfix">
                                <c:forEach items="${ZB_FZ_PageUtil.list}" var="data">
                                    <div class="goods-item animated">
                                        <div class="goods-preview-img">
                                            <c:set var="t_goods_color_name" value=""></c:set>
                                            <c:set var="t_goods_color_id" value=""></c:set>
                                            <c:set var="t_goods_color_img_url" value=""></c:set>
                                            <c:if test="${fn:length(data.goodsColorList)>0}">
                                                <c:forEach items="${data.goodsColorList}" var="gc" varStatus="status">
                                                    <c:if test="${status.index==0}">
                                                        <c:set var="t_goods_color_name" value="${gc.goods_addribute_val_name}"></c:set>
                                                        <c:set var="t_goods_color_id" value="${gc.goods_color_id}"></c:set>
                                                        <c:set var="t_goods_color_img_url" value="${gc.goods_color_img_url}"></c:set>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">
                                                <img width="200" height="200" alt="" src="${pageContext.request.contextPath}${t_goods_color_img_url==""?data.goods_preview_image:t_goods_color_img_url}?width=200&height=200">
                                            </a>
                                        </div>
                                        <c:if test="${data.goods_big_type_id==2}">
                                            <p class="desc">适用机型：${empty data.adapt_phone_type_name?"适用于全部机型":data.adapt_phone_type_name}</p>
                                        </c:if>
                                        <h2 class="title">
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">${data.goods_name} ${t_goods_color_name}</a>
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
                                                <span onclick="selectGoodsColorImg(this,'${data.goods_id}','${data.adapt_phone_type_id}')" data-node-id="${gc.goods_color_id}" data-img="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=200&height=200" class="${status.index==0?'active':''}" data-title="${data.goods_name} ${gc.goods_addribute_val_name}">
                                                    <img width="34" height="34" alt="${data.goods_name} ${gc.goods_addribute_val_name}" src="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=34&height=34">
                                                </span>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="actions clearfix">
                                            <a onclick="addUserCollect(this,'${data.goods_id}')" class="btn-like" href="javascript:;">
                                                <i class="fa fa-heart-o"></i>
                                                <span>喜欢</span>
                                            </a>
                                            <c:if test="${data.goods_stock>0}">
                                                <a targetUrl="${pageContext.request.contextPath}/userShoppingCartCtrl/addUserShoppingCart.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}" onclick="addUserShoppingCart(this)" class="btn-buy" href="javascript:;">
                                                    <span>加入购物车</span>
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                            </c:if>
                                            <c:if test="${data.goods_stock<=0}">
                                                <a class="btn-buy" href="javascript:;">
                                                    <span>暂时缺货</span>
                                                    <i class="fa fa-clock-o"></i>
                                                </a>
                                            </c:if>
                                            <div class="actions-info"></div>
                                        </div>
                                        <div class="flags">
                                            <c:if test="${data.goods_new_price<data.goods_former_price}">
                                                <div class="flag flag-sale-off">${data.goods_new_price*10/data.goods_former_price}折促销</div>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div id="J_ZB_MT" class="goods-list-box hide">
                            <div class="goods-list clearfix">
                                <c:forEach items="${ZB_MT_PageUtil.list}" var="data">
                                    <div class="goods-item animated">
                                        <div class="goods-preview-img">
                                            <c:set var="t_goods_color_name" value=""></c:set>
                                            <c:set var="t_goods_color_id" value=""></c:set>
                                            <c:set var="t_goods_color_img_url" value=""></c:set>
                                            <c:if test="${fn:length(data.goodsColorList)>0}">
                                                <c:forEach items="${data.goodsColorList}" var="gc" varStatus="status">
                                                    <c:if test="${status.index==0}">
                                                        <c:set var="t_goods_color_name" value="${gc.goods_addribute_val_name}"></c:set>
                                                        <c:set var="t_goods_color_id" value="${gc.goods_color_id}"></c:set>
                                                        <c:set var="t_goods_color_img_url" value="${gc.goods_color_img_url}"></c:set>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">
                                                <img width="200" height="200" alt="" src="${pageContext.request.contextPath}${t_goods_color_img_url==""?data.goods_preview_image:t_goods_color_img_url}?width=200&height=200">
                                            </a>
                                        </div>
                                        <c:if test="${data.goods_big_type_id==2}">
                                            <p class="desc">适用机型：${empty data.adapt_phone_type_name?"适用于全部机型":data.adapt_phone_type_name}</p>
                                        </c:if>
                                        <h2 class="title">
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">${data.goods_name} ${t_goods_color_name}</a>
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
                                                <span onclick="selectGoodsColorImg(this,'${data.goods_id}','${data.adapt_phone_type_id}')" data-node-id="${gc.goods_color_id}" data-img="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=200&height=200" class="${status.index==0?'active':''}" data-title="${data.goods_name} ${gc.goods_addribute_val_name}">
                                                    <img width="34" height="34" alt="${data.goods_name} ${gc.goods_addribute_val_name}" src="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=34&height=34">
                                                </span>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="actions clearfix">
                                            <a onclick="addUserCollect(this,'${data.goods_id}')" class="btn-like" href="javascript:;">
                                                <i class="fa fa-heart-o"></i>
                                                <span>喜欢</span>
                                            </a>
                                            <c:if test="${data.goods_stock>0}">
                                                <a targetUrl="${pageContext.request.contextPath}/userShoppingCartCtrl/addUserShoppingCart.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}" onclick="addUserShoppingCart(this)" class="btn-buy" href="javascript:;">
                                                    <span>加入购物车</span>
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                            </c:if>
                                            <c:if test="${data.goods_stock<=0}">
                                                <a class="btn-buy" href="javascript:;">
                                                    <span>暂时缺货</span>
                                                    <i class="fa fa-clock-o"></i>
                                                </a>
                                            </c:if>
                                            <div class="actions-info"></div>
                                        </div>
                                        <div class="flags">
                                            <c:if test="${data.goods_new_price<data.goods_former_price}">
                                                <div class="flag flag-sale-off">${data.goods_new_price*10/data.goods_former_price}折促销</div>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div id="J_ZB_SHZB" class="goods-list-box hide">
                            <div class="goods-list clearfix">
                                <c:forEach items="${ZB_SHZB_PageUtil.list}" var="data">
                                    <div class="goods-item animated">
                                        <div class="goods-preview-img">
                                            <c:set var="t_goods_color_name" value=""></c:set>
                                            <c:set var="t_goods_color_id" value=""></c:set>
                                            <c:set var="t_goods_color_img_url" value=""></c:set>
                                            <c:if test="${fn:length(data.goodsColorList)>0}">
                                                <c:forEach items="${data.goodsColorList}" var="gc" varStatus="status">
                                                    <c:if test="${status.index==0}">
                                                        <c:set var="t_goods_color_name" value="${gc.goods_addribute_val_name}"></c:set>
                                                        <c:set var="t_goods_color_id" value="${gc.goods_color_id}"></c:set>
                                                        <c:set var="t_goods_color_img_url" value="${gc.goods_color_img_url}"></c:set>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">
                                                <img width="200" height="200" alt="" src="${pageContext.request.contextPath}${t_goods_color_img_url==""?data.goods_preview_image:t_goods_color_img_url}?width=200&height=200">
                                            </a>
                                        </div>
                                        <c:if test="${data.goods_big_type_id==2}">
                                            <p class="desc">适用机型：${empty data.adapt_phone_type_name?"适用于全部机型":data.adapt_phone_type_name}</p>
                                        </c:if>
                                        <h2 class="title">
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">${data.goods_name} ${t_goods_color_name}</a>
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
                                                <span onclick="selectGoodsColorImg(this,'${data.goods_id}','${data.adapt_phone_type_id}')" data-node-id="${gc.goods_color_id}" data-img="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=200&height=200" class="${status.index==0?'active':''}" data-title="${data.goods_name} ${gc.goods_addribute_val_name}">
                                                    <img width="34" height="34" alt="${data.goods_name} ${gc.goods_addribute_val_name}" src="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=34&height=34">
                                                </span>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="actions clearfix">
                                            <a onclick="addUserCollect(this,'${data.goods_id}')" class="btn-like" href="javascript:;">
                                                <i class="fa fa-heart-o"></i>
                                                <span>喜欢</span>
                                            </a>
                                            <c:if test="${data.goods_stock>0}">
                                                <a targetUrl="${pageContext.request.contextPath}/userShoppingCartCtrl/addUserShoppingCart.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}" onclick="addUserShoppingCart(this)" class="btn-buy" href="javascript:;">
                                                    <span>加入购物车</span>
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                            </c:if>
                                            <c:if test="${data.goods_stock<=0}">
                                                <a class="btn-buy" href="javascript:;">
                                                    <span>暂时缺货</span>
                                                    <i class="fa fa-clock-o"></i>
                                                </a>
                                            </c:if>
                                            <div class="actions-info"></div>
                                        </div>
                                        <div class="flags">
                                            <c:if test="${data.goods_new_price<data.goods_former_price}">
                                                <div class="flag flag-sale-off">${data.goods_new_price*10/data.goods_former_price}折促销</div>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div id="J_ZB_XB" class="goods-list-box hide">
                            <div class="goods-list clearfix">
                                <c:forEach items="${ZB_XB_PageUtil.list}" var="data">
                                    <div class="goods-item animated">
                                        <div class="goods-preview-img">
                                            <c:set var="t_goods_color_name" value=""></c:set>
                                            <c:set var="t_goods_color_id" value=""></c:set>
                                            <c:set var="t_goods_color_img_url" value=""></c:set>
                                            <c:if test="${fn:length(data.goodsColorList)>0}">
                                                <c:forEach items="${data.goodsColorList}" var="gc" varStatus="status">
                                                    <c:if test="${status.index==0}">
                                                        <c:set var="t_goods_color_name" value="${gc.goods_addribute_val_name}"></c:set>
                                                        <c:set var="t_goods_color_id" value="${gc.goods_color_id}"></c:set>
                                                        <c:set var="t_goods_color_img_url" value="${gc.goods_color_img_url}"></c:set>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">
                                                <img width="200" height="200" alt="" src="${pageContext.request.contextPath}${t_goods_color_img_url==""?data.goods_preview_image:t_goods_color_img_url}?width=200&height=200">
                                            </a>
                                        </div>
                                        <c:if test="${data.goods_big_type_id==2}">
                                            <p class="desc">适用机型：${empty data.adapt_phone_type_name?"适用于全部机型":data.adapt_phone_type_name}</p>
                                        </c:if>
                                        <h2 class="title">
                                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}">${data.goods_name} ${t_goods_color_name}</a>
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
                                                <span onclick="selectGoodsColorImg(this,'${data.goods_id}','${data.adapt_phone_type_id}')" data-node-id="${gc.goods_color_id}" data-img="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=200&height=200" class="${status.index==0?'active':''}" data-title="${data.goods_name} ${gc.goods_addribute_val_name}">
                                                    <img width="34" height="34" alt="${data.goods_name} ${gc.goods_addribute_val_name}" src="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=34&height=34">
                                                </span>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="actions clearfix">
                                            <a onclick="addUserCollect(this,'${data.goods_id}')" class="btn-like" href="javascript:;">
                                                <i class="fa fa-heart-o"></i>
                                                <span>喜欢</span>
                                            </a>
                                            <c:if test="${data.goods_stock>0}">
                                                <a targetUrl="${pageContext.request.contextPath}/userShoppingCartCtrl/addUserShoppingCart.action?goods_id=${data.goods_id}&goods_color_id=${t_goods_color_id}&adapt_phone_type_id=${data.adapt_phone_type_id}" onclick="addUserShoppingCart(this)" class="btn-buy" href="javascript:;">
                                                    <span>加入购物车</span>
                                                    <i class="fa fa-shopping-cart"></i>
                                                </a>
                                            </c:if>
                                            <c:if test="${data.goods_stock<=0}">
                                                <a class="btn-buy" href="javascript:;">
                                                    <span>暂时缺货</span>
                                                    <i class="fa fa-clock-o"></i>
                                                </a>
                                            </c:if>
                                            <div class="actions-info"></div>
                                        </div>
                                        <div class="flags">
                                            <c:if test="${data.goods_new_price<data.goods_former_price}">
                                                <div class="flag flag-sale-off">${data.goods_new_price*10/data.goods_former_price}折促销</div>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="./include/mi-bottomPage.jsp" %>
    </div>
<script type="text/javascript">
    $(function(){
        var isNotLogin = '${empty sessionScope.usersFront}';
        if(isNotLogin=='false'){
            getCartSumGoodsNumShowCartBtn('${pageContext.request.contextPath}');
        }
        $('#goodsList').show();
        $('#myCarousel').carousel({interval: 4000});
        $('.goods-item').hover(function(){
            $(this).addClass('pulse');
        },function(){
            $(this).removeClass('pulse');
        });
    });


    function selectTabNavList(obj){
        activeFun(obj,'tab-active');
        var targetId = $(obj).attr('targetId');
        var $targetIdObj = $('#'+targetId);
        $targetIdObj.parent().children().addClass('hide');
        $targetIdObj.removeClass('hide');
    }


    //异步加入购物车
    function addUserShoppingCart(obj){
        var targetUrl = $(obj).attr('targetUrl');
        var isNotLogin = '${empty sessionScope.usersFront}';
        if(isNotLogin=='true'){
            ajaxLoginBoxShow(targetUrl);
        }else{
            $.post(targetUrl,{command:"ajax"},function(data){
                if(data.errorCode==0){
                    getCartSumGoodsNumShowCartBtn('${pageContext.request.contextPath}');
                }
            },'json');
            $(obj).parent().children('div.actions-info').text('加入购物车成功!');
            $(obj).parent().children('div.actions-info').slideToggle().delay(1200).slideToggle(function(){});
        }
    }

    //异步加入用户收藏
    function addUserCollect(obj,goods_id){
        var isNotLogin = '${empty sessionScope.usersFront}';
        if(isNotLogin=='true'){
            ajaxLoginBoxShow();
        }
        $(obj).parent().children('div.actions-info').text('加入收藏成功!');
        $(obj).parent().children('div.actions-info').slideToggle().delay(1200).slideToggle(function(){});
    }

    //选择商品图片
    function selectGoodsColorImg(obj,goods_id,adapt_phone_type_id){
        var $goodsItem = $(obj).parent().parent().parent();
        $goodsItem.children('div.goods-preview-img').find('img').attr('src',$(obj).data('img'));
        $goodsItem.children('h2.title').children('a').text($(obj).data('title'));
        activeFun(obj,'active');

        var targetUrl = '${pageContext.request.contextPath}/goodsPurchaseCtrl/showGoodsDetailPurchase.action?goods_id='+goods_id+'&goods_color_id='+$(obj).data('node-id')+'&adapt_phone_type_id='+adapt_phone_type_id;
        $goodsItem.children('div.goods-preview-img').children('a').attr('href',targetUrl);
        $goodsItem.children('h2.title').children('a').attr('href',targetUrl);

        var addShoppingCartTargetUrl = '${pageContext.request.contextPath}/userShoppingCartCtrl/addUserShoppingCart.action?goods_id='+goods_id+'&goods_color_id='+$(obj).data('node-id')+'&adapt_phone_type_id='+adapt_phone_type_id;
        $goodsItem.children('div.actions').children('a.btn-buy').attr('targetUrl',addShoppingCartTargetUrl);
    }
</script>
</body>
</html>
