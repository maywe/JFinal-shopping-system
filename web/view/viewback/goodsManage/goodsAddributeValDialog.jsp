<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <i class="glyphicon glyphicon-remove font-size16"></i>
    </button>
    <img alt="弹出框" src="../../../images/diatopicon.png" style="vertical-align: middle">
    <span class="modal-title font-size16">增加商品小类型</span>
</div>
<form id="goodsAddributeValDialogFrom" class="form-horizontal" role="form" onsubmit="return goodsAddributeValSubmit(this)">
    <div class="modal-body">
        <input value="${goodsAddributeVal.goods_addribute_val_id}" name="goodsAddributeVal.goods_addribute_val_id" type="hidden">
        <div class="tab-pane active">
            <table class="table dialog-table">
                <tr>
                    <th><span class="must-msg">*&nbsp;</span>商品属性:</th>
                    <td>
                        <select id="goods_addribute_id" name="goodsAddributeVal.goods_addribute_id" class="form-control" required="required" onchange="changeGoodsAddribute()">
                            <option value="">--请选择--</option>
                            <c:forEach items="${goodsAddributeList}" var="ga">
                                <option ${ga.goods_addribute_id==goodsAddributeVal.goods_addribute_id?"selected":""} value="${ga.goods_addribute_id}">${ga.goods_addribute_name}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th><span class="must-msg">*&nbsp;</span>商品属性值:</th>
                    <td>
                        <input value="${goodsAddributeVal.goods_addribute_val_name}" name="goodsAddributeVal.goods_addribute_val_name" type="text" class="form-control" placeholder="商品属性值名称" required="required" maxlength="64">
                    </td>
                </tr>
                <tr>
                    <th><span class="must-msg">*&nbsp;</span>商品颜色码:</th>
                    <td>
                        <input data-position="top right" id="goods_color_code" value="${goodsAddributeVal.goods_color_code}" name="goodsAddributeVal.goods_color_code" type="text" class="form-control" placeholder="商品属性值名称" maxlength="32">
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
            disabledDialogForm('goodsAddributeValDialogFrom');
        }

        $('#goods_color_code').minicolors({
            control: $(this).attr('data-control') || 'hue',
            defaultValue: $(this).attr('data-defaultValue') || '',
            inline: $(this).attr('data-inline') === 'true',
            letterCase: $(this).attr('data-letterCase') || 'lowercase',
            opacity: $(this).attr('data-opacity'),
            position: $(this).attr('data-position') || 'bottom left',
            change: function(hex, opacity) {
                if( !hex ) return;
                if( opacity ) hex += ', ' + opacity;
                try {
                    console.log(hex);
                } catch(e) {}
            },
            theme: 'bootstrap'
        });

        changeGoodsAddribute();
    });

    function goodsAddributeValSubmit(form){
        var command = '${command}';
        if(command=='addRequest'){
            callSubmit('/goodsAddributeValCtrl/addData',$(form).attr('id'),'goodsAddributeValListBox');
        }else if(command=='updateRequest'){
            callSubmit('/goodsAddributeValCtrl/updateData',$(form).attr('id'),'goodsAddributeValListBox');
        }
        return false;
    }

    function changeGoodsAddribute(){
        //当属性为手机颜色或商品颜色时
        var selectObj = $('#goods_addribute_id');
        var goodAttrVal = selectObj.val();
        var goodAttrName = selectObj.find('option:selected').text();
        var inputObj = $('#goods_color_code');
        if(goodAttrVal=='21' || goodAttrVal=='1' || goodAttrName=='手机颜色' || goodAttrName=='商品颜色'){
            inputObj.attr('required','required');
            inputObj.parent().parent().parent().css('display','');
        }else{
            inputObj.removeAttr('required');
            inputObj.parent().parent().parent().css('display','none');
        }
    }
</script>
