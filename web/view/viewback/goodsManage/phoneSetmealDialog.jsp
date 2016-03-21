<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <i class="glyphicon glyphicon-remove font-size16"></i>
    </button>
    <img alt="弹出框" src="../../../images/diatopicon.png" style="vertical-align: middle">
    <span class="modal-title font-size16">增加手机套餐</span>
</div>
<form id="phoneSetmealDialogFrom" class="form-horizontal" role="form" onsubmit="return phoneSetmealSubmit(this)">
    <input value="${phoneSetmeal.phone_setmeal_id}" name="phoneSetmeal.phone_setmeal_id" type="hidden">
    <div class="modal-body">
        <div class="tab-pane active">
            <table class="table dialog-table">
                <tr>
                    <th style="width: 110px;"><span class="must-msg">*&nbsp;</span>所属手机类别:</th>
                    <td>
                        <select name="phoneSetmeal.goods_small_type_id" class="form-control" required="required">
                            <option value="">--请选择--</option>
                            <c:forEach items="${goodsSmallTypeList}" var="gst">
                                <option ${phoneSetmeal.goods_small_type_id==gst.goods_small_type_id?"selected":""} value="${gst.goods_small_type_id}">${gst.goods_small_type_name}</option>
                            </c:forEach>
                        </select>
                    </td>

                    <th style="width: 110px;"><span class="must-msg">*&nbsp;</span>手机套餐名称:</th>
                    <td>
                        <input value="${phoneSetmeal.phone_setmeal_name}" name="phoneSetmeal.phone_setmeal_name" type="text" class="form-control" placeholder="手机套餐名称" required="required" maxlength="64">
                    </td>
                </tr>
                <tr>
                    <th><span class="must-msg">*&nbsp;</span>套餐商品总数:</th>
                    <td>
                        <input value="${phoneSetmeal.setmeal_goods_num}" name="phoneSetmeal.setmeal_goods_num" type="text" class="form-control" placeholder="套餐商品总数" required="required" pattern="^\d{1,10}$">
                    </td>

                    <th><span class="must-msg">*&nbsp;</span>当前套餐价格:</th>
                    <td>
                        <input value="${phoneSetmeal.setmeal_price}" name="phoneSetmeal.setmeal_price" type="text" class="form-control" placeholder="当前套餐总价" required="required" pattern="^\d+(\.\d+)?$">
                    </td>
                </tr>
                <tr>
                    <th><span class="must-msg">*&nbsp;</span>节省钱数:</th>
                    <td>
                        <input value="${phoneSetmeal.save_money}" name="phoneSetmeal.save_money" type="text" class="form-control" placeholder="当前套餐总价" required="required" pattern="^\d+(\.\d+)?$">
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
        <button type="submit" class="btn btn-xs btn-info">
            <i class="glyphicon glyphicon-ok font-size12"></i>
            <span>提交</span>
        </button>
    </div>
</form>

<script type="text/javascript">
    $(function(){
        var command = '${command}';
        if(command=='showRequest'){
            disabledDialogForm('phoneSetmealDialogFrom');
        }
    });

    function phoneSetmealSubmit(form){
        var command = '${command}';
        if(command=='addRequest'){
            callSubmit('/phoneSetmealCtrl/addData',$(form).attr('id'),'phoneSetmealListBox');
        }else if(command=='updateRequest'){
            callSubmit('/phoneSetmealCtrl/updateData',$(form).attr('id'),'phoneSetmealListBox');
        }
        return false;
    }
</script>
