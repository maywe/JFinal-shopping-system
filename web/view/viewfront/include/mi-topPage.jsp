<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="${pageContext.request.contextPath}/css/viewfront/mi-topPage.css" type="text/css" rel="stylesheet">
<header class="head clearfix">
    <div class="div-center-width-1290">
        <ul class="nav navbar-nav navbar-left head-left">
            <li><a class="p-l-0" href="#">小米网</a></li>
            <li><a href="#">MIUI</a></li>
            <li><a href="#">米聊</a></li>
            <li><a href="#">游戏</a></li>
            <li><a href="#">多看阅读</a></li>
            <li><a href="#">云服务</a></li>
            <li><a href="#">小米网移动版</a></li>
            <li><a href="#">问题反馈</a></li>
            <li><a href="#">Select Region</a></li>
        </ul>

        <c:if test="${empty sessionScope.usersFront}">
            <ul class="nav navbar-nav navbar-right head-right">
                <li><a href="${pageContext.request.contextPath}/view/viewfront/login.jsp">登陆</a></li>
                <li><a class="p-r-0" href="${pageContext.request.contextPath}/view/viewfront/register.jsp">注册</a></li>
            </ul>
        </c:if>
        <c:if test="${not empty sessionScope.usersFront}">
            <ul class="nav navbar-nav navbar-right head-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                        欢迎您&nbsp;
                        <span>${empty sessionScope.usersFront.nickname?sessionScope.usersFront.login_name:sessionScope.usersFront.nickname}</span>&nbsp;
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" role="menu">
                        <li role="presentation">
                            <a href="${pageContext.request.contextPath}/userCenterCtrl/initUserCenter.action?command=getMyPersonCenterPage">
                                个人中心
                            </a>
                        </li>
                        <li role="presentation"><a href="${pageContext.request.contextPath}/userCenterCtrl/initUserCenter.action?command=getMyCollectPage">我的收藏</a></li>
                        <li role="presentation">
                            <a href="${pageContext.request.contextPath}/loginCtrl/loginOutFront.action">
                                退出登陆
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/userCenterCtrl/initUserCenter.action?command=getMyOrdersPage">
                        我的订单
                    </a>
                </li>
                <li>
                    <a class="p-r-0" href="${pageContext.request.contextPath}/userCenterCtrl/initUserCenter.action?command=getPersonInfoPage">
                        小米账户
                    </a>
                </li>
            </ul>
        </c:if>
    </div>
</header>
