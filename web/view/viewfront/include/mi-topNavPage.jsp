<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="${pageContext.request.contextPath}/css/viewfront/mi-topNavPage.css" type="text/css" rel="stylesheet">
<%@ include file="./mi-topPage.jsp" %>
<div class="container-fluid clearfix" style="padding:40px 0 0 0;">
    <div class="col-xs-12 search">
        <div class="col-xs-5 display-table">
            <div class="display-table-cell">
                <a class="search-logo" title="小米官网" href="${pageContext.request.contextPath}">
                    <img width="75" height="75" src="${pageContext.request.contextPath}/images/front/mi-logo-49.png"/>
                </a>
            </div>
        </div>

        <div class="col-xs-5 display-table">
            <div class="display-table-cell">
                <div class="input-group input-group-lg search-group">
                    <input type="text" class="form-control search-input" placeholder="搜索您需要的商品"/>
                    <span class="input-group-addon search-btn"><i class="fa fa-search"></i></span>
                </div>
            </div>
        </div>

        <div class="col-xs-2 display-table">
            <div class="display-table-cell search-cart">
                <a class="btn btn-yellow btn-lg btn-cart" href="${pageContext.request.contextPath}" >
                    <i class="fa fa-shopping-cart"></i>
                    <span>购物车</span>
                </a>
            </div>
        </div>

    </div>
    <nav class="col-xs-12 productList">
        <ul>
            <li>
                <a href="#">&nbsp;&nbsp;&nbsp;全部商品分类</a>
                <span></span>
                <ul id="goodsList" class="goodsList">
                    <li>
                        <a href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action">购买手机</a>
                        <div>
                            <a href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=23">小米5</a>&nbsp;
                            <a href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=86">小米Note</a>&nbsp;
                            <a href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=82">红米3</a>&nbsp;
                            <a href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=84">红米Note</a>
                        </div>
                        <ul>
                            <li>
                                <a href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=23">
                                    <img  src="${pageContext.request.contextPath}/images/front/nav/mi5bar80.jpg"/>
                                    &nbsp;&nbsp;小米手机5
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=81">
                                    <img  src="${pageContext.request.contextPath}/images/front/nav/mi4sbar80.jpg"/>
                                    &nbsp;&nbsp;小米手机4S
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=86">
                                    <img  src="${pageContext.request.contextPath}/images/front/nav/minote.jpg"/>
                                    &nbsp;&nbsp;小米Note
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=21">
                                    <img  src="${pageContext.request.contextPath}/images/front/nav/mi4.jpg"/>
                                    &nbsp;&nbsp;小米4
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=22">
                                    <img  src="${pageContext.request.contextPath}/images/front/nav/mi4c.jpg"/>
                                    &nbsp;&nbsp;小米4C
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=83">
                                    <img  src="${pageContext.request.contextPath}/images/front/nav/hongminote3.jpg"/>
                                    &nbsp;&nbsp;红米Note3
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=82">
                                    <img  src="${pageContext.request.contextPath}/images/front/nav/hongmi3.jpg"/>
                                    &nbsp;&nbsp;红米手机3
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
                            <li>
                                <a href="#">
                                    <img  src="${pageContext.request.contextPath}/images/front/nav/mitv3-70.png"/>
                                    &nbsp;&nbsp;小米电视3 70英寸
                                </a>
                            <li>
                                <a href="#">
                                    <img  src="${pageContext.request.contextPath}/images/front/nav/mitv3s-65.jpg"/>
                                    &nbsp;&nbsp;小米电视3s 65英寸
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <img  src="${pageContext.request.contextPath}/images/front/nav/hezizengqiangban80side.jpg"/>
                                    &nbsp;&nbsp;小米盒子3 增强版
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <img  src="${pageContext.request.contextPath}/images/front/nav/hezis.jpg"/>
                                    &nbsp;&nbsp;小米盒子3
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <img  src="${pageContext.request.contextPath}/images/front/nav/mipad2.png"/>
                                    &nbsp;&nbsp;小米平板2
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
                        <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/initGoodsPurchase.action">移动电源与电池</a>
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
            <li>
                <a href="#">小米手机</a>
                <div class="angle"></div>
                <ul class="goodsItem" >
                    <li>
                        <a href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=23">
                            <div class="goodsItem-img">
                                <img src="${pageContext.request.contextPath}/images/front/nav/mi5!160x110.jpg"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>小米手机5</span>
                                <br>
                                <span>1999元起</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=81">
                            <div class="goodsItem-img">
                                <img src="${pageContext.request.contextPath}/images/front/nav/mi4s!160x110.jpg"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>小米手机4S</span>
                                <br>
                                <span>1699元起</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=22">
                            <div class="goodsItem-img">
                                <img src="${pageContext.request.contextPath}/images/front/nav/mi4c!160x110.jpg"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>小米手机4C</span>
                                <br>
                                <span>1099元起</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=21">
                            <div class="goodsItem-img">
                                <img src="${pageContext.request.contextPath}/images/front/nav/mi4!160x110.jpg"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>小米手机4</span>
                                <br>
                                <span>1299元起</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=86">
                            <div class="goodsItem-img">
                                <img src="${pageContext.request.contextPath}/images/front/nav/minotepro!160x110.jpg"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>小米Note</span>
                                <br>
                                <span>1499元起</span>
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
                        <a href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=82">
                            <div class="goodsItem-img">
                                <img src="${pageContext.request.contextPath}/images/front/nav/hongmi3!160x110.jpg"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>红米手机3</span>
                                <br>
                                <span>699元起</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=24">
                            <div class="goodsItem-img">
                                <img src="${pageContext.request.contextPath}/images/front/nav/hongmi2!160x110.jpg"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>红米手机2</span>
                                <br>
                                <span>599元起</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/">
                            <div class="goodsItem-img">
                                <img src="${pageContext.request.contextPath}/images/front/nav/hongmi2a!160x110.jpg"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>红米手机2A</span>
                                <br>
                                <span>特价499元</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=83">
                            <div class="goodsItem-img">
                                <img src="${pageContext.request.contextPath}/images/front/nav/hongminote3!160x110.jpg"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>红米Note3</span>
                                <br>
                                <span>899元起</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=84">
                            <div class="goodsItem-img">
                                <img src="${pageContext.request.contextPath}/images/front/nav/hongminote!160x110.jpg"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>红米Note 电信版</span>
                                <br>
                                <span>699元起</span>
                            </div>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#">小米平板</a>
                <div class="angle"></div>
                <ul class="goodsItem">
                    <li>
                        <a href="${pageContext.request.contextPath}">
                            <div class="goodsItem-img">
                                <img src="${pageContext.request.contextPath}/images/front/nav/mipad2-64-win!160x110.jpg"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>小米平板2 64GB Windows版</span>
                                <br>
                                <span>1299元起</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}">
                            <div class="goodsItem-img">
                                <img src="${pageContext.request.contextPath}/images/front/nav/mipad2-64!160x110.jpg"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>小米平板2 64GB</span>
                                <br>
                                <span>1299元起</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}">
                            <div class="goodsItem-img">
                                <img src="${pageContext.request.contextPath}/images/front/nav/mipad2-16!160x110.jpg"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>小米平板2 16GB</span>
                                <br>
                                <span>999元起</span>
                            </div>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#">小米电视</a>
                <div class="angle"></div>
                <ul class="goodsItem">
                    <li>
                        <a href="${pageContext.request.contextPath}">
                            <div class="goodsItem-img">
                                <img src="${pageContext.request.contextPath}/images/front/nav/mitv3-70!160x110.jpg"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>小米电视3 70英寸</span>
                                <br>
                                <span>9999元起</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}">
                            <div class="goodsItem-img">
                                <img src="${pageContext.request.contextPath}/images/front/nav/mitv3s-65!160x110.jpg"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>小米电视3S 65英寸</span>
                                <br>
                                <span>8999元起</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}">
                            <div class="goodsItem-img">
                                <img src="${pageContext.request.contextPath}/images/front/nav/mitv3-60!160x110.jpg"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>小米电视3 60英寸</span>
                                <br>
                                <span>4999元起</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}">
                            <div class="goodsItem-img">
                                <img src="${pageContext.request.contextPath}/images/front/nav/mitv3-55!160x110.jpg"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>小米电视3 55英寸</span>
                                <br>
                                <span>3999元起</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}">
                            <div class="goodsItem-img">
                                <img src="${pageContext.request.contextPath}/images/front/nav/mitv3s-48!160x110.jpg"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>小米电视3S 48英寸</span>
                                <br>
                                <span>1999元起</span>
                            </div>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#">盒子</a>
                <div class="angle"></div>
                <ul class="goodsItem">
                    <li>
                        <a href="#">
                            <div class="goodsItem-img">
                                <img src="${pageContext.request.contextPath}/images/front/nav/hezi3s!160x110.jpg"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>小米盒子3 增强版</span>
                                <br>
                                <span>399元</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="goodsItem-img">
                                <img width="160" height="110" src="${pageContext.request.contextPath}/images/front/nav/hezi3.png"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>小米盒子3</span>
                                <br>
                                <span>299元</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="goodsItem-img">
                                <img width="160" height="110" src="${pageContext.request.contextPath}/images/front/nav/hezimini.png"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>小米盒子mini版</span>
                                <br>
                                <span>199元</span>
                            </div>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#">路由器</a>
                <div class="angle"></div>
                <ul class="goodsItem">
                    <li>
                        <a href="#">
                            <div class="goodsItem-img">
                                <img src="${pageContext.request.contextPath}/images/front/nav/miwifi!160x110.jpg"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>全新小米路由器</span>
                                <br>
                                <span>699元</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="goodsItem-img">
                                <img src="${pageContext.request.contextPath}/images/front/nav/miwifi-3!160x110.png"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>小米路由器 3</span>
                                <br>
                                <span>149元</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="goodsItem-img">
                                <img src="${pageContext.request.contextPath}/images/front/nav/miwifimini!160x110.jpg"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>小米路由器 mini</span>
                                <br>
                                <span>129元</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="goodsItem-img">
                                <img src="${pageContext.request.contextPath}/images/front/nav/miwifilite!160x110.jpg"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>小米路由器 青春版</span>
                                <br>
                                <span>79元</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="goodsItem-img">
                                <img src="${pageContext.request.contextPath}/images/front/nav/miwifiExtension!160x110.jpg"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>小米WiFi放大器</span>
                                <br>
                                <span>39元</span>
                            </div>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#">智能硬件</a>
                <div class="angle"></div>
                <ul class="goodsItem">
                    <li>
                        <a href="#">
                            <div class="goodsItem-img">
                                <img src="${pageContext.request.contextPath}/images/front/nav/scooter!160x110.jpg"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>九号平衡车</span>
                                <br>
                                <span>1999元</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="goodsItem-img">
                                <img src="${pageContext.request.contextPath}/images/front/nav/dianfanbao!160x110.jpg"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>米家压力IH电饭煲</span>
                                <br>
                                <span>999元</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="goodsItem-img">
                                <img src="${pageContext.request.contextPath}/images/front/nav/air2!160x110.jpg"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>小米空气净化器 2</span>
                                <br>
                                <span>699元</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="goodsItem-img">
                                <img src="${pageContext.request.contextPath}/images/front/nav/xiaoyi!160x110.jpg"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>摄像机</span>
                                <br>
                                <span>129元</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="goodsItem-img">
                                <img src="${pageContext.request.contextPath}/images/front/nav/scale!160x110.jpg"/>
                            </div>
                            <div class="goodsItem-desc">
                                <span>体重秤</span>
                                <br>
                                <span>99元</span>
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
