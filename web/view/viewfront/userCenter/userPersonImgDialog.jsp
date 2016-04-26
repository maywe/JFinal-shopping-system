<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <i class="glyphicon glyphicon-remove font-size16"></i>
    </button>
    <span class="modal-title font-size16">修改个人头像</span>
</div>
<form id="userPersonImgForm" class="form-horizontal" role="form" onsubmit="return userFrontImageSubmit(this)" method="post">
    <div class="modal-body">
        <div class="container">
            <div class="row">
                <div class="col-md-7" style="width: 480px;height: 360px;position:relative;padding: 0 15px;">
                    <img id="cutImageShow" src="${pageContext.request.contextPath}${empty usersFront.img?'/images/avatar-160.png':usersFront.img}">
                </div>
                <div class="col-md-5" style="padding: 0 15px;">
                    <h4 class="m-t-0">1、图片预览:</h4>
                    <div id="cutImagePreview" style="width: 150px;height: 150px;overflow: hidden;"></div>

                    <h4>2、说明:<p>你可以选择新图片上传，然后下载裁剪后的图片</p></h4>
                    <div class="btn-group">
                        <label for="cutImageInput" title="上传图片" class="btn btn-success btn-sm">
                            <input id="cutImageInput" name="cutImageInput" type="file" accept="image/*" name="file" class="hide">
                            <i class="fa fa-upload"></i>上传新图片
                        </label>
                        <a id="cutImageDownload" target="_blank" class="btn btn-success btn-sm">
                            <i class="fa fa-download"></i>下载裁剪图片
                        </a>
                    </div>

                    <h4>3、其他说明:<p>你可以对图片进行以下操作</p>
                    </h4>
                    <div class="btn-group">
                        <button class="btn btn-info btn-sm" type="button" data-method="zoom" data-option="0.1">
                            <i class="fa fa-search-plus"></i>放大
                        </button>
                        <button class="btn btn-info btn-sm" type="button" data-method="zoom" data-option="-0.1">
                            <i class="fa fa-search-minus"></i>缩小
                        </button>
                        <button class="btn btn-info btn-sm" type="button" data-method="rotate" data-option="-45" title="向左旋转45°">
                            <i class="fa fa-rotate-left"></i>左旋转
                        </button>
                        <button class="btn btn-info btn-sm" type="button" data-method="rotate" data-option="45" title="向右旋转45°">
                            <i class="fa fa-rotate-right"></i>右旋转
                        </button>
                        <button type="button" class="btn btn-warning btn-sm" data-method="getCroppedCanvas">
                            <i class="fa fa-cut"></i>裁剪
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-grey" style="width: 125px;" data-dismiss="modal">
            <span>关闭</span>
        </button>
        <button type="submit" class="btn btn-orange" style="width: 125px;">
            <span>提交</span>
        </button>
    </div>
</form>
<script type="text/javascript">
    $(function(){
        //加载图片剪裁插件
        $('#cutImageShow').myCropper({
            aspectRatio: 4 / 3.8,                               //剪裁框比例
            preview: '#cutImagePreview',                        //预览容器id
            cutImageBoxId:'#userPersonImgForm',                 //主容器id
            cutImageDownloadId:'#cutImageDownload',             //下载容器id
            cutImageInputId:'#cutImageInput',                   //剪裁的新文件
            cutImageType:'image/png',                           //剪裁的图片类型
            crop: function(e){}                                 //输出剪裁图片的结果数据信息
        });
    });
    function userFrontImageSubmit(){
        var userFrontImageData = $('#cutImageDownload').attr('href');
        if(userFrontImageData){
            $('#userPersonImg').attr('src',userFrontImageData);
            userFrontImageData = userFrontImageData.replace("data:image/png;base64,","");
            $.post('${pageContext.request.contextPath}/userCenterCtrl/updatePersonImgData.action',{"userFrontImageData":userFrontImageData},function(data){
                if(data.errorCode==0){
                    toastr.success(data.errorMessage);
                    $('#pop_modal_lg').modal('hide')
                }else{
                    toastr.info(data.errorMessage);
                }
            },'json');
        }else{
            toastr.warning('图片请先剪裁再提交!');
        }
        return false;
    }
</script>
