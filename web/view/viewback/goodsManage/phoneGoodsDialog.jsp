<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <i class="glyphicon glyphicon-remove font-size16"></i>
    </button>
    <img alt="弹出框" src="../../../images/back/diatopicon.png" style="vertical-align: middle">
    <span class="modal-title font-size16">增加手机商品</span>
</div>
<form id="phoneGoodsDialogFrom" class="form-horizontal" role="form" onsubmit="return phoneGoodsSubmit(this)" method="post" enctype="multipart/form-data">
    <div class="modal-body">
        <input value="${phoneGoodsView.model_id}" name="phoneModel.model_id" type="hidden">
        <input value="${phoneGoodsView.phone_goods_id}" name="phoneVersion.phone_goods_id" type="hidden">
        <div class="tab-pane active">
            <table class="table dialog-table">
                <tr>
                    <th style="width: 80px;"><span class="must-msg">*&nbsp;</span>手机类别:</th>
                    <td style="width: 210px;">
                        <select name="phoneModel.goods_small_type_id" class="form-control" required="required">
                            <option value="">--请选择--</option>
                            <c:forEach items="${goodsSmallTypeList}" var="gst">
                                <option ${phoneGoodsView.goods_small_type_id==gst.goods_small_type_id?"selected":""} value="${gst.goods_small_type_id}">${gst.goods_small_type_name}</option>
                            </c:forEach>
                        </select>
                    </td>

                    <th style="width: 100px;"><span class="must-msg">*&nbsp;</span>手机型号:</th>
                    <td style="width: 210px;">
                        <select name="phoneModel.goods_addribute_val_id" class="form-control" required>
                            <option value="">--请选择--</option>
                            <c:forEach items="${phoneModelList}" var="pm">
                                <option ${phoneGoodsView.phone_model_id==pm.goods_addribute_val_id?"selected":""} value="${pm.goods_addribute_val_id}">${pm.goods_addribute_val_name}</option>
                            </c:forEach>
                        </select>
                    </td>

                    <th style="width: 80px;"><span class="must-msg">*&nbsp;</span>手机版本:</th>
                    <td style="width: 210px;">
                        <select name="phoneVersion.goods_addribute_val_id" class="form-control" required>
                            <option value="">--请选择--</option>
                            <c:forEach items="${phoneVersionList}" var="pv">
                                <option ${phoneGoodsView.phone_version_id==pv.goods_addribute_val_id?"selected":""} value="${pv.goods_addribute_val_id}">${pv.goods_addribute_val_name}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th><span class="must-msg">*&nbsp;</span>库存总量:</th>
                    <td>
                        <input value="${phoneGoodsView.phone_stock}" name="phoneVersion.phone_stock" type="text" class="form-control" placeholder="库存总量" required="required" pattern="^\d{1,10}$">
                    </td>

                    <th><span class="must-msg">*&nbsp;</span>已售数量:</th>
                    <td>
                        <input readonly value="${empty phoneGoodsView.phone_sales_num?0:phoneGoodsView.phone_sales_num}" name="phoneVersion.phone_sales_num" type="text" class="form-control" placeholder="已售数量" required="required">
                    </td>
                    <th><span class="must-msg">*&nbsp;</span>手机原价:</th>
                    <td>
                        <input value="${phoneGoodsView.phone_former_price}" name="phoneVersion.phone_former_price" type="text" class="form-control" placeholder="手机原价" required="required" pattern="^\d+(\.\d+)?$">
                    </td>
                </tr>
                <tr>
                    <th><span class="must-msg">*&nbsp;</span>手机现价:</th>
                    <td>
                        <input value="${phoneGoodsView.phone_now_price}" name="phoneVersion.phone_now_price" type="text" class="form-control" placeholder="手机现价" required="required" pattern="^\d+(\.\d+)?$">
                    </td>

                    <th><span class="must-msg">*&nbsp;</span>手机预览图:</th>
                    <td>
                        <div class="input-group">
                            <input id="goods_preview_image" name="phone_preview_image" type="file" class="form-control" placeholder="手机预览图" accept="image/*" required>
                            <span class="input-group-addon" style="padding: 1px 5px;">
                                <img width="30" height="30" alt="手机颜色图片" src="${pageContext.request.contextPath}${empty phoneGoodsView.phone_preview_image?"/images/avatar-160.png":phoneGoodsView.phone_preview_image}?width=30&height=30">
                            </span>
                        </div>
                    </td>
                </tr>
            </table>
            <fieldset class="p-b" id="phoneColorImageFileField">
                <legend class="m-b-xs"><span class="must-msg">*</span>手机颜色:</legend>
                <div class="tab-pane active">
                    <table class="table dialog-table">
                        <c:forEach items="${phoneColorList}" var="pc" varStatus="status">
                            <c:if test="${(status.count)%3==1}">
                                <tr>
                            </c:if>
                            <c:set var="isExistColor" value="0"> </c:set>
                            <c:forEach items="${privatePhoneColorList}" var="ppc">
                                <c:if test="${ppc.goods_addribute_val_id==pc.goods_addribute_val_id}">
                                    <c:set var="isExistColor" value="1"> </c:set>
                                    <th style="width: 80px;color: ${pc.goods_addribute_val_name=='白色'?'':pc.goods_color_code};">
                                        <div class="checkbox checkbox-orange checkbox-inline">
                                            <input checked onclick="selectPhoneColor(this)" name="goods_addribute_val_id" type="checkbox" value="${pc.goods_addribute_val_id}">
                                            <label>${pc.goods_addribute_val_name}</label>
                                        </div>
                                    </th>
                                    <!-- 该文件上传时，会把 goods_color_img_url(手机颜色图片)，和 goods_addribute_val_id(手机颜色id一起上传)-->
                                    <td><input disabled id="goods_color_img_url${pc.goods_addribute_val_id}" name="goods_color_img_url${pc.goods_addribute_val_id}" type="file" class="form-control" accept="image/*" placeholder="商品颜色图片"></td>
                                    <td><img width="35" height="35" alt="手机颜色图片" src="${pageContext.request.contextPath}${ppc.goods_color_img_url}?width=35&height=35"></td>
                                </c:if>
                            </c:forEach>
                            <c:if test="${isExistColor==0}">
                                <th style="width: 80px;color: ${pc.goods_addribute_val_name=='白色'?'':pc.goods_color_code};">
                                    <div class="checkbox checkbox-orange checkbox-inline">
                                        <input onclick="selectPhoneColor(this)" name="goods_addribute_val_id" type="checkbox" value="${pc.goods_addribute_val_id}">
                                        <label>${pc.goods_addribute_val_name}</label>
                                    </div>
                                </th>
                                <!-- 该文件上传时，会把 goods_color_img_url(手机颜色图片)，和 goods_addribute_val_id(手机颜色id一起上传)-->
                                <td><input disabled id="goods_color_img_url${pc.goods_addribute_val_id}" name="goods_color_img_url${pc.goods_addribute_val_id}" type="file" class="form-control" accept="image/*" placeholder="商品颜色图片"></td>
                                <td><img width="35" height="35" alt="手机颜色图片" src="${pageContext.request.contextPath}/images/avatar-160.png?width=35&height=35"></td>
                            </c:if>
                            <c:if test="${(status.count)%3==0||status.last}">
                                </tr>
                            </c:if>
                        </c:forEach>
                    </table>
                </div>
            </fieldset>
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
            disabledDialogForm('phoneGoodsDialogFrom');
        }else if(command=='updateRequest'){
            var goods_preview_imageObj = $('#goods_preview_image');
            goods_preview_imageObj.removeAttr('required');
            goods_preview_imageObj.parent().parent('td').prev('th').children('span').text('');
        }
    });

    function phoneGoodsSubmit(form){
        //拿到需要上传图片的ids
        var imageFileElements = $('#phoneColorImageFileField').find('input[type="file"]:enabled');
        var fileIds = '';
        imageFileElements.each(function(i){
            if(i==imageFileElements.length-1){
                fileIds = fileIds + $(this).attr('id');
            }else{
                fileIds = fileIds + $(this).attr('id')+',';
            }
        });

        //拿到参数
        var param = $(form).formToJson();
        console.log(param);
        var goods_preview_imageObj = $('#goods_preview_image');
        if(goods_preview_imageObj.val()!="" && goods_preview_imageObj.val()!=undefined && goods_preview_imageObj.val() != null){
            fileIds = 'goods_preview_image,'+fileIds;
        }
        //默认存在文件上传
        var isExistFile = true;
        var fileElementIdList;
        if(fileIds==''){
            isExistFile = false;
        }else{
            fileElementIdList = fileIds.split(',');
            param.fileIds = fileIds;
        }

        var command = '${command}';
        if(command=='addRequest'){
            if(isExistFile){
                callBatchFileUploadSubmit('/phoneGoodsCtrl/addData',fileElementIdList,null,'phoneGoodsListBox',param);
            }
        }else if(command=='updateRequest') {
            if (isExistFile) {
                callBatchFileUploadSubmit('/phoneGoodsCtrl/updateFilesData',fileElementIdList, null, 'phoneGoodsListBox',param);
            }else{
                callSubmit('/phoneGoodsCtrl/updateData',null,'phoneGoodsListBox',param);
            }
        }
        return false;
    }

    function selectPhoneColor(inputCheckbox){
        var inputFileObj = $(inputCheckbox).parent().parent().next('td').children('input');
        if($(inputCheckbox).is(':checked')){
            inputFileObj.attr('disabled',false);
            inputFileObj.attr('required','required');
        }else{
            inputFileObj.attr('disabled',true);
            inputFileObj.removeAttr('required');
            inputFileObj.val('');
        }
    }
</script>
