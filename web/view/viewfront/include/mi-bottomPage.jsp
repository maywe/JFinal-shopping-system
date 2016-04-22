<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="${pageContext.request.contextPath}/css/viewfront/mi-bottomPage.css" type="text/css" rel="stylesheet">

<div class="clearfix"></div>
<div id="bottomHideArea" class="bottom-hide-area">
    <!-- 登录框 start -->
    <div class="login-min-box-hide animated bounceIn">
        <div class="login-hide-action"><i onclick="ajaxLoginBoxHide()" class="glyphicon glyphicon-remove"></i></div>
        <header class="login-header">
            <div class="login-logo">
                <a class="logo" title="小米官网" href="${pageContext.request.contextPath}/"></a>
            </div>
            <div class="login-title">
                <h2>小米帐号登录</h2>
            </div>
        </header>
        <div class="login-context">
            <form onsubmit="return ajaxLogin(this)" class="form-login" role="form" method="post" action="${pageContext.request.contextPath}/loginCtrl/ajaxLoginInFront.action">
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
    </div>
    <!-- 登录框 end -->

    <div id="pop_modal_sm" aria-labelledby="popModalSmLabel" class="modal animated fadeInRight bs-example-modal-sm" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content"></div>
        </div>
    </div>

    <div class="content-box-shade"></div>
