/**
 * Created by ChenMW on 2016-02-17.
 * 系统工具方法代码
 */

/** 系统相关公共变量* */
var initSeting = {
    ids:{
        progressBarId:'alert_background',       //任务进度条id
        popModalLg:'pop_modal_lg',              //弹出大模态框id
        popModal:'pop_modal',                   //弹出中模态框id
        popModalSm:'pop_modal_sm',              //弹出小模态框id
        navCloseId:'nav_close',                 //左边树导航隐藏按钮id
        navOpenId:'nav_open',                   //左边树导航显示按钮id
        systemTimeId:'system_time',             //系统时间容器id
        treeId:'myTree',                        //左边导航树id
        tabsId:'myTabs',                        //右边标签页id
        tabsBackwardId:'nav_backward',          //标签页左边滚动按钮id
        tabsForwardId:'nav_forward',            //标签页右边滚动按钮id
        containerContentId:'container_content', //内容主容器id
        containerPagesId:'my_tab_content',      //业务页面主容器id
        footerId:'footer',                      //底部容器id

        myPopModalLg:'my_pop_modal_lg',         //自定义弹出大模态框id
        myAlertBackground:'my_alert_background' //自定义模态背景
    }
}
/** 用户相关公共变量* */
var publicVar = {};

/**
 * JS操作cookies方法!
 */
//1、写入cookies（time以秒为单位）
function setCookie(name,value,time){
    var exp = new Date();
    exp.setTime(exp.getTime() + time*1000);
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}
//2、读取COOKIES
function getCookie(name) {
    console.log('cookie='+document.cookie);
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
    if (arr = document.cookie.match(reg)) {
        return unescape(arr[2]).replace(/\"/g, '');
    } else {
        return null;
    }
}
//3、删除cookies
function delCookie(name) {
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval=getCookie(name);
    if(cval!=null){
        document.cookie= name + "="+cval+";expires="+exp.toGMTString();
    }
}

//4、获得当前的url
function getLocationUrl() {
    // 获取当前访问协议
    var protocol = window.location.protocol;
    // 获取IP和端口
    var host = window.location.host;
    // 获取项目名称(前面带斜杠)
    var pathName = window.document.location.pathname;
    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
    //阿里云/IDEA环境使用
    return protocol + '//' + host;
    //MyEclipse开发环境使用
    //return protocol + '//' + host + projectName;
}

//5、获取目标URL的方法
function getTargetUrl(pageId){
    var tabs_A_List = $('#'+initSeting.ids.tabsId).find('a');
    var targetTabText = '';
    tabs_A_List.each(function(i){
        if(tabs_A_List.eq(i).attr('href')==('#'+pageId)){
            targetTabText = tabs_A_List.eq(i).text();
        }
    });
    if(targetTabText==''){
        return null;
    }

    var tree_A_List = $('#'+initSeting.ids.treeId).find('a[haschild="false"]');
    var targetUrl = '';
    tree_A_List.each(function(i){
        if(tree_A_List.eq(i).children('label').text()==targetTabText){
            targetUrl = tree_A_List.eq(i).attr('rel');
        }
    });
    if(targetUrl==''){
        return null;
    }
    return targetUrl;
}

//6、隐藏bootstarp模态框
function hideModal() {
    $('#' + initSeting.ids.popModalLg + ',#' + initSeting.ids.popModal + ',#' + initSeting.ids.popModalSm).modal('hide');
}

//7、隐藏与显示自定义的模态框
function showMyModel(parentModelId){
    $('#'+initSeting.ids.myPopModalLg).parent().parent().show();
    $('#'+initSeting.ids.myAlertBackground).show();
    if(parentModelId){
        $('#'+parentModelId).hide();
    }
}
function hideMyModel(parentModelId){
    $('#'+initSeting.ids.myPopModalLg).parent().parent().hide();
    $('#'+initSeting.ids.myPopModalLg).empty();
    $('#'+initSeting.ids.myAlertBackground).hide();
    if(parentModelId){
        $('#'+parentModelId).show();
    }
}


