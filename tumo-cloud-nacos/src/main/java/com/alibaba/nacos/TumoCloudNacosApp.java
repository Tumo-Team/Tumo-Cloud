/*
 * Copyright 1999-2018 Alibaba Group Holding Ltd.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.alibaba.nacos;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * 将Nacos官方源码中console组件的代码拷贝到这里单独作为一个服务启动，实际部署中还是应该用Nacos官方打包好的jar
 * 这里仅仅是为了开发方便
 *
 * @author tycoding
 * @since 2021/3/1
 */
@SpringBootApplication(scanBasePackages = "com.alibaba.nacos")
@ServletComponentScan
@EnableScheduling
public class TumoCloudNacosApp {

    public static void main(String[] args) {
        System.setProperty("nacos.standalone", "true");
        System.setProperty("nacos.core.auth.enabled", "false");
        System.setProperty("server.tomcat.basedir", "logs");
        SpringApplication.run(TumoCloudNacosApp.class, args);
    }
}
