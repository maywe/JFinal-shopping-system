<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="user-person-center">
    <div class="row user-account-box">
        <div class="col-xs-2 display-table">
            <div class="display-table-cell user-img-box">
                <img width="150" height="150" class="img-circle" src="${pageContext.request.contextPath}/images/logo_me.jpg">
            </div>
        </div>
        <div class="col-xs-4 display-table">
            <div class="display-table-cell user-nickname-box">
                <h3 class="nickname">${empty sessionScope.usersFront.nickname?sessionScope.usersFront.name:sessionScope.usersFront.nickname}</h3>
                <p class="tip">${gregorianCalendarStr}</p>
                <a href="javascript:;" onclick="getTargetPage(null,'getPersonInfoPage')">修改个人信息&gt;</a>
            </div>
        </div>
        <div class="col-xs-6 display-table">
            <div class="display-table-cell user-actions-box">
                <ul class="action-list">
                    <li>
                        账户安全：
                        <span class="level">较高</span>
                    </li>
                    <li>
                        绑定手机：
                        <span class="tel">155********53</span>
                    </li>
                    <li>
                        绑定邮箱：
                        <span class="tel">22******4@q*.com</span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="row portal-box">
        <div class="col-xs-2 display-table">
            <div class="display-table-cell portal-img">
                <img alt="" src="${pageContext.request.contextPath}/images/front/i/portal-icon-1.png">
            </div>
        </div>
        <div class="col-xs-4 display-table">
            <div class="display-table-cell portal-info">
                <h4>我的购物车商品：<span class="num">${userCartSumGoodsNum}</span></h4>
                <a href="${pageContext.request.contextPath}/userShoppingCartCtrl/initUserShoppingCart.action">查看购物车商品&gt;</a>
            </div>
        </div>
        <div class="col-xs-2 display-table">
            <div class="display-table-cell portal-img">
                <img alt="" src="${pageContext.request.contextPath}/images/front/i/portal-icon-2.png">
            </div>
        </div>
        <div class="col-xs-4 display-table">
            <div class="display-table-cell portal-info">
                <h4>待收货的订单：<span class="num">${userSumNotReceivedOrderNum}</span></h4>
                <a href="javascript:;" onclick="getTargetPage(null,'getMyOrdersPage',{orders_status:'4'})">查看待收货订单&gt;</a>
            </div>
        </div>
    </div>
    <div class="row portal-box">
        <div class="col-xs-2 display-table">
            <div class="display-table-cell portal-img">
                <img alt="" src="${pageContext.request.contextPath}/images/front/i/portal-icon-3.png">
            </div>
        </div>
        <div class="col-xs-4 display-table">
            <div class="display-table-cell portal-info">
                <h4>待评价商品数：<span class="num">2</span></h4>
                <a href="javascript:;">查看待评价商品&gt;</a>
            </div>
        </div>
        <div class="col-xs-2 display-table">
            <div class="display-table-cell portal-img">
                <img alt="" src="${pageContext.request.contextPath}/images/front/i/portal-icon-4.png">
            </div>
        </div>
        <div class="col-xs-4 display-table">
            <div class="display-table-cell portal-info">
                <h4>喜欢的商品：<span class="num">2</span></h4>
                <a href="javascript:;">查看喜欢的商品&gt;</a>
            </div>
        </div>
    </div>
</div>
