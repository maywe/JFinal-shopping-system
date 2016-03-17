package com.base.annotation;

import java.lang.annotation.*;

/**
 * Route 绑定Controller注解
 * 在controller上使用
 * @author ChenMW
 *  2016-02-04 上午11:48:26
 */
@Inherited
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.TYPE,ElementType.METHOD})
public @interface RouteBind {
	/**对应的路径名 已/开头*/
	String path() default"/";
	/**视图所在目录*/
	String viewPath() default "";
	/**名称*/
	String name() default "";
	/**系统名称*/
	String sys() default "";
	/**模块*/
	String model() default "";
	/**编码 5位编码 可用于绑定权限*/
	String code()default "";
}
