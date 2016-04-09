<%--
  Created by IntelliJ IDEA.
  User: ChenMW
  Date: 2016-04-08
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
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
    <link href="${pageContext.request.contextPath}/css/common/common.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/viewfront/mi-common.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/viewfront/mi-phonePurchase.css" type="text/css" rel="stylesheet">
</head>
<body class="myBody">
    <div class="div-center-width-1290">
        <%@ include file="./include/mi-topNavPage.jsp" %>
        <div class="myContainer-context-zIndex23 buy-choose-box">
            <div class="hd">
                <ul id="J_navBar" class="pro-nav-bar clearfix">
                    <c:forEach items="${phoneSmallTypeList}" var="pst">
                        <li class="${pst.goods_small_type_id==phoneSmallType.goods_small_type_id?'active':''}">
                            <a href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=${pst.goods_small_type_id}">${pst.goods_small_type_name}</a>
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
                <div id="J_chooseMain" class="pro-choose-main clearfix">
                    <div class="pro-view">
                        <img id="J_proImg" alt="小米Note" src="${pageContext.request.contextPath}${phoneSmallType.phone_preview_image}" style="height: 70%;">
                    </div>
                    <div class="pro-info">
                        <div class="row pro-title clearfix margin0">
                            <div class="col-xs-8">
                                <span class="pro-name">购买小米Note</span>
                                <span class="pro-price">${phoneSmallType.phone_low_price}元起</span>
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
                                    <li onclick="getPhoneSetmealDetailList(this)" class="packageItem" title="必备套装 65元" data-node-id="1161400016">
                                        必备套装<br>65元<i>省32元</i>
                                    </li>
                                    <li onclick="hidePackageListBox(this)" class="packageItem">
                                        裸机<br><i>不享受优惠</i>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div id="J_packageListBox" class="package-list hide">
                            <ul id="J_packageList" class="list clearfix">
                                <li class="item">
                                    <div class="item-img">
                                        <img alt="小米活塞耳机 基础版 银色" src="//i1.mifile.cn/a1/T1Ax_vB_Kv1RXrhCrK!140x140.jpg">
                                    </div>
                                    <div class="item-title">小米活塞耳机 基础版 银色</div>
                                    <div class="item-versions">
                                        <span class="active" data-title="小米活塞耳机 基础版 银色" data-node-id="2161200005" data-img="//i1.mifile.cn/a1/T1Ax_vB_Kv1RXrhCrK!140x140.jpg">
                                            <img alt="" src="//i1.mifile.cn/a1/T1Ax_vB_Kv1RXrhCrK!14x14.jpg">
                                        </span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div id="J_chooseResultMsg" class="choose-result-msg">
                            <span class="msg-tit">您选择了以下产品:</span>
                            <p class="msg-bd">小米Note 标准版 双网通 16GB</p>
                        </div>
                        <div id="J_chooseResult" class="pro-choose-result">
                            <button disabled class="btn btn-lg btn-orange">立即购买</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="./include/mi-bottomPage.jsp" %>
    </div>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/bootstrap.min.js"></script>
<!-- 浏览器兼容 bsie js 补丁只在IE6中才执行 -->
<!--[if lte IE 6]>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/bootstrap-ie.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/html5shiv.min.js"></script>
<![endif]-->
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/viewfront/mi-common.js"></script>
<script type="text/javascript">
    $(function(){
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
                chooseVersionUl.append('<li onclick="getPhoneColorList(this)" title="'+data[i].phone_version_name+'" data-node-id="'+data[i].phone_goods_id+'" data-index="2">'+data[i].phone_version_name+'</li>');
            }
        },'json');
    }

    function getPhoneColorList(obj){
        $('#J_chooseColor').removeClass('hide');
        $('#J_choosePackage').addClass('hide');
        $('#J_packageListBox').addClass('hide');
        $('#J_chooseResult>button').attr('disabled',true);
        activeFun(obj,'active');

        var targetUrl = '${pageContext.request.contextPath}/phonePurchaseCtrl/getPhoneColorList.action';
        var param = {"goodsColor.phone_goods_id":$(obj).data('node-id')};
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
        $('#J_chooseResult>button').attr('disabled',true);
        activeFun(obj,'active');
        /*
        var targetUrl = '${pageContext.request.contextPath}/phonePurchaseCtrl';
        $.post(targetUrl,{},function(data){
            activeFun(obj,'active');
        },'json');
        */
    }

    function getPhoneSetmealDetailList(obj){
        $('#J_packageListBox').removeClass('hide');
        $('#J_chooseResult>button').removeAttr('disabled');
        activeFun(obj,'active');
    }

    function hidePackageListBox(obj){
        $('#J_packageListBox').addClass('hide');
        $('#J_chooseResult>button').removeAttr('disabled');
        activeFun(obj,'active');
    }
</script>
</body>
</html>
