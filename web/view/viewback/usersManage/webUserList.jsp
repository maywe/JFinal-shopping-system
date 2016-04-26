<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 网站用户管理 -->
<!-- 列表 start-->
<div class="tab-pane animated fadeInDown my-tab-pane" id="webUserListBox">
    <div class="portlet col-xs-12 padding0">
        <div class="portlet-title themes-portlet-title">
            <div class="col-xs-1 padding0">
                <img alt="搜索" src="../../../images/back/search.png">
            </div>
            <div class="col-xs-11 p-r-0">
                <form id="webUserListForm" class="form-inline" onsubmit="return false">
                    <label>关键字</label>
                    <input name="search_key" value="${usersFront.search_key}" type="text" class="form-control input-sm" placeholder="账号/姓名/电话/邮箱"/>
                    <label>用户状态</label>
                    <select name="usersFront.user_status" class="form-control input-sm">
                        <option value="">所有</option>
                        <option ${usersFront.user_status=="0"?"selected":""} value="0">正常</option>
                        <option ${usersFront.user_status=="1"?"selected":""} value="1">冻结</option>
                    </select>
                    <a data-backdrop="static" data-whatever="增加网站用户" data-toggle="modal" href="${pageContext.request.contextPath}/webUserCtrl/addRequest.action" data-target="#pop_modal" class="btn btn-xs btn-info pull-right" style="margin-top:3px;">
                        <i class="glyphicon glyphicon-plus font-size12"></i>
                        <span>新增</span>
                    </a>
                    <button onclick="paginationBreak('webUserListBox')" type="button" class="btn btn-xs btn-info">
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
                        <th>登录账号</th>
                        <th>用户姓名</th>
                        <th>用户性别</th>
                        <th>联系电话</th>
                        <th>邮箱地址</th>
                        <th>用户生日</th>
                        <th>用户昵称</th>
                        <th>用户头像</th>
                        <th>用户状态</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${pageUtil.list}" var="data" varStatus="status">
                        <tr>
                            <td>${status.count}</td>
                            <td>${data.login_name}</td>
                            <td>${data.name}</td>
                            <td>${data.sex}</td>
                            <td>${data.telephone}</td>
                            <td>${data.email}</td>
                            <td><fmt:formatDate value="${data.birthday}" pattern="yyyy-MM-dd"/></td>
                            <td>${data.nickname}</td>
                            <td><img alt="用户头像" width="25" height="25" src="${pageContext.request.contextPath}${data.img}?width=25&height=25"/></td>
                            <td>${data.user_status=='0'?"正常":"冻结"}</td>
                            <td>
                                <a data-backdrop="static" data-whatever="查看网站用户" data-toggle="modal" href="${pageContext.request.contextPath}/webUserCtrl/showRequest.action?usersFront.user_front_id=${data.user_front_id}" data-target="#pop_modal" class="btn btn-xs btn-info">
                                    <i class="glyphicon glyphicon-share-alt font-size12"></i>
                                    <span>查看</span>
                                </a>
                                <a data-backdrop="static" data-whatever="修改网站用户" data-toggle="modal" href="${pageContext.request.contextPath}/webUserCtrl/updateRequest.action?usersFront.user_front_id=${data.user_front_id}" data-target="#pop_modal" class="btn btn-xs btn-info">
                                    <i class="glyphicon glyphicon-pencil font-size12"></i>
                                    <span>修改</span>
                                </a>
                                <button onclick="deleteCallSubmit(this,'/webUserCtrl/deleteData','webUserListBox',{'usersFront.user_front_id':${data.user_front_id}})" type="button" class="btn btn-xs btn-info" data-deleteInfo="删除后不可恢复!您确定要删除?">
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
            <select name="pageSize" onchange="paginationBreak('webUserListBox')">
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

