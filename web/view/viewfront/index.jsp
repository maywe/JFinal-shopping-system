<%--
  Created by IntelliJ IDEA.
  User: ChenMW
  Date: 2016-04-05
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width,initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" name="viewport">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <link rel="shortcut icon" type="image/ico" href="../../images/mi-logo-36.png">
    <title>MI2-主页展示</title>
    <link href="${pageContext.request.contextPath}/css/common/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/font-awesome.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/common.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/viewfront/mi-common.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/viewfront/mi-index.css" type="text/css" rel="stylesheet">
</head>
<body class="myBody">
    <div class="div-center-width-1290">
        <%@ include file="./include/mi-topNavPage.jsp" %>
        <div class="myContainer-context">
            <div class="carousel-left">&nbsp;</div>
            <div class="carousel-center">
                <div id="myCarousel" class="carousel slide myCarousel" data-ride="carousel">
                    <!-- 指示器 -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                        <li data-target="#myCarousel" data-slide-to="3"></li>
                        <li data-target="#myCarousel" data-slide-to="4"></li>
                    </ol>

                    <!-- 轮播内容 -->
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
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
                            <a href="#"><img src="${pageContext.request.contextPath}/images/front/carousel/mi-carousel-mifans.jpg" alt="米粉节 狂欢周"></a>
                            <div class="carousel-caption"></div>
                        </div>
                        <div class="item">
                            <a href="#"><img src="${pageContext.request.contextPath}/images/front/carousel/mi-carousel-mi4c.jpg" alt="小米4C"></a>
                            <div class="carousel-caption"></div>
                        </div>
                    </div>

                    <!-- 控制器 -->
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
                            <img width="316" height="170" src="${pageContext.request.contextPath}/images/front/carousel/mi-carousel-bottom-minote.jpg" alt="小米Note">
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
<script type="text/javascript">
    $(function(){
        $('#myCarousel').carousel({interval: 4000});
    });
</script>
</body>
</html>