</div>
<div id="bottomSiteBox" class="bottom-site">
    <div class="site-footer">
        <div class="container-fluid myContainer-fluid">
            <div class="footer-service">
                <ul class="list-service clearfix">
                    <li>
                        <a target="_blank" href="http://www.mi.com/service/exchange#repaire" rel="nofollow" data-stat-id="6b165acae0a512cf" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-6b165acae0a512cf', 'http://www.mi.com/service/exchange#repaire', 'pcpid']);">
                            <span></span>1小时快修服务
                        </a>
                    </li>
                    <li>
                        <a target="_blank" href="http://www.mi.com/service/exchange#back" rel="nofollow" data-stat-id="4bcdbd7b49855b21" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-4bcdbd7b49855b21', 'http://www.mi.com/service/exchange#back', 'pcpid']);">
                            <span></span>7天无理由退货
                        </a>
                    </li>
                    <li>
                        <a target="_blank" href="http://www.mi.com/service/exchange#free" rel="nofollow" data-stat-id="e801808d1b971db5" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-e801808d1b971db5', 'http://www.mi.com/service/exchange#free', 'pcpid']);">
                            <span></span>15天免费换货
                        </a>
                    </li>
                    <li>
                        <a target="_blank" href="http://www.mi.com/service/exchange#mail" rel="nofollow" data-stat-id="55d6bb7bcb37832c" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-55d6bb7bcb37832c', 'http://www.mi.com/service/exchange#mail', 'pcpid']);">
                            <span></span>满150元包邮
                        </a>
                    </li>
                    <li>
                        <a target="_blank" href="http://www.mi.com/c/service/poststation/" rel="nofollow" data-stat-id="eb10a3b1b392bacf" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-eb10a3b1b392bacf', 'http://www.mi.com/c/service/poststation/', 'pcpid']);">
                            <span></span>520余家售后网点
                        </a>
                    </li>
                </ul>
            </div>
            <div class="footer-links">
                <dl class="col-links">
                    <dt>帮助中心</dt>
                    <dd>
                        <a target="_blank" href="http://www.mi.com/service/help_center/guide/" rel="nofollow" data-stat-id="e20a1843bdcc6d50" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-e20a1843bdcc6d50', 'http://www.mi.com/service/help_center/guide/', 'pcpid']);">购物指南</a>
                    </dd>
                    <dd>
                        <a target="_blank" href="http://www.mi.com/service/help_center/pay/" rel="nofollow" data-stat-id="cbc83e341928cad2" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-cbc83e341928cad2', 'http://www.mi.com/service/help_center/pay/', 'pcpid']);">支付方式</a>
                    </dd>
                    <dd>
                        <a target="_blank" href="http://www.mi.com/service/help_center/delivery/" rel="nofollow" data-stat-id="961c92c727284046" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-961c92c727284046', 'http://www.mi.com/service/help_center/delivery/', 'pcpid']);">配送方式</a>
                    </dd>
                </dl>
                <dl class="col-links ">
                    <dt>服务支持</dt>
                    <dd>
                        <a target="_blank" href="http://www.mi.com/service/exchange" rel="nofollow" data-stat-id="08819f19ea21f3e4" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-08819f19ea21f3e4', 'http://www.mi.com/service/exchange', 'pcpid']);">售后政策</a>
                    </dd>
                    <dd>
                        <a target="_blank" href="http://fuwu.mi.com/" rel="nofollow" data-stat-id="5f2408ab3c808aa2" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-5f2408ab3c808aa2', 'http://fuwu.mi.com/', 'pcpid']);">自助服务</a>
                    </dd>
                    <dd>
                        <a target="_blank" href="http://xiazai.mi.com/" rel="nofollow" data-stat-id="18c340c920a278a1" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-18c340c920a278a1', 'http://xiazai.mi.com/', 'pcpid']);">相关下载</a>
                    </dd>
                </dl>
                <dl class="col-links ">
                    <dt>小米之家</dt>
                    <dd>
                        <a target="_blank" href="http://www.mi.com/c/xiaomizhijia/" rel="nofollow" data-stat-id="078fe5e483ca402c" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-078fe5e483ca402c', 'http://www.mi.com/c/xiaomizhijia/', 'pcpid']);">小米之家</a>
                    </dd>
                    <dd>
                        <a target="_blank" href="http://www.mi.com/c/service/poststation/" rel="nofollow" data-stat-id="6b28dd256c6ca580" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-6b28dd256c6ca580', 'http://www.mi.com/c/service/poststation/', 'pcpid']);">服务网点</a>
                    </dd>
                    <dd>
                        <a target="_blank" href="http://service.order.mi.com/mihome/index" rel="nofollow" data-stat-id="ab58b266b5b52950" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-ab58b266b5b52950', 'http://service.order.mi.com/mihome/index', 'pcpid']);">预约亲临到店服务</a>
                    </dd>
                </dl>
                <dl class="col-links ">
                    <dt>关于小米</dt>
                    <dd>
                        <a target="_blank" href="http://www.mi.com/about" rel="nofollow" data-stat-id="e7dd29b3633d3b9d" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-e7dd29b3633d3b9d', 'http://www.mi.com/about', 'pcpid']);">了解小米</a>
                    </dd>
                    <dd>
                        <a target="_blank" href="http://hr.xiaomi.com/" rel="nofollow" data-stat-id="4307a445f5592adb" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-4307a445f5592adb', 'http://hr.xiaomi.com/', 'pcpid']);">加入小米</a>
                    </dd>
                    <dd>
                        <a target="_blank" href="http://www.mi.com/about/contact" rel="nofollow" data-stat-id="bd03a61dc2a9251e" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-bd03a61dc2a9251e', 'http://www.mi.com/about/contact', 'pcpid']);">联系我们</a>
                    </dd>
                </dl>
                <dl class="col-links ">
                    <dt>关注我们</dt>
                    <dd>
                        <a target="_blank" href="http://e.weibo.com/xiaomishouji" rel="nofollow" data-stat-id="464883aa6e799290" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-464883aa6e799290', 'http://e.weibo.com/xiaomishouji', 'pcpid']);">新浪微博</a>
                    </dd>
                    <dd>
                        <a target="_blank" href="http://xiaoqu.qq.com/mobile/share/index.html?url=http%3A%2F%2Fxiaoqu.qq.com%2Fmobile%2Fbarindex.html%3Fwebview%3D1%26type%3D%26source%3Dindex%26_lv%3D25741%26sid%3D%26_wv%3D5123%26_bid%3D128%26%23bid%3D10525%26from%3Dwechat" rel="nofollow" data-stat-id="78fdefa9dee561b5" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-78fdefa9dee561b5', 'http://xiaoqu.qq.com/mobile/share/index.html?url=http%3A%2F%2Fxiaoqu.qq.com%2Fmobile%2Fbarindex.html%3Fwebview%3D1%26type%3D%26source%3Dindex%26_lv%3D25741%26sid%3D%26_wv%3D5123%26_bid%3D128%26%23bid%3D10525%26from%3Dwechat', 'pcpid']);">小米部落</a>
                    </dd>
                    <dd>
                        <a data-toggle="modal" href="#" rel="nofollow" data-stat-id="47539f6570f0da90" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-47539f6570f0da90', '#J_modalWeixin', 'pcpid']);">官方微信</a>
                    </dd>
                </dl>
                <div class="col-contact">
                    <p class="phone">400-100-5678</p>
                    <p>
                        <span class="J_serviceTime-normal" style=" ">周一至周日 8:00-18:00</span>
                        <span class="J_serviceTime-holiday" style="display:none;">10月1日至7日服务时间 9:00-18:00</span>
                        <br>
                        （仅收市话费）
                    </p>
                    <a class="btn btn-line-primary btn-small" target="_blank" href="http://www.mi.com/service/contact" rel="nofollow" data-stat-id="e71bbbe7c3afda0f" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-e71bbbe7c3afda0f', 'http://www.mi.com/service/contact', 'pcpid']);">
                        24小时在线客服
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="site-info container-fluid myContainer-fluid">
        <div class="col-md-1 logo"></div>
        <div class="col-md-8 info-text">
            <p class="sites">
                <a data-toggle="modal" href="http://www.mi.com/index.html" data-stat-id="be947df7f4aedaf3" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-be947df7f4aedaf3', 'http://www.mi.com/index.html', 'pcpid']);">小米网</a>
                <span class="sep">|</span>
                <a data-toggle="modal" href="http://www.miui.com/" data-stat-id="ed2a0e25c8b0ca2f" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-ed2a0e25c8b0ca2f', 'http://www.miui.com/', 'pcpid']);">MIUI</a>
                <span class="sep">|</span>
                <a data-toggle="modal" href="http://www.miliao.com/" data-stat-id="826b32c1478a98d5" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-826b32c1478a98d5', 'http://www.miliao.com/', 'pcpid']);">米聊</a>
                <span class="sep">|</span>
                <a data-toggle="modal" href="http://www.duokan.com/" data-stat-id="c9d2af1ad828a834" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-c9d2af1ad828a834', 'http://www.duokan.com/', 'pcpid']);">多看书城</a>
                <span class="sep">|</span>
                <a data-toggle="modal" href="http://www.miwifi.com/" data-stat-id="96f1a8cecc909af2" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-96f1a8cecc909af2', 'http://www.miwifi.com/', 'pcpid']);">小米路由器</a>
                <span class="sep">|</span>
                <a data-toggle="modal" href="http://blog.xiaomi.com/" data-stat-id="4ad42379062eda19" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-4ad42379062eda19', 'http://blog.xiaomi.com/', 'pcpid']);">小米后院</a>
                <span class="sep">|</span>
                <a data-toggle="modal" href="http://xiaomi.tmall.com/" data-stat-id="dfe0fac59cfb15d9" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-dfe0fac59cfb15d9', 'http://xiaomi.tmall.com/', 'pcpid']);">小米天猫店</a>
                <span class="sep">|</span>
                <a data-toggle="modal" href="http://shop115048570.taobao.com" data-stat-id="c2613d0d3b77ddff" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-c2613d0d3b77ddff', 'http://shop115048570.taobao.com', 'pcpid']);">小米淘宝直营店</a>
                <span class="sep">|</span>
                <a data-toggle="modal" href="http://union.mi.com/" data-stat-id="2f48f953961c637d" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-2f48f953961c637d', 'http://union.mi.com/', 'pcpid']);">小米网盟</a>
                <span class="sep">|</span>
                <a data-toggle="modal" href="http://static.mi.com/feedback/" data-stat-id="484969b59fd8d549" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-484969b59fd8d549', 'http://static.mi.com/feedback/', 'pcpid']);">问题反馈</a>
                <span class="sep">|</span>
                <a data-toggle="modal" href="#" data-stat-id="9db137a8e0d5b3dd" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-9db137a8e0d5b3dd', '#J_modal-globalSites', 'pcpid']);">Select Region</a>
            </p>
            <p>
                ©
                <a title="mi.com" target="_blank" href="http://www.mi.com/" data-stat-id="d7577c2c6d9aff60" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-d7577c2c6d9aff60', 'http://www.mi.com/', 'pcpid']);">mi.com</a>
                京ICP证110507号 京ICP备10046444号 京公网安备1101080212535号
                <a target="_blank" href="http://c1.mifile.cn/f/i/2013/cn/jingwangwen.jpg" data-stat-id="fc34c079ca0f8423" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-fc34c079ca0f8423', 'http://c1.mifile.cn/f/i/2013/cn/jingwangwen.jpg', 'pcpid']);">京网文[2014]0059-0009号</a>
                违法和不良信息举报电话：185-0130-1238
            </p>
        </div>
        <div class="col-md-3 info-links">
            <a target="_blank" href="https://search.szfw.org/cert/l/CX20120926001783002010" data-stat-id="9e1604cd6612205c" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-9e1604cd6612205c', 'https://search.szfw.org/cert/l/CX20120926001783002010', 'pcpid']);">
                <img alt="诚信网站" src="${pageContext.request.contextPath}/images/front/i/v-logo-2.png">
            </a>
            <a target="_blank" href="https://ss.knet.cn/verifyseal.dll?sn=e12033011010015771301369&ct=df&pa=461082" data-stat-id="3e1533699f264eac" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-3e1533699f264eac', 'https://ss.knet.cn/verifyseal.dll?sn=e12033011010015771301369&ct=df&pa=461082', 'pcpid']);">
                <img alt="可信网站" src="${pageContext.request.contextPath}/images/front/i/v-logo-1.png">
            </a>
            <a target="_blank" href="http://www.315online.com.cn/member/315140007.html" data-stat-id="b085e50c7ec83104" onclick="_msq.push(['trackEvent', '79fe2eae924d2a2e-b085e50c7ec83104', 'http://www.315online.com.cn/member/315140007.html', 'pcpid']);">
                <img alt="网上交易保障中心" src="${pageContext.request.contextPath}/images/front/i/v-logo-3.png">
            </a>
        </div>
    </div>
</div>
