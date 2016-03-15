<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 系统用户管理 -->
<!-- 列表 start-->
<div class="tab-pane animated fadeInDown my-tab-pane" id="goodsSmallTypeListBox">
    <div class="portlet col-xs-12 padding0">
        <div class="portlet-title themes-portlet-title">
            <div class="col-xs-1 padding0">
                <img alt="搜索" src="../../../images/search.png">
            </div>
            <div class="col-xs-11 p-r-0">
                <form id="goodsSmallTypeListForm" class="form-inline" onsubmit="return false">
                    <label>商品小类型</label>
                    <input name="goodsSmallType.goods_small_type_name" value="${goodsSmallType.goods_small_type_name}" type="text" class="form-control input-sm" placeholder="商品小类型"/>
                    <label>所属商品大类别</label>
                    <select name="goodsSmallType.goods_big_type_id" class="form-control input-sm">
                        <option value="">所有</option>
                        <c:forEach items="${goodsBigTypeList}" var="gbt">
                            <option ${gbt.goods_big_type_id==goodsSmallType.goods_big_type_id?"selected":""} value="${gbt.goods_big_type_id}">${gbt.goods_bigl_type_name}</option>
                        </c:forEach>
                    </select>
                    <a data-whatever="增加商品小类型" data-toggle="modal" href="${pageContext.request.contextPath}/goodsSmallTypeCtrl/addRequest.action" data-target="#pop_modal_sm" class="btn btn-xs btn-info pull-right" style="margin-top:3px;">
                        <i class="glyphicon glyphicon-plus font-size12"></i>
                        <span>新增</span>
                    </a>
                    <button onclick="paginationBreak('goodsSmallTypeListBox')" type="button" class="btn btn-xs btn-info">
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
                        <th>商品小类别名称</th>
                        <th>所属商品大类别名称</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${pageUtil.list}" var="gst" varStatus="status">
                        <tr>
                            <td>${status.count}</td>
                            <td>${gst.goods_small_type_name}</td>
                            <td>${gst.goods_bigl_type_name}</td>
                            <td>
                                <a data-whatever="查看商品小类型" data-toggle="modal" href="${pageContext.request.contextPath}/goodsSmallTypeCtrl/showRequest.action?goodsSmallType.goods_small_type_id=${gst.goods_small_type_id}" data-target="#pop_modal_sm" class="btn btn-xs btn-info">
                                    <i class="glyphicon glyphicon-share-alt font-size12"></i>
                                    <span>查看</span>
                                </a>
                                <a data-whatever="修改商品小类型" data-toggle="modal" href="${pageContext.request.contextPath}/goodsSmallTypeCtrl/updateRequest.action?goodsSmallType.goods_small_type_id=${gst.goods_small_type_id}" data-target="#pop_modal_sm" class="btn btn-xs btn-info">
                                    <i class="glyphicon glyphicon-pencil font-size12"></i>
                                    <span>修改</span>
                                </a>
                                <button onclick="deleteCallSubmit(this,'/goodsSmallTypeCtrl/deleteData','goodsSmallTypeListBox',{'goodsSmallType.goods_small_type_id':${gst.goods_small_type_id}})" type="button" class="btn btn-xs btn-info" data-deleteInfo="删除后不可恢复!您确定要删除?">
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
            <select name="pageSize" onchange="paginationBreak('goodsSmallTypeListBox')">
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

