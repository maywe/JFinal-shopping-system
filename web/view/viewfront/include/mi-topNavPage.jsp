<%--
  Created by IntelliJ IDEA.
  User: ChenMW
  Date: 2016-04-05
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="${pageContext.request.contextPath}/css/viewfront/mi-topNavPage.css" type="text/css" rel="stylesheet">
<header class="head">
    <div class="div-center-width-1290">
        <ul class="nav navbar-nav navbar-left head-left">
            <li><a class="p-l-0" href="#">小米网</a></li>
            <li><a href="#">MIUI</a></li>
            <li><a href="#">米聊</a></li>
            <li><a href="#">游戏</a></li>
            <li><a href="#">多看阅读</a></li>
            <li><a href="#">云服务</a></li>
            <li><a href="#">小米网移动版</a></li>
            <li><a href="#">问题反馈</a></li>
            <li><a href="#">Select Region</a></li>
        </ul>

        <!--
            <ul class="nav navbar-nav navbar-right head-right">
                <li><a href="${pageContext.request.contextPath}/viewfront/LoginFrontstage.jsp">登陆</a></li>
                <li><a href="${pageContext.request.contextPath}/viewfront/RegisterFrontstage.jsp">注册</a></li>
            </ul>
        -->
        <ul class="nav navbar-nav navbar-right head-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                    欢迎您&nbsp;
                    <span>月星流</span>&nbsp;
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu" role="menu">
                    <li role="presentation">
                        <a href="${pageContext.request.contextPath}/servlet/UserCenterAction?command=myPersonCenter&loadCommand=getMyCenter">
                            个人中心
                        </a>
                    </li>
                    <li role="presentation"><a href="#">我的收藏</a></li>
                    <li role="presentation">
                        <a href="${pageContext.request.contextPath}/servlet/LoginFrontstageAction?command=exit">
                            退出登陆
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/servlet/UserCenterAction?command=myPersonCenter&loadCommand=getMyOrder">
                    我的订单
                </a>
            </li>
            <li>
                <a class="p-r-0" href="${pageContext.request.contextPath}/servlet/UserCenterAction?command=myPersonCenter&loadCommand=getMyNewManage">
                    我的小米账户
                </a>
            </li>
        </ul>
    </div>
</header>

