<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="user-address-box">
    <div class="user-address-title">收货地址</div>
    <div class="user-address-body clearfix">
        <div class="user-address-item">
            <div class="user-add-address display-table">
                <div class="display-table-cell text-center">
                    <a data-whatever="增加收货地址" data-backdrop="static" data-toggle="modal" href="${pageContext.request.contextPath}/userCenterCtrl/addUserAddressRequest.action" data-target="#pop_modal_sm">
                        <i class="fa fa-plus-circle"></i><br>
                        <span>添加新地址</span>
                    </a>
                </div>
            </div>
        </div>
        <c:forEach items="${usersDeliveryAddressList}" var="uda">
            <div onclick="selectUserAddress(this,'${uda.users_delivery_address_id}')" class="user-address-item">
                <dl>
                    <dt class="m-b clearfix">
                        <span class="user-address-tag">${uda.address_label}</span>
                        <em class="user-name">${uda.name}</em>
                    </dt>
                    <dd class="user-tel">${uda.telephone}</dd>
                    <dd class="user-address">
                        ${uda.province} ${uda.city} ${uda.county}
                        <br>
                        ${uda.street}
                    </dd>
                </dl>
                <div class="row actions">
                    <div class="col-xs-6 user-address-delete">
                        <a href="${pageContext.request.contextPath}/userCenterCtrl/deleteUserAddressData.action?usersDeliveryAddress.users_delivery_address_id=${uda.users_delivery_address_id}">删除</a>
                    </div>
                    <div class="col-xs-6 user-address-update">
                        <a data-whatever="修改收货地址" data-backdrop="static" data-toggle="modal" href="${pageContext.request.contextPath}/userCenterCtrl/updateUserAddressRequest.action?usersDeliveryAddress.users_delivery_address_id=${uda.users_delivery_address_id}" data-target="#pop_modal_sm">修改</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
