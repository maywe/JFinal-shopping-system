/**
 * Created by ChenMW on 2016-01-28.
 * 系统初始化UI代码
 */

//系统加载初始化
function initUI(){
    //初始化系统时间
    initSystemTime();
    //开启插件与系统导航点击事件
    openPlugins();
    //自动计算标签页的显示数目
    autoCountTabsShow();
}

//1、初始化系统时间
function initSystemTime(){
    // 对Date的扩展，将 Date 转化为指定格式的String
    // 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
    // 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
    // 例子：
    // (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
    // (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
    Date.prototype.Format = function(fmt){
        //author: meizz
        var o = {
            "M+" : this.getMonth()+1,                 //月份
            "d+" : this.getDate(),                    //日
            "h+" : this.getHours(),                   //小时
            "m+" : this.getMinutes(),                 //分
            "s+" : this.getSeconds(),                 //秒
            "q+" : Math.floor((this.getMonth()+3)/3), //季度
            "S"  : this.getMilliseconds()             //毫秒
        };
        if(/(y+)/.test(fmt))
            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
        for(var k in o)
            if(new RegExp("("+ k +")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        return fmt;
    };
    //时钟
    setInterval(function() {
        $('#'+initSeting.ids.systemTimeId).html(new Date().Format("yyyy-MM-dd hh:mm:ss"));
    }, 1000);
}

//2、自动计算标签页的显示
function autoCountTabsShow(command){
    var navBackward = $('#'+initSeting.ids.tabsBackwardId);
    var navForward = $('#'+initSeting.ids.tabsForwardId);
    var liTabs = $('#'+initSeting.ids.tabsId).children('li[data-tab="true"]');

    //2.1、计算左滑动按钮与滑动按钮之间的距离
    var tabsWidth = navForward.offset().left - navBackward.offset().left;
    var lastTabsWith = liTabs.last().offset().left - navBackward.offset().left;

    //2.2、隐藏与显示
    if(lastTabsWith<0 || tabsWidth-100<=lastTabsWith || command=='forward'){
        var showTabIndex = lookupShowTab(liTabs);
        var leftFristShowIndex=showTabIndex.leftFristShowIndex;
        var rightFirstShowIndex=showTabIndex.rightFirstShowIndex;

        if(leftFristShowIndex==0&&rightFirstShowIndex==0){
            return;
        }
        if(command=='backward'){
            if(leftFristShowIndex>0){
                liTabs.eq(leftFristShowIndex).hide();
            }
            if(rightFirstShowIndex<liTabs.length-1){
                liTabs.eq(rightFirstShowIndex+1).show();
            }
        }else if(tabsWidth-100>lastTabsWith&&command=='forward'){
            if(leftFristShowIndex>0||rightFirstShowIndex==liTabs.length-1){
                liTabs.eq(leftFristShowIndex-1).show();
            }
            if(leftFristShowIndex!=1&&rightFirstShowIndex<=liTabs.length-1){
                liTabs.eq(rightFirstShowIndex).hide();
            }
        }
    }
}

//3、查找显示的标签(第一个和最后一个)
function lookupShowTab(liTabs){
    var leftFristShowIndex=0,rightFirstShowIndex= 0,currenActiveIndex=0;
    for(var i=0;i<liTabs.length;i++){
        if(leftFristShowIndex>0){break;}
        if(leftFristShowIndex==0){
            //找到左边第一个显示的tabindex
            if(liTabs.eq(i).css('display')!='none'){
                leftFristShowIndex = i;
            }
        }
    }
    for(i=liTabs.length-1;i>=0;i--){
        if(rightFirstShowIndex>0){break;}
        if(rightFirstShowIndex==0){
            //找到右边边第一个显示的tabindex
            if(liTabs.eq(i).css('display')!='none'){
                rightFirstShowIndex = i;
            }
        }
    }
    for(i=0;i<liTabs.length;i++){
        if(currenActiveIndex>0){break;}
        if(currenActiveIndex==0){
            //找到当前选中的标签页tabindex
            if(liTabs.eq(i).attr('class').indexOf('active')>-1){
                currenActiveIndex = i;
            }
        }
    }
    var showTabIndex={};
    showTabIndex.leftFristShowIndex=leftFristShowIndex;
    showTabIndex.rightFirstShowIndex=rightFirstShowIndex;
    showTabIndex.currenActiveIndex=currenActiveIndex;
    return showTabIndex;
}

//4、开启插件与系统导航点击事件
function openPlugins(){
    //开启工具提示插件
    $("[data-toggle='tooltip']").tooltip();

    //开启导航栏点击事件
    $('#'+initSeting.ids.navOpenId).click(function(){
        $(this).parent('nav').removeClass('block').addClass('none');
        $('#'+initSeting.ids.navCloseId).parent('nav').removeClass('none').addClass('block');
        $('#'+initSeting.ids.containerContentId).removeClass('container-content_p-l-40').addClass('container-content_p-l-250');
        $('#'+initSeting.ids.tabsBackwardId).removeClass('nav-backward_m-l-45').addClass('nav-backward_m-l-255');
    });
    $('#'+initSeting.ids.navCloseId).click(function(){
        $(this).parent('nav').removeClass('block').addClass('none');
        $('#'+initSeting.ids.navOpenId).parent('nav').removeClass('none').addClass('block');
        $('#'+initSeting.ids.containerContentId).removeClass('container-content_p-l-250').addClass('container-content_p-l-40');
        $('#'+initSeting.ids.tabsBackwardId).removeClass('nav-backward_m-l-255').addClass('nav-backward_m-l-45');
    });
}

//5、开启菜单项点击在标签页中显示
function openMenuItemToTabs(a){
    var tabTitle = $(a).children('label').html();
    var tabsObj = $("#"+initSeting.ids.tabsId);
    var tabContentObj = $('#'+initSeting.ids.containerPagesId).find('div.tab-content');
    //判断标签页是否已经存在
    var liTabs = tabsObj.children('li[data-tab="true"]');
    for(var i=0;i<liTabs.length;i++){
        var liTab = liTabs.eq(i);
        if(liTab.children('a').text()==tabTitle){
            tabContentObj.children().removeClass('active');
            var tabId = liTab.children('a').attr('href');
            $(tabId).addClass('active');
            liTabs.removeClass('active');
            liTab.addClass('active');
            gotoCurrentActiveTab(lookupShowTab(liTabs));
            return null;
        }
    }

    var tabContentId = 'tab_page_content_'+new Date().getTime();
    tabContentObj.children().removeClass('active');
    tabContentObj.append('<div id="'+tabContentId+'" class="tab-pane animated fadeInRight active"></div>');
    autoCountTabsShow('backward');

    liTabs.removeClass('active');
    tabsObj.append('<li data-tab="true" class="animated fadeInRight active"><a href="#'+tabContentId+'" data-toggle="tab">'+tabTitle+'<i class="glyphicon glyphicon-remove" onclick="closeTabs(this,\'self\')"></i></a></li>');

    //加载菜单项对应的页面
    if($(a).attr('rel')!='#'){
        $('#'+tabContentId).callLoad($(a).attr('rel'),{},function(){
            initTabContentInfo(tabContentId);
            initPaginationData(tabContentId);
        });
    }
    return tabContentId;
}

//6、关闭标签页方法
function closeTabs(obj,command){
    var liTabs = $('#'+initSeting.ids.tabsId).children('li[data-tab="true"]');
    if(command=='self'){
        var targetLi = $(obj).parent('a').parent('li');
        if(targetLi.attr('class').indexOf('active')>-1){
            targetLi.prev('li').addClass('active');
            var showTabId = targetLi.prev('li').children('a').attr('href');
            $(showTabId).addClass('active');
        }
        var removeTabId = $(obj).parent('a').attr('href');
        $(removeTabId).remove();
        targetLi.remove();

        //显示左右两边的标签页
        var showTabIndex = lookupShowTab(liTabs);
        liTabs.eq(showTabIndex.leftFristShowIndex-1).show();
        liTabs.eq(showTabIndex.rightFirstShowIndex+1).show();
    }else if(command=='all'){
        liTabs.each(function(i){
            if(i>1){
                $(liTabs.eq(i).children('a').attr('href')).remove();
                liTabs.eq(i).remove();
            }
            liTabs.eq(1).show();
            liTabs.eq(1).addClass('active');
            $(liTabs.eq(1).children('a').attr('href')).addClass('active');
        });
    }else if(command=='notSelf'){
        liTabs.each(function(i){
            if(i>1) {
                if (liTabs.eq(i).attr('class').indexOf('active') == -1) {
                    $(liTabs.eq(i).children('a').attr('href')).remove();
                    liTabs.eq(i).remove();
                }else{
                    liTabs.eq(i).show();
                }
            }
        });
    }else if(command=='gotoCurrentActiveTab'){
        //定位当前选中标签页
        gotoCurrentActiveTab(lookupShowTab(liTabs));
    }
}

//7、定位当前选中标签页
function gotoCurrentActiveTab(showTabIndex){
    var liTabs = null;
    if(showTabIndex.currenActiveIndex<showTabIndex.leftFristShowIndex){
        autoCountTabsShow('forward');
        liTabs = $('#'+initSeting.ids.tabsId).children('li[data-tab="true"]');
    }else if(showTabIndex.currenActiveIndex>showTabIndex.rightFirstShowIndex){
        autoCountTabsShow('backward');
        liTabs = $('#'+initSeting.ids.tabsId).children('li[data-tab="true"]');
    }
    if(liTabs!=null&&liTabs.eq(showTabIndex.currenActiveIndex).css('display')=='none'){
        gotoCurrentActiveTab(lookupShowTab(liTabs));
    }
}

//8、初始化加载进来的标签的高度，适配不同浏览器的展现内容
function initTabContentInfo(tabContentId){
    var tabContentObj = $('#'+tabContentId);
    var tab_content_height = $('#'+initSeting.ids.footerId).offset().top - tabContentObj.offset().top - 5;
    tabContentObj.css('height',tab_content_height+'px');
    tabContentObj.css('paddingBottom','45px');
}

