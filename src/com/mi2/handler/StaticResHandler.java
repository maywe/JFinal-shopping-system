package com.mi2.handler;

import com.base.handler.BaseHandler;
import com.base.util.ImageUtils;
import com.base.util.StringUtils;
import com.jfinal.kit.PathKit;
import com.jfinal.kit.StrKit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

/**
 * 静态资源处理器
 *
 * @author ChenMW 2016-04-13 19:19
 */
public class StaticResHandler extends BaseHandler {

    // 默认MAX_AGE：一个月
    private static final long MAX_AGE = 20000;

    public void doHandle(String target, HttpServletRequest request, HttpServletResponse response, boolean[] isHandled) {
        String suffix = StringUtils.isExistEndWithMatches(target,".png",".jpg",".jpeg");
        if(null!=suffix){
            String imgWidth = request.getParameter("width");
            String imgHeight = request.getParameter("height");
            if(StringUtils.isNumber(imgWidth,imgHeight)){
                //判断带参数请求的图片是否存在
                String newTarget = target.replace(suffix,"")+"!"+imgWidth+"x"+imgHeight+suffix;
                if(StrKit.notBlank(newTarget)){
                    File imgResizedFile = new File(PathKit.getWebRootPath()+newTarget);
                    if(!imgResizedFile.exists()){
                        File imgOriginalFile = new File(PathKit.getWebRootPath()+target);
                        if(imgOriginalFile.exists()){
                            //生成不同尺寸的同一张图片
                            ImageUtils.resizeImage(imgOriginalFile,imgResizedFile,Integer.parseInt(imgWidth),1f);
                        }
                    }
                    try {
                        //重定向
                        response.sendRedirect(newTarget);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    return;
                }
            }
        }
        next.handle(target, request, response, isHandled);

        /*
        // 最后修改时间
        long ims = request.getDateHeader("If-Modified-Since");
        long now = System.currentTimeMillis();
        // 进一步ETag文件MD5比较"If-None-Match" eq "ETag"
        // String token = request.getHeader("If-None-Match");
        // 如果header头没有过期
        if(ims + MAX_AGE > now){
            isHandled[0] = true;
            response.setStatus(HttpServletResponse.SC_NOT_MODIFIED);
            return;
        }
        next.handle(target, request, response, isHandled);
        // 去除对页面的缓存，造成后台进不去
        // 验证是否静态文件 静态文件缓存30天
        if(target.indexOf(".") > 0 || target.endsWith("/combo")){
            // 新生成http cache头信息
            response.setHeader("ETag", StrKit.getTonken());
            response.setHeader("Cache-Control", "max-age=" + MAX_AGE);
            response.addDateHeader("Expires", now + MAX_AGE);
            response.addDateHeader("Last-Modified", now);
        }
        */

    }




}
