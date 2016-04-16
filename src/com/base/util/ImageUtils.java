package com.base.util;

import com.jfinal.kit.StrKit;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import sun.misc.BASE64Decoder;

import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.image.ConvolveOp;
import java.awt.image.Kernel;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * 文件处理工具类
 *
 * @author ChenMW 2016-03-31 10:35
 */
public class ImageUtils {

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

    //多图合并方法
    public static void mergeImage(String file1Path, String file2Path,String outFilePath){
        try {
            BufferedImage image1 = ImageIO.read(new File(file1Path));
            BufferedImage image2 = ImageIO.read(new File(file2Path));

            BufferedImage combined = new BufferedImage(image1.getWidth()*2, image1.getHeight(), BufferedImage.TYPE_INT_RGB);

            // paint both images, preserving the alpha channels
            Graphics g = combined.getGraphics();
            g.drawImage(image1, 0, 0, null);
            g.drawImage(image2, image1.getWidth(), 0, null);

            // Save as new image
            ImageIO.write(combined, "JPG", new File(outFilePath));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void resizeImage(File originalFile, File resizedFile, int newWidth, float quality) {
        if (quality > 1) {
            quality = 1f;
        }
        try {
            ImageIcon imageIcon = new ImageIcon(originalFile.getCanonicalPath());
            Image image = imageIcon.getImage();
            Image resizedImage;

            int iWidth = image.getWidth(null);
            int iHeight = image.getHeight(null);

            if (iWidth > iHeight) {
                resizedImage = image.getScaledInstance(newWidth, (newWidth * iHeight) / iWidth, Image.SCALE_SMOOTH);
            } else {
                resizedImage = image.getScaledInstance((newWidth * iWidth) / iHeight, newWidth, Image.SCALE_SMOOTH);
            }

            // This code ensures that all the pixels in the image are loaded.
            Image temp = new ImageIcon(resizedImage).getImage();

            // Create the buffered image.
            BufferedImage bufferedImage = new BufferedImage(temp.getWidth(null), temp.getHeight(null), BufferedImage.TYPE_INT_RGB);

            // Copy image to buffered image.
            Graphics g = bufferedImage.createGraphics();

            // Clear background and paint the image.
            g.setColor(Color.white);
            g.fillRect(0, 0, temp.getWidth(null), temp.getHeight(null));
            g.drawImage(temp, 0, 0, null);
            g.dispose();

            // Soften.
            float softenFactor = 0.05f;
            float[] softenArray = { 0, softenFactor, 0, softenFactor, 1 - (softenFactor * 4), softenFactor, 0, softenFactor, 0 };
            Kernel kernel = new Kernel(3, 3, softenArray);
            ConvolveOp cOp = new ConvolveOp(kernel, ConvolveOp.EDGE_NO_OP, null);
            bufferedImage = cOp.filter(bufferedImage, null);

            // Write the jpeg to a file.
            FileOutputStream out = new FileOutputStream(resizedFile);

            // Encodes image as a JPEG data stream
            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);

            JPEGEncodeParam param = encoder.getDefaultJPEGEncodeParam(bufferedImage);

            param.setQuality(quality, true);

            encoder.setJPEGEncodeParam(param);
            encoder.encode(bufferedImage);
        }catch (IOException e){
            e.printStackTrace();
        }
    }

    public static void main(String args[]) {
        /*
        Long star = System.currentTimeMillis();

        ImageUtils.mergeImage("C:\\Users\\ChenMW\\Desktop\\img\\1.jpg",
                "C:\\Users\\ChenMW\\Desktop\\img\\2.jpg",
                "C:\\Users\\ChenMW\\Desktop\\img\\out1_pic.jpg");
        Long end =System.currentTimeMillis();
        System.out.print("time====:"+(end-star));
*/
        File originalImage = new File("C:\\Users\\ChenMW\\Desktop\\img\\T1Ax_vB_Kv1RXrhCrK.jpg");
        ImageUtils.resizeImage(originalImage, new File("C:\\Users\\ChenMW\\Desktop\\img\\1207-2.jpg"),900, 0.7f);
        ImageUtils.resizeImage(originalImage, new File("C:\\Users\\ChenMW\\Desktop\\img\\1207-3.jpg"),900, 1f);
    }
}
