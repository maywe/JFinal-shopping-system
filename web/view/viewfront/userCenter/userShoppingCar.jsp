<%--
  Created by IntelliJ IDEA.
  User: ChenMW
  Date: 2016-04-11
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width,initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0,user-scalable=no"
          name="viewport">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <link rel="shortcut icon" type="image/ico" href="${pageContext.request.contextPath}/images/mi-logo-36.png">
    <title>小米官网-我的购物车</title>
    <link href="${pageContext.request.contextPath}/css/common/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/font-awesome.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/awesome-bootstrap-checkbox.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/common.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/viewfront/mi-common.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/viewfront/mi-userShoppingCar.css" type="text/css" rel="stylesheet">
</head>
<body class="myBody">
<div class="div-center-width-1290">
    <%@ include file="./../include/mi-topPage.jsp" %>
    <div class="myContainer-context">
        <div class="myContainer-context-top-title">
            <div class="cart-goods-title">
                <a class="logo" title="小米官网" href="//www.mi.com/index.html"></a>
                <h3 class="logo-title">我的购物车</h3>
                <p class="logo-desc">温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算。</p>
            </div>
        </div>
      <%--
        <div id="J_cartEmpty" class="row cart-empty">
            <div class="col-xs-5 display-table">
                <div class="display-table-cell cart-empty-img">
                    <img width="359" height="273" src="${pageContext.request.contextPath}/images/front/mi-cart-empty.png">
                </div>
            </div>
            <div class="col-xs-7 display-table">
                <div class="display-table-cell cart-empty-desc">
                    <h1>您的购物车还是空的！</h1>
                    <a class="btn btn-orange btn-lg" href="#">马上去购物</a>
                </div>
            </div>
        </div>
        --%>

        <div class="cart-goods-list">
            <div class="list-head">
                <div class="item-row">
                    <div class="row item-box">
                    <div class="col-xs-1 col-check display-table">
                        <div class="display-table-cell">
                            <div class="checkbox checkbox-orange checkbox-inline">
                                <input id="J_selectAllCheckbox" onclick="goodsSelectAll(this)" type="checkbox" value="全选">
                                <label>全选</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-2 col-img display-table">
                        <div class="display-table-cell">商品预览</div>
                    </div>
                    <div class="col-xs-3 col-name display-table">
                        <div class="display-table-cell">商品名称</div>
                    </div>
                    <div class="col-xs-1 col-price display-table">
                        <div class="display-table-cell">商品单价</div>
                    </div>
                    <div class="col-xs-2 col-num display-table">
                        <div class="display-table-cell">商品数量</div>
                    </div>
                    <div class="col-xs-2 col-total display-table">
                        <div class="display-table-cell">金额小计</div>
                    </div>
                    <div class="col-xs-1 col-action display-table">
                        <div class="display-table-cell">操作</div>
                    </div>
                </div>
                </div>
            </div>
            <div id="J_listBody" class="list-body">
                <div class="item-row">
                    <div class="row item-box">
                        <div class="col-xs-1 col-check display-table">
                            <div class="display-table-cell">
                                <div class="checkbox checkbox-orange checkbox-inline">
                                    <input onclick="goodsSelectItem()" type="checkbox" value="">
                                    <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-2 col-img display-table">
                            <div class="display-table-cell">
                                <a href="#" target="_blank">
                                    <img alt="" src="//i1.mifile.cn/a1/T1WxYvB_xv1RXrhCrK!80x80.jpg" width="80" height="80">
                                </a>
                            </div>
                        </div>
                        <div class="col-xs-3 col-name display-table">
                            <div class="display-table-cell">
                                <a href="//item.mi.com/1161200004.html" target="_blank"> 小米活塞耳机 基础版 黑色 </a>
                            </div>
                        </div>
                        <div class="col-xs-1 col-price display-table">
                            <div class="display-table-cell">
                                <span class="goods-price">29</span>元
                            </div>
                        </div>
                        <div class="col-xs-2 col-num display-table">
                            <div class="display-table-cell">
                                <div class="input-group input-group-sm digital-setting">
                                    <span onclick="minusGoodsDigital(this)" class="input-group-addon">－</span>
                                    <input value="1" type="text" class="form-control" required readonly>
                                    <span onclick="plusGoodsDigital(this)" class="input-group-addon">＋</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-2 col-total display-table">
                            <div class="display-table-cell">
                                <span class="goods-total">29</span>元
                            </div>
                        </div>
                        <div class="col-xs-1 col-action display-table">
                            <div class="display-table-cell">
                                <a>
                                    <i class="glyphicon glyphicon-remove"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item-row">
                    <div class="row item-box">
                        <div class="col-xs-1 col-check display-table">
                            <div class="display-table-cell">
                                <div class="checkbox checkbox-orange checkbox-inline">
                                    <input onclick="goodsSelectItem()" type="checkbox" value="">
                                    <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-2 col-img display-table">
                            <div class="display-table-cell">
                                <a target="_blank" href="//item.mi.com/1151400062.html">
                                    <img width="80" height="80" src="//i1.mifile.cn/a1/T16pC_BvbT1RXrhCrK!80x80.jpg" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="col-xs-3 col-name display-table">
                            <div class="display-table-cell">
                                <a target="_blank" href="//item.mi.com/1151400062.html"> 小米手机4 联通4G版 2GB内存 黑色 16GB </a>
                            </div>
                        </div>
                        <div class="col-xs-1 col-price display-table">
                            <div class="display-table-cell">
                                <span class="goods-price">1299</span>元
                            </div>
                        </div>
                        <div class="col-xs-2 col-num display-table">
                            <div class="display-table-cell">
                                <div class="input-group input-group-sm digital-setting">
                                    <span onclick="minusGoodsDigital(this)" class="input-group-addon">－</span>
                                    <input value="2" type="text" class="form-control" required readonly>
                                    <span onclick="plusGoodsDigital(this)" class="input-group-addon">＋</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-2 col-total display-table">
                            <div class="display-table-cell">
                                <span class="goods-total">2598</span>元
                            </div>
                        </div>
                        <div class="col-xs-1 col-action display-table">
                            <div class="display-table-cell">
                                <a>
                                    <i class="glyphicon glyphicon-remove"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="item-row">
                    <div class="row item-box">
                        <div class="col-xs-1 col-check display-table">
                            <div class="display-table-cell">
                                <div class="checkbox checkbox-orange checkbox-inline">
                                    <input onclick="goodsSelectItem()" type="checkbox" value="">
                                    <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-2 col-img display-table">
                            <div class="display-table-cell">
                                <a href="//item.mi.com/1161400010.html" target="_blank">
                                    <img alt="" src="//i1.mifile.cn/a1/T1H5AgBv_v1RXrhCrK!80x80.jpg" width="80" height="80">
                                </a>
                            </div>
                        </div>
                        <div class="col-xs-3 col-name display-table">
                            <div class="display-table-cell">
                                <a href="//item.mi.com/1161400010.html" target="_blank"> 必备套装 </a>
                            </div>
                        </div>
                        <div class="col-xs-1 col-price display-table">
                            <div class="display-table-cell">
                                <span class="goods-price">59</span>元
                            </div>
                        </div>
                        <div class="col-xs-2 col-num display-table">
                            <div class="display-table-cell">
                                <div class="input-group input-group-sm digital-setting">
                                    <span onclick="minusGoodsDigital(this)" class="input-group-addon">－</span>
                                    <input value="2" type="text" class="form-control" required readonly>
                                    <span onclick="plusGoodsDigital(this)" class="input-group-addon">＋</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-2 col-total display-table">
                            <div class="display-table-cell">
                                <span class="goods-total">118</span>元
                                <p class="pre-info">已优惠36元</p>
                            </div>
                        </div>
                        <div class="col-xs-1 col-action display-table">
                            <div class="display-table-cell">
                                <a>
                                    <i class="glyphicon glyphicon-remove"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="list-sub-body">
                        <i class="arrow"></i>
                        <div class="row item-sub-box">
                            <div class="col-xs-1 col-check display-table">
                                <div class="display-table-cell"></div>
                            </div>
                            <div class="col-xs-2 col-img display-table">
                                <div class="display-table-cell">
                                    <a href="//item.mi.com/1161200008.html" target="_blank">
                                        <img alt="" src="//i1.mifile.cn/a1/T1szd_BjVv1RXrhCrK!60x60.jpg" width="60" height="60">
                                    </a>
                                </div>
                            </div>
                            <div class="col-xs-3 col-name display-table">
                                <div class="display-table-cell">
                                    <a href="//item.mi.com/1161200008.html" target="_blank">小米活塞耳机 基础版 蓝色</a>
                                </div>
                            </div>
                            <div class="col-xs-1 col-price display-table">
                                <div class="display-table-cell"></div>
                            </div>
                            <div class="col-xs-2 col-num display-table">
                                <div class="display-table-cell">×1</div>
                            </div>
                            <div class="col-xs-2 col-total display-table">
                                <div class="display-table-cell"></div>
                            </div>
                            <div class="col-xs-1 col-action display-table">
                                <div class="display-table-cell"></div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="row cart-bar clearfix" id="J_cartBar">
            <div class="col-xs-8 section-left">
                <span class="cart-total">购物车中共 <span id="J_cartTotalNum" class="orangeColor">3</span> 件商品，已选择 <span id="J_cartSelTotalNum" class="orangeColor">0</span> 件</span>
                <span class="total-price orangeColor"> 合计（不含运费）：<span id="J_cartTotalPrice" class="font-size24 orangeColor">0.00</span>元</span>
            </div>
            <div class="col-xs-4 section-right">
                <a href="#" class="btn btn-lg btn-grey border-radius-0">继续购物</a>
                <button id="J_cartGoSettleAccounts" class="btn btn btn-orange btn-lg border-radius-0">去结算</button>
            </div>
        </div>

    </div>
    <%@ include file="./../include/mi-bottomPage.jsp" %>
