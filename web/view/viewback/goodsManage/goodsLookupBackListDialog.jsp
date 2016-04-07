<%@ page import="com.jfinal.kit.JsonKit" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="modal-header">
    <button type="button" class="close" onclick="hideMyModel('pop_modal')">
        <i class="glyphicon glyphicon-remove font-size16"></i>
    </button>
    <img alt="弹出框" src="../../../images/back/diatopicon.png" style="vertical-align: middle">
    <span class="modal-title font-size16">商品信息查找带回</span>
</div>
<div class="modal-body padding0" style="height: 360px;margin-bottom: 60px;">
    <!-- 列表 start-->
    <div class="tab-pane animated fadeInDown my-tab-pane" id="goodsListBox">
        <div class="portlet col-xs-12 padding0">
            <div class="portlet-title themes-portlet-title">
                <div class="col-xs-1 padding0">
                    <img alt="搜索" src="../../../images/back/search.png">
                </div>
                <div class="col-xs-11 p-r-0">
                    <form id="goodsListForm" class="form-inline" onsubmit="return false">
                        <%--
                        <label>商品大类别</label>
                        <select name="goods_big_type_id" class="form-control input-sm">
                            <option value="">所有</option>
                            <c:forEach items="${goodsBigTypeList}" var="gbt">
                                <option ${goods.goods_big_type_id==gbt.goods_big_type_id?"selected":""} value="${gbt.goods_big_type_id}">${gbt.goods_bigl_type_name}</option>
                            </c:forEach>
                        </select>
                        --%>
                        <label>商品小类别</label>
                        <select name="goods.goods_small_type_id" class="form-control input-sm">
                            <option value="">所有</option>
                            <c:forEach items="${goodsSmallTypeList}" var="gst">
                                <option ${goods.goods_small_type_id==gst.goods_small_type_id?"selected":""} value="${gst.goods_small_type_id}">${gst.goods_small_type_name}</option>
                            </c:forEach>
                        </select>
                        <label>匹配机型</label>
                        <select disabled name="phone_small_type_id" class="form-control input-sm">
                            <option value="">所有</option>
                            <c:forEach items="${phoneSmallTypeList}" var="pst">
                                <option ${goods.phone_small_type_id==pst.goods_small_type_id?"selected":""} value="${pst.goods_small_type_id}">${pst.goods_small_type_name}</option>
                            </c:forEach>
                        </select>
                        <label>商品名称</label>
                        <input name="goods.goods_name" value="${goods.goods_name}" type="text" class="form-control input-sm" placeholder="商品名称"/>
                        <button onclick="lookupBackPaginationBreak('my_pop_modal_lg','/goodsCtrl/getLookupDataByPage')" type="button" class="btn btn-xs btn-info">
                            <i class="glyphicon glyphicon-search font-size12"></i>
                            <span>查询</span>
                        </button>
                    </form>
                </div>
            </div>
            <div class="portlet-box themes-portlet-box">
                <table class="table table-condensed table-bordered table-hover detail-table">
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
                            <%
                                pageContext.setAttribute("dataJson",JsonKit.toJson(pageContext.getAttribute("data")));
                            %>
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
                                    <button onclick='lookupBackGoodsInfo(${dataJson})' class="btn btn-xs btn-info">
                                        <i class="glyphicon glyphicon-ok font-size12"></i>
                                        <span>选择</span>
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
    <div class="pageFooter themes-pageFooter" style="margin-top: 50px;">
        <div class="pagination-select">
            <label>每页&nbsp;</label>
            <div class="select-pagesize">
                <select name="pageSize" onchange="lookupBackPaginationBreak('my_pop_modal_lg','/goodsCtrl/getLookupDataByPage')">
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
</div>

<script type="text/javascript">
    //选择带回商品信息
    function lookupBackGoodsInfo(goods){
        $('#phoneSetmealGoodsBox').append('<tr goods=\''+JSON.stringify(goods)+'\'><td>'+goods.rownum_+'</td><td>'+goods.goods_name+'</td><td>'+goods.goods_stock+'</td><td>'+goods.goods_new_price+'</td><td><div class="input-group input-group-sm digital-setting"><span onclick="minusDigital(this)" class="input-group-addon">－</span><input value="1" type="text" class="form-control" required readonly><span onclick="plusDigital(this)" class="input-group-addon">＋</span></div></td><td><img alt="商品预览图" width="25" height="25" src="'+getLocationUrl()+goods.goods_preview_image+'"/></td><td><button onclick="removeTableRow(this)" type="button" class="btn btn-xs btn-info"><i class="glyphicon glyphicon-floppy-remove font-size12"></i><span>删除</span></button></td></tr>');
        hideMyModel('pop_modal');
    }
</script>