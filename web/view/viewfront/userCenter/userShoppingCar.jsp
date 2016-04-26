<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width,initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" name="viewport">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <link rel="shortcut icon" type="image/ico" href="${pageContext.request.contextPath}/images/mi-logo-36.png">
    <title>小米官网-我的购物车</title>
    <link href="${pageContext.request.contextPath}/css/common/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/font-awesome.min.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/awesome-bootstrap-checkbox.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/common/toastr.min.css" rel="stylesheet">
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
                <a class="logo" title="小米官网" href="${pageContext.request.contextPath}/"></a>
                <h3 class="logo-title">我的购物车</h3>
                <p class="logo-desc">温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算。</p>
            </div>
        </div>

        <c:if test="${empty phoneGoodsList and empty phoneSetmealGoodsList and empty otherGoodsList}">
            <div id="J_cartEmpty" class="row cart-empty">
                <div class="col-xs-5 display-table">
                    <div class="display-table-cell cart-empty-img">
                        <img width="359" height="273" src="${pageContext.request.contextPath}/images/front/mi-cart-empty.png">
                    </div>
                </div>
                <div class="col-xs-7 display-table">
                    <div class="display-table-cell cart-empty-desc">
                        <h1>您的购物车还是空的！</h1>
                        <a class="btn btn-orange btn-lg" href="${pageContext.request.contextPath}/">马上去购物</a>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${not empty phoneGoodsList or not empty phoneSetmealGoodsList or not empty otherGoodsList}">
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
                    <c:forEach items="${phoneGoodsList}" var="pg">
                        <div class="item-row">
                            <div class="row item-box" data-node-id="${pg.users_shopping_id}">
                                <div class="col-xs-1 col-check display-table">
                                    <div class="display-table-cell">
                                        <div class="checkbox checkbox-orange checkbox-inline">
                                            <input ${pg.is_select_pay=="0"?"checked":""} name="users_shopping_id" onclick="goodsSelectItem(this)" type="checkbox" value="${pg.is_select_pay}">
                                            <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-2 col-img display-table">
                                    <div class="display-table-cell">
                                        <a target="_blank" href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=${pg.goods_small_type_id}">
                                            <img alt="${pg.goods_small_type_name} ${pg.phone_model_name} ${pg.phone_version_name} ${pg.goods_color_name}" src="${pageContext.request.contextPath}${pg.goods_color_img_url}?width=80&height=80" width="80" height="80">
                                        </a>
                                    </div>
                                </div>
                                <div class="col-xs-3 col-name display-table">
                                    <div class="display-table-cell">
                                        <a target="_blank" href="${pageContext.request.contextPath}/phonePurchaseCtrl/initPhonePurchase.action?goodsSmallType.goods_small_type_id=${pg.goods_small_type_id}"> ${pg.goods_small_type_name} ${pg.phone_model_name} ${pg.phone_version_name} ${pg.goods_color_name} </a>
                                    </div>
                                </div>
                                <div class="col-xs-1 col-price display-table">
                                    <div class="display-table-cell">
                                        <span class="goods-price">${pg.phone_now_price}</span>元
                                    </div>
                                </div>
                                <div class="col-xs-2 col-num display-table">
                                    <div class="display-table-cell">
                                        <div class="input-group input-group-sm digital-setting">
                                            <span onclick="minusGoodsDigital(this)" class="input-group-addon">－</span>
                                            <input value="${pg.shopping_num}" type="text" class="form-control" required readonly>
                                            <span onclick="plusGoodsDigital(this)" class="input-group-addon">＋</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-2 col-total display-table">
                                    <div class="display-table-cell">
                                        <span class="goods-total">${pg.phone_now_price*pg.shopping_num}</span>元
                                    </div>
                                </div>
                                <div class="col-xs-1 col-action display-table">
                                    <div class="display-table-cell">
                                        <a href="javascript:;" onclick="deleteCartGoods('${pg.users_shopping_id}')"><i class="glyphicon glyphicon-remove"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <c:forEach items="${phoneSetmealGoodsList}" var="psg">
                        <div class="item-row">
                            <div class="row item-box" data-node-id="${psg.users_shopping_id}">
                                <div class="col-xs-1 col-check display-table">
                                    <div class="display-table-cell">
                                        <div class="checkbox checkbox-orange checkbox-inline">
                                            <input ${psg.is_select_pay=="0"?"checked":""} name="users_shopping_id" onclick="goodsSelectItem(this)" type="checkbox" value="${psg.is_select_pay}">
                                            <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-2 col-img display-table">
                                    <div class="display-table-cell">
                                        <a>
                                            <img alt="${psg.goods_small_type_name} ${psg.phone_setmeal_name}" src="${pageContext.request.contextPath}${psg.setmeal_preview_image}?width=80&height=80" width="80" height="80">
                                        </a>
                                    </div>
                                </div>
                                <div class="col-xs-3 col-name display-table">
                                    <div class="display-table-cell">
                                        <a> ${psg.goods_small_type_name} ${psg.phone_setmeal_name} </a>
                                    </div>
                                </div>
                                <div class="col-xs-1 col-price display-table">
                                    <div class="display-table-cell">
                                        <span class="goods-price">${psg.setmeal_price}</span>元
                                    </div>
                                </div>
                                <div class="col-xs-2 col-num display-table">
                                    <div class="display-table-cell">
                                        <div class="input-group input-group-sm digital-setting">
                                            <span onclick="minusGoodsDigital(this)" class="input-group-addon">－</span>
                                            <input value="${psg.shopping_num}" type="text" class="form-control" required readonly>
                                            <span onclick="plusGoodsDigital(this)" class="input-group-addon">＋</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-2 col-total display-table">
                                    <div class="display-table-cell">
                                        <span class="goods-total">${psg.setmeal_price}</span>元
                                        <p class="pre-info">已优惠${psg.save_money}元</p>
                                    </div>
                                </div>
                                <div class="col-xs-1 col-action display-table">
                                    <div class="display-table-cell">
                                        <a href="javascript:;" onclick="deleteCartGoods('${psg.users_shopping_id}')"><i class="glyphicon glyphicon-remove"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="list-sub-body">
                                <i class="arrow"></i>
                                <c:forEach items="${psg.usersshopcarsetmealgoodsList}" var="ussg">
                                    <div class="row item-sub-box">
                                        <div class="col-xs-1 col-check display-table">
                                            <div class="display-table-cell"></div>
                                        </div>
                                        <div class="col-xs-2 col-img display-table">
                                            <div class="display-table-cell">
                                                <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/initGoodsPurchase.action?filterGoodsSmallTypeId=${ussg.goods_small_type_id}" target="_blank">
                                                    <img alt="${ussg.goods_name} ${ussg.goods_color_name}" src="${pageContext.request.contextPath}${ussg.goods_color_img_url}?width=60&height=60" width="60" height="60">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-xs-3 col-name display-table">
                                            <div class="display-table-cell">
                                                <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/initGoodsPurchase.action?filterGoodsSmallTypeId=${ussg.goods_small_type_id}" target="_blank">${ussg.goods_name} ${ussg.goods_color_name}</a>
                                            </div>
                                        </div>
                                        <div class="col-xs-1 col-price display-table">
                                            <div class="display-table-cell"></div>
                                        </div>
                                        <div class="col-xs-2 col-num display-table">
                                            <div class="display-table-cell">×${ussg.goods_num}</div>
                                        </div>
                                        <div class="col-xs-2 col-total display-table">
                                            <div class="display-table-cell"></div>
                                        </div>
                                        <div class="col-xs-1 col-action display-table">
                                            <div class="display-table-cell"></div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </c:forEach>
                    <c:forEach items="${otherGoodsList}" var="og">
                        <div class="item-row">
                            <div class="row item-box" data-node-id="${og.users_shopping_id}">
                                <div class="col-xs-1 col-check display-table">
                                    <div class="display-table-cell">
                                        <div class="checkbox checkbox-orange checkbox-inline">
                                            <input ${og.is_select_pay=="0"?"checked":""} name="users_shopping_id" onclick="goodsSelectItem(this)" type="checkbox" value="${og.is_select_pay}">
                                            <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-2 col-img display-table">
                                    <div class="display-table-cell">
                                        <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/initGoodsPurchase.action?filterGoodsSmallTypeId=${og.goods_small_type_id}" target="_blank">
                                            <img alt="${og.goods_name} ${og.goods_color_name}" src="${pageContext.request.contextPath}${og.goods_color_img_url}?width=80&height=80" width="80" height="80">
                                        </a>
                                    </div>
                                </div>
                                <div class="col-xs-3 col-name display-table">
                                    <div class="display-table-cell">
                                        <a href="${pageContext.request.contextPath}/goodsPurchaseCtrl/initGoodsPurchase.action?filterGoodsSmallTypeId=${og.goods_small_type_id}" target="_blank"> ${og.goods_name} ${og.goods_color_name} </a>
                                    </div>
                                </div>
                                <div class="col-xs-1 col-price display-table">
                                    <div class="display-table-cell">
                                        <span class="goods-price">${og.goods_new_price}</span>元
                                    </div>
                                </div>
                                <div class="col-xs-2 col-num display-table">
                                    <div class="display-table-cell">
                                        <div class="input-group input-group-sm digital-setting">
                                            <span onclick="minusGoodsDigital(this)" class="input-group-addon">－</span>
                                            <input value="${og.shopping_num}" type="text" class="form-control" required readonly>
                                            <span onclick="plusGoodsDigital(this)" class="input-group-addon">＋</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-2 col-total display-table">
                                    <div class="display-table-cell">
                                        <span class="goods-total">${og.goods_new_price*og.shopping_num}</span>元
                                    </div>
                                </div>
                                <div class="col-xs-1 col-action display-table">
                                    <div class="display-table-cell">
                                        <a href="javascript:;" onclick="deleteCartGoods('${og.users_shopping_id}')"><i class="glyphicon glyphicon-remove"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="row cart-bar clearfix" id="J_cartBar">
                <div class="col-xs-8 section-left">
                    <span class="cart-total">购物车中共 <span id="J_cartTotalNum" class="orangeColor">0</span> 件商品，已选择 <span id="J_cartSelTotalNum" class="orangeColor">0</span> 件</span>
                    <span class="total-price orangeColor"> 合计（不含运费）：<span id="J_cartTotalPrice" class="font-size24 orangeColor">0.00</span>元</span>
                </div>
                <div class="col-xs-4 section-right">
                    <a href="${pageContext.request.contextPath}/" class="btn btn-lg btn-grey border-radius-0">继续购物</a>
                    <button id="J_cartGoSettleAccounts" onclick="goSettleAccounts()" class="btn btn btn-orange btn-lg border-radius-0">去结算</button>
                </div>
            </div>
        </c:if>
    </div>
    <div id="popModalHintInfo" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog">
            <div class="modal-content border-radius-0">
                <div class="modal-header" style="border: none;">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i class="glyphicon glyphicon-remove font-size16"></i>
                    </button>
                </div>
                <div class="modal-body" style="text-align: center;padding-bottom: 80px;">
                    <h2>确定删除吗？</h2>
                </div>
                <div class="modal-footer" style="text-align: center;border: none;background: rgb(245,245,245);">
                    <button style="border-radius: 0; width: 150px;" type="button" class="btn btn-grey btn-lg" data-dismiss="modal">关闭</button>
                    <button onclick="deleteCartGoods()" style="border-radius: 0; width: 150px;" type="button" class="btn btn-orange btn-lg" data-dismiss="modal">确定</button>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="./../include/mi-bottomPage.jsp" %>
