package com.base;

import com.base.ctrl.BaseController;
import com.base.plugin.MyRouteBind;
import com.jfinal.config.*;
import com.jfinal.ext.handler.ContextPathHandler;
import com.jfinal.ext.handler.FakeStaticHandler;
import com.jfinal.kit.PathKit;
import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.CaseInsensitiveContainerFactory;
import com.jfinal.plugin.activerecord.ModelRecordElResolver;
import com.jfinal.plugin.activerecord.dialect.OracleDialect;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.ViewType;
import com.mi2.handler.StaticResHandler;
import com.mi2.interceptor.MyTxByMethodRegexInterceptor;
import com.mi2.model._MappingKit;
import org.apache.log4j.Logger;

/**
 * JFinal 框架配置类
 * @author CMW
 */
public class JFWebConfig extends JFinalConfig {
	private Logger log=Logger.getLogger(getClass());
	private static Prop dbProp;
	/**
	 * 配置常量
	 * 加载少量必要配置，随后可用getProperty(...)获取值
	 */
	@Override
	public void configConstant(Constants me){
		//设置数据库配置文件加载
		//this.loadPropertyFile("db.properties");	
		dbProp = PropKit.use("db.properties");
		
		//设置开发模式为true
		me.setDevMode(dbProp.getBoolean("devMode", false));
		
		//设置视图类型
		me.setViewType(ViewType.JSP);
		
		//设置定位到的视图目录
		me.setBaseViewPath("/");
		
		//设置错误所跳转的页面
		me.setErrorView(400,"/view/error/400.html");
		me.setError401View("/view/error/401.html");
		me.setError403View("/view/error/403.html");
		me.setError404View("/view/error/404.html");
		me.setError500View("/view/error/500.html");
		
		//设置国际化资源
		//me.setI18n("i18nResourceBaseName");
		
		//设置FreeMarker模板引擎文件的后缀名(.ftl)
		//me.setFreeMarkerViewExtension(".html");
		
		//设置默认的文件下载的地址
		me.setBaseDownloadPath(PathKit.getWebRootPath() + BaseController.DOWNLOAD_PATH);
		
		//设置上传文件默认保存的目录
		me.setBaseUploadPath(PathKit.getWebRootPath() + BaseController.UPLOAD_PATH);
		
		//设置url参数的分隔符http://localhost/blog/1-3(ID=1，页码=3)
		//me.setUrlParaSeparator("-");
		
		//设置一次post提交最大的容量100MB
		me.setMaxPostSize(dbProp.getInt("maxPostSize",104857600));
	}
	
	/**
	 * 配置路由
	 */
	@Override
	public void configRoute(Routes me) {
		log.debug("==== add configRoute start====");
		MyRouteBind.add(me,dbProp);
		log.debug("==== add configRoute end====");
	}

	/**
	 * 配置插件
	 */
	@Override
	public void configPlugin(Plugins me) {
		/* 配置数据库连接池插件*/
		Prop p = PropKit.use("db.properties");
		C3p0Plugin c3p0Plugin = new C3p0Plugin(p.get("url"), p.get("username"), p.get("password"),p.get("driver"));
		c3p0Plugin.start();
		me.add(c3p0Plugin);
		
		/*
		DruidPlugin druidPlugin = new DruidPlugin(dbProp.get("url"),dbProp.get("username"),dbProp.get("password"),dbProp.get("driver"));
		druidPlugin.set(dbProp.getInt("initialSize", 1),dbProp.getInt("minIdle", 1),dbProp.getInt("maxActive", 1));
		druidPlugin.addFilter(new StatFilter());
		druidPlugin.start();
		me.add(druidPlugin);
		*/
		
		// 配置ActiveRecord插件
		ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
		//设置事务级别(jfinal2.2事务级别为4，oracle不支持4)
		arp.setTransactionLevel(2);
		//显示执行的sql语句
		arp.setShowSql(true);
		me.add(arp);
		arp.setDialect(new OracleDialect());
        // 配置属性名(字段名)大小写不敏感容器工厂
        arp.setContainerFactory(new CaseInsensitiveContainerFactory(true));
		//arp.setContainerFactory(new PropertyNameContainerFactory());
		// 所有映射配置在 MappingKit 中搞定
		_MappingKit.mapping(arp);
	}

	/**
	 * 配置全局拦截器(AOP+Command(代理模式))
	 */
	@Override
	public void configInterceptor(Interceptors me) {
		//方法事务拦截
		me.add(new MyTxByMethodRegexInterceptor("((?!.*Request.*).*save.*|(?!.*Request.*).*update.*|(?!.*Request.*).*add.*|(?!.*Request.*).*delete.*)"));
	}

	/**
	 * 配置全局公共处理器(责任链模式的变种)
	 */
	@Override
	public void configHandler(Handlers me) {
		//静态资源处理器
		me.add(new StaticResHandler());
	    //该处理器将request.getContextPath()存储在root中，可以解决路径问题
	  	me.add(new ContextPathHandler("root"));
	  	//通过.json后缀访问后台链接
	  	//me.add(new FakeStaticHandler(".json"));
		//通过.action后缀访问后台方法
		me.add(new FakeStaticHandler(".action"));
	}
	
	/**
	 * JFinalConfig 中的 afterJFinalStart()与 beforeJFinalStop()方法供开发者在 JFinalConfig 继承类中覆盖 。 
			JFinal 会在系统启动完成后回调 afterJFinalStart() 方法， 会在系统关闭前回 调beforeJFinalStop()方法。 
			这两个方法可以很方便地在项目启动后与关闭前让开发者有机会进行额外操作，
			如在系统启动后创建调度线程或在系统关闭前写回缓存。
	 */
	@Override
	public void afterJFinalStart() {
		//设置jsp取值方法，这种是当做map类型的取值，而不是当做bean
		ModelRecordElResolver.setResolveBeanAsModel(true);
		super.afterJFinalStart();
		System.out.println("JFinal启动后启动自动调度线程！");
	}
	
	@Override
	public void beforeJFinalStop() {
		super.beforeJFinalStop();
		System.out.println("JFinal关闭前关闭资源!!调用调度线程释放! !");
	}
}
