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
    <title>小米官网-手机购买</title>
    <link href="${pageContext.request.contextPath}/css/common/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/font-awesome.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/toastr.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/common.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/viewfront/mi-common.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/viewfront/mi-phonePurchase.css" type="text/css" rel="stylesheet">
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
                        <a href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action" class="goods-big-type">小米手机系列</a>
                        <c:if test="${not empty phoneSmallType}">
                            <span>&gt;</span>
                            <a href="#" class="goods-small-type">${phoneSmallType.goods_small_type_name}</a>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="hd">
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
            </div>
            <div class="bd">
                <c:if test="${empty phoneSmallType}">
                    <div class="phone-goods-list-box clearfix">
                        <ul class="goods-list">
                            <c:forEach items="${phoneGoodsList}" var="pg">
                                <li class="goods-item-box">
                                    <div class="goods-item-img">
                                        <a href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=${pg.goods_small_type_id}">
                                            <img alt="${pg.goods_small_type_name}" src="${pageContext.request.contextPath}${pg.goods_small_type_image}?width=450&height=450">
                                        </a>
                                    </div>
                                    <div class="row goods-item-other">
                                        <div class="col-xs-7 goods-item-desc">
                                            <div>
                                                <span class="goods-item-name">${pg.goods_small_type_name}</span>
                                                <span class="goods-item-price">${pg.phone_type_small_low_price}</span>
                                                <span class="goods-item-price-desc">元起</span>
                                            </div>
                                            <span>${pg.goods_small_type_remark}</span>
                                        </div>
                                        <div class="col-xs-5 goods-item-btn">
                                            <a class="btn btn-grey btn-lg" href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=${pg.goods_small_type_id}" >立即购买</a>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </c:if>
                <c:if test="${not empty phoneSmallType}">
                    <div id="J_chooseMain" class="pro-choose-main clearfix">
                    <div class="pro-view">
                        <img id="J_proImg" alt="手机图片预览" src="${pageContext.request.contextPath}${phoneSmallType.goods_small_type_image}" style="height: 70%;">
                    </div>
                    <div class="pro-info">
                        <div class="row pro-title clearfix margin0">
                            <div class="col-xs-8">
                                <span class="pro-name">购买${phoneSmallType.goods_small_type_name}</span>
                                <span class="pro-price">${phoneSmallType.phone_type_small_low_price}元起</span>
                            </div>
                            <div class="col-xs-4 pro-more">
                                <a id="J_proMore" href="#">深入了解产品></a>
                            </div>
                        </div>
                        <div id="J_proStep" class="show-package">
                            <div id="J_chooseModel" class="pro-choose-step" data-index="1">
                                <h4 class="step-title">1. 选择型号</h4>
                                <ul class="step-list clearfix">
                                    <c:forEach items="${phoneModelList}" var="pm">
                                        <li onclick="getPhoneVersionList(this)" title="${pm.goods_addribute_val_name}" data-node-id="${pm.model_id}" data-index="1">${pm.goods_addribute_val_name}</li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div id="J_chooseVersion" class="pro-choose-step hide" data-index="2">
                                <h4 class="step-title">2. 选择版本</h4>
                                <ul class="step-list clearfix"></ul>
                            </div>
                            <div id="J_chooseColor" class="pro-choose-step hide" data-index="3">
                                <h4 class="step-title">3. 选择颜色</h4>
                                <ul class="step-list clearfix"></ul>
                            </div>
                            <div id="J_choosePackage" class="pro-choose-step hide">
                                <h4 class="step-title">4. 添加特惠配件套装</h4>
                                <ul class="step-list clearfix">
                                    <%--
                                    <li onclick="getPhoneSetmealDetailList(this)" class="packageItem" title="必备套装 65元" data-node-id="1161400016">必备套装<br>65元<i>省32元</i></li>
                                    <li onclick="hidePackageListBox(this)" class="packageItem">裸机<br><i>不享受优惠</i></li>
                                    --%>
                                </ul>
                            </div>
                        </div>
                        <div id="J_packageListBox" class="package-list hide">
                            <ul class="list clearfix">
                                <%--
                                <li class="item">
                                    <div class="item-img"><img alt="小米活塞耳机 基础版 银色" src=""></div>
                                    <div class="item-title">小米活塞耳机 基础版 银色</div>
                                    <div class="item-versions">
                                        <span class="active" data-title="小米活塞耳机 基础版 银色" data-node-id="2161200005" data-img=""><img alt="" src=""></span>
                                    </div>
                                </li>
                                --%>
                            </ul>
                        </div>
                        <div id="J_chooseResultMsg" class="choose-result-msg">
                            <span class="msg-tit">您选择了以下产品:</span>
                            <p class="msg-bd">
                                <span class="select-phone-type">${phoneSmallType.goods_small_type_name}</span>&nbsp;
                                <span class="select-phone-model"></span>
                                <span class="select-phone-version"></span>
                                <span class="select-phone-color"></span>
                                <span class="select-phone-setmeal"></span>
                                <span class="select-phone-price orangeColor"></span>
                            </p>
                        </div>
                        <div id="J_chooseResult" class="pro-choose-result">
                            <button onclick="addUserShoppingCart()" disabled class="btn btn-lg btn-orange">加入购物车</button>
                            <a disabled href="javascript:;" class="btn btn-lg btn-orange hide">暂时缺货</a>
                        </div>
                    </div>
                </div>
                    <form id="phonePurchaseForm" class="hide" method="get" action="${pageContext.request.contextPath}/userShoppingCartCtrl/addUserShoppingCart.action">
                        <%--
                            phone_goods_id         手机商品id
                            goods_color_id         手机商品颜色id
                            phone_setmeal_id       手机套餐id
                            phone_setmeal_goods_color_ids           手机套餐颜色id
                        --%>
                        <input type="hidden" name="phone_goods_id">
                        <input type="hidden" name="goods_color_id">
                        <input type="hidden" name="phone_setmeal_id">
                        <input type="hidden" name="phoneSetmeal_goodsIds_goodsNums_goodsColorIds">
                    </form>
                </c:if>
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
        getCartSumGoodsNumShowCartBtn('${pageContext.request.contextPath}');
        var errorMessage = '${errorMessage}';
        if(errorMessage){
            toastr.info(errorMessage);
        }
    });

    function getPhoneVersionList(obj){
        $('#J_chooseVersion').removeClass('hide');
        $('#J_chooseColor').addClass('hide');
        $('#J_choosePackage').addClass('hide');
        $('#J_packageListBox').addClass('hide');
        $('#J_chooseResultMsg').find('span.select-phone-model').text($(obj).text()+' ');
        $('#J_chooseResult>button').attr('disabled',true);
        activeFun(obj,'active');

        var targetUrl = '${pageContext.request.contextPath}/phonePurchaseCtrl/getPhoneVersionList.action';
        var param = {
            "phoneGoodsView.goods_small_type_id":"${phoneSmallType.goods_small_type_id}",
            "phoneGoodsView.model_id":$(obj).data('node-id')
        };
        $.post(targetUrl,param,function(data){
            var chooseVersionUl = $('#J_chooseVersion>ul');
            chooseVersionUl.empty();
            for(var i in data){
                chooseVersionUl.append('<li onclick="getPhoneColorList(this)" title="'+data[i].phone_version_name+'" data-node-id="'+data[i].phone_goods_id+'" data-phone-stock="'+data[i].phone_stock+'" data-phone-price="'+data[i].phone_now_price+'" data-index="2">'+data[i].phone_version_name+'</li>');
            }
        },'json');
    }

    function getPhoneColorList(obj){
        $('#J_chooseColor').removeClass('hide');
        $('#J_choosePackage').addClass('hide');
        $('#J_packageListBox').addClass('hide');
        $('#J_chooseResultMsg').find('span.select-phone-version').text($(obj).text()+' ');
        $('#J_chooseResultMsg').find('span.select-phone-price').text($(obj).data('phone-price')+'元 ');
        if(parseInt($(obj).data('phone-stock'))>0){
            $('#J_chooseResult>button').attr('disabled',true);
            $('#J_chooseResult>button').removeClass('hide');
            $('#J_chooseResult>a').addClass('hide');
        }else{
            $('#J_chooseResult>button').addClass('hide');
            $('#J_chooseResult>a').removeClass('hide');
        }
        activeFun(obj,'active');

        var phone_goods_id = $(obj).data('node-id');
        $('#phonePurchaseForm').find('input[name="phone_goods_id"]').val(phone_goods_id);

        var targetUrl = '${pageContext.request.contextPath}/phonePurchaseCtrl/getPhoneColorList.action';
        var param = {"goodsColor.phone_goods_id":phone_goods_id};
        $.post(targetUrl,param,function(data){
            var chooseColorUl = $('#J_chooseColor>ul');
            chooseColorUl.empty();
            for(var i in data){
                chooseColorUl.append('<li onclick="getPhoneSetmealList(this)" data-img="${pageContext.request.contextPath}'+data[i].goods_color_img_url+'" data-node-id="'+data[i].goods_color_id+'" data-index="3"><span class="pro-color-box" style="background: '+data[i].goods_color_code+';'+(data[i].goods_addribute_val_name=='白色'?'border: 1px solid #dfdfdf':'')+'"></span>'+data[i].goods_addribute_val_name+'</li>');
            }
        },'json');
    }

    function getPhoneSetmealList(obj){
        $('#J_choosePackage').removeClass('hide');
        $('#J_packageListBox').addClass('hide');
        $('#J_proImg').attr('src',$(obj).data('img'));
        $('#J_chooseResultMsg').find('span.select-phone-color').text($(obj).text()+' ');
        $('#J_chooseResult>button').attr('disabled',true);
        activeFun(obj,'active');

        $('#phonePurchaseForm').find('input[name="goods_color_id"]').val($(obj).data('node-id'));

        var targetUrl = '${pageContext.request.contextPath}/phonePurchaseCtrl/getPhoneSetmealList.action';
        var param = {"phoneSetmeal.goods_small_type_id":"${phoneSmallType.goods_small_type_id}"};
        $.post(targetUrl,param,function(data){
            var choosePackageUl = $('#J_choosePackage>ul');
            choosePackageUl.empty();
            for(var i in data){
                choosePackageUl.append('<li onclick="getPhoneSetmealDetailList(this)" class="packageItem" title="'+data[i].phone_setmeal_name+'" data-node-id="'+data[i].phone_setmeal_id+'">'+data[i].phone_setmeal_name+'<br>'+data[i].setmeal_price+'元<i>省'+data[i].save_money+'元</i></li>');
            }
            choosePackageUl.append('<li onclick="hidePackageListBox(this)" class="packageItem" data-node-id="">裸机<br><i>不享受优惠</i></li>');
        },'json');
    }

    function getPhoneSetmealDetailList(obj){
        $('#J_packageListBox').removeClass('hide');
        $('#J_chooseResultMsg').find('span.select-phone-setmeal').text($(obj).text()+' ');
        $('#J_chooseResult>button').removeAttr('disabled');
        activeFun(obj,'active');

        var phone_setmeal_id = $(obj).data('node-id');
        $('#phonePurchaseForm').find('input[name="phone_setmeal_id"]').val(phone_setmeal_id);

        var targetUrl = '${pageContext.request.contextPath}/phonePurchaseCtrl/getPhoneSetmealDetailList.action';
        var param = {"phoneSetmealDetail.phone_setmeal_id":phone_setmeal_id};
        $.post(targetUrl,param,function(data){
            var packageListUl = $('#J_packageListBox>ul');
            var targetHtml;
            var goodsColorList;
            var phoneSetmeal_goodsIds_goodsNums_goodsColorIds='';
            packageListUl.empty();
            for(var i in data){
                targetHtml = '<li class="item"><div class="item-img"><img alt="'+data[i].goods_name+'" src="${pageContext.request.contextPath}'+data[i].goods_preview_image+'?width=100&height=100"></div><div class="item-title">'+data[i].goods_name+'</div><div class="item-versions">';
                goodsColorList = data[i].goodscolorlist;
                if(goodsColorList.length==0){
                    if(i==data.length-1){
                        phoneSetmeal_goodsIds_goodsNums_goodsColorIds += data[i].goods_id+'_'+data[i].goods_num+'_';
                    }else{
                        phoneSetmeal_goodsIds_goodsNums_goodsColorIds += data[i].goods_id+'_'+data[i].goods_num+'_,';
                    }
                    targetHtml = '<li class="item"><div class="item-img"><img alt="'+data[i].goods_name+'" src="${pageContext.request.contextPath}'+data[i].goods_preview_image+'?width=100&height=100"></div><div class="item-title">'+data[i].goods_name+'</div><div class="item-versions" data-node-id="'+data[i].goods_id+'_'+data[i].goods_num+'_">';
                }
                for(var j in goodsColorList){
                    if(j==0){
                        targetHtml = '<li class="item"><div class="item-img"><img alt="'+data[i].goods_name+'" src="${pageContext.request.contextPath}'+goodsColorList[j].goods_color_img_url+'?width=100&height=100"></div><div class="item-title">'+data[i].goods_name+'</div><div class="item-versions">';
                        if(i==data.length-1){
                            phoneSetmeal_goodsIds_goodsNums_goodsColorIds += goodsColorList[j].goods_id+'_'+data[i].goods_num+'_'+goodsColorList[j].goods_color_id;
                        }else{
                            phoneSetmeal_goodsIds_goodsNums_goodsColorIds += goodsColorList[j].goods_id+'_'+data[i].goods_num+'_'+goodsColorList[j].goods_color_id+',';
                        }
                    }
                    targetHtml += '<span onclick="selectPhoneSetmealImg(this)" class="'+(j==0?'active':'')+'" data-title="'+data[i].goods_name+' '+goodsColorList[j].goods_addribute_val_name+'" data-node-id="'+goodsColorList[j].goods_id+'_'+data[i].goods_num+'_'+goodsColorList[j].goods_color_id+'" data-img="${pageContext.request.contextPath}'+goodsColorList[j].goods_color_img_url+'?width=100&height=100"><img alt="'+data[i].goods_name+'" "'+goodsColorList[j].goods_addribute_val_name+'" src="${pageContext.request.contextPath}'+goodsColorList[j].goods_color_img_url+'?width=14&height=14"></span>';
                }
                targetHtml += '</div></li>';
                packageListUl.append(targetHtml);
            }
            $('#phonePurchaseForm').find('input[name="phoneSetmeal_goodsIds_goodsNums_goodsColorIds"]').val(phoneSetmeal_goodsIds_goodsNums_goodsColorIds);
        },'json');
    }

    function hidePackageListBox(obj){
        $('#J_packageListBox').addClass('hide');
        $('#J_chooseResultMsg').find('span.select-phone-setmeal').text('');
        $('#J_chooseResult>button').removeAttr('disabled');
        activeFun(obj,'active');
        $('#phonePurchaseForm').find('input[name="phone_setmeal_id"]').val($(obj).data('node-id'));
    }

    function selectPhoneSetmealImg(obj){
        var itemTitleDiv=$(obj).parent('div.item-versions').prev('div.item-title');
        itemTitleDiv.text($(obj).data('title'));
        itemTitleDiv.prev('div.item-img').children('img').attr('src',$(obj).data('img'));
        activeFun(obj,'active');

        var phoneSetmeal_goodsIds_goodsNums_goodsColorIds='';
        var spanActiveList = $('#J_packageListBox').find('div.item-versions');
        spanActiveList.each(function(i){
            var item_versions_id=$(this).data('node-id');
            if(item_versions_id){
                if(i==spanActiveList.length-1){
                    phoneSetmeal_goodsIds_goodsNums_goodsColorIds+=item_versions_id;
                }else{
                    phoneSetmeal_goodsIds_goodsNums_goodsColorIds+=item_versions_id+',';
                }
            }else{
                if(i==spanActiveList.length-1){
                    phoneSetmeal_goodsIds_goodsNums_goodsColorIds+=$(this).children('span.active').data('node-id');
                }else{
                    phoneSetmeal_goodsIds_goodsNums_goodsColorIds+=$(this).children('span.active').data('node-id')+',';
                }
            }
        });
        $('#phonePurchaseForm').find('input[name="phoneSetmeal_goodsIds_goodsNums_goodsColorIds"]').val(phoneSetmeal_goodsIds_goodsNums_goodsColorIds);
    }

    //加入购物车
    function addUserShoppingCart(){
        $('#phonePurchaseForm').submit();
    }
</script>
</body>
</html>
