/**
 * 小米前台公共js
 * Created by ChenMW on 2016-04-09.
 *
 */

//激活函数、选中函数（专门用于ul+li的激活）
function activeFun(obj,activeCss){
    if(!activeCss){
        activeCss = 'active';
    }
    $(obj).parent().children().removeClass(activeCss);
    $(obj).addClass(activeCss);
}

//前台分页函数
$.fn.initPaginationData = function(actionFunName){
    var pageNumber = parseInt(this.attr('pageNumber'));
    var totalPage = parseInt(this.attr('totalPage'));
    var htmlStr = '';
    if(pageNumber&&totalPage){
        if(pageNumber>1){
            htmlStr += '<a onclick="'+actionFunName+'('+(pageNumber-1)+')" href="javascript:;" class="j-num j-prev fa fa-chevron-left"></a>';
        }else if(pageNumber<=1){
            htmlStr += '<span class="j-num j-prev fa fa-chevron-left"></span>';
        }
        for(var i=1;i<=totalPage;i++){
            if(i==pageNumber){
                htmlStr += '<span class="j-num active">'+i+'</span>';
            }else{
                htmlStr += '<a onclick="'+actionFunName+'('+i+')"  class="j-num" href="javascript:;">'+i+'</a>';
            }
        }
        if(pageNumber>=1&&pageNumber<totalPage){
            htmlStr += '<a onclick="'+actionFunName+'('+(pageNumber+1)+')" href="javascript:;" class="j-num j-next fa fa-chevron-right"></a>';
        }else if(pageNumber>=totalPage){
            htmlStr += '<span class="j-num j-next fa fa-chevron-right"></span>';
        }
        this.append(htmlStr);
    }
};

//前台异步登录
function ajaxLogin(form){
    $.post($(form).attr('action'),$(form).formToJson(),function(data){
        if(data.errorCode==0){
            toastr.success(data.errorMessage);
            ajaxLoginBoxHide();
        }else if(data.errorCode==100){
            toastr.success("登录成功!");
            ajaxLoginBoxHide();
            window.location.href=data.errorMessage;
        }else{
            toastr.info(data.errorMessage);
        }
    },'json');
    return false;
}

function ajaxLoginBoxHide(){
    var $bottomHideArea = $('#bottomHideArea');
    $bottomHideArea.children('div.login-min-box-hide').hide();
    $bottomHideArea.children('div.content-box-shade').hide();
    $bottomHideArea.children('div.login-min-box-hide').find('form').children('input[name="requestUrl"]').remove();
}

function ajaxLoginBoxShow(targetUrl){
    var $bottomHideArea = $('#bottomHideArea');
    if(targetUrl){
        $bottomHideArea.children('div.login-min-box-hide').find('form').append('<input type="hidden" name="requestUrl" value="'+targetUrl+'">');
    }
    $bottomHideArea.children('div.login-min-box-hide').show();
    $bottomHideArea.children('div.content-box-shade').show();
}

//ajax技术查询购物车中的商品数量并显示在购物车按钮上
function getCartSumGoodsNumShowCartBtn(prefix){
    var targetUrl = prefix+'/userShoppingCartCtrl/getCartSumGoodsNum.action';
    $.post(targetUrl,{},function(goods_sum){
        if(parseInt(goods_sum)>0){
            $('#cartSumGoodsNumShow').text("购物车("+goods_sum+")");
        }
    },'json');
}
