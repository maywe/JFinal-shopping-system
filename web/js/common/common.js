/**
 * 前后台公共的js
 * Created by ChenMW on 2016-04-11.
 */
//1、获取层或表单组件的值并转换成json
$.fn.formToJson = function() {
    var values = {};
    this.find('*[name]').each(function(index, element) {
        var elementName = element.name;
        if (element.name != undefined && element.name != '') {
            elementName = element.name;
            var type = element.type;
            if (element.type == 'radio' || type == 'checkbox') {
                if (element.checked) {
                    if (values[elementName] == undefined || values[elementName] == '') {
                        values[elementName] = element.value.trim();
                    } else {
                        values[elementName] = values[elementName] + ',' + element.value.trim();
                    }
                } else {
                    if (values[elementName] == undefined || values[elementName] == '') {
                        values[elementName] = '';
                    }
                }
            } else {
                if (values[elementName] == undefined) {
                    if(element.type!='file'){
                        if (typeof ($(this).attr('isDate')) != 'undefined') {
                            values[elementName] = element.value.trim();
                        } else if (typeof ($(this).attr('isNum')) != 'undefined') {
                            values[elementName] = element.value.trim();
                        } else {
                            values[elementName] = element.value.trim();
                        }
                    }
                } else {
                    values[elementName] = values[elementName] + ',' + element.value.trim();
                }
            }
        }
    });
    return values;
};

/* 2、数量设置插件 start*/
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
/* 2、数量设置插件 end*/

/**
 * 3、判断元素是否在浏览器窗口的可视范围之内
 *    如果返回true，则在可视范围之内
 */
$.fn.isOnScreen = function(){
    var win = $(window);
    var viewport = {
        top : win.scrollTop(),
        left : win.scrollLeft()
    };
    viewport.right = viewport.left + win.width();
    viewport.bottom = viewport.top + win.height();
    var bounds = this.offset();
    bounds.right = bounds.left + this.outerWidth();
    bounds.bottom = bounds.top + this.outerHeight();
    return (!(viewport.right < bounds.left || viewport.left > bounds.right || viewport.bottom < bounds.top || viewport.top > bounds.bottom));
};

//初始化模态框
function initModal(modalIds){
    var popModals = $(modalIds);
    /*在模态框显示之前进行一系列操作*/
    var recipient;
    popModals.on('show.bs.modal', function (e) {
        recipient = $(e.relatedTarget).data('whatever');
    });

    //模态框异步数据加载完成之后进行的操作
    popModals.on('loaded.bs.modal', function (e) {
        var response = $(this).find('.modal-content').text();
        //判断登录是否超时
        var errorVo = '{"errorMessage":"请您先登录!","errorCode":99}';
        if(response.substring(0,errorVo.length).indexOf('"errorCode":99')>-1){
            toastr.info('登录超时!');
            window.location.href = getLocationUrl()+"/view/viewback/login.html";
        }

        if(recipient==undefined){return;}
        $(this).find('.modal-title').text(recipient);
    });

    //模态框隐藏后清理模态框中的数据
    popModals.on('hidden.bs.modal', function (e) {
        $(this).removeData('bs.modal');
    });
}