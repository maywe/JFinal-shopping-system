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
    <link href="${pageContext.request.contextPath}/css/common/animate.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/common.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/viewfront/mi-common.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/viewfront/mi-index.css" type="text/css" rel="stylesheet">
</head>
<body class="myBody">
    <div class="div-center-width-1290">
        <%@ include file="./include/mi-topNavPage.jsp" %>
        <div class="myContainer-context clearfix">
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
                            <a href="#"><img src="${pageContext.request.contextPath}/images/front/carousel/mi-carousel-mi5zx.jpg" alt="小米手机5 尊享版"></a>
                            <div class="carousel-caption"></div>
                        </div>
                        <div class="item">
                            <a href="#"><img src="${pageContext.request.contextPath}/images/front/carousel/mi-carousel-mi5.jpg" alt="小米手机5"></a>
                            <div class="carousel-caption"></div>
                        </div>
                        <div class="item">
                            <a href="#"><img src="${pageContext.request.contextPath}/images/front/carousel/mi-carousel-redmi3.jpg" alt="红米3"></a>
                            <div class="carousel-caption"></div>
                        </div>
                        <div class="item">
                            <a href="#"><img src="${pageContext.request.contextPath}/images/front/carousel/mi-carousel-tv.jpg" alt="小米电视"></a>
                            <div class="carousel-caption"></div>
                        </div>
                        <div class="item">
                            <a href="#"><img src="${pageContext.request.contextPath}/images/front/carousel/mi-carousel-router.jpg" alt="小米路由器"></a>
                            <div class="carousel-caption"></div>
                        </div>
                        <div class="item">
                            <a href="#"><img src="${pageContext.request.contextPath}/images/front/carousel/mi-carousel-mi4c.jpg" alt="小米4C"></a>
                            <div class="carousel-caption"></div>
                        </div>
                        <div class="item">
                            <a href="#"><img src="${pageContext.request.contextPath}/images/front/carousel/mi-carousel-tv3s.jpg" alt="小米手机5"></a>
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
                        <a class="item" target="_blank" data-stat-pid="2_16_1_77" data-stat-aid="AA12528" href="//item.mi.com/buyphone/minote" data-stat-id="AA12528+2_16_1_77" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-AA12528+2_16_1_77', '//item.mi.com/buyphone/minote', 'pcpid']);">
                            <img width="316" height="170" src="${pageContext.request.contextPath}/images/front/carousel/mi-carousel-bottom-minotegaddess.jpg" alt="小米Note">
                        </a>
                    </div>
                    <div class="col-xs-4 text-center">
                        <a class="item" target="_blank" data-stat-pid="2_16_1_77" data-stat-aid="AA12528" href="//item.mi.com/buyphone/minote" data-stat-id="AA12528+2_16_1_77" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-AA12528+2_16_1_77', '//item.mi.com/buyphone/minote', 'pcpid']);">
                            <img width="316" height="170" src="${pageContext.request.contextPath}/images/front/carousel/mi-carousel-bottom-tv.jpg" alt="小米Note">
                        </a>
                    </div>
                    <div class="col-xs-4 text-right">
                        <a class="item" target="_blank" data-stat-pid="2_16_1_77" data-stat-aid="AA12528" href="//item.mi.com/buyphone/minote" data-stat-id="AA12528+2_16_1_77" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-AA12528+2_16_1_77', '//item.mi.com/buyphone/minote', 'pcpid']);">
                            <img width="316" height="170" src="${pageContext.request.contextPath}/images/front/carousel/mi-carousel-bottom-aircleaner.jpg" alt="小米Note">
                        </a>
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
        var isNotLogin = '${empty sessionScope.usersFront}';
        if(isNotLogin=='false'){
            getCartSumGoodsNumShowCartBtn('${pageContext.request.contextPath}');
        }
        $('#goodsList').show();
        $('#myCarousel').carousel({interval: 4000});
    });
</script>
</body>
</html>
