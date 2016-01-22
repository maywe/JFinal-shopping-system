/**
 * Created by CMW on 2016-01-19.
 */
$(function(){
    $.fn.extend({
        bootstraptree:function(options){
            //1、初始化参数
            var option = $.extend({
                jsonTreeData:'',
                openTree:true,
                click:function(a){

                },
                dblclick:function(a){

                }
            },options);

            //2、在参数对象中添加对当前菜单树的引用，以便在对象中使用该菜单树
            option.tree=this;

            //生成树的DOM结构
            var htmlStr = '';
            option.initTreeData=function(jsonTreeData){
                htmlStr += '<ul aria-expanded='+option.openTree+'>';
                for(var i=0;i<jsonTreeData.length;i++){
                    if(jsonTreeData[i]["children"]){
                        var tmpStr = '<li><a rel="#"><i></i>&nbsp;&nbsp;<label>'+jsonTreeData[i]["name"]+'</label><span></span></a></li>';
                        htmlStr += tmpStr;
                        option.initTreeData(jsonTreeData[i]["children"]);
                    }else{
                        var tmpStr = '<li><a rel="#"><i></i>&nbsp;&nbsp;<label>'+jsonTreeData[i]["name"]+'</label><span></span></a></li>';
                        htmlStr += tmpStr;
                    }
                }
                htmlStr += '</ul>';
                return htmlStr;
            };

            //3、初始化菜单展开状态，以及分叉节点的样式
            option.init=function(){
                //树型初始化参数，生成树型菜单的dom结构
                if(option.jsonTreeData){
                    option.tree.html(option.initTreeData(option.jsonTreeData));
                }

                //隐藏所有子级菜单
                var ul_all = option.tree.find('ul ul');
                ul_all.hide();

                //设置所有 a 标签中的样式
                //设置节点“是否包含子节点”属性，true为包含，false为不包含
                var a_all = option.tree.find('li>a');
                a_all.attr('hasChild',false);
                option.tree.find('ul').prev('li').children('a').attr('hasChild',true);

                a_all.children('i').addClass('glyphicon glyphicon-file');
                a_all.children('label').addClass('nav-label');
                a_all.children('span').addClass('glyphicon pull-right');

                option.tree.find('ul').addClass('nav animated fadeInRight');
                ul_all.prev('li').children('a').children('i').removeClass('glyphicon-file').addClass('glyphicon-folder-close');
                ul_all.prev('li').children('a').children('span').addClass('glyphicon-menu-left');

                //显示 show 属性为 true 的子级菜单
                var ul_show = option.tree.find('ul ul[aria-expanded="true"]');
                ul_show.show();
                ul_show.prev('li').children('a').children('i').removeClass('glyphicon-folder-close').addClass('glyphicon-folder-open');
                ul_show.prev('li').children('a').children('span').removeClass('glyphicon-menu-left').addClass('glyphicon-menu-down');

            }/* option.init() End */

            //3、初始化菜单
            option.init();

            //4、菜单项 <a> 接受单击
            this.find('li>a').click(function(){
                //呈现选中状态
                option.tree.find('li>a').css('backgroundColor','');
                $(this).css('backgroundColor','rgb(38,57,73)');

                var ul_one = $(this).parent().next('ul');
                var aria_expanded = ul_one.attr('aria-expanded');
                if(aria_expanded!=undefined){
                    if(aria_expanded=='true'){
                        ul_one.attr('aria-expanded','false');
                        $(this).children('i').removeClass('glyphicon-folder-open').addClass('glyphicon-folder-close');
                        $(this).children('span').removeClass('glyphicon-menu-down').addClass('glyphicon-menu-left');
                        $(this).parent().next('ul').hide();
                    }else{
                        ul_one.attr('aria-expanded','true');
                        $(this).children('i').removeClass('glyphicon-folder-close').addClass('glyphicon-folder-open');
                        $(this).children('span').removeClass('glyphicon-menu-left').addClass('glyphicon-menu-down');
                        $(this).parent().next('ul').show();
                    }
                }

                //如果获取的超链接不是 undefined，则触发单击
                var a=$(this);
                if(typeof(a)!='undefined'){
                    option.click(a);
                }
            });
        }/* SimpleTree Function End */
    });;
});


/**
 * json格式转树状结构
 * @param   {json}      json数据
 * @param   {String}    id的字符串
 * @param   {String}    父id的字符串
 * @param   {String}    children的字符串
 * @return  {Array}     数组
 */
function transData(jsonData, id, pid, children){
    var jsonTreeData = [], hash = {};
    for(var i = 0; i < jsonData.length; i++){
        hash[jsonData[i][id]] = jsonData[i];
    }
    for(var j=0; j < jsonData.length; j++){
        var jsonDataVal = jsonData[j];
        var hashVP = hash[jsonDataVal[pid]];
        if(hashVP){
            !hashVP[children] && (hashVP[children] = []);
            hashVP[children].push(jsonDataVal);
        }else{
            jsonTreeData.push(jsonDataVal);
        }
    }
    return jsonTreeData;
}
