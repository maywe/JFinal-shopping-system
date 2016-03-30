$(function(){
    $.fn.extend({
        myCropper:function(options){
            //1、初始化参数
            var option = $.extend({
                aspectRatio: 4 / 3.8,                               //剪裁框比例
                preview: '#cutImagePreview',                        //预览容器id
                cutImageBoxId:'#sysUserImageUploadDialogForm',      //主容器id
                cutImageDownloadId:'#cutImageDownload',             //下载容器id
                cutImageInputId:'#cutImageInput',                   //剪裁的新文件
                cutImageType:'image/png',                           //剪裁的图片类型
                crop: function (e) {}                               //输出剪裁图片的结果数据信息
            },options);

            //2、初始化必须的对象
            option.cutImage = this;
            option.cutImageBox = $(option.cutImageBoxId);
            option.cutImageDownload = $(option.cutImageDownloadId);
            option.cutImageInput = $(option.cutImageInputId);

            //3、初始化剪裁插件
            option.init=function(){
                var result = option.cutImage.cropper(option);
                option.initMethodsEvent(result);
                option.initCutNewImage();
            };

            //3.1、注册方法事件
            option.initMethodsEvent = function(result){
                option.cutImageBox.find('button[data-method]').on('click', function () {
                    var data = $(this).data();
                    var $target;
                    if (option.cutImage.data('cropper') && data.method) {
                        //克隆一份新的数据
                        data = $.extend({}, data);
                        if (typeof data.target !== 'undefined') {
                            $target = $(data.target);
                            if (typeof data.option === 'undefined') {
                                try {
                                    data.option = JSON.parse($target.val());
                                } catch (e) {
                                    console.log(e.message);
                                }
                            }
                        }

                        //执行方法
                        result = option.cutImage.cropper(data.method, data.option, data.secondOption);

                        //执行方法后额外需要做的事
                        switch (data.method) {
                            case 'getCroppedCanvas':
                                if (result) {
                                    /**
                                     * 你可以直接将canvas作为图片显示，
                                     * 或使用canvas.toDataURL方法获取图像的数据链接，
                                     * 或者使用canvas.toBlob方法获取一个blob，
                                     * 并通过FormData方法将它更新到服务器上（如果浏览器支持这些API）
                                     */
                                    option.cutImageDownload.attr('href', result.toDataURL(option.cutImageType));
                                    toastr.success("哈哈，图片剪裁成功!");
                                }
                                break;
                        }

                        if ($.isPlainObject(result) && $target) {
                            try {
                                $target.val(JSON.stringify(result));
                            } catch (e) {
                                console.log(e.message);
                            }
                        }
                    }
                });
            };

            //3.2、初始化新的裁剪图片
            option.initCutNewImage = function(){
                var URL = window.URL || window.webkitURL;
                if (URL) {
                    option.cutImageInput.change(function () {
                        var files = this.files;
                        if (!option.cutImage.data('cropper')) {return;}
                        if (files && files.length) {
                            var file = files[0];
                            if (/^image\/\w+$/.test(file.type)) {
                                var blobURL = URL.createObjectURL(file);
                                option.cutImage.one('built.cropper',function (){URL.revokeObjectURL(blobURL);}).cropper('reset').cropper('replace', blobURL);
                                option.cutImageInput.val('');
                            } else {
                                toastr.info('请选择图片文件！');
                            }
                        }
                    });
                }
            };

            //初始化
            option.init();
        }
    });
});
