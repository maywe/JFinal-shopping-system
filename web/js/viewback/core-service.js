/**
 * 封装业务相关的框架方法
 * Created by ChenMW on 2016-03-05.
 */

//1、进行查看操作时，让模态框表单元素变成不可激活状态
function disabledDialogForm(dialogFormId){
    var dialogFormObj = $('#'+dialogFormId);
    dialogFormObj.parent().find('[name]').attr('disabled',true);
    dialogFormObj.find('div.modal-body').find('button').attr('disabled',true);
    dialogFormObj.find('div.modal-footer').children().eq(1).attr('disabled',true);
}

//2、删除记录提示框
function deleteCallSubmit(obj,service,breakAreaId,parameter){
    var deleteInfo = $(obj).attr('data-deleteInfo');
    if(confirm(deleteInfo)){
        callSubmit(service,null,breakAreaId,parameter);
    }
}

/**
 * 4、获取子项列表显示在select元素中
 * @param pidVal            父编号值
 * @param pidName           父编号名称
 * @param idName            子编号明称
 * @param nameName          子名称的名称
 * @param items             列表资源
 * @param targetSelectId    目标select的id
 */
function getChildList(pidVal,pidName,idName,nameName,items,targetSelectId){
    var options = '<option value="">--请选择--</option>';
    for(var i in items){
        if(items[i][pidName]==pidVal){
            options += '<option value="' + items[i][idName] + '">'+ items[i][nameName] +'</option>';
        }
    }
    $('#'+targetSelectId).empty().append(options);
}

/* 3、数量设置插件 start*/
function minusDigital(obj){
    var digital = $(obj).next('input').val();
    if(isNaN(digital)){
        $(obj).next('input').val(1);
    }else{
        digital = Number(digital);
        $(obj).next('input').val(digital>1?digital-1:1);
    }
}
function plusDigital(obj){
    var digital = $(obj).prev('input').val();
    if(isNaN(digital)){
        $(obj).prev('input').val(1);
    }else{
        digital = Number(digital);
        $(obj).prev('input').val(digital+1);
    }
}
/* 数量设置插件 end*/