</div>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/common/toastr.min.js"></script>
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

        //选择付款项
        goodsSelectItem();
        countCartGoodsTotalNum();
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

        //更新数据库
        var param = {};
        param.command = "updateSelectAllPay";
        if(isSelectAll){
            param.is_select_pay = '0';
        }else{
            param.is_select_pay = '1';
        }
        updateCartGoods(param);
    }
    function goodsSelectItem(obj){
        var isSelectAll = isGoodSelectAll();
        var selectAllCheckbox = $('#J_selectAllCheckbox');
        if(isSelectAll){
            selectAllCheckbox.prop('checked',true);
        }else{
            selectAllCheckbox.prop('checked',false);
        }
        countCartTotalPrice();

        if(obj){
            //更新数据库
            var param = {};
            param.command = "updateSelectItemPay";
            param.users_shopping_id = $(obj).parent().parent().parent().parent().data('node-id');
            if($(obj).is(':checked')){
                param.is_select_pay = '0';
            }else{
                param.is_select_pay = '1';
            }
            updateCartGoods(param);
        }
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


        //更新数据库
        var param = {};
        param.command = 'updateShoppingNum';
        param.users_shopping_id = $(obj).parent().parent().parent().parent().data('node-id');
        param.shopping_num = $(obj).next('input').val();
        updateCartGoods(param);
    }

    //商品购买数量加
    function plusGoodsDigital(obj){
        plusDigital(obj);
        countGoodsTotalPrice(obj);

        //更新数据库
        var param = {};
        param.command = 'updateShoppingNum';
        param.users_shopping_id = $(obj).parent().parent().parent().parent().data('node-id');
        param.shopping_num = $(obj).prev('input').val();
        updateCartGoods(param);
    }

    //计算单种商品总价
    function countGoodsTotalPrice(obj){
        var goodsNum = Number($(obj).parent().children('input').val());
        var $divItemBox =  $(obj).parent().parent().parent().parent('div.item-box');
        var goodsPrice = Number($divItemBox.children('div.col-price').find('span.goods-price').text());
        $divItemBox.children('div.col-total').find('span.goods-total').text(goodsPrice*goodsNum);
        var $inputCheckbox = $divItemBox.children('div.col-check').find('input:checkbox');
        countCartGoodsTotalNum();
        if($inputCheckbox.is(':checked')){
            countCartTotalPrice();
        }
    }

    //计算商品总数
    function countCartGoodsTotalNum(){
        var cartTotalNum = 0;
        $('#J_listBody').find('input:text').each(function(){
            cartTotalNum+=Number($(this).val());
        });
        $('#J_cartTotalNum').text(cartTotalNum);
    }

    //计算购物车商品总价
    function countCartTotalPrice(){
        //查找已经被选中的商品
        var $inputCheckboxCheckedList = $('#J_listBody').find('input[type="checkbox"]:checked');
        if($inputCheckboxCheckedList.length==0){
            $('#J_cartGoSettleAccounts').attr('disabled',true);
        }else{
            $('#J_cartGoSettleAccounts').removeAttr('disabled');
        }
        var cartTotalPrice = 0;
        var cartSelTotalNum = 0;
        $inputCheckboxCheckedList.each(function(){
            var $divItemBox = $(this).parent().parent().parent().parent('div.item-box');
            cartTotalPrice += Number($divItemBox.children('div.col-total').find('span.goods-total').text());
            cartSelTotalNum += Number($divItemBox.find('input:text').val());
        });
        $('#J_cartSelTotalNum').text(cartSelTotalNum);
        $('#J_cartTotalPrice').text(cartTotalPrice);
    }

    function deleteCartGoods(users_shopping_id){
        var $popModalHintInfo = $('#popModalHintInfo');
        if(users_shopping_id){
            $popModalHintInfo.attr('users_shopping_id',users_shopping_id);
            $popModalHintInfo.modal('show');
        }else{
            window.location.href='${pageContext.request.contextPath}/userShoppingCartCtrl/deleteCartGoods.action?users_shopping_id='+$popModalHintInfo.attr('users_shopping_id');
        }
    }

    function updateCartGoods(param){
        var targetUrl = '${pageContext.request.contextPath}/userShoppingCartCtrl/updateCartGoods.action';
        $.post(targetUrl,param,function(data){
            if(data.errorCode==99){
                window.location.href='${pageContext.request.contextPath}/view/viewfront/login.jsp';
            }else if(data.errorCode!=0){
                toastr.info(data.errorMessage);
            }
        },'json');
    }

    function goSettleAccounts(){
        window.location.href='${pageContext.request.contextPath}/userSettleAccountsCtrl/initUserSettleAccounts.action';
    }
</script>
</body>
</html>
