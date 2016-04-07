<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 列表 start-->
<div class="tab-pane animated fadeInDown my-tab-pane" id="phoneModelListBox">
    <div class="portlet col-xs-12 padding0">
        <div class="portlet-title themes-portlet-title">
            <div class="col-xs-1 padding0">
                <img alt="搜索" src="../../../images/back/search.png">
            </div>
            <div class="col-xs-11 p-r-0">
                <form id="goodsBigTypeListForm" class="form-inline" onsubmit="return false">
                    <label>手机类型</label>
                    <select name="phoneModel.goods_small_type_id" class="form-control input-sm">
                        <option value="">所有</option>
                        <c:forEach items="${goodsSmallTypeList}" var="gst">
                            <option ${phoneModel.goods_small_type_id==gst.goods_small_type_id?"selected":""} value="${gst.goods_small_type_id}">${gst.goods_small_type_name}</option>
                        </c:forEach>
                    </select>
                    <button onclick="paginationBreak('phoneModelListBox')" type="button" class="btn btn-xs btn-info">
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
                        <th>手机类别名称</th>
                        <th>手机型号名称</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${pageUtil.list}" var="data" varStatus="status">
                        <tr>
                            <td>${status.count}</td>
                            <td>${data.goods_small_type_name}</td>
                            <td>${data.goods_addribute_val_name}</td>
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
            <select name="pageSize" onchange="paginationBreak('phoneModelListBox')">
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

