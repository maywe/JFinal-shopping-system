/**
 * Created by ChenMW on 2016-03-01.
 * 系统分页代码
 */
//初始化分页代码
function initPaginationData(pageId){
    var pageObj = $('#'+pageId);                                         //页面对象
    var pageFooter = pageObj.find('div.pageFooter');
    var paginationBox = pageFooter.find('div.pagination-box');
    var pageNumber = parseInt(paginationBox.attr('pageNumber'));         //当前页数
    var pageSize = parseInt(paginationBox.attr('pageSize'));             //每个标签页显示的记录条数
    var totalPage = parseInt(paginationBox.attr('totalPage'));           //总页数
    var totalRow = parseInt(paginationBox.attr('totalRow'));             //总记录数

    var htmlStr = '<ul class="pagination pagination-sm my-pagination">';
    if(pageNumber>1){
        htmlStr += '<li class="j-first"><a onclick="pagination(\''+pageId+'\','+totalPage+',1)" class="first" href="javascript:;"><i class="glyphicon glyphicon-step-backward font-size12"></i>首页</a></li>';
        htmlStr += '<li class="j-prev"><a onclick="pagination(\''+pageId+'\','+totalPage+','+(pageNumber-1)+')" class="previous" href="javascript:;"><i class="glyphicon glyphicon-backward font-size12"></i>上一页</a></li>';
    }else if(pageNumber<=1){
        htmlStr += '<li class="j-first disabled"><a class="first" href="javascript:;"><i class="glyphicon glyphicon-step-backward font-size12"></i>首页</a></li>';
        htmlStr += '<li class="j-prev disabled"><a class="previous" href="javascript:;"><i class="glyphicon glyphicon-backward font-size12"></i>上一页</a></li>';
    }
    for(var i=1;i<=totalPage;i++){
        if(i==pageNumber){
            htmlStr += '<li class="active j-num"><a onclick="pagination(\''+pageId+'\','+totalPage+','+i+')" href="javascript:;">'+i+'</a></li>';
        }else{
            htmlStr += '<li class="j-num"><a onclick="pagination(\''+pageId+'\','+totalPage+','+i+')" href="javascript:;">'+i+'</a></li>';
        }
    }
    if(pageNumber>1&&pageNumber<totalPage){
        htmlStr += '<li class="j-next"><a onclick="pagination(\''+pageId+'\','+totalPage+','+(pageNumber+1)+')" class="next" href="javascript:;">下一页<i class="glyphicon glyphicon-forward font-size12"></i></a></li>';
        htmlStr += '<li class="j-last"><a onclick="pagination(\''+pageId+'\','+totalPage+','+totalPage+')" class="last" href="javascript:;">末页<i class="glyphicon glyphicon-step-forward font-size12"></i></a></li>';
    }else if(pageNumber>=totalPage){
        htmlStr += '<li class="j-next disabled"><a class="next" href="javascript:;">下一页<i class="glyphicon glyphicon-forward font-size12"></i></a></li>';
        htmlStr += '<li class="j-last disabled"><a class="last" href="javascript:;">末页<i class="glyphicon glyphicon-step-forward font-size12"></i></a></li>';
    }
    htmlStr += '<li class="j-goto"><span class="p-input goto-input"><input name="pageNumber" type="text" value="'+pageNumber+'"/></span><a onclick="pagination(\''+pageId+'\','+totalPage+')" class="goto" href="javascript:;" title="跳转"><i class="glyphicon glyphicon-chevron-right font-size12"></i></a></li></ul>';

    paginationBox.append(htmlStr);
}

//更新本页面
function pagination(pageId,totalPage,pageNumber){
    var pageObj = $('#'+pageId);
    //检查参数合法性
    if(pageNumber==undefined){
        var pageNumberVal = pageObj.find('input[name="pageNumber"]').val();
        if(isNaN(pageNumberVal)||pageNumberVal==''){
            toastr.error('你输入的页面不是数字!');
            return;
        }else{
            pageNumber = parseInt(pageNumberVal);
        }
    }
    if(pageNumber<=0){
        toastr.error('你输入的当前页面数为负数!');
        return;
    }else {
        pageObj.find('input[name="pageNumber"]').val(pageNumber);
    }

    var targetUrl = getTargetUrl(pageId);
    if(targetUrl==null){
        toastr.error('未找到目标URL刷新页面!');
        return;
    }
    var param = pageObj.formToJson();
    console.log(param);
    pageObj.callLoad(targetUrl,param,function(){
        initPaginationData(pageId);
    });
}

//选择分页显示的记录
function paginationBreak(pageBoxId){
    var pageObj = $('#'+pageBoxId).parent('div');
    var pageId = pageObj.attr('id');
    var totalPage = parseInt(pageObj.find('div.pagination-box').attr('totalPage'));
    pagination(pageId,totalPage);
}