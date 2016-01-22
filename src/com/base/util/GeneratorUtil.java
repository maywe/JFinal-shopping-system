package com.base.util;

import com.jfinal.kit.PathKit;
import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.dialect.OracleDialect;
import com.jfinal.plugin.activerecord.generator.Generator;
import com.jfinal.plugin.c3p0.C3p0Plugin;

import javax.sql.DataSource;

/**
 * 生成数据库表对象的工具
 */
public class GeneratorUtil {
	
	public static DataSource getDataSource() {
		Prop p = PropKit.use("db.properties");
		C3p0Plugin c3p0Plugin = new C3p0Plugin(p.get("url"), p.get("username"), p.get("password"),p.get("driver"));
		c3p0Plugin.start();
		return c3p0Plugin.getDataSource();
	}
	
	public static void main(String[] args) {
		// base model 所使用的包名
		String baseModelPackageName = "com.base.model";
		// base model 文件保存路径
		String baseModelOutputDir = PathKit.getWebRootPath()+"/../src/com/base/model";
		// model 所使用的包名 (MappingKit 默认使用的包名)
		String modelPackageName = "com.mi2.model";
		// model 文件保存路径 (MappingKit 与 DataDictionary 文件默认保存路径)
		String modelOutputDir = PathKit.getWebRootPath()+"/../src/com/mi2/model";
		
		
		// 创建生成器
		Generator gernerator = new Generator(getDataSource(), baseModelPackageName, baseModelOutputDir, modelPackageName, modelOutputDir);
		
		// 添加不需要生成的表名
		//gernerator.addExcludedTable("adv");
		
		// 设置是否在 Model 中生成 dao 对象
		gernerator.setGenerateDaoInModel(true);
		
		//设置生成的MapingKit 文件保存的路径
		//gernerator.setMappingKitOutputDir(baseModelOutputDir);
		//gernerator.setMappingKitPackageName(baseModelPackageName);

		// 设置是否生成字典文件
		gernerator.setGenerateDataDictionary(true);
		
		// 设置生成的字典文件保存的路径
		gernerator.setDataDictionaryOutputDir(baseModelOutputDir);
		
		// 设置需要被移除的表名前缀用于生成modelName。例如表名 "osc_user"，移除前缀 "osc_"后生成的model名为 "User"而非 OscUser
		//gernerator.setRemovedTableNamePrefixes("t_");
		
		//增加数据库方言
		gernerator.setDialect(new OracleDialect());
				
		// 生成
		gernerator.generate();
	}
}




