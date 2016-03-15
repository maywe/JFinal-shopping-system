<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <i class="glyphicon glyphicon-remove font-size16"></i>
    </button>
    <img alt="弹出框" src="../../../images/diatopicon.png" style="vertical-align: middle">
    <span class="modal-title font-size16">增加角色</span>
</div>
<div class="modal-body">
    <form id="sysRoleDialogFrom" class="form-horizontal" role="form" onsubmit="return sysRoleSubmit(this)">
        <input value="${sysRoleGroup.role_group_id}" name="sysRoleGroup.role_group_id" type="hidden">
        <div class="tab-pane active">
            <table class="table dialog-table">
                <tr>
                    <th><span class="must-msg">*&nbsp;</span>角色名称:</th>
                    <td>
                        <input value="${sysRoleGroup.role_group_name}" name="sysRoleGroup.role_group_name" type="text" class="form-control" placeholder="角色名称" required="required" maxlength="32">
                    </td>
                </tr>
                <tr>
                    <th>角色描述:</th>
                    <td>
                        <textarea name="sysRoleGroup.role_group_desc" class="form-control" maxlength="200" placeholder="角色描述">${sysRoleGroup.role_group_desc}</textarea>
                    </td>
                </tr>
            </table>
            <h4 class="p-l">权限列表:</h4>
            <div style="height: 300px;" id="myMenuTree" class="myTree p-l-lg"></div>
        </div>
    </form>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-xs btn-info" data-dismiss="modal">
        <i class="glyphicon glyphicon-remove font-size12"></i>
        <span>关闭</span>
    </button>
    <button type="submit" form="sysRoleDialogFrom" class="btn btn-xs btn-info">
        <i class="glyphicon glyphicon-ok font-size12"></i>
        <span>提交</span>
    </button>
</div>
<script type="text/javascript">
    $(function(){
        //获取菜单树
        //1、获得jsonData数据
        var sysMenuList = '${sysMenuList}';
        var jsonData = eval(sysMenuList);
        //2、json格式转树状结构
        var jsonTreeData = transData(jsonData, 'menu_id', 'menu_parent_id', 'children');
        var myMenuTreeObj = $("#myMenuTree");
        myMenuTreeObj.bootstraptree({
            jsonTreeData:jsonTreeData,
            checkBox:true,
            click:function(a){
                myMenuTreeObj.mCustomScrollbar("update");
            }
        });
        //创建自定义滚动条
        myMenuTreeObj.mCustomScrollbar({
            scrollButtons:{
                enable:true
            },
            theme:"dark-2"
        });


        var command = '${command}';
        if(command=='showRequest'){
            disabledDialogForm('sysRoleDialogFrom');
        }
    });

    function sysRoleSubmit(form){
        var command = '${command}';
        if(command=='addRequest'){
            callSubmit('/sysRoleCtrl/addData',$(form).attr('id'),'sysRoleListBox');
        }else if(command=='updateRequest'){
            callSubmit('/sysRoleCtrl/updateData',$(form).attr('id'),'sysRoleListBox');
        }
        return false;
    }
</script>
