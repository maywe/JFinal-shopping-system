<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="row user-person-info">
    <div class="col-xs-5 display-table user-person-img-box">
        <div class="display-table-cell">
            <img id="userPersonImg" width="150" height="150" class="img-circle" src="${pageContext.request.contextPath}${empty usersFront.img?"/images/avatar-160.png":usersFront.img}">
            <a class="edit-img" data-backdrop="static" data-toggle="modal" href="${pageContext.request.contextPath}/userCenterCtrl/updatePersonImgRequest.action" data-target="#pop_modal_lg">
                <span>修改头像</span>
            </a>
        </div>
    </div>
    <div class="col-xs-7 display-table user-person-info-box">
        <div class="display-table-cell">
            <div class="fdata clearfix">
                <a class="pull-right edit" data-backdrop="static" data-toggle="modal" href="${pageContext.request.contextPath}/userCenterCtrl/updatePersonInfoRequest.action" data-target="#pop_modal_sm">
                    <i class="glyphicon glyphicon-pencil"></i>
                    <span>编辑</span>
                </a>
                <h3 class="m-t-0">基础资料</h3>
            </div>
            <div class="fdata nickname">
                <p>
                    <span>姓名：</span>
                    <span class="value">${usersFront.name}</span>
                </p>
            </div>
            <div class="fdata gender">
                <p>
                    <span>性别：</span>
                    <span class="value">${usersFront.sex}</span>
                </p>
            </div>
            <div class="fdata telephone">
                <p>
                    <span>电话：</span>
                    <span class="value">${usersFront.telephone}</span>
                </p>
            </div>
            <div class="fdata email">
                <p>
                    <span>邮箱：</span>
                    <span class="value">${usersFront.email}</span>
                </p>
            </div>
            <div class="fdata birthday">
                <p>
                    <span>生日：</span>
                    <span class="value"><fmt:formatDate value="${usersFront.birthday}" pattern="yyyy-MM-dd"/></span>
                </p>
            </div>
            <div class="fdata nickname">
                <p>
                    <span>昵称：</span>
                    <span class="value">${usersFront.nickname}</span>
                </p>
            </div>
        </div>
    </div>
</div>
