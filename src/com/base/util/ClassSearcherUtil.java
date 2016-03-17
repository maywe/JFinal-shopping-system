package com.base.util;

import com.jfinal.kit.Prop;
import com.jfinal.kit.StrKit;
import org.apache.log4j.Logger;

import java.io.File;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

/**
 * 类查找
 */
public class ClassSearcherUtil {

	private static Logger log=Logger.getLogger(ClassSearcherUtil.class);
	/**
	 * 递归查找文件
	 * @param baseDirName
	 *            查找的文件夹路径
	 * @param targetFileName
	 *            需要查找的文件名
	 */
	public static List<File> findFiles(String baseDirName,String targetFileName,List<File> classFiles) {
		/**
		 * 算法简述： 从某个给定的需查找的文件夹出发，搜索该文件夹的所有子文件夹及文件，
		 * 若为文件，则进行匹配，匹配成功则加入结果集，若为子文件夹，则进队列。 队列不空，重复上述操作，队列为空，程序结束，返回结果。
		 */
		String tempName = null;
		// 判断目录是否存在
		baseDirName=baseDirName.replaceAll("%20", " ");
		File baseDir = new File(baseDirName);
		if (!baseDir.exists() || !baseDir.isDirectory()) {
			log.error("文件查找失败：" + baseDirName + "不是一个目录！");
		} else {
			File[] filelist = baseDir.listFiles();
			if(filelist!=null)
			for(File f:filelist){
				if(f.isDirectory()==true){
					findFiles(f.getPath(),targetFileName,classFiles);
				}else{
					tempName = f.getName();
					if (ClassSearcherUtil.wildcardMatch(targetFileName, tempName)) {
						classFiles.add(f.getAbsoluteFile());
					}
				}
			}
		}
		return classFiles;
	}
	/**
	 * 通过父类查找
	 * @param clazz 父类
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public static List<Class> findClasses(Class clazz,String strFilePath) {
		List<Class> classList = new ArrayList<Class>();
		if(StrKit.isBlank(strFilePath)) strFilePath="/";
		URL classPathUrl = ClassSearcherUtil.class.getResource(strFilePath);
		List<File> classFileList=new ArrayList<File>();
		findFiles(classPathUrl.getFile(), "*.class",classFileList);
		for (File classFile : classFileList) {
			String className = className(classFile, "/classes");
			try {
				Class<?> classInFile = Class.forName(className);
				if (classInFile.getSuperclass() == clazz) {
					classList.add(classInFile);
				}
			} catch (ClassNotFoundException e) {
				log.error("未找到类："+className,e);
			}
		}
		return classList;
	}
	
	@SuppressWarnings("rawtypes")
	public static List<Class> findClasses(Prop dbProp) {
		List<Class> classList = new ArrayList<Class>();
		URL classPathUrl = ClassSearcherUtil.class.getResource("/");
		List<File> classFileList=new ArrayList<File>();
		findFiles(classPathUrl.getFile(), "*.class",classFileList);
		String package_=dbProp.get("package","");
		for (File classFile : classFileList) {
			String className = className(classFile, "/classes");
			try {
				if(className.startsWith(package_)){
					Class<?> classInFile = Class.forName(className);
					classList.add(classInFile);
				}
			} catch (Exception e) {
				continue;
			}
		}
		return classList;
	}
	
	/**
	 * 取得某个文件下所有的类
	 * @param strFilePath
	 * @return
	 */
	public static List<Class<?>> findClass(String strFilePath,Prop dbProp){
		
		List<Class<?>> classList = new ArrayList<Class<?>>();
		if(StrKit.isBlank(strFilePath)){
			strFilePath="/";
		}
		
		URL classPathUrl= ClassSearcherUtil.class.getResource(strFilePath);
		List<File> classFileList=new ArrayList<File>();
		findFiles(classPathUrl.getFile(), "*.class",classFileList);
		String package_=dbProp.get("package","");
		for (File classFile : classFileList) {
			String className = className(classFile, "/classes");
			try {
				if(className.startsWith(package_)){
					Class<?> classInFile = Class.forName(className);
					classList.add(classInFile);
				}
			} catch (Exception e) {
				continue;
			}
		}
		return classList;
	}
	
 	private static String className(File classFile, String pre) {
		String objStr = classFile.toString().replaceAll("\\\\", "/");
		String className;
		className = objStr.substring(objStr.indexOf(pre) + pre.length(),
		objStr.indexOf(".class"));
		if (className.startsWith("/")) {
			className = className.substring(className.indexOf("/") + 1);
		}
		return className.replaceAll("/", ".");
	}
	/**
	 * 通配符匹配
	 * @param pattern
	 *            通配符模式
	 * @param str
	 *            待匹配的字符串
	 * @return 匹配成功则返回true，否则返回false
	 */
	private static boolean wildcardMatch(String pattern, String str) {
		int patternLength = pattern.length();
		int strLength = str.length();
		int strIndex = 0;
		char ch;
		for (int patternIndex = 0; patternIndex < patternLength; patternIndex++) {
			ch = pattern.charAt(patternIndex);
			if (ch == '*') {
				// 通配符星号*表示可以匹配任意多个字符
				while (strIndex < strLength) {
					if (wildcardMatch(pattern.substring(patternIndex + 1),
					str.substring(strIndex))) {
						return true;
					}
					strIndex++;
				}
			} else if (ch == '?') {
				// 通配符问号?表示匹配任意一个字符
				strIndex++;
				if (strIndex > strLength) {
					// 表示str中已经没有字符匹配?了。
					return false;
				}
			} else {
				if ((strIndex >= strLength) || (ch != str.charAt(strIndex))) {
					return false;
				}
				strIndex++;
			}
		}
		return (strIndex == strLength);
	}
}