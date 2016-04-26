<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width,initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" name="viewport">
    <link rel="shortcut icon" type="image/ico" href="${pageContext.request.contextPath}/images/mi-logo-36.png">
    <title>小米账号-注册</title>
    <link href="${pageContext.request.contextPath}/css/common/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/toastr.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/common.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/viewfront/mi-common.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/viewfront/mi-loginRegister.css" rel="stylesheet">
</head>
<body class="grayColor-1">
<div class="container-fluid">
    <div class="login-container whiteColor-0">
        <header class="login-header">
            <div class="login-logo">
                <a class="logo" title="小米官网" href="${pageContext.request.contextPath}/"></a>
            </div>
            <div class="login-title">
                <h2>注册小米帐号</h2>
            </div>
        </header>
        <div class="login-context">
            <form id="registerFrontUserForm" class="form-login" role="form" method="post" action="${pageContext.request.contextPath}/loginCtrl/registerFrontUser.action">
                <div class="login-input">
                    <input name="usersFront.login_name" type="email" class="form-control input-lg" placeholder="邮箱" required="required">
                </div>
                <div class="login-input">
                    <input name="usersFront.password" type="password" class="form-control input-lg" placeholder="密码"
                           required="required" pattern="^.{6,20}$" oninvalid="setCustomValidity('请填写密码6-20位!');" oninput="setCustomValidity('');">
                </div>
                <div class="register-input">
                    <input name="imageCodeVal" type="text" class="form-control input-lg" placeholder="图片验证码"
                           required="required" pattern="^[0-9a-zA-Z]{5}$" oninvalid="setCustomValidity('请填写验证码5位!');" oninput="setCustomValidity('');">
                    <img id="imageCode" onclick="changeImageCode()" class="image-code" src="${pageContext.request.contextPath}/loginCtrl/generatorCaptcha.action" alt="图片验证码" title="看不清换一张"/>
                </div>
                <div class="login-input" style="padding-top: 15px;">
                    <input type="submit" class="btn btn-orange btn-lg" value="立即注册">
                    <p class="register-msg">
                        点击“立即注册”，即表示您同意并愿意遵守小米
                        <a title="用户协议" target="_blank" href="http://www.miui.com/res/doc/eula/cn.html">用户协议</a>
                        和
                        <a title="隐私政策" target="_blank" href="http://www.miui.com/res/doc/privacy/cn.html">隐私政策</a>
                    </p>
                </div>
            </form>
        </div>
    </div>
    <footer class="login-container-footer">
        <div class="nf-link-area clearfix">
            <ul class="lang-select-list">
                <li><a href="javascript:void(0)" data-lang="zh_CN" class="lang-select-li current">简体</a><span>|</span></li>
                <li><a href="?callback=http%3A%2F%2Forder.mi.com%2Flogin%2Fcallback%3Ffollowup%3Dhttp%253A%252F%252Fwww.mi.com%252Findex.html%26sign%3DNDRhYjQwYmNlZTg2ZGJhZjI0MTJjY2ZiMTNiZWExODMwYjkwNzg2ZQ%2C%2C&amp;sid=mi_eshop&amp;_locale=zh_TW" data-lang="zh_TW" class="lang-select-li">繁体</a><span>|</span></li>
                <li><a href="?callback=http%3A%2F%2Forder.mi.com%2Flogin%2Fcallback%3Ffollowup%3Dhttp%253A%252F%252Fwww.mi.com%252Findex.html%26sign%3DNDRhYjQwYmNlZTg2ZGJhZjI0MTJjY2ZiMTNiZWExODMwYjkwNzg2ZQ%2C%2C&amp;sid=mi_eshop&amp;_locale=en" data-lang="en" class="lang-select-li">English</a><span>|</span></li>
                <li><a href="http://static.account.xiaomi.com/html/faq/faqList.html" target="_blank">常见问题</a></li>
            </ul>
        </div>
        <p class="nf-intro">
            <span>小米公司版权所有-京ICP备10046444-
                <a class="beian-record-link" target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11010802020134">
                    <span>
                        <img src="${pageContext.request.contextPath}/images/front/i/ghs.png">
                    </span>
                    京公网安备11010802020134号
                </a>
                -京ICP证110507号
            </span>
        </p>
    </footer>
</div>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/toastr.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/viewback/core.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/viewback/core-ajax.js"></script>
<script type="text/javascript">
    $(function(){
        var errorMessage = '${errorMessage}';
        if(errorMessage){
            toastr.info(errorMessage);
        }
    });

    function changeImageCode(){
        var $imageCode = $('#imageCode');
        $imageCode.attr('src','${pageContext.request.contextPath}/loginCtrl/generatorCaptcha.action'+new Date().getTime());
        $imageCode.prev('input[name="imageCodeVal"]').val("");
        $imageCode.prev('input[name="imageCodeVal"]').focus();
    }

</script>
</body>
</html>
