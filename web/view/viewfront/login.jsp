<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width,initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" name="viewport">
    <link rel="shortcut icon" type="image/ico" href="${pageContext.request.contextPath}/images/mi-logo-36.png">
    <title>小米账号-登录</title>
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
                <h2>小米帐号登录</h2>
            </div>
        </header>
        <div class="login-context">
            <form class="form-login" role="form" method="post" action="${pageContext.request.contextPath}/loginCtrl/loginInFront.action">
                <div class="login-input">
                    <input name="usersFront.login_name" type="email" class="form-control input-lg" placeholder="邮箱/手机号码/小米账号" required/>
                </div>
                <div class="login-input">
                    <input name="usersFront.password" type="password" class="form-control input-lg" placeholder="密码"
                           required="required" pattern="^.{6,20}$" oninvalid="setCustomValidity('请填写密码6-20位!');" oninput="setCustomValidity('');">
                </div>
                <div class="login-input" style="padding-top: 15px;">
                    <input type="submit" class="btn btn-orange btn-lg" value="立即登录">
                </div>
            </form>
        </div>
        <footer class="login-footer">
            <div class="other-login-type">
                <fieldset class="other-type-title">
                    <legend align="center">其他方式登录</legend>
                    <div class="other-type-context">
                        <a class="login-type-qq" title="QQ登录" href="https://account.xiaomi.com/pass/sns/login/auth?appid=100284651&&callback=http%3A%2F%2Forder.mi.com%2Flogin%2Fcallback%3Ffollowup%3Dhttp%253A%252F%252Fwww.mi.com%252Findex.html%26sign%3DNDRhYjQwYmNlZTg2ZGJhZjI0MTJjY2ZiMTNiZWExODMwYjkwNzg2ZQ%2C%2C&sid=mi_eshop" data-type="qq" target="_blank">
                            <i class="fa fa-qq"></i>
                        </a>
                        <a class="login-type-weibo" title="微博登录" href="https://account.xiaomi.com/pass/sns/login/auth?appid=2996826273&&callback=http%3A%2F%2Forder.mi.com%2Flogin%2Fcallback%3Ffollowup%3Dhttp%253A%252F%252Fwww.mi.com%252Findex.html%26sign%3DNDRhYjQwYmNlZTg2ZGJhZjI0MTJjY2ZiMTNiZWExODMwYjkwNzg2ZQ%2C%2C&sid=mi_eshop" data-type="weibo" target="_blank">
                            <i class="fa fa-weibo"></i>
                        </a>
                        <a class="login-type-weixin" title="微信登录" href="https://account.xiaomi.com/pass/sns/login/auth?appid=2088011127562160&&callback=http%3A%2F%2Forder.mi.com%2Flogin%2Fcallback%3Ffollowup%3Dhttp%253A%252F%252Fwww.mi.com%252Findex.html%26sign%3DNDRhYjQwYmNlZTg2ZGJhZjI0MTJjY2ZiMTNiZWExODMwYjkwNzg2ZQ%2C%2C&sid=mi_eshop" data-type="weixin" target="_blank">
                            <i class="fa fa-weixin"></i>
                        </a>
                    </div>
                </fieldset>
            </div>
            <div class="other-operator-type">
                <a class="outer-link" href="${pageContext.request.contextPath}/view/viewfront/register.jsp">注册小米帐号</a>
                <span>|</span>
                <a class="outer-link" href="https://account.xiaomi.com/pass/forgetPassword?callback=https%3A%2F%2Faccount.xiaomi.com%2Fsts%3Fsign%3Dd3TQADwqzTGCIRn%252BwM9%252FPiAoVcY%253D%26followup%3Dhttps%253A%252F%252Faccount.xiaomi.com%252Fpass%252Fauth%252Fprofile%252Fhome%253FuserId%253D161710699%26sid%3Dpassport&sid=passport">忘记密码？</a>
            </div>
        </footer>
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
<script type="text/javascript">
    $(function(){
        var errorMessage = '${errorMessage}';
        if(errorMessage){
            toastr.info(errorMessage);
        }
    });

</script>
</body>
</html>
