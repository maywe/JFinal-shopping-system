/**
 * 小米前台公共js
 * Created by ChenMW on 2016-04-09.
 *
 */

//激活函数、选中函数（专门用于ul+li的激活）
function activeFun(obj,activeCss){
    $(obj).parent('ul').children('li').removeClass(activeCss);
    $(obj).addClass(activeCss);
}