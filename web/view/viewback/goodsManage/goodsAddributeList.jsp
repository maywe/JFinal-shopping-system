<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 系统用户管理 -->
<!-- 列表 start-->
<div class="tab-pane animated fadeInDown my-tab-pane" id="goodsAddributeListBox">
    <div class="portlet col-xs-12 padding0">
        <div class="portlet-title themes-portlet-title">
            <div class="col-xs-1 padding0">
                <img alt="搜索" src="../../../images/back/search.png">
            </div>
            <div class="col-xs-11 p-r-0">
                <form id="goodsAddributeListForm" class="form-inline" onsubmit="return false">
                    <label>商品属性</label>
                    <input name="goodsAddribute.goods_addribute_name" value="${goodsAddribute.goods_addribute_name}" type="text" class="form-control input-sm" placeholder="商品属性"/>
                    <a data-backdrop="static" data-whatever="增加商品属性" data-toggle="modal" href="${pageContext.request.contextPath}/goodsAddributeCtrl/addRequest.action" data-target="#pop_modal_sm" class="btn btn-xs btn-info pull-right" style="margin-top:3px;">
                        <i class="glyphicon glyphicon-plus font-size12"></i>
                        <span>新增</span>
                    </a>
                    <button onclick="paginationBreak('goodsAddributeListBox')" type="button" class="btn btn-xs btn-info">
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
                        <th>商品属性名称</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${pageUtil.list}" var="ga" varStatus="status">
                        <tr>
                            <td>${status.count}</td>
                            <td>${ga.goods_addribute_name}</td>
                            <td>
                                <a data-backdrop="static" data-whatever="查看商品属性" data-toggle="modal" href="${pageContext.request.contextPath}/goodsAddributeCtrl/showRequest.action?goodsAddribute.goods_addribute_id=${ga.goods_addribute_id}" data-target="#pop_modal_sm" class="btn btn-xs btn-info">
                                    <i class="glyphicon glyphicon-share-alt font-size12"></i>
                                    <span>查看</span>
                                </a>
                                <a data-backdrop="static" data-whatever="修改商品属性" data-toggle="modal" href="${pageContext.request.contextPath}/goodsAddributeCtrl/updateRequest.action?goodsAddribute.goods_addribute_id=${ga.goods_addribute_id}" data-target="#pop_modal_sm" class="btn btn-xs btn-info">
                                    <i class="glyphicon glyphicon-pencil font-size12"></i>
                                    <span>修改</span>
                                </a>
                                <button onclick="deleteCallSubmit(this,'/goodsAddributeCtrl/deleteData','goodsAddributeListBox',{'goodsAddribute.goods_addribute_id':${ga.goods_addribute_id}})" type="button" class="btn btn-xs btn-info" data-deleteInfo="删除后不可恢复!您确定要删除?">
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
            <select name="pageSize" onchange="paginationBreak('goodsAddributeListBox')">
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