</div>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/bootstrap.min.js"></script>
<!-- 浏览器兼容 bsie js 补丁只在IE6中才执行 -->
<!--[if lte IE 6]>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/bootstrap-ie.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/html5shiv.min.js"></script>
<![endif]-->
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/common.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/viewfront/mi-common.js"></script>
<script type="text/javascript">
    $(function(){
        /* 滚动事件，未处理
        $(window).on("scroll", function () {
            //1、方法1
            var obj = document.getElementById('J_cartBar');
            var pos = obj.getBoundingClientRect();
            console.log(pos);
            var $cartBar = $('#J_cartBar');
            var w = document.documentElement.clientWidth;
            var h = document.documentElement.clientHeight;
            if(pos.top>h || pos.bottom<0 || pos.left>w || pos.right<0){
                //可视
                $cartBar.removeClass('cart-bar-fixed');
            }else{
                //不可视
                $cartBar.addClass('cart-bar-fixed');
            }

            //2、方法2
            var $cartBar = $('#J_cartBar');
            console.log($cartBar.next('div').isOnScreen());
            if($cartBar.next('div').isOnScreen()){
                $cartBar.removeClass('cart-bar-fixed');
            }else{
                $cartBar.addClass('cart-bar-fixed');
            }
        });
        */

        //默认选中全部商品
        goodsSelectAll(null);
    });

    function goodsSelectAll(obj){
        var isSelectAll;
        if(obj){
            isSelectAll = $(obj).is(':checked');
        }else{
            $('#J_selectAllCheckbox').prop('checked',true);
            isSelectAll = true;
        }
        $('#J_listBody').find('input:checkbox').prop('checked',isSelectAll);
        countCartTotalPrice();
    }
    function goodsSelectItem(){
        var isSelectAll = isGoodSelectAll();
        var selectAllCheckbox = $('#J_selectAllCheckbox');
        if(isSelectAll){
            selectAllCheckbox.prop('checked',true);
        }else{
            selectAllCheckbox.prop('checked',false);
        }
        countCartTotalPrice();
    }

    //判断商品选择
    function isGoodSelectAll(){
        var isSelectAll=true;
        var $inputCheckboxList = $('#J_listBody').find('input:checkbox');
        $inputCheckboxList.each(function(){
            if(!$(this).is(':checked')){
                isSelectAll = false;
                return false;
            }
        });
        return isSelectAll;
    }

    //商品购买数量减
    function minusGoodsDigital(obj){
        minusDigital(obj);
        countGoodsTotalPrice(obj);
    }

    //商品购买数量加
    function plusGoodsDigital(obj){
        plusDigital(obj);
        countGoodsTotalPrice(obj);
    }

    //计算单种商品总价
    function countGoodsTotalPrice(obj){
        var goodsNum = Number($(obj).parent().children('input').val());
        var $divItemBox =  $(obj).parent().parent().parent().parent('div.item-box');
        var goodsPrice = Number($divItemBox.children('div.col-price').find('span.goods-price').text());
        $divItemBox.children('div.col-total').find('span.goods-total').text(goodsPrice*goodsNum);
        var $inputCheckbox = $divItemBox.children('div.col-check').find('input:checkbox');
        if($inputCheckbox.is(':checked')){
            countCartTotalPrice();
        }
    }

    //计算购物车商品总价
    function countCartTotalPrice(){
        //查找已经被选中的商品
        var $inputCheckboxCheckedList = $('#J_listBody').find('input[type="checkbox"]:checked');
        var cartSelTotalNum = $inputCheckboxCheckedList.length;
        if(cartSelTotalNum==0){
            $('#J_cartGoSettleAccounts').attr('disabled',true);
        }else{
            $('#J_cartGoSettleAccounts').removeAttr('disabled');
        }
        var cartTotalPrice = 0;
        $inputCheckboxCheckedList.each(function(){
            var $divItemBox = $(this).parent().parent().parent().parent('div.item-box');
            cartTotalPrice += Number($divItemBox.children('div.col-total').find('span.goods-total').text());
        });
        $('#J_cartSelTotalNum').text(cartSelTotalNum);
        $('#J_cartTotalPrice').text(cartTotalPrice);
    }

</script>
</body>
</html>
