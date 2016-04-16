<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <i class="glyphicon glyphicon-remove font-size16"></i>
    </button>
    <img alt="弹出框" src="../../../images/back/diatopicon.png" style="vertical-align: middle">
    <span class="modal-title font-size16">增加商品小类型</span>
</div>

<form id="goodsSmallTypeDialogFrom" class="form-horizontal" role="form" onsubmit="return goodsSmallTypeSubmit(this)">
    <div class="modal-body">
        <input value="${goodsSmallType.goods_small_type_id}" name="goodsSmallType.goods_small_type_id" type="hidden">
        <div class="tab-pane active">
            <table class="table dialog-table">
                <tr>
                    <th style="width: 90px;"><span class="must-msg">*&nbsp;</span>所属大类别:</th>
                    <td>
                        <select name="goodsSmallType.goods_big_type_id" class="form-control" required="required">
                            <option value="">--请选择--</option>
                            <c:forEach items="${goodsBigTypeList}" var="gbt">
                                <option ${gbt.goods_big_type_id==goodsSmallType.goods_big_type_id?"selected":""} value="${gbt.goods_big_type_id}">${gbt.goods_bigl_type_name}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th><span class="must-msg">*&nbsp;</span>商品小类别:</th>
                    <td>
                        <input value="${goodsSmallType.goods_small_type_name}" name="goodsSmallType.goods_small_type_name" type="text" class="form-control" placeholder="商品小类别名称" required="required" maxlength="64">
                    </td>
                </tr>
                <tr>
                    <th><span class="must-msg">&nbsp;</span>预览图片:</th>
                    <td>
                        <div class="input-group">
                            <input id="goods_small_type_image" name="goods_small_type_image" type="file" class="form-control" placeholder="商品预览图" accept="image/*">
                            <span class="input-group-addon" style="padding: 1px 5px;">
                                <img width="30" height="30" alt="商品颜色图片" src="${pageContext.request.contextPath}${empty goodsSmallType.goods_small_type_image?"/images/avatar-160.png":goodsSmallType.goods_small_type_image}">
                            </span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th><span class="must-msg">&nbsp;</span>类别描述:</th>
                    <td>
                        <textarea maxlength="256" class="form-control" placeholder="商品小类别描述" name="goodsSmallType.goods_small_type_remark">${goodsSmallType.goods_small_type_remark}</textarea>
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
            disabledDialogForm('goodsSmallTypeDialogFrom');
        }
    });

    function goodsSmallTypeSubmit(form){
        //拿到参数
        var param = $(form).formToJson();
        var goods_preview_imageObj = $('#goods_small_type_image');
        //默认不存在文件上传
        var isExistFile = false;
        var fileElementIdList = new Array(1);
        if(goods_preview_imageObj.val()!='' && goods_preview_imageObj.val()!=undefined && goods_preview_imageObj.val() != null){
            fileElementIdList[0]= 'goods_small_type_image';
            isExistFile = true;
        }

        var command = '${command}';
        if(command=='addRequest'){
            if(isExistFile){
                callBatchFileUploadSubmit('/goodsSmallTypeCtrl/addFilesData',fileElementIdList,null,'goodsSmallTypeListBox',param);
            }else {
                callSubmit('/goodsSmallTypeCtrl/addData', null, 'goodsSmallTypeListBox',param);
            }
        }else if(command=='updateRequest'){
            if(isExistFile){
                callBatchFileUploadSubmit('/goodsSmallTypeCtrl/updateFilesData',fileElementIdList,null,'goodsSmallTypeListBox',param);
            }else {
                callSubmit('/goodsSmallTypeCtrl/updateData', null, 'goodsSmallTypeListBox',param);
            }
        }
        return false;
    }
</script>
