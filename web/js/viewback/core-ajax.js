/**
 * Created by ChenMW on 2016-02-17.
 * 系统ajax相关代码
 */
//1、异步加载数据方法
function call(service, parameter, success, openProgressLoad) {
    if (arguments[3] == null) {
        openProgressLoad = true;
    }
    $.ajax({
        type : 'POST',
        url : getLocationUrl() + service + '.action',
        data : parameter,
        dataType : 'json',
        async : true,
        beforeSend : function(XMLHttpRequest) {
            if (openProgressLoad) {
                $("#"+initSeting.ids.progressBarId).show();
            }
        },
        error : function(XMLHttpRequest, textStatus, errorThrown) {
            if (openProgressLoad) {
                $("#"+initSeting.ids.progressBarId).show();
            }
            if (XMLHttpRequest.status == 500) {
                toastr.error('服务器内部错误,请跟管理员联系!');
            } else if (XMLHttpRequest.status == 200) {
                toastr.error('服务器返回的结果不是标准的JSON数据格式!');
            }
        },
        success : function(data) {
            if (openProgressLoad) {
                $("#"+initSeting.ids.progressBarId).hide();
            }
            if (data.errorCode == 99) {
                toastr.info(data.errorMessage);
                window.location.href = getLocationUrl()+"/view/viewback/login.html";
                return;
            }
            success(data);
        }
    });
}

//2、异步加载页面方法
$.fn.callLoad = function(service,parameter,success,openProgressLoad){
    if (arguments[3] == null) {
        openProgressLoad = true;
    }
    var targetUrl = getLocationUrl() + service;
    if(service.indexOf('.html')==-1 && service.indexOf('.jsp')==-1 && service.indexOf('.action')){
        targetUrl = getLocationUrl() + service + '.action';
    }
    if (openProgressLoad) {
        $("#"+initSeting.ids.progressBarId).show();
    }
    this.empty().load(targetUrl,parameter,function(response,status,xhr){
        if (openProgressLoad) {
            $("#"+initSeting.ids.progressBarId).hide();
        }
        //判断登录是否超时
        var errorVo = '{"errorMessage":"请您先登录!","errorCode":99}';
        if(response.substring(0,errorVo.length).indexOf('"errorCode":99')>-1){
            toastr.info('登录超时!');
            window.location.href = getLocationUrl()+"/view/viewback/login.html";
        }else{
            success();
        }
    });
};

/**
 3、一般业务异步加载数据固定写法
 service            后台业务方法路由
 submitAreaId       业务提交区域
 breakAreaId        业务刷新区域(这里指列表)
 parameter          用户指定参数（当用户指定参数后，会与提交区域的参数合并）
 */
function callSubmit(service,submitAreaId,breakAreaId,parameter){
    var params = {};
    if(parameter==undefined){
        if(submitAreaId==null){
            return;
        }
        params = $('#'+submitAreaId).formToJson();
    }else{
        if(submitAreaId==null){
            params = parameter;
        }else{
            //强两个json简单对象参数合并
            var formParams = $('#'+submitAreaId).formToJson();
            for(var attr in formParams){
                params[attr] = formParams[attr];
            }
            for(attr in parameter){
                params[attr] = parameter[attr];
            }
        }
    }
    call(service,params,function(data){
        if(data.errorCode==0){
            toastr.success(data.errorMessage);
            hideModal();
            paginationBreak(breakAreaId);
        }else{
            toastr.error(data.errorMessage);
        }
    });
}


