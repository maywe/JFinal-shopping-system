<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <i class="glyphicon glyphicon-remove font-size16"></i>
    </button>
    <img alt="弹出框" src="../../../images/back/diatopicon.png" style="vertical-align: middle">
    <span class="modal-title font-size16">增加网站用户</span>
</div>

<form id="webUserDialogFrom" class="form-horizontal" role="form" onsubmit="return webUserSubmit(this)">
    <input value="${usersFront.user_front_id}" name="usersFront.user_front_id" type="hidden">
    <div class="modal-body">
        <div class="tab-pane active">
            <table class="table dialog-table">
                <tr>
                    <th><span class="must-msg">*&nbsp;</span>用户账号:</th>
                    <td>
                        <input value="${usersFront.login_name}" name="usersFront.login_name" type="email" class="form-control" placeholder="用户账号" required="required" maxlength="32">
                    </td>
                    <th><span class="must-msg">*&nbsp;</span>用户密码:</th>
                    <td>
                        <input value="${usersFront.password}" name="usersFront.password" type="password" class="form-control" placeholder="用户密码" required="required" pattern="^.{6,20}$" oninvalid="setCustomValidity('请填写密码6-20位!');" oninput="setCustomValidity('');">
                    </td>
                </tr>
                <tr>
                    <th><span class="must-msg">&nbsp;</span>用户姓名:</th>
                    <td>
                        <input value="${usersFront.name}" name="usersFront.name" type="text" class="form-control" placeholder="用户姓名" maxlength="32">
                    </td>

                    <th><span class="must-msg">&nbsp;</span>用户性别:</th>
                    <td>
                        <select name="usersFront.sex" class="form-control">
                            <option value="">--请选择--</option>
                            <option ${usersFront.sex=="男"?"selected":""} value="男">男</option>
                            <option ${usersFront.sex=="女"?"selected":""} value="女">女</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th><span class="must-msg">&nbsp;</span>联系电话:</th>
                    <td>
                        <input value="${usersFront.telephone}" name="usersFront.telephone" type="tel" class="form-control" placeholder="联系电话" maxlength="11" pattern="(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$">
                    </td>
                    <th><span class="must-msg">&nbsp;</span>邮箱地址:</th>
                    <td>
                        <input value="${usersFront.email}" name="usersFront.email" type="email" class="form-control" placeholder="邮箱地址" maxlength="64">
                    </td>
                </tr>
                <tr>
                    <th>出生日期:</th>
                    <td>
                        <input readonly isDate value="<fmt:formatDate value="${usersFront.birthday}" pattern="yyyy-MM-dd"/>" name="usersFront.birthday" type="text" class="form-control dateSelect" placeholder="出生日期" maxlength="11">
                    </td>
                    <th>用户昵称:</th>
                    <td>
                        <input value="${usersFront.nickname}" name="usersFront.nickname" type="text" class="form-control" placeholder="用户昵称" maxlength="32">
                    </td>
                </tr>
                <tr>
                    <th><span class="must-msg">*&nbsp;</span>用户状态:</th>
                    <td>
                        <select name="usersFront.user_status" class="form-control" required="required">
                            <option ${usersFront.user_status=="0"?"selected":""} value="0">正常</option>
                            <option ${usersFront.user_status=="1"?"selected":""} value="1">冻结</option>
                        </select>
                    </td>
                    <th><span class="must-msg"></span>用户头像:</th>
                    <td style="width: 200px;">
                        <div class="input-group">
                            <input id="usersFrontImg" name="usersFrontImg" type="file" class="form-control" placeholder="用户头像" accept="image/*">
                            <span class="input-group-addon" style="padding: 1px 5px;">
                                <img width="30" height="30" alt="用户头像图片" src="${pageContext.request.contextPath}${empty usersFront.img?"/images/avatar-160.png":usersFront.img}?width=30&height=30">
                            </span>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-xs btn-info" data-dismiss="modal">
            <i class="glyphicon glyphicon-remove font-size12"></i>
            <span>关闭</span>
        </button>
        <button type="submit" form="webUserDialogFrom" class="btn btn-xs btn-info">
            <i class="glyphicon glyphicon-ok font-size12"></i>
            <span>提交</span>
        </button>
    </div>
</form>
<script type="text/javascript">
    $(function(){
        var command = '${command}';
        if(command=='showRequest'){
            disabledDialogForm('webUserDialogFrom');
        }else if(command=='updateRequest'){
            $('#webUserDialogFrom').find('input[name="usersFront.login_name"]').attr('disabled',true);
        }
        //日历选择控件
        $(".dateSelect").datetimepicker({
            language: 'zh-CN', //汉化
            format: "yyyy-mm-dd", //选择日期后，文本框显示的日期格式
            minView: "month", //选择日期后，不会再跳转去选择时分秒
            autoclose: true //选择日期后自动关闭
        });
    });

    function webUserSubmit(form){
        //拿到参数
        var fileElementIdList=[];
        var param = $(form).formToJson();
        var usersFrontImgObj = $('#usersFrontImg');
        if(usersFrontImgObj.val()!='' && usersFrontImgObj.val()!=undefined && usersFrontImgObj.val() != null){
            fileElementIdList.push('usersFrontImg');
        }
        //默认存在文件上传
        var isExistFile = true;
        if(fileElementIdList.length==0){
            isExistFile = false;
        }

        var command = '${command}';
        if(command=='addRequest'){
            if(isExistFile){
                callBatchFileUploadSubmit('/webUserCtrl/addFilesData',fileElementIdList,null,'webUserListBox',param);
            }else{
                callSubmit('/webUserCtrl/addData',null,'webUserListBox',param);
            }
        }else if(command=='updateRequest'){
            if(isExistFile){
                callBatchFileUploadSubmit('/webUserCtrl/updateFilesData',fileElementIdList,null,'webUserListBox',param);
            }else {
                callSubmit('/webUserCtrl/updateData', null,'webUserListBox',param);
            }
        }
        return false;
    }
</script>
