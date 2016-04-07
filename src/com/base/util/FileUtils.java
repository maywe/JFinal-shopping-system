package com.base.util;

import com.jfinal.kit.StrKit;
import sun.misc.BASE64Decoder;

import java.io.File;
import java.io.FileOutputStream;

/**
 * 文件处理工具类
 *
 * @author ChenMW 2016-03-31 10:35
 */
public class FileUtils {

    /**
     * 将base64编码的图片字符串，转换成图片
     * @param imgBase64Str          //base64编码的字符串
     * @param imgPath               //图片保存路径
     * @param imgName               //图片名称
     * @return                      //返回图片文件
     */
    public static File saveToImgByBase64Str(String imgBase64Str, String imgPath, String imgName) {
        //可以是任何图片格式.jpg,.png等
        File imgFile = new File(imgPath,imgName);
        if (StrKit.notBlank(imgBase64Str, imgPath, imgName)) {
            //对字节数组字符串进行Base64解码并生成图片
            FileOutputStream fos= null;
            try {
                byte b[] = new BASE64Decoder().decodeBuffer(imgBase64Str);
                for (int i = 0; i < b.length; i++) {
                    // 调整异常数据
                    if (b[i] < 0) {
                        b[i] += 256;
                    }
                }
                fos = new FileOutputStream(imgFile);
                fos.write(b);
                fos.flush();
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }finally {
                Release.close(fos);
            }
        }
        return imgFile;
    }
}
