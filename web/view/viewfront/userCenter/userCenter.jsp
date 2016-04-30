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
    <title>小米用户-个人中心</title>
    <link href="${pageContext.request.contextPath}/css/common/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/font-awesome.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/animate.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/toastr.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/cropper.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/common.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/viewfront/mi-common.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/viewfront/mi-userCenter.css" type="text/css" rel="stylesheet">

    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/bootstrap.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/toastr.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/PCASClass.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/bootstrap-datetimepicker.zh-CN.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/cropper.min.js"></script>

    <!-- 浏览器兼容 bsie js 补丁只在IE6中才执行 -->
    <!--[if lte IE 6]>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/bootstrap-ie.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/html5shiv.min.js"></script>
    <![endif]-->
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/common.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/viewback/core-imageCutOut.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/viewfront/mi-common.js"></script>
    <script type="text/javascript">
        $(function(){
            initModal('#pop_modal_sm,#pop_modal_lg');
            getTargetPage(null,'${command}');
            var isNotLogin = '${empty sessionScope.usersFront}';
            if(isNotLogin=='false'){
                getCartSumGoodsNumShowCartBtn('${pageContext.request.contextPath}');
            }
        });

        function getTargetPage(obj,command,param){
            var $ucNavBox = $('#ucNavBox');
            var $navSmallType = $('#navSmallType');
            //var isExistPage = false;
            if(obj){
                $ucNavBox.find('li').removeClass('active');
                $(obj).addClass('active');
                command = $(obj).attr('command');
                $navSmallType.text($(obj).text());
                //isExistPage = true;
            }else{
                $ucNavBox.find('li').each(function(){
                    if($(this).attr('command')==command){
                        $ucNavBox.find('li').removeClass('active');
                        $(this).addClass('active');
                        $navSmallType.text($(this).text());
                        //isExistPage = true;
                        return false;
                    }
                });
            }

            //if(command&&isExistPage){
            if(command){
                if(!param){
                    param = {};
                }
                param.command = command;

                var targetUrl = "${pageContext.request.contextPath}/userCenterCtrl/"+command+".action";
                var $ucContentBox = $('#ucContentBox');
                $ucContentBox.empty().load(targetUrl,param,function(response,status,xhr){
                    //判断登录是否超时
                    var errorVo = '{"errorMessage":"请您先登录!","errorCode":99}';
                    if(response&&response.substring(0,errorVo.length).indexOf('"errorCode":99')>-1){
                        toastr.info('登录超时!');
                        window.location.href = '${pageContext.request.contextPath}/view/viewfront/login.jsp';
                    }
                    var $ucContentBoxHeight = $ucContentBox.children('div').height();
                    if($ucContentBoxHeight&&$ucContentBoxHeight>570){
                        $('#ucNavBox').height($ucContentBoxHeight);
                        $ucContentBox.height($ucContentBoxHeight+30);
                    }else{
                        $('#ucNavBox').height(570-30);
                        $ucContentBox.height(570);
                    }
                });
            }
        }
    </script>
</head>
<body class="myBody">
<div class="div-center-width-1290">
    <%@ include file="./../include/mi-topNavPage.jsp" %>
        <div class="myContainer-context">
            <div class="path-nav-box">
                <div class="display-table">
                    <div class="display-table-cell path-nav">
                        <a href="${pageContext.request.contextPath}/" class="home">首页</a>
                        <span>&gt;</span>
                        <a href="#" class="anv-big-type">个人中心</a>
                        <span>&gt;</span>
                        <a id="navSmallType" href="#" class="nav-small-type">个人中心</a>
                    </div>
                </div>
            </div>
            <div class="uc-box clearfix">
                <div id="ucNavBox" class="uc-nav-box">
                    <div class="uc-nav">
                        <div class="nav-hd">
                            <h4 class="title">订单中心</h4>
                        </div>
                        <div class="nav-bd">
                            <ul class="uc-nav-list">
                                <li onclick="getTargetPage(this)" command="getMyOrdersPage">我的订单</li>
                                <li onclick="getTargetPage(this)" command="getGoodsAccessPage">商品评价</li>
                            </ul>
                        </div>
                    </div>
                    <div class="uc-nav">
                        <div class="nav-hd">
                            <h4 class="title">个人中心</h4>
                        </div>
                        <div class="nav-bd">
                            <ul class="uc-nav-list">
                                <li onclick="getTargetPage(this)" command="getMyPersonCenterPage">我的个人中心</li>
                                <li onclick="getTargetPage(this)" command="getMyCollectPage">我的收藏</li>
                                <li onclick="getTargetPage(this)" command="getReceiptAddressPage">收货地址</li>
                                <li onclick="getTargetPage(this)" command="getPersonInfoPage">个人信息</li>
                                <li>
                                    <a data-backdrop="static" data-toggle="modal" href="${pageContext.request.contextPath}/userCenterCtrl/updatePersonPasswordRequest.action" data-target="#pop_modal_sm">修改密码</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div id="ucContentBox" class="uc-content-box">

                </div>
            </div>
        </div>
    <%@ include file="./../include/mi-bottomPage.jsp" %>
</div>
</body>
</html>
