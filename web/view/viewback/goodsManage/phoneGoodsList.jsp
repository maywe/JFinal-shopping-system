<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 系统用户管理 -->
<!-- 列表 start-->
<div class="tab-pane animated fadeInDown my-tab-pane" id="phoneGoodsListBox">
    <div class="portlet col-xs-12 padding0">
        <div class="portlet-title themes-portlet-title">
            <div class="col-xs-1 padding0">
                <img alt="搜索" src="../../../images/back/search.png">
            </div>
            <div class="col-xs-11 p-r-0">
                <form id="phoneGoodsViewListForm" class="form-inline" onsubmit="return false">
                    <label>所属类别</label>
                    <select name="phoneGoodsView.goods_small_type_id" class="form-control input-sm">
                        <option value="">所有</option>
                        <c:forEach items="${goodsSmallTypeList}" var="gst">
                            <option ${phoneGoodsView.goods_small_type_id==gst.goods_small_type_id?"selected":""} value="${gst.goods_small_type_id}">${gst.goods_small_type_name}</option>
                        </c:forEach>
                    </select>
                    <label>手机型号</label>
                    <select name="phoneGoodsView.phone_model_id" class="form-control input-sm">
                        <option value="">所有</option>
                        <c:forEach items="${phoneModelList}" var="pm">
                            <option ${phoneGoodsView.phone_model_id==pm.goods_addribute_val_id?"selected":""} value="${pm.goods_addribute_val_id}">${pm.goods_addribute_val_name}</option>
                        </c:forEach>
                    </select>
                    <label>手机版本</label>
                    <select name="phoneGoodsView.phone_version_id" class="form-control input-sm">
                        <option value="">所有</option>
                        <c:forEach items="${phoneVersionList}" var="pv">
                            <option ${phoneGoodsView.phone_version_id==pv.goods_addribute_val_id?"selected":""} value="${pv.goods_addribute_val_id}">${pv.goods_addribute_val_name}</option>
                        </c:forEach>
                    </select>
                    <a data-backdrop="static" data-whatever="增加手机商品" data-toggle="modal" href="${pageContext.request.contextPath}/phoneGoodsCtrl/addRequest.action" data-target="#pop_modal_lg" class="btn btn-xs btn-info pull-right" style="margin-top:3px;">
                        <i class="glyphicon glyphicon-plus font-size12"></i>
                        <span>新增</span>
                    </a>
                    <button onclick="paginationBreak('phoneGoodsListBox')" type="button" class="btn btn-xs btn-info">
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
                        <th>所属类别</th>
                        <th>手机型号</th>
                        <th>手机版本</th>
                        <th>总库存量</th>
                        <th>已售数量</th>
                        <th>手机原价</th>
                        <th>手机现价</th>
                        <th>预览图片</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${pageUtil.list}" var="pgv" varStatus="status">
                        <tr>
                            <td>${status.count}</td>
                            <td>${pgv.goods_small_type_name}</td>
                            <td>${pgv.phone_model_name}</td>
                            <td>${pgv.phone_version_name}</td>
                            <td>${pgv.phone_stock}</td>
                            <td>${pgv.phone_sales_num}</td>
                            <td>${pgv.phone_former_price}</td>
                            <td>${pgv.phone_now_price}</td>
                            <td><img alt="手机预览图" width="25" height="25" src="${pageContext.request.contextPath}${pgv.phone_preview_image}"/></td>
                            <td>
                                <a data-backdrop="static" data-whatever="查看手机商品" data-toggle="modal" href="${pageContext.request.contextPath}/phoneGoodsCtrl/showRequest.action?phoneGoodsView.phone_goods_id=${pgv.phone_goods_id}" data-target="#pop_modal_lg" class="btn btn-xs btn-info">
                                    <i class="glyphicon glyphicon-share-alt font-size12"></i>
                                    <span>查看</span>
                                </a>
                                <a data-backdrop="static" data-whatever="修改手机商品" data-toggle="modal" href="${pageContext.request.contextPath}/phoneGoodsCtrl/updateRequest.action?phoneGoodsView.phone_goods_id=${pgv.phone_goods_id}" data-target="#pop_modal_lg" class="btn btn-xs btn-info">
                                    <i class="glyphicon glyphicon-pencil font-size12"></i>
                                    <span>修改</span>
                                </a>
                                <button onclick="deleteCallSubmit(this,'/phoneGoodsCtrl/deleteData','phoneGoodsListBox',{'phoneGoodsView.phone_goods_id':${pgv.phone_goods_id}})" type="button" class="btn btn-xs btn-info" data-deleteInfo="删除后不可恢复!您确定要删除?">
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
            <select name="pageSize" onchange="paginationBreak('phoneGoodsListBox')">
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

