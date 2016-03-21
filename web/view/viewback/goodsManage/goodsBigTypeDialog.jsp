<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <i class="glyphicon glyphicon-remove font-size16"></i>
    </button>
    <img alt="弹出框" src="../../../images/diatopicon.png" style="vertical-align: middle">
    <span class="modal-title font-size16">增加商品大类型</span>
</div>
<form id="goodsBigTypeDialogFrom" class="form-horizontal" role="form" onsubmit="return goodsBigTypeSubmit(this)">
    <div class="modal-body">
        <input value="${goodsBigType.goods_big_type_id}" name="goodsBigType.goods_big_type_id" type="hidden">
        <div class="tab-pane active">
            <table class="table dialog-table">
                <tr>
                    <th><span class="must-msg">*&nbsp;</span>商品类别:</th>
                    <td>
                        <input value="${goodsBigType.goods_bigl_type_name}" name="goodsBigType.goods_bigl_type_name" type="text" class="form-control" placeholder="商品大类别" required="required" maxlength="64">
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
            disabledDialogForm('goodsBigTypeDialogFrom');
        }
    });

    function goodsBigTypeSubmit(form){
        var command = '${command}';
        if(command=='addRequest'){
            callSubmit('/goodsBigTypeCtrl/addData',$(form).attr('id'),'goodsBigTypeListBox');
        }else if(command=='updateRequest'){
            callSubmit('/goodsBigTypeCtrl/updateData',$(form).attr('id'),'goodsBigTypeListBox');
        }
        return false;
    }
</script>
