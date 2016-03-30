<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <i class="glyphicon glyphicon-remove font-size16"></i>
    </button>
    <img alt="弹出框" src="../../../images/diatopicon.png" style="vertical-align: middle">
    <span class="modal-title font-size16">增加商品</span>
</div>
<form id="goodsDialogFrom" class="form-horizontal" role="form" onsubmit="return goodsSubmit(this)" method="post" enctype="multipart/form-data">
    <div class="modal-body">
        <input value="${goods.goods_id}" name="goods.goods_id" type="hidden">
        <div class="tab-pane active">
            <table class="table dialog-table">
                <tr>
                    <th style="width:100px;"><span class="must-msg">*&nbsp;</span>商品大类别:</th>
                    <td style="width: 210px;">
                        <select id="goodsBigTypeId" onchange="selectGoodsSmallType(this)" name="goods_big_type_id" class="form-control" required="required">
                            <option value="">--请选择--</option>
                            <c:forEach items="${goodsBigTypeList}" var="gbt">
                                <option ${goods.goods_big_type_id==gbt.goods_big_type_id?"selected":""} value="${gbt.goods_big_type_id}">${gbt.goods_bigl_type_name}</option>
                            </c:forEach>
                        </select>
                    </td>

                    <th style="width:100px;"><span class="must-msg">*&nbsp;</span>商品小类别:</th>
                    <td style="width: 210px;">
                        <select id="goodsSmallTypeId" name="goods.goods_small_type_id" class="form-control" required="required">
                            <option value="">--请选择--</option>
                            <c:forEach items="${goodsSmallTypeList}" var="gst">
                                <option ${goods.goods_small_type_id==gst.goods_small_type_id?"selected":""} value="${gst.goods_small_type_id}">${gst.goods_small_type_name}</option>
                            </c:forEach>
                        </select>
                    </td>

                    <th style="width:115px;"><span class="must-msg">*&nbsp;</span>商品名称:</th>
                    <td style="width: 210px;">
                        <input value="${goods.goods_name}" name="goods.goods_name" type="text" class="form-control" placeholder="商品名称" required="required" maxlength="128">
                    </td>
                </tr>
                <tr>
                    <th><span class="must-msg">*&nbsp;</span>库存总量:</th>
                    <td>
                        <input value="${goods.goods_stock}" name="goods.goods_stock" type="text" class="form-control" placeholder="库存总量" required="required" pattern="^\d{1,10}$">
                    </td>

                    <th><span class="must-msg">*&nbsp;</span>已售数量:</th>
                    <td>
                        <input readonly value="${empty goods.goods_sales_num?0:goods.goods_sales_num}" name="goods.goods_sales_num" type="text" class="form-control" placeholder="已售数量" required="required">
                    </td>

                    <th><span class="must-msg">*&nbsp;</span>商品原价:</th>
                    <td>
                        <input value="${goods.goods_former_price}" name="goods.goods_former_price" type="text" class="form-control" placeholder="商品原价" required="required" pattern="^\d+(\.\d+)?$">
                    </td>
                </tr>
                <tr>
                    <th><span class="must-msg">*&nbsp;</span>商品现价:</th>
                    <td>
                        <input value="${goods.goods_new_price}" name="goods.goods_new_price" type="text" class="form-control" placeholder="商品现价" required="required" pattern="^\d+(\.\d+)?$">
                    </td>

                    <th><span class="must-msg">*&nbsp;</span>商品预览图:</th>
                    <td>
                        <div class="input-group">
                            <input id="goods_preview_image" name="goods_preview_image" type="file" class="form-control" placeholder="商品预览图" accept="image/*" required>
                            <span class="input-group-addon" style="padding: 1px 5px;">
                                <img width="30" height="30" alt="商品颜色图片" src="${pageContext.request.contextPath}${empty goods.goods_preview_image?"/images/avatar-160.png":goods.goods_preview_image}">
                            </span>
                        </div>
                    </td>
                    <th class="phone-access"><span class="must-msg">*&nbsp;</span>适配所有机型:</th>
                    <td class="phone-access">
                        <select id="adapterAllPhone" onchange="selectAdapterPhone(this)" name="goods.adapter_all_phone" class="form-control" required>
                            <option ${goods.adapter_all_phone=="0"?"selected":""} value="0">否</option>
                            <option ${goods.adapter_all_phone=="1"?"selected":""} value="1">是</option>
                        </select>
                    </td>
                </tr>
            </table>
            <fieldset class="p-b-xs" id="goodsColorImageFileField">
                <legend class="m-b-xs font-size16"><span class="must-msg">*</span>商品颜色:</legend>
                <div class="tab-pane active">
                    <table class="table dialog-table">
                        <c:forEach items="${goodsColorList}" var="gc" varStatus="status">
                            <c:if test="${(status.count)%3==1}">
                                <tr>
                            </c:if>
                            <c:set var="isExistColor" value="0"> </c:set>
                            <c:forEach items="${privateGoodsColorList}" var="pgc">
                                <c:if test="${pgc.goods_addribute_val_id==gc.goods_addribute_val_id}">
                                    <c:set var="isExistColor" value="1"> </c:set>
                                    <th style="width: 80px;background: ${gc.goods_color_code};">
                                        <div class="checkbox checkbox-info checkbox-inline">
                                            <input checked onclick="selectGoodsColor(this)" name="goods_addribute_val_id" type="checkbox" value="${gc.goods_addribute_val_id}">
                                            <label>${gc.goods_addribute_val_name}</label>
                                        </div>
                                    </th>
                                    <!-- 该文件上传时，会把 goods_color_img_url(商品颜色图片)，和 goods_addribute_val_id(商品颜色id一起上传)-->
                                    <td><input disabled id="goods_color_img_url${gc.goods_addribute_val_id}" name="goods_color_img_url${gc.goods_addribute_val_id}" type="file" class="form-control" accept="image/*" placeholder="商品颜色图片"></td>
                                    <td><img width="35" height="35" alt="商品颜色图片" src="${pageContext.request.contextPath}${pgc.goods_color_img_url}"></td>
                                </c:if>
                            </c:forEach>
                            <c:if test="${isExistColor==0}">
                                <th style="width: 80px;background: ${gc.goods_color_code};">
                                    <div class="checkbox checkbox-info checkbox-inline">
                                        <input onclick="selectGoodsColor(this)" name="goods_addribute_val_id" type="checkbox" value="${gc.goods_addribute_val_id}">
                                        <label>${gc.goods_addribute_val_name}</label>
                                    </div>
                                </th>
                                <!-- 该文件上传时，会把 goods_color_img_url(商品颜色图片)，和 goods_addribute_val_id(商品颜色id一起上传)-->
                                <td><input disabled id="goods_color_img_url${gc.goods_addribute_val_id}" name="goods_color_img_url${gc.goods_addribute_val_id}" type="file" class="form-control" accept="image/*" placeholder="商品颜色图片"></td>
                                <td><img width="35" height="35" alt="商品颜色图片" src="${pageContext.request.contextPath}/images/avatar-160.png"></td>
                            </c:if>
                            <c:if test="${(status.count)%3==0||status.last}">
                                </tr>
                            </c:if>
                        </c:forEach>
                    </table>
                </div>
            </fieldset>
            <fieldset class="p-b phone-access" id="goodsadapterPhoneField" style="display: none;">
                <legend class="m-b-xs font-size16"><span class="must-msg">*</span>商品所适配的手机类别:</legend>
                <div class="tab-pane active">
                    <c:forEach items="${phoneSmallTypeList}" var="pst">
                        <c:set var="isExistPhoneType" value="0"> </c:set>
                        <c:forEach items="${privateGoodAdapterPhoneList}" var="pgp">
                            <c:if test="${pst.goods_small_type_id==pgp.goods_small_type_id}">
                                <c:set var="isExistPhoneType" value="1"> </c:set>
                                <div class="checkbox checkbox-info checkbox-inline">
                                    <input checked onclick="phoneTypeSelect()" name="phone_small_type_ids" type="checkbox" value="${pst.goods_small_type_id}">
                                    <label>${pst.goods_small_type_name}</label>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:if test="${isExistPhoneType==0}">
                            <div class="checkbox checkbox-info checkbox-inline">
                                <input onclick="phoneTypeSelect()" name="phone_small_type_ids" type="checkbox" value="${pst.goods_small_type_id}">
                                <label>${pst.goods_small_type_name}</label>
                            </div>
                        </c:if>
                    </c:forEach>
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
            disabledDialogForm('goodsDialogFrom');
        }else if(command=='updateRequest'){
            var goods_preview_imageObj = $('#goods_preview_image');
            goods_preview_imageObj.removeAttr('required');
            goods_preview_imageObj.parent().parent('td').prev('th').children('span').text('');
            $('#goodsBigTypeId,#goodsSmallTypeId').attr('disabled',true);
        }

        var goods_big_type_id = $('#goodsBigTypeId').val();
        if(goods_big_type_id=='2'){
            $('.phone-access').css('display','');
        }else{
            $('.phone-access').css('display','none');
        }
    });

    function goodsSubmit(form){
        //拿到需要上传图片的ids
        var imageFileElements = $('#goodsColorImageFileField').find('input[type="file"]:enabled');
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
        var goods_preview_imageObj = $('#goods_preview_image');
        if(goods_preview_imageObj.val()!='' && goods_preview_imageObj.val()!=undefined && goods_preview_imageObj.val() != null){
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
                callBatchFileUploadSubmit('/goodsCtrl/addData',fileElementIdList,null,'goodsListBox',param);
            }
        }else if(command=='updateRequest') {
            if (isExistFile) {
                callBatchFileUploadSubmit('/goodsCtrl/updateFilesData',fileElementIdList, null, 'goodsListBox',param);
            }else{
                callSubmit('/goodsCtrl/updateData',null,'goodsListBox',param);
            }
        }
        return false;
    }

    function selectGoodsColor(inputCheckbox){
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

    function selectGoodsSmallType(selectObj){
        var goodsSmallTypeList = eval('${goodsSmallTypeListJson}');
        var goods_big_type_id = $(selectObj).val();
        getChildList(goods_big_type_id,'goods_big_type_id','goods_small_type_id','goods_small_type_name',goodsSmallTypeList,'goodsSmallTypeId');
        //如果是手机配件
        if(goods_big_type_id=='2'){
            $('.phone-access').css('display','');
        }else{
            $('.phone-access').css('display','none');
        }
    }

    function selectAdapterPhone(selectObj){
        var adapter_all_phone = $(selectObj).val();
        if(adapter_all_phone=='1'){
            $('#goodsadapterPhoneField').find('input:checkbox').prop('checked',true);
        }
        phoneTypeSelect();
    }

    function phoneTypeSelect(){
        var isAllSelect = true;
        $('#goodsadapterPhoneField').find('input:checkbox').each(function(){
            if(!$(this).is(':checked')){
                isAllSelect = false;
            }
        });
        var options = $('#adapterAllPhone').find('option');
        if(isAllSelect){
            options.each(function(){
                if($(this).prop('value')=='1'){
                    $(this).prop('selected',true);
                }else{
                    $(this).prop('selected',false);
                }
            });
        }else{
            options.each(function(){
                if($(this).prop('value')=='0'){
                    $(this).prop('selected',true);
                }else{
                    $(this).prop('selected',false);
                }
            });
        }
    }
</script>
