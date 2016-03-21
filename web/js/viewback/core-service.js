/**
 * 封装业务相关的框架方法
 * Created by ChenMW on 2016-03-05.
 */

//1、隐藏模态框
function hideModal() {
    $('#' + initSeting.ids.popModalLg + ',#' + initSeting.ids.popModal + ',#' + initSeting.ids.popModalSm).modal('hide');
}

//2、进行查看操作时，让模态框表单元素变成不可激活状态
function disabledDialogForm(dialogFormId){
    var dialogFormObj = $('#'+dialogFormId);
    dialogFormObj.parent().find('[name]').attr('disabled',true);
    dialogFormObj.find('div.modal-footer').children().eq(1).attr('disabled',true);
}

//3、删除记录提示框
function deleteCallSubmit(obj,service,breakAreaId,parameter){
    var deleteInfo = $(obj).attr('data-deleteInfo');
    if(confirm(deleteInfo)){
        callSubmit(service,null,breakAreaId,parameter);
    }
}