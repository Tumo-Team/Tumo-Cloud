/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : scst_nacos_config

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 19/07/2020 11:17:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `c_use` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `effect` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `c_schema` text COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info';

-- ----------------------------
-- Records of config_info
-- ----------------------------
BEGIN;
INSERT INTO `config_info` VALUES (1, 'application-dev.yml', 'DEFAULT_GROUP', '# Spring 相关配置\nspring:\n  # redis:\n  #   password:\n  #   host: \n  cloud:\n    sentinel:\n      eager: true\n      transport:\n        dashboard: scst-sentinel:5002\n\n# 暴露监控端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: always\n\n# feign 配置\nfeign:\n  sentinel:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n\n#请求处理的超时时间\nribbon:\n  ReadTimeout: 10000\n  ConnectTimeout: 10000\n\n# mybaits-plus配置\nmybatis-plus:\n  mapper-locations: classpath:/mapper/*.xml\n  global-config:\n    banner: false\n    db-config:\n      id-type: auto\n      table-underline: true\n      logic-delete-value: 1\n      logic-not-delete-value: 0\n  configuration:\n    map-underscore-to-camel-case: true\n\n# spring security oauth 配置\nsecurity:\n  oauth2:\n    resource:\n      loadBalanced: true\n      token-info-uri: http://scst-auth:3000/oauth/check_token\n    # 不拦截的url\n    ignore:\n      urls:\n        - /v2/api-docs\n        - /actuator/**\n', '98fabd16a45f758e45cd027745483984', '2019-11-29 16:31:20', '2020-07-13 12:57:53', NULL, '0:0:0:0:0:0:0:1', '', '', '项目通用配置', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (7, 'scst-gateway-dev.yml', 'DEFAULT_GROUP', 'spring:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n      routes:\n        # `scst-auth`服务路由\n        - id: scst-auth\n          uri: lb://scst-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n             - StripPrefix=1\n        # `scst-system`服务路由\n        - id: scst-system-biz\n          uri: lb://scst-system-biz\n          predicates:\n            - Path=/system/**\n          filters:\n             - StripPrefix=1\n', 'ae416dc2932bdaacdf2aa4759a02ca16', '2020-07-12 00:11:58', '2020-07-16 23:52:00', NULL, '127.0.0.1', '', '', '`scst-gateway` 网关服务配置', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (9, 'scst-auth-dev.yml', 'DEFAULT_GROUP', '# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: root\n    jdbcUrl: jdbc:mysql://scst-mysql:3306/scst?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n', '4b6c380bb7d8db606bf9f04705ab7d4a', '2020-07-12 00:22:12', '2020-07-13 08:04:28', NULL, '0:0:0:0:0:0:0:1', '', '', '`scst-auth`服务配置', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (13, 'scst-system-biz-dev.yml', 'DEFAULT_GROUP', '# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: root\n    url: jdbc:mysql://scst-mysql:3306/scst?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n', '7474858a7224e47f23abb8fbb6768e41', '2020-07-13 06:33:25', '2020-07-13 08:58:21', NULL, '0:0:0:0:0:0:0:1', '', '', '`sct-system-biz` 服务配置', '', '', 'yaml', '');
COMMIT;

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='增加租户字段';

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_beta';

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_tag';

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_tag_relation';

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='集群、各Group容量信息表';

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info` (
  `id` bigint(64) unsigned NOT NULL,
  `nid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text COLLATE utf8_bin,
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `op_type` char(10) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='多租户改造';

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
BEGIN;
INSERT INTO `his_config_info` VALUES (0, 1, 'scst-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      locator:\n        enabled: true\n      routes:\n        # `scst-auth`服务路由\n        - id: scst-auth\n          uri: lb://scst-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter\n        # `scst-system`服务路由\n        - id: scst-system-biz\n          uri: lb://scst-system-biz\n          predicates:\n            - Path=/admin/**\n', '384c0c1616e6bd3d56585599fd439aae', '2020-07-12 08:11:58', '2020-07-12 00:11:58', NULL, '192.168.0.217', 'I', '');
INSERT INTO `his_config_info` VALUES (1, 2, 'application-dev.yml', 'DEFAULT_GROUP', '', '# 加解密根密码\njasypt:\n  encryptor:\n    password: pig #根密码\n\n# Spring 相关\nspring:\n  redis:\n    password:\n    host: pig-redis\n  cloud:\n    sentinel:\n      eager: true\n      transport:\n        dashboard: pig-sentinel:5003\n\n# 暴露监控端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n\n# feign 配置\nfeign:\n  sentinel:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n\n#请求处理的超时时间\nribbon:\n  ReadTimeout: 10000\n  ConnectTimeout: 10000\n\n# mybaits-plus配置\nmybatis-plus:\n  mapper-locations: classpath:/mapper/*Mapper.xml\n  global-config:\n    banner: false\n    db-config:\n      id-type: auto\n      table-underline: true\n      logic-delete-value: 1\n      logic-not-delete-value: 0\n  configuration:\n    map-underscore-to-camel-case: true\n\n# spring security 配置\nsecurity:\n  oauth2:\n    resource:\n      loadBalanced: true\n      token-info-uri: http://pig-auth/oauth/check_token\n    # 通用放行URL，服务个性化，请在对应配置文件覆盖\n    ignore:\n      urls:\n        - /v2/api-docs\n        - /actuator/**\n# swagger 配置\nswagger:\n  title: Pig Swagger API\n  license: Powered By pig4cloud\n  licenseUrl: https://pig4cloud.com\n  terms-of-service-url: https://pig4cloud.com\n  contact:\n    email: wangiegie@gmail.com\n    url: https://pig4cloud.com\n  authorization:\n    name: pig4cloud OAuth\n    auth-regex: ^.*$\n    authorization-scope-list:\n      - scope: server\n        description: server all\n    token-url-list:\n      - http://${GATEWAY_HOST:pig-gateway}:${GATEWAY-PORT:9999}/auth/oauth/token', 'a6af9159e8c910e988f1c15ad67ba8ff', '2020-07-12 08:20:13', '2020-07-12 00:20:13', NULL, '192.168.0.217', 'U', '');
INSERT INTO `his_config_info` VALUES (0, 3, 'scst-auth-dev.yml', 'DEFAULT_GROUP', '', '# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: root\n    url: jdbc:mysql://scst-mysql:3306/scst?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n', '7474858a7224e47f23abb8fbb6768e41', '2020-07-12 08:22:12', '2020-07-12 00:22:12', NULL, '192.168.0.217', 'I', '');
INSERT INTO `his_config_info` VALUES (7, 4, 'scst-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      locator:\n        enabled: true\n      routes:\n        # `scst-auth`服务路由\n        - id: scst-auth\n          uri: lb://scst-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter\n        # `scst-system`服务路由\n        - id: scst-system-biz\n          uri: lb://scst-system-biz\n          predicates:\n            - Path=/admin/**\n', '384c0c1616e6bd3d56585599fd439aae', '2020-07-12 08:48:46', '2020-07-12 00:48:46', NULL, '192.168.0.217', 'U', '');
INSERT INTO `his_config_info` VALUES (4, 5, 'pig-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      locator:\n        enabled: true\n      routes:\n        # 认证中心\n        - id: pig-auth\n          uri: lb://pig-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n            # 验证码处理\n            - ValidateCodeGatewayFilter\n            # 前端密码解密\n            - PasswordDecoderFilter\n        #UPMS 模块\n        - id: pig-upms-biz\n          uri: lb://pig-upms-biz\n          predicates:\n            - Path=/admin/**\n          filters:\n            # 限流配置\n            - name: RequestRateLimiter\n              args:\n                key-resolver: \'#{@remoteAddrKeyResolver}\'\n                redis-rate-limiter.replenishRate: 100\n                redis-rate-limiter.burstCapacity: 200\n        # 代码生成模块\n        - id: pig-codegen\n          uri: lb://pig-codegen\n          predicates:\n            - Path=/gen/**\n\n\nsecurity:\n  encode:\n    # 前端密码密钥，必须16位\n    key: \'thanks,pig4cloud\'\n\n# 不校验验证码终端\nignore:\n  clients:\n    - test\n', '6dfb01b7636af477135c1bfeba2fd48d', '2020-07-12 08:50:31', '2020-07-12 00:50:32', NULL, '192.168.0.217', 'D', '');
INSERT INTO `his_config_info` VALUES (9, 6, 'scst-auth-dev.yml', 'DEFAULT_GROUP', '', '# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: root\n    url: jdbc:mysql://scst-mysql:3306/scst?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n', '7474858a7224e47f23abb8fbb6768e41', '2020-07-12 19:17:41', '2020-07-12 19:17:40', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (9, 7, 'scst-auth-dev.yml', 'DEFAULT_GROUP', '', '# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: root\n    jdbcUrl: jdbc:mysql://scst-mysql:3306/scst?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n', '4b6c380bb7d8db606bf9f04705ab7d4a', '2020-07-12 22:02:40', '2020-07-12 22:02:41', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (2, 8, 'pig-auth-dev.yml', 'DEFAULT_GROUP', '', '# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: root\n    url: jdbc:mysql://pig-mysql:3306/pig?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n  freemarker:\n    allow-request-override: false\n    allow-session-override: false\n    cache: true\n    charset: UTF-8\n    check-template-location: true\n    content-type: text/html\n    enabled: true\n    expose-request-attributes: false\n    expose-session-attributes: false\n    expose-spring-macro-helpers: true\n    prefer-file-system-access: true\n    suffix: .ftl\n    template-loader-path: classpath:/templates/', '58b1b48a2888f49e667864be32edf9c1', '2020-07-13 06:32:12', '2020-07-13 06:32:13', NULL, '127.0.0.1', 'D', '');
INSERT INTO `his_config_info` VALUES (3, 9, 'pig-codegen-dev.yml', 'DEFAULT_GROUP', '', '## spring security 配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ENC(27v1agvAug87ANOVnbKdsw==)\n      client-secret: ENC(VbnkopxrwgbFVKp+UxJ2pg==)\n      scope: server\n\n# 数据源配置\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: root\n    url: jdbc:mysql://pig-mysql:3306/pig_codegen?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n  resources:\n    static-locations: classpath:/static/,classpath:/views/\n\n# 直接放行URL\nignore:\n  urls:\n    - /v2/api-docs\n    - /actuator/**\n', '546ea6c298a96267fdd1fc63678ea1a5', '2020-07-13 06:32:17', '2020-07-13 06:32:18', NULL, '127.0.0.1', 'D', '');
INSERT INTO `his_config_info` VALUES (5, 10, 'pig-monitor-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  # 安全配置\n  security:\n    user:\n      name: ENC(8Hk2ILNJM8UTOuW/Xi75qg==)     # pig\n      password: ENC(o6cuPFfUevmTbkmBnE67Ow====) # pig\n', '85509c6f8c67c364dc78301896274f26', '2020-07-13 06:32:22', '2020-07-13 06:32:23', NULL, '127.0.0.1', 'D', '');
INSERT INTO `his_config_info` VALUES (6, 11, 'pig-upms-biz-dev.yml', 'DEFAULT_GROUP', '', 'security:\n  oauth2:\n    client:\n      client-id: ENC(imENTO7M8bLO38LFSIxnzw==)\n      client-secret: ENC(i3cDFhs26sa2Ucrfz2hnQw==)\n      scope: server\n\n# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: root\n    url: jdbc:mysql://pig-mysql:3306/pig?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&allowMultiQueries=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n', '3248f7cf9ea2ce40cd41cd664ec32ae0', '2020-07-13 06:32:26', '2020-07-13 06:32:26', NULL, '127.0.0.1', 'D', '');
INSERT INTO `his_config_info` VALUES (0, 12, 'scst-system-biz-dev.yml', 'DEFAULT_GROUP', '', '# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: root\n    url: jdbc:mysql://scst-mysql:3306/scst?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n', '7474858a7224e47f23abb8fbb6768e41', '2020-07-13 06:33:25', '2020-07-13 06:33:25', NULL, '127.0.0.1', 'I', '');
INSERT INTO `his_config_info` VALUES (7, 13, 'scst-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      locator:\n        enabled: true\n      routes:\n        # `scst-auth`服务路由\n        - id: scst-auth\n          uri: lb://scst-auth\n          predicates:\n            - Path=/auth/**\n        # `scst-system`服务路由\n        - id: scst-system-biz\n          uri: lb://scst-system-biz\n          predicates:\n            - Path=/admin/**\n', '64a4dc2dc4677e1a24f53a3950303bc8', '2020-07-13 07:10:02', '2020-07-13 07:10:02', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (9, 14, 'scst-auth-dev.yml', 'DEFAULT_GROUP', '', '# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: root\n    url: jdbc:mysql://scst-mysql:3306/scst?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n', '7474858a7224e47f23abb8fbb6768e41', '2020-07-13 07:18:37', '2020-07-13 07:18:38', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (13, 15, 'scst-system-biz-dev.yml', 'DEFAULT_GROUP', '', '# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: root\n    url: jdbc:mysql://scst-mysql:3306/scst?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n', '7474858a7224e47f23abb8fbb6768e41', '2020-07-13 07:18:48', '2020-07-13 07:18:49', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (9, 16, 'scst-auth-dev.yml', 'DEFAULT_GROUP', '', '# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: root\n    jdbc-url: jdbc:mysql://scst-mysql:3306/scst?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n', 'c854c1f45a90ccd203661b4382cce8fe', '2020-07-13 08:04:28', '2020-07-13 08:04:28', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (13, 17, 'scst-system-biz-dev.yml', 'DEFAULT_GROUP', '', '# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: root\n    jdbc-url: jdbc:mysql://scst-mysql:3306/scst?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n', 'c854c1f45a90ccd203661b4382cce8fe', '2020-07-13 08:04:39', '2020-07-13 08:04:39', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (13, 18, 'scst-system-biz-dev.yml', 'DEFAULT_GROUP', '', '# 数据源\nspring:\n  datasource:\n    type: com.zaxxer.hikari.HikariDataSource\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: root\n    jdbcUrl: jdbc:mysql://scst-mysql:3306/scst?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Shanghai\n', '4b6c380bb7d8db606bf9f04705ab7d4a', '2020-07-13 08:58:20', '2020-07-13 08:58:21', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (1, 19, 'application-dev.yml', 'DEFAULT_GROUP', '', '# Spring 相关配置\nspring:\n  # redis:\n  #   password:\n  #   host: \n  cloud:\n    sentinel:\n      eager: true\n      transport:\n        dashboard: scst-sentinel:5003\n\n# 暴露监控端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n\n# feign 配置\nfeign:\n  sentinel:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n\n#请求处理的超时时间\nribbon:\n  ReadTimeout: 10000\n  ConnectTimeout: 10000\n\n# mybaits-plus配置\nmybatis-plus:\n  mapper-locations: classpath:/mapper/*Mapper.xml\n  global-config:\n    banner: false\n    db-config:\n      id-type: auto\n      table-underline: true\n      logic-delete-value: 1\n      logic-not-delete-value: 0\n  configuration:\n    map-underscore-to-camel-case: true\n\n# spring security oauth 配置\nsecurity:\n  oauth2:\n    resource:\n      loadBalanced: true\n      token-info-uri: http://scst-auth/oauth/check_token\n    # 不拦截的url\n    ignore:\n      urls:\n        - /v2/api-docs\n        - /actuator/**\n# swagger 配置\nswagger:\n  title: Scst Swagger API\n  # license: \n  # licenseUrl:\n  # terms-of-service-url: \n  contact:\n    email: tytumo@163.com\n    url: https://tycoding.cn\n  authorization:\n    name: Scst OAuth\n    auth-regex: ^.*$\n    authorization-scope-list:\n      - scope: server\n        description: server all\n    token-url-list:\n      - http://scst-gateway:9999/auth/oauth/token', '8138807f0c1a490c0c468feff8b123c4', '2020-07-13 16:55:32', '2020-07-13 08:55:32', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (1, 20, 'application-dev.yml', 'DEFAULT_GROUP', '', '# Spring 相关配置\nspring:\n  # redis:\n  #   password:\n  #   host: \n  cloud:\n    sentinel:\n      eager: true\n      transport:\n        dashboard: scst-sentinel:5003\n\n# 暴露监控端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: always\n\n# feign 配置\nfeign:\n  sentinel:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n\n#请求处理的超时时间\nribbon:\n  ReadTimeout: 10000\n  ConnectTimeout: 10000\n\n# mybaits-plus配置\nmybatis-plus:\n  mapper-locations: classpath:/mapper/*Mapper.xml\n  global-config:\n    banner: false\n    db-config:\n      id-type: auto\n      table-underline: true\n      logic-delete-value: 1\n      logic-not-delete-value: 0\n  configuration:\n    map-underscore-to-camel-case: true\n\n# spring security oauth 配置\nsecurity:\n  oauth2:\n    resource:\n      loadBalanced: true\n      token-info-uri: http://scst-auth/oauth/check_token\n    # 不拦截的url\n    ignore:\n      urls:\n        - /v2/api-docs\n        - /actuator/**\n# swagger 配置\nswagger:\n  title: Scst Swagger API\n  # license: \n  # licenseUrl:\n  # terms-of-service-url: \n  contact:\n    email: tytumo@163.com\n    url: https://tycoding.cn\n  authorization:\n    name: Scst OAuth\n    auth-regex: ^.*$\n    authorization-scope-list:\n      - scope: server\n        description: server all\n    token-url-list:\n      - http://scst-gateway:9999/auth/oauth/token', '63208aeb46ca6ff3ccbf5932f7cc1ec9', '2020-07-13 18:21:57', '2020-07-13 10:21:57', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (7, 21, 'scst-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n      routes:\n        # `scst-auth`服务路由\n        - id: scst-auth\n          uri: lb://scst-auth\n          predicates:\n            - Path=/auth/**\n        # `scst-system`服务路由\n        - id: scst-system-biz\n          uri: lb://scst-system-biz\n          predicates:\n            - Path=/admin/**\n', '70e2dff6e2f9d9779a5525aa92af0033', '2020-07-13 18:43:55', '2020-07-13 10:43:55', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (7, 22, 'scst-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      routes:\n        # `scst-auth`服务路由\n        - id: scst-auth\n          uri: lb://scst-auth\n          predicates:\n            - Path=/auth/**\n        # `scst-system`服务路由\n        - id: scst-system-biz\n          uri: lb://scst-system-biz\n          predicates:\n            - Path=/admin/**\n', 'f85d9ffe388e478d1428fe27a78eb333', '2020-07-13 18:58:19', '2020-07-13 10:58:20', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (7, 23, 'scst-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n      routes:\n        # `scst-auth`服务路由\n        - id: scst-auth\n          uri: lb://scst-auth\n          predicates:\n            - Path=/auth/**\n        # `scst-system`服务路由\n        - id: scst-system-biz\n          uri: lb://scst-system-biz\n          predicates:\n            - Path=/admin/**\n', '70e2dff6e2f9d9779a5525aa92af0033', '2020-07-13 19:03:59', '2020-07-13 11:03:59', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (7, 24, 'scst-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n      routes:\n        # `scst-auth`服务路由\n        - id: scst-auth\n          uri: lb://scst-auth\n          predicates:\n            - Path=/auth\n        # `scst-system`服务路由\n        - id: scst-system-biz\n          uri: lb://scst-system-biz\n          predicates:\n            - Path=/admin/**\n', 'fc9018f65be43916ec005e39f98a3c49', '2020-07-13 19:04:54', '2020-07-13 11:04:55', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (7, 25, 'scst-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n      routes:\n        # `scst-auth`服务路由\n        - id: scst-auth\n          uri: lb://scst-auth\n          predicates:\n            - Path=/auth\n        # `scst-system`服务路由\n        - id: scst-system-biz\n          uri: lb://scst-system-biz\n          predicates:\n            - Path=/admin\n', 'b496662813284279f8b8357015dad0dc', '2020-07-13 19:21:46', '2020-07-13 11:21:47', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (7, 26, 'scst-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n      routes:\n        # `scst-auth`服务路由\n        - id: scst-auth\n          uri: lb://scst-auth\n          predicates:\n            - Path=/auth\n          filters:\n             - StripPrefix=1\n        # `scst-system`服务路由\n        - id: scst-system-biz\n          uri: lb://scst-system-biz\n          predicates:\n            - Path=/admin\n          filters:\n             - StripPrefix=1\n', '51d36ab2e452d998e88fefa24a270175', '2020-07-13 19:23:00', '2020-07-13 11:23:01', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (7, 27, 'scst-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n      routes:\n        # `scst-auth`服务路由\n        - id: scst-auth\n          uri: lb://scst-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n             - StripPrefix=1\n        # `scst-system`服务路由\n        - id: scst-system-biz\n          uri: lb://scst-system-biz\n          predicates:\n            - Path=/admin/**\n          filters:\n             - StripPrefix=1\n', '9257a8e7b1ad6dbb22fd482b63a84183', '2020-07-13 19:23:41', '2020-07-13 11:23:42', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (1, 28, 'application-dev.yml', 'DEFAULT_GROUP', '', '# Spring 相关配置\nspring:\n  # redis:\n  #   password:\n  #   host: \n  cloud:\n    sentinel:\n      eager: true\n      transport:\n        dashboard: scst-sentinel:5003\n\n# 暴露监控端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n  endpoint:\n    health:\n      show-details: always\n\n# feign 配置\nfeign:\n  sentinel:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n\n#请求处理的超时时间\nribbon:\n  ReadTimeout: 10000\n  ConnectTimeout: 10000\n\n# mybaits-plus配置\nmybatis-plus:\n  mapper-locations: classpath:/mapper/*Mapper.xml\n  global-config:\n    banner: false\n    db-config:\n      id-type: auto\n      table-underline: true\n      logic-delete-value: 1\n      logic-not-delete-value: 0\n  configuration:\n    map-underscore-to-camel-case: true\n\n# spring security oauth 配置\nsecurity:\n  oauth2:\n    resource:\n      loadBalanced: true\n      token-info-uri: http://scst-auth:4000/oauth/check_token\n    # 不拦截的url\n    ignore:\n      urls:\n        - /v2/api-docs\n        - /actuator/**\n# swagger 配置\n# swagger:\n#   title: Scst Swagger API\n#   license: \n#   licenseUrl:\n#   terms-of-service-url: \n#   contact:\n#     email: tytumo@163.com\n#     url: https://tycoding.cn\n#   authorization:\n#     name: Scst OAuth\n#     auth-regex: ^.*$\n#     authorization-scope-list:\n#       - scope: server\n#         description: server all\n#     token-url-list:\n#       - http://scst-gateway:9999/auth/oauth/token', '191293bf1030246af817a0c89140b751', '2020-07-13 20:57:52', '2020-07-13 12:57:53', NULL, '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (7, 29, 'scst-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n      routes:\n        # `scst-auth`服务路由\n        - id: scst-auth\n          uri: lb://scst-auth\n          predicates:\n            - Path=/auth/**\n          filters:\n             - StripPrefix=1\n        # `scst-system`服务路由\n        - id: scst-system-biz\n          uri: lb://scst-system-biz\n          predicates:\n            - Path=/admin/**\n          filters:\n             - StripPrefix=1\n', '9257a8e7b1ad6dbb22fd482b63a84183', '2020-07-17 07:51:59', '2020-07-16 23:52:00', NULL, '127.0.0.1', 'U', '');
COMMIT;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `role` varchar(50) NOT NULL,
  `resource` varchar(255) NOT NULL,
  `action` varchar(8) NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `username` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  UNIQUE KEY `idx_user_role` (`username`,`role`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');
COMMIT;

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='租户容量信息表';

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='tenant_info';

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('scst', '$2a$10$7HEFH1LQ3lJkft1mJt5nMOEZCq5s3tWnOgwLy1Y2HmHW/2OT0aZ7u', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
