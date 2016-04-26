<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <i class="glyphicon glyphicon-remove font-size16"></i>
    </button>
    <span class="modal-title font-size16">修改个人信息</span>
</div>
<form id="usersPersonInfoForm" class="form-horizontal" role="form" method="post" action="${pageContext.request.contextPath}/userCenterCtrl/updatePersonInfoData.action">
    <div class="modal-body border0" style="padding:0 20px">
        <input value="${usersFront.user_front_id}" name="usersFront.user_front_id" type="hidden">
        <input value="${usersFront.name}" name="usersFront.name" class="form-control m-b" type="text" placeholder="姓名" maxlength="32">
        <select name="usersFront.sex" class="form-control m-b">
            <option value="">--选择性别--</option>
            <option ${usersFront.sex=='男'?'selected':''} value="男">男</option>
            <option ${usersFront.sex=='女'?'selected':''} value="女">女</option>
        </select>
        <input value="${usersFront.telephone}" name="usersFront.telephone" class="form-control m-b" type="tel" placeholder="11位手机号码" maxlength="11" pattern="(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$">
        <input value="${usersFront.email}" name="usersFront.email" class="form-control m-b" type="email" placeholder="电子邮箱">
        <input value="<fmt:formatDate value="${usersFront.birthday}" pattern="yyyy-MM-dd"/>" name="usersFront.birthday" class="form-control m-b dateSelect" type="text" placeholder="生日" maxlength="32" readonly>
        <input value="${usersFront.nickname}" name="usersFront.nickname" class="form-control m-b" type="text" placeholder="昵称" maxlength="32">
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-grey" style="width: 125px;" data-dismiss="modal">
            <span>关闭</span>
        </button>
        <button type="submit" class="btn btn-orange" style="width: 125px;">
            <span>提交</span>
        </button>
    </div>
</form>
<script type="text/javascript">
    $(function(){
        //日历选择控件
        $(".dateSelect").datetimepicker({
            language: 'zh-CN',      //汉化
            format: "yyyy-mm-dd",   //选择日期后，文本框显示的日期格式
            minView: "month",       //选择日期后，不会再跳转去选择时分秒
            autoclose: true         //选择日期后自动关闭
        });
    });
</script>
