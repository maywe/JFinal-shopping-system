/**
 * Created by ChenMW on 2016-02-17.
 * 系统ajax相关代码
 */
/**
 * 1、异步加载数据方法
 * @param service           后台业务方法路由地址
 * @param parameter         传入参数
 * @param success           成功后回调函数
 * @param openProgressLoad  是否出现遮罩层，默认为true
 */
function call(service, parameter, success, openProgressLoad) {
    if (arguments[3] == null) {
        openProgressLoad = true;
    }
    $.ajax({
        type : 'POST',
        url : getLocationUrl() + service + '.action',
        data : parameter,
        dataType : 'JSON',
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

/**
 * 2、异步加载页面方法
 * @param service           后台业务方法路由地址
 * @param parameter         传入参数
 * @param success           成功后回调函数
 * @param openProgressLoad  是否出现遮罩层，默认为true
 */
$.fn.callLoad = function(service,parameter,success,openProgressLoad){
    if (arguments[3] == null) {
        openProgressLoad = true;
    }
    var targetUrl = getLocationUrl() + service;
    if(service.indexOf('.html')==-1 && service.indexOf('.jsp')==-1 && service.indexOf('.action')==-1){
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
 * 3、一般业务异步加载数据固定写法
 * @param service           后台业务方法路由地址
 * @param submitAreaId      业务提交区域
 * @param breakAreaId       业务刷新区域(这里指列表)
 * @param parameter         用户指定参数（当用户指定参数后，会与提交区域的参数合并）
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
            if(breakAreaId){
                paginationBreak(breakAreaId);
            }
        }else{
            toastr.error(data.errorMessage);
        }
    });
}

/**
 * 4、ajax多文件携带参数异步上传
 * @param service           后台业务方法路由地址
 * @param fileElementIdList   上传文件元素的id列表
 * @param parameter         传入参数
 * @param success           成功后回调函数
 * @param openProgressLoad  是否出现遮罩层，默认为true
 *
 * 错误提示:
 * 1.SyntaxError: missing ; before statement错误
 *　     如果出现这个错误就需要检查url路径是否可以访问
 * 2.SyntaxError: syntax error错误
 *　     如果出现这个错误就需要检查处理提交操作的服务器后台处理程序是否存在语法错误
 * 3.SyntaxError: invalid property id错误
 *      如果出现这个错误就需要检查文本域属性ID是否存在
 * 4.SyntaxError: missing } in XML expression错误
 *      如果出现这个错误就需要检查文件name是否一致或不存在
 * 5.其它自定义错误
 *      大家可使用变量$error直接打印的方法检查各参数是否正确，比起上面这些无效的错误提示还是方便很多。
 */
function callBatchFileUpload(service,fileElementIdList, parameter, success, openProgressLoad) {
    if (arguments[4] == null) {
        openProgressLoad = true;
    }
    if (openProgressLoad) {
        $("#"+initSeting.ids.progressBarId).show();
    }
    $.ajaxFileUpload({
        type : 'POST',
        url : getLocationUrl() + service + '.action',
        secureuri : false,                          //是否启用安全提交，默认为false
        fileElementId : fileElementIdList,          //需要上传的文件列表
        dataType : 'json',
        data : parameter,
        error : function(data, status, e) {
            console.log(data);
            console.log("error1");
            if (openProgressLoad) {
                $("#"+initSeting.ids.progressBarId).show();
            }
            if (status == 500) {
                toastr.error('服务器内部错误,请跟管理员联系!');
            } else if (status == 200) {
                toastr.error('服务器返回的结果不是标准的JSON数据格式!');
            }
        },
        success : function(data, status) {
            console.log(data);
            console.log("success1");
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


/**
 * 4、一般业务异步加载数据固定写法
 * @param service           后台业务方法路由地址
 * @param fileElementIdList 上传文件元素的id列表
 * @param submitAreaId      业务提交区域
 * @param breakAreaId       业务刷新区域(这里指列表)
 * @param parameter         用户指定参数（当用户指定参数后，会与提交区域的参数合并）
 */
function callBatchFileUploadSubmit(service,fileElementIdList,submitAreaId,breakAreaId,parameter){
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
            //将两个json简单对象参数合并
            var formParams = $('#'+submitAreaId).formToJson();
            for(var attr in formParams){
                params[attr] = formParams[attr];
            }
            for(attr in parameter){
                params[attr] = parameter[attr];
            }
        }
    }
    callBatchFileUpload(service,fileElementIdList,params,function(data){
        console.log(data);
        if(data.errorCode==0){
            toastr.success(data.errorMessage);
            hideModal();
            if(breakAreaId){
                paginationBreak(breakAreaId);
            }
        }else{
            toastr.error(data.errorMessage);
        }
    });
}
