<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <i class="glyphicon glyphicon-remove font-size16"></i>
    </button>
    <img alt="弹出框" src="../../../images/back/diatopicon.png" style="vertical-align: middle">
    <span class="modal-title font-size16">修改网站订单状态</span>
</div>

<form id="webOrderDialogFrom" class="form-horizontal" role="form" onsubmit="return webOrderSubmit(this)">
    <input value="${usersOrders.orders_id}" name="usersOrders.orders_id" type="hidden">
    <div class="modal-body">
        <div class="tab-pane active">
            <table class="table dialog-table">
                <tr>
                    <th><span class="must-msg">*&nbsp;</span>订单状态:</th>
                    <td>
                        <select name="usersOrders.orders_status" class="form-control">
                            <option ${usersOrders.orders_status=="1"?"selected":""} value="1">已付款</option>
                            <option ${usersOrders.orders_status=="2"?"selected":""} value="2">正在配货</option>
                            <option ${usersOrders.orders_status=="3"?"selected":""} value="3">已发货</option>
                            <option ${usersOrders.orders_status=="4"?"selected":""} value="4">交易成功</option>
                        </select>
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
        <button type="submit" form="webOrderDialogFrom" class="btn btn-xs btn-info">
            <i class="glyphicon glyphicon-ok font-size12"></i>
            <span>提交</span>
        </button>
    </div>
</form>
<script type="text/javascript">
    function webOrderSubmit(form){
        //拿到参数
        var param = $(form).formToJson();
        var command = '${command}';
        if(command=='updateRequest'){
            callSubmit('/webOrderCtrl/updateData', null,'webOrderListBox',param);
        }
        return false;
    }
</script>
