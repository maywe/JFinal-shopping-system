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
                        <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/initGoodsPurchase.action" class="all-goods">全部商品</a>
                        <c:if test="${command=='showGoodsDetailPurchase'}">
                            <span>&gt;</span>
                            <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/initGoodsPurchase.action?filterGoodsSmallTypeId=${otherGoodsView.goods_small_type_id}" class="goods-small-type">${otherGoodsView.goods_small_type_name}</a>
                            <span>&gt;</span>
                            <a class="goods-name">${otherGoodsView.goods_name}</a>
                        </c:if>
                    </div>
                </div>
            </div>
            <c:if test="${command=='initGoodsPurchase'}">
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
                                                <ul id="filterPhoneAccessoryTypeBox" class="clearfix">
                                                    <c:forEach items="${phoneAccessoryTypeList}" var="pat">
                                                        <li onclick="selectFilterPhoneAccessorySmallType(this,'${pat.goods_small_type_id}')" class="filter-list-item ${otherGoodsView.filterGoodsSmallTypeId==pat.goods_small_type_id?'active':''}">${pat.goods_small_type_name}</li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="row">
                                            <div class="col-xs-2 filter-list-type">小米生活系列&gt;</div>
                                            <div class="col-xs-10 filter-list-item-box">
                                                <ul id="filterMiLifeTypeBox" class="clearfix">
                                                    <c:forEach items="${miLifeTypeList}" var="mlt">
                                                        <li onclick="selectFilterMiLifeSmallType(this,'${mlt.goods_small_type_id}')" class="filter-list-item ${otherGoodsView.filterGoodsSmallTypeId==mlt.goods_small_type_id?'active':''}">${mlt.goods_small_type_name}</li>
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
                                                <ul id="filterAdaptPhoneTypeBox" class="clearfix">
                                                    <c:forEach items="${phoneTypeList}" var="pt">
                                                        <li onclick="selectFilterAdaptPhoneSmallType(this,'${pt.goods_small_type_id}')" class="filter-list-item ${otherGoodsView.filterAdaptPhoneSmallTypeId==pt.goods_small_type_id?'active':''}">${pt.goods_small_type_name}</li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="bd">
                    <div class="row order-list-box clearfix">
                        <ul class="col-xs-6 order-list">
                            <li onclick="selectOrderBy(this,'default')" class="${empty otherGoodsView.orderBy||otherGoodsView.orderBy=='default'?'active':''}">推荐</li>
                            <li onclick="selectOrderBy(this,'newGoods')" class="${otherGoodsView.orderBy=='newGoods'?'active':''}">新品</li>
                            <li onclick="selectOrderBy(this,'priceUp')" class="${otherGoodsView.orderBy=='priceUp'?'active':''}">
                                价格
                                <i class="fa fa-long-arrow-up"></i>
                            </li>
                            <li onclick="selectOrderBy(this,'priceDown')" class="${otherGoodsView.orderBy=='priceDown'?'active':''}">
                                价格
                                <i class="fa fa-long-arrow-down"></i>
                            </li>
                        </ul>
                        <ul class="col-xs-6 type-list">
                            <li>
                                <div class="checkbox checkbox-orange checkbox-inline">
                                    <input ${otherGoodsView.filterGoodsDiscountPrice?'checked':''} onclick="selectFilterGoodsDiscountPrice(this)" type="checkbox">
                                    <label>仅显示特惠商品</label>
                                </div>
                            </li>
                            <li>
                                <div class="checkbox checkbox-orange checkbox-inline">
                                    <input ${otherGoodsView.filterGoodsExistSource?'checked':''} onclick="selectFilterGoodsExistSource(this)" type="checkbox">
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
                        <div id="goodsPaginationBox" class="pagination-box clearfix" pageNumber="${pageUtil.pageNumber}" pageSize="${pageUtil.pageSize}" totalPage="${pageUtil.totalPage}" totalRow="${pageUtil.totalRow}"></div>
                    </div>
                </div>
                <form id="goodsHideForm" class="hide" method="get" action="${pageContext.request.contextPath}/goodsPurchaseCtrl/initGoodsPurchase.action">
                    <input name="filterGoodsSmallTypeId" type="hidden" value="${otherGoodsView.filterGoodsSmallTypeId}">
                    <input name="filterAdaptPhoneSmallTypeId" type="hidden" value="${otherGoodsView.filterAdaptPhoneSmallTypeId}">
                    <input name="orderBy" type="hidden" value="${empty otherGoodsView.orderBy?'default':otherGoodsView.orderBy}">
                    <input name="filterGoodsDiscountPrice" type="hidden" value="${empty otherGoodsView.filterGoodsDiscountPrice?'false':otherGoodsView.filterGoodsDiscountPrice}">
                    <input name="filterGoodsExistSource" type="hidden" value="${empty otherGoodsView.filterGoodsExistSource?'false':otherGoodsView.filterGoodsExistSource}">
                    <input name="pageNumber" type="hidden" value="${pageUtil.pageNumber}">
                </form>
            </c:if>
            <c:if test="${command=='showGoodsDetailPurchase'}">
                <div class="row goods-detail-purchase-box">
                    <div class="col-xs-8">
                        <div id="goodsPicBox" class="goods-pic-box">
                            <c:set var="t_goods_color_name" value=""></c:set>
                            <c:set var="t_goods_color_id" value=""></c:set>
                            <c:set var="t_goods_color_img_url" value=""></c:set>
                            <c:if test="${fn:length(otherGoodsView.goodsColorList)>0}">
                                <c:forEach items="${otherGoodsView.goodsColorList}" var="gc" varStatus="status">
                                    <c:if test="${empty otherGoodsView.goods_color_id?status.index==0:gc.goods_color_id==otherGoodsView.goods_color_id}">
                                        <c:set var="t_goods_color_name" value="${gc.goods_addribute_val_name}"></c:set>
                                        <c:set var="t_goods_color_id" value="${gc.goods_color_id}"></c:set>
                                        <c:set var="t_goods_color_img_url" value="${gc.goods_color_img_url}"></c:set>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                            <img width="482" height="482" src="${pageContext.request.contextPath}${t_goods_color_img_url==""?otherGoodsView.goods_preview_image:t_goods_color_img_url}?width=482&height=482">
                        </div>
                    </div>
                    <div class="col-xs-4">
                        <div class="goods-info-box">
                            <div class="goods-info-head">
                                <h2 class="goods-name">${otherGoodsView.goods_name}</h2>
                                <p class="adapt-phone-type-name"> 适用于：${empty otherGoodsView.adapt_phone_type_name?"适用于全部机型":otherGoodsView.adapt_phone_type_name}</p>
                                <div class="goods-info-head-price">
                                    <b>${otherGoodsView.goods_new_price}</b>
                                    <span>元</span>
                                    <c:if test="${otherGoodsView.goods_new_price<otherGoodsView.goods_former_price}">
                                        <del>${otherGoodsView.goods_former_price}元</del>
                                    </c:if>
                                </div>
                                <div class="thumbs">
                                    <span class="style-name">颜色：${t_goods_color_name==""?"":t_goods_color_name}</span>
                                    <div class="thumb-list">
                                        <c:forEach items="${otherGoodsView.goodsColorList}" var="gc" varStatus="status">
                                            <span onclick="selectGoodsColorImgDetail(this,'${otherGoodsView.goods_id}','${otherGoodsView.adapt_phone_type_id}')" data-node-id="${gc.goods_color_id}" data-img="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=482&height=482" class="${((empty otherGoodsView.goods_color_id and status.index==0) or gc.goods_color_id==otherGoodsView.goods_color_id)?'active':''}" data-title="${gc.goods_addribute_val_name}">
                                                <img width="38" height="38" alt="${otherGoodsView.goods_name} ${gc.goods_addribute_val_name}" src="${pageContext.request.contextPath}${gc.goods_color_img_url}?width=38&height=38">
                                            </span>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="action">
                                    <a href="${pageContext.request.contextPath}/userShoppingCartCtrl/addUserShoppingCart.action?goods_id=${otherGoodsView.goods_id}&goods_color_id=${otherGoodsView.goods_color_id}&adapt_phone_type_id=${otherGoodsView.adapt_phone_type_id}" class="btn btn-orange btn-lg">加入购物车</a>
                                </div>
                            </div>
                            <div class="goods-info-footer">
                                <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/initGoodsPurchase.action?filterGoodsSmallTypeId=${otherGoodsView.goods_small_type_id}">
                                    <i class="fa fa-align-justify"></i>
                                    查看更多 ${otherGoodsView.goods_small_type_name}
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
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
        var isNotLogin = '${empty sessionScope.usersFront}';
        if(isNotLogin=='false'){
            getCartSumGoodsNumShowCartBtn('${pageContext.request.contextPath}');
        }
        var errorMessage = '${errorMessage}';
        if(errorMessage){
            toastr.info(errorMessage);
        }

        <c:if test="${command=='initGoodsPurchase'}">
            $('.goods-item').hover(function(){
                $(this).addClass('pulse');
            },function(){
                $(this).removeClass('pulse');
            });
            $('#goodsPaginationBox').initPaginationData('selectPageNumber');
        </c:if>
    });

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

    //选择过滤商品类型
    function selectFilterPhoneAccessorySmallType(obj,goodsSmallTypeId){
        $('#filterMiLifeTypeBox,#filterPhoneAccessoryTypeBox').children().removeClass('active');
        activeFun(obj,'active');
        $('#goodsHideForm input[name="filterGoodsSmallTypeId"]').val(goodsSmallTypeId);
        $('#goodsHideForm').submit();
    }
    function selectFilterMiLifeSmallType(obj,goodsSmallTypeId){
        $('#filterMiLifeTypeBox,#filterPhoneAccessoryTypeBox,#filterAdaptPhoneTypeBox').children().removeClass('active');
        activeFun(obj,'active');
        $('#goodsHideForm input[name="filterGoodsSmallTypeId"]').val(goodsSmallTypeId);
        $('#goodsHideForm input[name="filterAdaptPhoneSmallTypeId"]').val('');
        $('#goodsHideForm').submit();
    }
    //选择过滤适配手机型号
    function selectFilterAdaptPhoneSmallType(obj,adaptPhoneSmallTypeId){
        activeFun(obj,'active');
        $('#goodsHideForm input[name="filterAdaptPhoneSmallTypeId"]').val(adaptPhoneSmallTypeId);
        $('#goodsHideForm').submit();
    }
    //选择分页项
    function selectPageNumber(pageNumber){
        $('#goodsHideForm input[name="pageNumber"]').val(pageNumber);
        $('#goodsHideForm').submit();
    }
    //选择排序类型
    function selectOrderBy(obj,orderBy){
        activeFun(obj,'active');
        $('#goodsHideForm input[name="orderBy"]').val(orderBy);
        $('#goodsHideForm').submit();
    }
    //选择过滤优惠商品
    function selectFilterGoodsDiscountPrice(obj){
        $('#goodsHideForm input[name="filterGoodsDiscountPrice"]').val($(obj).is(':checked'));
        $('#goodsHideForm').submit();
    }
    //选择过滤有货商品
    function selectFilterGoodsExistSource(obj){
        $('#goodsHideForm input[name="filterGoodsExistSource"]').val($(obj).is(':checked'));
        $('#goodsHideForm').submit();
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


    //-----------------------------------------商品详细信息展示-------------------------------
    function selectGoodsColorImgDetail(obj,goods_id,adapt_phone_type_id){
        $(obj).parent().prev('span.style-name').text('颜色：'+$(obj).data('title'));
        $('#goodsPicBox').children('img').attr('src',$(obj).data('img'));
        activeFun(obj,'active');
        var targetUrl = '${pageContext.request.contextPath}/userShoppingCartCtrl/addUserShoppingCart.action?goods_id='+goods_id+'&goods_color_id='+$(obj).data('node-id')+'&adapt_phone_type_id='+adapt_phone_type_id;
        $(obj).parent().parent().next('div.action').children('a').attr('href',targetUrl);
    }
</script>
</body>
</html>
