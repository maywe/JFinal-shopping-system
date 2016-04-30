<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 网站用户管理 -->
<!-- 列表 start-->
<div class="tab-pane animated fadeInDown my-tab-pane" id="webOrderListBox">
    <div class="portlet col-xs-12 padding0">
        <div class="portlet-title themes-portlet-title">
            <div class="col-xs-1 padding0">
                <img alt="搜索" src="../../../images/back/search.png">
            </div>
            <div class="col-xs-11 p-r-0">
                <form id="webOrderListForm" class="form-inline" onsubmit="return false">
                    <label>关键字</label>
                    <input name="search_key" value="${usersOrders.search_key}" type="text" class="form-control input-sm" placeholder="订单编号/收货人/联系电话"/>
                    <label>用户状态</label>
                    <select name="search_orders_status" class="form-control input-sm">
                        <option value="">所有</option>
                        <%--
                        <option ${usersOrders.search_orders_status==0?"selected":""} value="0">已下单</option>
                        --%>
                        <option ${usersOrders.search_orders_status==1?"selected":""} value="1">已付款</option>
                        <option ${usersOrders.search_orders_status==2?"selected":""} value="2">正在配货</option>
                        <option ${usersOrders.search_orders_status==3?"selected":""} value="3">已发货</option>
                        <option ${usersOrders.search_orders_status==4?"selected":""} value="4">交易成功</option>
                    </select>
                    <label>订单时间</label>
                    <input name="search_orders_time1" value="${usersOrders.search_orders_time1}" type="text" class="form-control input-sm dateSelect" placeholder="开始时间"/>
                    -
                    <input name="search_orders_time2" value="${usersOrders.search_orders_time2}" type="text" class="form-control input-sm dateSelect" placeholder="结束时间"/>
                    <button onclick="paginationBreak('webOrderListBox')" type="button" class="btn btn-xs btn-info">
                        <i class="glyphicon glyphicon-search font-size12"></i>
                        <span>查询</span>
                    </button>
                </form>
            </div>
        </div>
        <div class="portlet-box themes-portlet-box">
            <table class="table table-condensed table-bordered table-hover">
                <thead>
                    <tr>
                        <th>序号</th>
                        <th>订单编号</th>
                        <th>收货人</th>
                        <th>联系电话</th>
                        <th>商品总件数</th>
                        <th>订单总金额(￥)</th>
                        <th>订单状态</th>
                        <th>活动优惠(￥)</th>
                        <th>商品运费(￥)</th>
                        <th>支付金额(￥)</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${pageUtil.list}" var="data" varStatus="status">
                        <tr>
                            <td>${status.count}</td>
                            <td>${data.user_orders_id}</td>
                            <td>${data.name}</td>
                            <td>${data.telephone}</td>
                            <td>${data.goods_sum}</td>
                            <td>${data.sum_money}</td>
                            <td>
                                ${data.orders_status=="1"?"已付款":""}
                                ${data.orders_status=="2"?"正在配货":""}
                                ${data.orders_status=="3"?"已发货":""}
                                ${data.orders_status=="4"?"交易成功":""}
                            </td>
                            <td>${data.discount_amount}</td>
                            <td>${data.goods_freight}</td>
                            <td>${data.payment_money}</td>
                            <td>
                                <a data-backdrop="static" data-whatever="查看网站订单" data-toggle="modal" href="${pageContext.request.contextPath}/webOrderCtrl/showRequest.action?usersOrders.orders_id=${data.orders_id}" data-target="#pop_modal_lg" class="btn btn-xs btn-info">
                                    <i class="glyphicon glyphicon-share-alt font-size12"></i>
                                    <span>查看</span>
                                </a>
                                <a data-backdrop="static" data-whatever="修改网站订单状态" data-toggle="modal" href="${pageContext.request.contextPath}/webOrderCtrl/updateRequest.action?usersOrders.orders_id=${data.orders_id}" data-target="#pop_modal_sm" class="btn btn-xs btn-info">
                                    <i class="glyphicon glyphicon-pencil font-size12"></i>
                                    <span>修改</span>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- 列表 end-->

<!-- 分页 start -->
<div class="navbar-fixed-bottom pageFooter themes-pageFooter">
    <div class="pagination-select">
        <label>每页&nbsp;</label>
        <div class="select-pagesize">
            <select name="pageSize" onchange="paginationBreak('webOrderListBox')">
                <option ${pageUtil.pageSize==30?"selected":""} value="30">30</option>
                <option ${pageUtil.pageSize==60?"selected":""} value="60">60</option>
                <option ${pageUtil.pageSize==120?"selected":""} value="120">120</option>
                <option ${pageUtil.pageSize==150?"selected":""} value="150">150</option>
            </select>
        </div>
        <label>&nbsp;条，共 ${pageUtil.totalRow} 条</label>
    </div>
    <div class="pagination-box" pageNumber="${pageUtil.pageNumber}" pageSize="${pageUtil.pageSize}" totalPage="${pageUtil.totalPage}" totalRow="${pageUtil.totalRow}"></div>
</div>
<!-- 分页 end -->
<script type="text/javascript">
    $(function(){
        //日历选择控件
        $(".dateSelect").datetimepicker({
            language: 'zh-CN',      //汉化
            format: "yyyy-mm-dd",   //选择日期后，文本框显示的日期格式
            minView: "month",       //选择日期后，不会再跳转去选择时分秒
            autoclose: true         //选择日期后自动关闭
        });
    });
</script>
