<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <i class="glyphicon glyphicon-remove font-size16"></i>
    </button>
    <span class="modal-title font-size16">修改密码</span>
</div>

<form id="userPersonPasswordForm" class="form-horizontal" role="form" onsubmit="return userPersonPasswordSubmit(this)">
    <div class="modal-body">
        <div class="tab-pane active">
            <table class="table dialog-table">
                <tr>
                    <th style="width: 90px;"><span class="must-msg">*&nbsp;</span>原密码:</th>
                    <td>
                        <input name="usersFront.password" type="password" class="form-control" required="required" placeholder="用户原密码" maxlength="32">
                    </td>
                </tr>
                <tr>
                    <th><span class="must-msg">*&nbsp;</span>新密码:</th>
                    <td>
                        <input name="password_new1" type="password" class="form-control" placeholder="用户新密码" required="required" maxlength="32">
                    </td>
                </tr>
                <tr>
                    <th><span class="must-msg">*&nbsp;</span>确认新密码:</th>
                    <td>
                        <input name="password_new2" type="password" class="form-control" placeholder="确认新密码" required="required" maxlength="32">
                    </td>
                </tr>
            </table>
        </div>
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
    function userPersonPasswordSubmit(form){
        var passwordNew1 = $(form).find('input[name="password_new1"]').val();
        var passwordNew2 = $(form).find('input[name="password_new2"]').val();
        if(passwordNew1==''||passwordNew2==''||passwordNew1!=passwordNew2){
            toastr.warning("两次输入的新密码不一致!");
            return false;
        }
        $.post('${pageContext.request.contextPath}/userCenterCtrl/updatePersonPasswordData.action',$(form).formToJson(),function(data){
            if(data.errorCode==0){
                toastr.success(data.errorMessage);
                $('#pop_modal_sm').modal('hide');
                window.location.href='${pageContext.request.contextPath}/view/viewfront/login.jsp';
            }else{
                toastr.info(data.errorMessage);
            }
        },'json');
        return false;
    }
</script>
