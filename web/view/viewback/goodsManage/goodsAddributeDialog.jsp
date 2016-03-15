<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <i class="glyphicon glyphicon-remove font-size16"></i>
    </button>
    <img alt="弹出框" src="../../../images/diatopicon.png" style="vertical-align: middle">
    <span class="modal-title font-size16">增加商品属性</span>
</div>
<div class="modal-body">
    <form id="goodsAddributeDialogFrom" class="form-horizontal" role="form" onsubmit="return goodsAddributeSubmit(this)">
        <input value="${goodsAddribute.goods_addribute_id}" name="goodsAddribute.goods_addribute_id" type="hidden">
        <div class="tab-pane active">
            <table class="table dialog-table">
                <tr>
                    <th><span class="must-msg">*&nbsp;</span>商品属性:</th>
                    <td>
                        <input value="${goodsAddribute.goods_addribute_name}" name="goodsAddribute.goods_addribute_name" type="text" class="form-control" placeholder="商品属性" required="required" maxlength="64">
                    </td>
                </tr>
            </table>
        </div>
    </form>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-xs btn-info" data-dismiss="modal">
        <i class="glyphicon glyphicon-remove font-size12"></i>
        <span>关闭</span>
    </button>
    <button type="submit" form="goodsAddributeDialogFrom" class="btn btn-xs btn-info">
        <i class="glyphicon glyphicon-ok font-size12"></i>
        <span>提交</span>
    </button>
</div>
<script type="text/javascript">
    $(function(){
        var command = '${command}';
        if(command=='showRequest'){
            disabledDialogForm('goodsAddributeDialogFrom');
        }
    });

    function goodsAddributeSubmit(form){
        var command = '${command}';
        if(command=='addRequest'){
            callSubmit('/goodsAddributeCtrl/addData',$(form).attr('id'),'goodsAddributeListBox');
        }else if(command=='updateRequest'){
            callSubmit('/goodsAddributeCtrl/updateData',$(form).attr('id'),'goodsAddributeListBox');
        }
        return false;
    }
</script>