<div class="container-fluid" style="padding:40px 0 0 0;">
    <div class="col-md-12 search">
        <div class="col-md-4">
            <a href="#">
                <img src="${pageContext.request.contextPath}/images/front/mi-logo-75.png" class="xmImg"/>
            </a>
        </div>
        <div class="col-md-8 searchTop">
            <div class="spTime">
                <i class="fa fa-clock-o"></i>
                <span>&nbsp;6月1日开放购买</span>
            </div>
            <div class="shoppingCar">
                <div class="selectInput">
                    <div class="col-xs-12 p-l-0 p-r-0">
                        <div class="col-xs-9">
                            <div class="input-group input-group-lg">
                                <input type="text" class="form-control" placeholder="搜索您需要的商品"/>
                                <span class="selectBtn input-group-addon">搜索</span>
                            </div>
                        </div>
                        <div class="col-xs-3">
                            <a class="spCar" href="${pageContext.request.contextPath}/servlet/UserShoppingCartAction?command=selectShoppingCartGoods" >
                                <i class="fa fa-shopping-cart"></i>
                                <span>购物车</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <nav class="productList">
            <ul>
                <li>
                    <a href="#">&nbsp;&nbsp;&nbsp;全部商品分类</a>
                    <span></span>
                    <ul class="goodsList">
                        <li>
                            <a href="#">购买手机</a>
                            <div>
                                <a href="${pageContext.request.contextPath}/servlet/FrontMiPhoneAction?command=shoppingMiPhone&goods_id=5">小米Note</a>&nbsp;
                                <a href="${pageContext.request.contextPath}/servlet/FrontMiPhoneAction?command=shoppingMiPhone&goods_id=4">小米4</a>&nbsp;
                                <a href="${pageContext.request.contextPath}/servlet/FrontMiPhoneAction?command=shoppingMiPhone&goods_id=7">红米</a>&nbsp;
                                <a href="${pageContext.request.contextPath}/servlet/FrontMiPhoneAction?command=shoppingMiPhone&goods_id=8">红米Note</a>
                            </div>
                            <ul>
                                <li>
                                    <a href="${pageContext.request.contextPath}/servlet/FrontMiPhoneAction?command=shoppingMiPhone&goods_id=5">
                                        <img  src="${pageContext.request.contextPath}/images/front/nav/minote.jpg"/>
                                        &nbsp;&nbsp;小米Note
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/servlet/FrontMiPhoneAction?command=shoppingMiPhone&goods_id=4">
                                        <img  src="${pageContext.request.contextPath}/images/front/nav/mi4.jpg"/>
                                        &nbsp;&nbsp;小米手机4
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/servlet/FrontMiPhoneAction?command=shoppingMiPhone&goods_id=7">
                                        <img  src="${pageContext.request.contextPath}/images/front/nav/redmi2.jpg"/>
                                        &nbsp;&nbsp;红米手机2
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/servlet/FrontMiPhoneAction?command=shoppingMiPhone&goods_id=6">
                                        <img  src="${pageContext.request.contextPath}/images/front/nav/redmi1s.jpg"/>
                                        &nbsp;&nbsp;红米手机1S
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/servlet/FrontMiPhoneAction?command=shoppingMiPhone&goods_id=8">
                                        <img  src="${pageContext.request.contextPath}/images/front/nav/redminote.jpg"/>
                                        &nbsp;&nbsp;红米Note
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img  src="${pageContext.request.contextPath}/images/front/nav/typeacc.jpg"/>
                                        &nbsp;&nbsp;根据机型选配件
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">购买电视与平板</a>
                            <div>
                                <a href="#">小米电视</a>&nbsp;
                                <a href="#">小米盒子</a>&nbsp;
                                <a href="#">小米平板</a>&nbsp;
                            </div>
                            <ul>
                                <li><a href="#">
                                    <img  src="${pageContext.request.contextPath}/images/front/nav/mitv.jpg"/>
                                    &nbsp;&nbsp;小米电视2
                                </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img  src="${pageContext.request.contextPath}/images/front/nav/mibox.jpg"/>
                                        &nbsp;&nbsp;小米盒子
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img  src="${pageContext.request.contextPath}/images/front/nav/mipad.jpg"/>
                                        &nbsp;&nbsp;小米平板
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">路由器与智能硬件</a>
                            <div>
                                <a href="#">小米路由器</a>&nbsp;
                                <a href="#">小米手环</a>&nbsp;
                                <a href="#">净化器</a>&nbsp;
                            </div>
                            <ul>
                                <li>
                                    <a href="#">
                                        <img  src="${pageContext.request.contextPath}/images/front/nav/T1KQWvB7hT1RXrhCrK!40x40.jpg"/>
                                        &nbsp;&nbsp;小米路由器
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img  src="${pageContext.request.contextPath}/images/front/nav/T1PRJgBmKT1RXrhCrK!40x40.jpg"/>
                                        &nbsp;&nbsp;小米路由器mini
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img  src="${pageContext.request.contextPath}/images/front/nav/T1YN_vBKxT1RXrhCrK!40x40.jpg"/>
                                        &nbsp;&nbsp;小米手环
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img  src="${pageContext.request.contextPath}/images/front/nav/T1d___B4AT1RXrhCrK!40x40.jpg"/>
                                        &nbsp;&nbsp;净化器
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img  src="${pageContext.request.contextPath}/images/front/nav/T1aw_vBTVT1RXrhCrK!40x40.jpg"/>
                                        &nbsp;&nbsp;血压计
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img  src="${pageContext.request.contextPath}/images/front/nav/T1XHD_BCxT1RXrhCrK!40x40.jpg"/>
                                        &nbsp;&nbsp;智能插座
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img  src="${pageContext.request.contextPath}/images/front/nav/T1Q_KTByEv1RXrhCrK!40x40.jpg"/>
                                        &nbsp;&nbsp;智能灯泡
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img  src="${pageContext.request.contextPath}/images/front/nav/T1LMZvBCAT1RXrhCrK!40x40.jpg"/>
                                        &nbsp;&nbsp;随身wifi
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">移动电源与电池</a>
                            <div>
                                <a href="#">移动电源</a>&nbsp;
                                <a href="#">电池</a>&nbsp;
                                <a href="#">充电器</a>&nbsp;
                            </div>
                            <ul>
                                <li>
                                    <a href="#"><img  src="${pageContext.request.contextPath}/images/front/nav/T17DxvB4_T1RXrhCrK!40x40.jpg"/>
                                        &nbsp;&nbsp;小米移动电源
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img  src="${pageContext.request.contextPath}/images/front/nav/T1OwLvB5AT1RXrhCrK!40x40.jpg"/>
                                        &nbsp;&nbsp;品牌移动电源
                                    </a>
                                </li>
                                <li>
                                    <a href="#"><img  src="${pageContext.request.contextPath}/images/front/nav/T1QJKvBvJT1RXrhCrK!40x40.jpg"/>
                                        &nbsp;&nbsp;电池
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <img  src="${pageContext.request.contextPath}/images/front/nav/T1DUEvBKxT1RXrhCrK!40x40.jpg"/>
                                        &nbsp;&nbsp;充电器
                                    </a>
                                </li>
                                <li>
                                    <a href="#"><img  src="${pageContext.request.contextPath}/images/front/nav/T1dAAvBKLT1RXrhCrK!40x40.jpg"/>
                                        &nbsp;&nbsp;线材
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">耳机音箱与存储卡</a>
                            <div>
                                <a href="#">头戴式耳机</a>&nbsp;
                                <a href="#">活塞耳机</a>&nbsp;
                            </div>
                            <ul>
                                <li><a href="#"><img  src="${pageContext.request.contextPath}/images/front/nav/T1CfKTBQZT1RXrhCrK!40x40.jpg"/>&nbsp;&nbsp;小米头戴式耳机</a></li>
                                <li><a href="#"><img  src="${pageContext.request.contextPath}/images/front/nav/T1TQLvBmbT1RXrhCrK!40x40.jpg"/>&nbsp;&nbsp;小米活塞耳机</a></li>
                                <li><a href="#"><img  src="${pageContext.request.contextPath}/images/front/nav/T15uCTBQWT1RXrhCrK!40x40.jpg"/>&nbsp;&nbsp;更多耳机</a></li>
                                <li><a href="#"><img  src="${pageContext.request.contextPath}/images/front/nav/T1ZjATBQWT1RXrhCrK!40x40.jpg"/>&nbsp;&nbsp;音箱</a></li>
                                <li><a href="#"><img  src="${pageContext.request.contextPath}/images/front/nav/T12ObvB4bT1RXrhCrK!40x40.jpg"/>&nbsp;&nbsp;存储卡</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">保护套与贴膜</a>
                            <div>
                                <a href="#">保护套/保护壳</a>&nbsp;
                                <a href="#">贴膜</a>&nbsp;
                                <a href="#">防尘塞</a>&nbsp;
                            </div>
                            <ul>
                                <li><a href="#"><img  src="${pageContext.request.contextPath}/images/front/nav/T1C0h_B4AT1RXrhCrK!40x40.jpg"/>&nbsp;&nbsp;保护套/保护壳</a></li>
                                <li><a href="#"><img  src="${pageContext.request.contextPath}/images/front/nav/T1uGJvBCdT1RXrhCrK!40x40.jpg"/>&nbsp;&nbsp;贴膜</a></li>
                                <li><a href="#"><img  src="${pageContext.request.contextPath}/images/front/nav/T1tGAvB7xT1RXrhCrK!40x40.jpg"/>&nbsp;&nbsp;防尘塞</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">后盖与个性化配件</a>
                            <div>
                                <a href="#">米健</a>&nbsp;
                                <a href="#">后盖</a>&nbsp;
                                <a href="#">贴纸</a>&nbsp;
                                <a href="#">手机支架</a>&nbsp;
                            </div>
                            <ul>
                                <li><a href="#"><img  src="${pageContext.request.contextPath}/images/front/nav/T1IBJTBmJT1RXrhCrK!40x40.jpg"/>&nbsp;&nbsp;米键</a></li>
                                <li><a href="#"><img  src="${pageContext.request.contextPath}/images/front/nav/T1anYvB5xT1RXrhCrK!40x40.jpg"/>&nbsp;&nbsp;后盖</a></li>
                                <li><a href="#"><img  src="${pageContext.request.contextPath}/images/front/nav/T14JKvB7JT1RXrhCrK!40x40.jpg"/>&nbsp;&nbsp;贴纸</a></li>
                                <li><a href="#"><img  src="${pageContext.request.contextPath}/images/front/nav/T1voWvBKET1RXrhCrK!40x40.jpg"/>&nbsp;&nbsp;挂饰</a></li>
                                <li><a href="#"><img  src="${pageContext.request.contextPath}/images/front/nav/T1Vk_vBKdT1RXrhCrK!40x40.jpg"/>&nbsp;&nbsp;手机支架</a></li>
                                <li><a href="#"><img  src="${pageContext.request.contextPath}/images/front/nav/T1FvDvB7ET1RXrhCrK!40x40.jpg"/>&nbsp;&nbsp;耳机绕线器</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">小米生活方式</a>
                            <div>
                                <a href="#">服装</a>&nbsp;
                                <a href="#">米兔</a>&nbsp;
                                <a href="#">背包</a>&nbsp;
                                <a href="#">生活周边</a>&nbsp;
                            </div>
                            <ul>
                                <li><a href="#"><img  src="${pageContext.request.contextPath}/images/front/nav/T1CaYgBsLT1RXrhCrK!40x40.jpg"/>&nbsp;&nbsp;服装</a></li>
                                <li><a href="#"><img  src="${pageContext.request.contextPath}/images/front/nav/T1edZvB7_T1RXrhCrK!40x40.jpg"/>&nbsp;&nbsp;米兔</a></li>
                                <li><a href="#"><img  src="${pageContext.request.contextPath}/images/front/nav/T1hlEvB5AT1RXrhCrK!40x40.jpg"/>&nbsp;&nbsp;背包</a></li>
                                <li><a href="#"><img  src="${pageContext.request.contextPath}/images/front/nav/T1YUZ_BCdT1RXrhCrK!40x40.jpg"/>&nbsp;&nbsp;小米鼠标垫</a></li>
                                <li><a href="#"><img  src="${pageContext.request.contextPath}/images/front/nav/T1USVvB7KT1RXrhCrK!40x40.jpg"/>&nbsp;&nbsp;生活周边</a></li>
                                <li><a href="#"><img  src="${pageContext.request.contextPath}/images/front/nav/T1XhhvByKv1RXrhCrK!40x40.jpg"/>&nbsp;&nbsp;拉卡拉刷卡器</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li><a href="#">首页</a></li>
                <li>
                    <a href="#">小米手机</a>
                    <div class="angle"></div>
                    <ul class="goodsItem" >
                        <li>
                            <a href="${pageContext.request.contextPath}/servlet/FrontMiPhoneAction?command=shoppingMiPhone&goods_id=5">
                                <div class="goodsItem-img">
                                    <img src="${pageContext.request.contextPath}/images/front/nav/nav-phone-minote.jpg"/>
                                </div>
                                <div class="goodsItem-desc">
                                    <span>小米Note</span><br>
                                    <span>大屏旗舰,HiFi双卡双待</span><br>
                                    <span>2200元起</span>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/servlet/FrontMiPhoneAction?command=shoppingMiPhone&goods_id=4">
                                <div class="goodsItem-img">
                                    <img src="${pageContext.request.contextPath}/images/front/nav/nav-phone-mi4.jpg"/>
                                </div>
                                <div class="goodsItem-desc">
                                    <span>小米手机4</span><br>
                                    <span>工艺和手感,超乎想象</span><br>
                                    <span>1999元</span>
                                </div>
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">红米</a>
                    <div class="angle"></div>
                    <ul class="goodsItem">
                        <li>
                            <a href="${pageContext.request.contextPath}/servlet/FrontMiPhoneAction?command=shoppingMiPhone&goods_id=7">
                                <div class="goodsItem-img">
                                    <img src="${pageContext.request.contextPath}/images/front/nav/nav-phone-hongmi2.jpg"/>
                                </div>
                                <div class="goodsItem-desc">
                                    <span>红米手机2 4G版</span><br>
                                    <span>64位性能/双4G/双卡双待</span><br>
                                    <span>699元</span>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/servlet/FrontMiPhoneAction?command=shoppingMiPhone&goods_id=8">
                                <div class="goodsItem-img">
                                    <img src="${pageContext.request.contextPath}/images/front/nav/nav-phone-note.jpg"/>
                                </div>
                                <div class="goodsItem-desc">
                                    <span>红米Note 4G版</span><br>
                                    <span>工艺和手感,超乎想象</span><br>
                                    <span>1999元</span>
                                </div>
                            </a>
                        </li>
                    </ul>
                </li>
                <li><a href="#">小米平板</a></li>
                <li><a href="#">小米电视</a></li>
                <li>
                    <a href="#">盒子</a>
                    <div class="angle"></div>
                    <ul class="goodsItem">
                        <li>
                            <a href="#">
                                <div class="goodsItem-img">
                                    <img src="${pageContext.request.contextPath}/images/front/nav/nav-phone-hezimini.jpg"/>
                                </div>
                                <div class="goodsItem-desc">
                                    <span>小米盒子</span><br>
                                    <span>全球最小全高清网络机顶盒</span><br>
                                    <span>199元</span>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/servlet/FrontMiPhoneAction?command=shoppingMiPhone&goods_id=8">
                                <div class="goodsItem-img">
                                    <img src="${pageContext.request.contextPath}/images/front/nav/nav-hezis.jpg"/>
                                </div>
                                <div class="goodsItem-desc">
                                    <span>小米盒子 增强版</span><br>
                                    <span>首款4K超高清机顶盒</span><br>
                                    <span>299元</span>
                                </div>
                            </a>
                        </li>
                    </ul>
                </li>
                <li><a href="#">路由器</a>
                    <div class="angle"></div>
                    <ul class="goodsItem">
                        <li>
                            <a href="#">
                                <div class="goodsItem-img">
                                    <img src="${pageContext.request.contextPath}/images/front/nav/T17FYvBXWT1RXrhCrK!160x160.jpg"/>
                                </div>
                                <div class="goodsItem-desc">
                                    <span>小米路由器</span><br>
                                    <span>顶配双屏AC智能路由器内置1TB大硬盘</span><br>
                                    <span>199元</span>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/servlet/FrontMiPhoneAction?command=shoppingMiPhone&goods_id=8">
                                <div class="goodsItem-img">
                                    <img src="${pageContext.request.contextPath}/images/front/nav/T1XsATBCLT1RXrhCrK!160x160.jpg"/>
                                </div>
                                <div class="goodsItem-desc">
                                    <span>小米路由器 mini</span><br>
                                    <span>主流双屏AC智能路由器性价比之王</span><br>
                                    <span>129元</span>
                                </div>
                            </a>
                        </li>
                    </ul>
                </li>
                <li><a href="#">合约机</a></li>
                <li><a href="#">服务</a></li>
                <li><a href="#">社区</a></li>
            </ul>
        </nav>
    </div>
</div>