package com.base.util;

import com.base.annotation.RouteBind;
import com.jfinal.config.Routes;
import com.jfinal.kit.Prop;

import java.io.File;
import java.util.List;

/**
 * Routes 工具类 自动绑定Controller
 */
public class RouteBindUtil{
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static void add(Routes me,Prop dbProp){
		List<Class<?>> list= ClassSearcherUtil.findClass("/com/mi2/ctrl",dbProp);
		if(list!=null&&!list.isEmpty()){
			for(Class clz:list){
				RouteBind rb=(RouteBind)clz.getAnnotation(RouteBind.class);
				if(rb!=null){
					String clzDir=(new File(clz.getResource("").getPath())).getName();
					if("ctrl".equals(clzDir)){
						clzDir="";
					}else{
						clzDir+="/";
					}
					String route = dbProp.get("basePath","");
					route += rb.path().startsWith("/")?rb.path():(clzDir+rb.path());
					System.out.println("Add Route:"+route + " Class:" + clz.getName() + " ViewPath:" + rb.viewPath());
					me.add(route,clz,rb.viewPath());
				}
			}
		}
	}
	
}
