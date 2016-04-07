<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 列表 start-->
<div class="tab-pane animated fadeInDown my-tab-pane" id="goodsListBox">
    <div class="portlet col-xs-12 padding0">
        <div class="portlet-title themes-portlet-title">
            <div class="col-xs-1 padding0">
                <img alt="搜索" src="../../../images/back/search.png">
            </div>
            <div class="col-xs-11 p-r-0">
                <form id="goodsListForm" class="form-inline" onsubmit="return false">
                    <label>商品大类别</label>
                    <select name="goods_big_type_id" class="form-control input-sm">
                        <option value="">所有</option>
                        <c:forEach items="${goodsBigTypeList}" var="gbt">
                            <option ${goods.goods_big_type_id==gbt.goods_big_type_id?"selected":""} value="${gbt.goods_big_type_id}">${gbt.goods_bigl_type_name}</option>
                        </c:forEach>
                    </select>
                    <label>商品小类别</label>
                    <select name="goods.goods_small_type_id" class="form-control input-sm">
                        <option value="">所有</option>
                        <c:forEach items="${goodsSmallTypeList}" var="gst">
                            <option ${goods.goods_small_type_id==gst.goods_small_type_id?"selected":""} value="${gst.goods_small_type_id}">${gst.goods_small_type_name}</option>
                        </c:forEach>
                    </select>
                    <label>商品名称</label>
                    <input name="goods.goods_name" value="${goods.goods_name}" type="text" class="form-control input-sm" placeholder="商品名称"/>
                    <a data-backdrop="static" data-whatever="增加商品" data-toggle="modal" href="${pageContext.request.contextPath}/goodsCtrl/addRequest.action" data-target="#pop_modal_lg" class="btn btn-xs btn-info pull-right" style="margin-top:3px;">
                        <i class="glyphicon glyphicon-plus font-size12"></i>
                        <span>新增</span>
                    </a>
                    <button onclick="paginationBreak('goodsListBox')" type="button" class="btn btn-xs btn-info">
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
                        <th>商品大类别</th>
                        <th>商品小类别</th>
                        <th>商品名称</th>
                        <th>总库存量</th>
                        <th>已售数量</th>
                        <th>商品原价</th>
                        <th>商品现价</th>
                        <th>预览图片</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${pageUtil.list}" var="data" varStatus="status">
                        <tr>
                            <td>${status.count}</td>
                            <td>${data.goods_bigl_type_name}</td>
                            <td>${data.goods_small_type_name}</td>
                            <td>${data.goods_name}</td>
                            <td>${data.goods_stock}</td>
                            <td>${data.goods_sales_num}</td>
                            <td>${data.goods_former_price}</td>
                            <td>${data.goods_new_price}</td>
                            <td><img alt="商品预览图" width="25" height="25" src="${pageContext.request.contextPath}${data.goods_preview_image}"/></td>
                            <td>
                                <a data-backdrop="static" data-whatever="查看商品" data-toggle="modal" href="${pageContext.request.contextPath}/goodsCtrl/showRequest.action?goods.goods_id=${data.goods_id}" data-target="#pop_modal_lg" class="btn btn-xs btn-info">
                                    <i class="glyphicon glyphicon-share-alt font-size12"></i>
                                    <span>查看</span>
                                </a>
                                <a data-backdrop="static" data-whatever="修改商品" data-toggle="modal" href="${pageContext.request.contextPath}/goodsCtrl/updateRequest.action?goods.goods_id=${data.goods_id}" data-target="#pop_modal_lg" class="btn btn-xs btn-info">
                                    <i class="glyphicon glyphicon-pencil font-size12"></i>
                                    <span>修改</span>
                                </a>
                                <button onclick="deleteCallSubmit(this,'/goodsCtrl/deleteData','goodsListBox',{'goods.goods_id':${data.goods_id}})" type="button" class="btn btn-xs btn-info" data-deleteInfo="删除后不可恢复!您确定要删除?">
                                    <i class="glyphicon glyphicon-floppy-remove font-size12"></i>
                                    <span>删除</span>
                                </button>
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
            <select name="pageSize" onchange="paginationBreak('goodsListBox')">
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

