package com.buct.acmer;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.generator.FastAutoGenerator;
import com.baomidou.mybatisplus.generator.config.OutputFile;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;

import java.util.Collections;

public class Main {
    public static void main(String[] args) {
        // 获取当前项目路径
        String projectPath = System.getProperty("user.dir");

        // 数据库连接URL
        String url = "jdbc:mysql://127.0.0.1:3306/acm?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&autoReconnect=true&allowMultiQueries=true";

        // 创建代码生成器实例
        FastAutoGenerator.create(url, "root", "123456")
                .globalConfig(builder -> builder
                        .author("BUCT") // 设置作者
                        .enableSwagger() // 开启 Swagger 模式
                        .fileOverride() // 覆盖已生成文件
                        .outputDir(projectPath + "/src/main/java")) // 指定输出目录
                .packageConfig(builder -> builder
                        .parent("com.buct") // 设置父包名
                        .moduleName("acmer") // 设置父包模块名
                        .entity("entity")
                        .mapper("mapper")
                        .service("service")
                        .serviceImpl("service.impl")
                        .controller("controller")
                        .pathInfo(Collections.singletonMap(OutputFile.xml, projectPath + "/src/main/java/com/buct/acmer/mapper"))) // 设置 mapperXml 生成路径
                .strategyConfig(builder -> builder
                        .addInclude("codeforces") // 包含的表名或表名匹配规则
                        .addInclude("aaa") // 包含的表名或表名匹配规则
                        .entityBuilder()
                        .enableLombok() // 启用 Lombok
                        .idType(IdType.INPUT) // 设置 ID 类型
                        .controllerBuilder()
                        .enableRestStyle() // 启用 REST 风格
                        .mapperBuilder()
                        .enableMapperAnnotation()) // 启用 Mapper 注解
                .templateEngine(new FreemarkerTemplateEngine()) // 使用 Freemarker 引擎模板，默认的是 Velocity 引擎模板
                .execute(); // 执行代码生成
    }
}
