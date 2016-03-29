<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 系统用户管理 -->
<!-- 列表 start-->
<div class="tab-pane animated fadeInDown my-tab-pane" id="sysUserListBox">
    <div class="portlet col-xs-12 padding0">
        <div class="portlet-title themes-portlet-title">
            <div class="col-xs-1 padding0">
                <img alt="搜索" src="../../../images/search.png">
            </div>
            <div class="col-xs-11 p-r-0">
                <form id="sysUserListForm" class="form-inline" onsubmit="return false">
                    <label>关键字</label>
                    <input name="search_key" value="${usersBackstage.search_key}" type="text" class="form-control input-sm" placeholder="用户账号/用户姓名"/>
                    <label>用户状态</label>
                    <select name="usersBackstage.status" class="form-control input-sm">
                        <option value="">所有</option>
                        <option ${usersBackstage.status=="0"?"selected":""} value="0">正常</option>
                        <option ${usersBackstage.status=="1"?"selected":""} value="1">冻结</option>
                    </select>
                    <a data-backdrop="static" data-whatever="增加系统用户" data-toggle="modal" href="${pageContext.request.contextPath}/sysUserCtrl/addRequest.action" data-target="#pop_modal" class="btn btn-xs btn-info pull-right" style="margin-top:3px;">
                        <i class="glyphicon glyphicon-plus font-size12"></i>
                        <span>新增</span>
                    </a>
                    <button onclick="paginationBreak('sysUserListBox')" type="button" class="btn btn-xs btn-info">
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
                        <th>用户角色</th>
                        <th>用户姓名</th>
                        <th>用户性别</th>
                        <th>联系电话</th>
                        <th>用户昵称</th>
                        <th>用户状态</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${pageUtil.list}" var="ub" varStatus="status">
                        <tr>
                            <td>${status.count}</td>
                            <td>${ub.sys_user_name}</td>
                            <td>
                                <c:forEach items="${sysRoleGroupList}" var="srg">
                                    <c:if test="${ub.role_group_id==srg.role_group_id}">
                                        ${srg.role_group_name}
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td>${ub.name}</td>
                            <td>${ub.sex}</td>
                            <td>${ub.telephone}</td>
                            <td>${ub.nickname}</td>
                            <td>${ub.status=="0"?"正常":"冻结"}</td>
                            <td>
                                <a data-backdrop="static" data-whatever="查看系统用户" data-toggle="modal" href="${pageContext.request.contextPath}/sysUserCtrl/showRequest.action?usersBackstage.users_backstage_id=${ub.users_backstage_id}" data-target="#pop_modal" class="btn btn-xs btn-info">
                                    <i class="glyphicon glyphicon-share-alt font-size12"></i>
                                    <span>查看</span>
                                </a>
                                <a data-backdrop="static" data-whatever="修改系统用户" data-toggle="modal" href="${pageContext.request.contextPath}/sysUserCtrl/updateRequest.action?usersBackstage.users_backstage_id=${ub.users_backstage_id}" data-target="#pop_modal" class="btn btn-xs btn-info">
                                    <i class="glyphicon glyphicon-pencil font-size12"></i>
                                    <span>修改</span>
                                </a>
                                <button onclick="deleteCallSubmit(this,'/sysUserCtrl/deleteData','sysUserListBox',{'usersBackstage.users_backstage_id':${ub.users_backstage_id}})" type="button" class="btn btn-xs btn-info" data-deleteInfo="删除后不可恢复!您确定要删除?">
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
            <select name="pageSize" onchange="paginationBreak('sysUserListBox')">
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

