package com.base.util;

import java.io.Closeable;
import java.io.IOException;

/**
 *
 * Release.java:公共释放类
 * @author CMW
 *
 */
public class Release {
	/**
	 * Closeable接口：Closeable 是可以关闭的数据源或目标。
	 * 				   调用 close 方法可释放对象保存的资源（如打开文件）。
	 * 				 (Buffered类型的流都已经实现本接口)
	 */
	public static void close(Closeable...strs){	//三个点的语法

		for(Closeable s : strs){					//必须先遍历
			if(s != null){
				try {
					s.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}


}
