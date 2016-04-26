<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <i class="glyphicon glyphicon-remove font-size16"></i>
    </button>
    <span class="modal-title font-size16">修改收货地址</span>
</div>
<form id="usersDeliveryAddressForm" class="form-horizontal" role="form" method="post" action="${pageContext.request.contextPath}/userSettleAccountsCtrl/addUserAddressData.action">
    <div class="modal-body border0" style="padding:0 20px">
        <input value="${usersDeliveryAddress.users_delivery_address_id}" name="usersDeliveryAddress.users_delivery_address_id" type="hidden">
        <input value="${usersDeliveryAddress.name}" name="usersDeliveryAddress.name" class="form-control m-b" type="text" placeholder="收货人姓名" required maxlength="32">
        <input value="${usersDeliveryAddress.telephone}" name="usersDeliveryAddress.telephone" class="form-control m-b" type="tel" placeholder="11位手机号码" required maxlength="11" pattern="(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$">
        <select name="usersDeliveryAddress.province" class="form-control m-b" required></select>
        <select name="usersDeliveryAddress.city" class="form-control m-b" required></select>
        <select name="usersDeliveryAddress.county" class="form-control m-b" required></select>
        <textarea name="usersDeliveryAddress.street" class="form-control m-b" placeholder="详细地址，路名或街道名称，门牌号" required maxlength="200">${usersDeliveryAddress.street}</textarea>
        <input value="${usersDeliveryAddress.postalcode}" name="usersDeliveryAddress.postalcode" class="form-control m-b" type="text" placeholder="邮政编码" required maxlength="6">
        <input value="${usersDeliveryAddress.address_label}" name="usersDeliveryAddress.address_label" class="form-control m-b" type="text" placeholder="如家、公司。限5个字之内" maxlength="32">
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
        //通过ID省市二级联动，无默认值，无文字提示信息
        //new PCAS("ProvinceId","CityId");
        //通过ID省市区三级联动，无默认，无文字提示信息
        new PCAS("usersDeliveryAddress.province","usersDeliveryAddress.city","usersDeliveryAddress.county","${usersDeliveryAddress.province}","${usersDeliveryAddress.city}","${usersDeliveryAddress.county}");
        /*
        //通过NAME省市区三级联动，无默认值，无文字提示信息
        new PCAS("ProvinceName","CityName","AreaName");
        //省市二级联动，有默认值，无文字提示
        new PCAS("Province=吉林省","City=长春市");
        //省市二级联动，无默认值，有文字提示信息
        new PCAS("Province,请选择省份","City,请选择城市");
        //省市区三级联动，无默认，无文字提示
        new PCAS("Province","City","Area");
        //三级联动，有默认值，有文字提示信息
        new PCAS("Province=吉林省,请选择省份","City=松原市,请选择城市","Area=宁江区,请选择地区");
        //三级联动，有默认值，有文字提示信息
        new PCAS(["Province=吉林省","请选择省份"],["City=松原市","请选择城市"],["Area=宁江区","请选择地区"]);
        */

        var command = '${command}';
        if(command=='addUserAddressRequest'){
            $('#usersDeliveryAddressForm').attr('action','${pageContext.request.contextPath}/userSettleAccountsCtrl/addUserAddressData.action');
        }else if(command=='updateUserAddressRequest'){
            $('#usersDeliveryAddressForm').attr('action','${pageContext.request.contextPath}/userSettleAccountsCtrl/updateUserAddressData.action');
        }else if(command=='addUserAddressRequest_userCenter'){
            $('#usersDeliveryAddressForm').attr('action','${pageContext.request.contextPath}/userCenterCtrl/addUserAddressData.action');
        }else if(command=='updateUserAddressRequest_userCenter'){
            $('#usersDeliveryAddressForm').attr('action','${pageContext.request.contextPath}/userCenterCtrl/updateUserAddressData.action');
        }
    });
</script>
