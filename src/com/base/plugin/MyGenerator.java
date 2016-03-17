package com.base.plugin;

import com.jfinal.plugin.activerecord.generator.BaseModelGenerator;
import com.jfinal.plugin.activerecord.generator.Generator;
import com.jfinal.plugin.activerecord.generator.ModelGenerator;

import javax.sql.DataSource;
/**
 * Jfinal代码生成器插件扩展
 *
 * @author ChenMW 2016-03-16 16:31
 */
public class MyGenerator extends Generator {

    public MyGenerator(DataSource dataSource, BaseModelGenerator baseModelGenerator) {
        super(dataSource, baseModelGenerator);
    }

    public MyGenerator(DataSource dataSource, BaseModelGenerator baseModelGenerator, ModelGenerator modelGenerator) {
        super(dataSource, baseModelGenerator, modelGenerator);
    }

    public MyGenerator(DataSource dataSource, String baseModelPackageName, String baseModelOutputDir) {
        super(dataSource, baseModelPackageName, baseModelOutputDir);
    }

    public MyGenerator(DataSource dataSource, String baseModelPackageName, String baseModelOutputDir, String modelPackageName, String modelOutputDir) {
        super(dataSource, baseModelPackageName, baseModelOutputDir, modelPackageName, modelOutputDir);
    }

    /**
     * 新构造器，构造 MyGenerator，生成 BaseModel、Model、MappingKit 三类文件，其中 MappingKit 输出目录与包名与 Model相同
     * @param dataSource 数据源
     * @param baseModelPackageName base model 包名
     * @param baseModelOutputDir base mode 输出目录
     * @param modelPackageName model 包名
     * @param modelOutputDir model 输出目录
     * @param baseModeSuperClassSimpleName base model父类类名
     */
    public MyGenerator(DataSource dataSource, String baseModelPackageName, String baseModelOutputDir, String modelPackageName, String modelOutputDir, String baseModeSuperClassSimpleName) {
        super(dataSource, new MyBaseModelGenerator(baseModelPackageName, baseModelOutputDir, baseModeSuperClassSimpleName), new ModelGenerator(modelPackageName, baseModelPackageName, modelOutputDir));
    }
}