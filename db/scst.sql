/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : scst

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 19/07/2020 11:17:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ClientDetails
-- ----------------------------
DROP TABLE IF EXISTS `ClientDetails`;
CREATE TABLE `ClientDetails` (
  `appId` varchar(256) NOT NULL,
  `resourceIds` varchar(256) DEFAULT NULL,
  `appSecret` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `grantTypes` varchar(256) DEFAULT NULL,
  `redirectUrl` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additionalInformation` varchar(4096) DEFAULT NULL,
  `autoApproveScopes` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`appId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oauth_access_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_token`;
CREATE TABLE `oauth_access_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(256) NOT NULL,
  `user_name` varchar(256) DEFAULT NULL,
  `client_id` varchar(256) DEFAULT NULL,
  `authentication` blob,
  `refresh_token` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_access_token
-- ----------------------------
BEGIN;
INSERT INTO `oauth_access_token` VALUES ('01845f3ab5806ba9a55cfeeabb71ef26', 0xACED0005737200436F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F4175746832416363657373546F6B656E0CB29E361B24FACE0200064C00156164646974696F6E616C496E666F726D6174696F6E74000F4C6A6176612F7574696C2F4D61703B4C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B4C000C72656672657368546F6B656E74003F4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F636F6D6D6F6E2F4F417574683252656672657368546F6B656E3B4C000573636F706574000F4C6A6176612F7574696C2F5365743B4C0009746F6B656E547970657400124C6A6176612F6C616E672F537472696E673B4C000576616C756571007E000578707372001E6A6176612E7574696C2E436F6C6C656374696F6E7324456D7074794D6170593614855ADCE7D002000078707372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017362AB7B167870737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C0001637400164C6A6176612F7574696C2F436F6C6C656374696F6E3B7870737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000023F400000000000017400036170707874000662656172657274001B59344B6D4F317A715959716367457335334E34676B7A3663335459, '8502edc3f4c61f1000b1932e6a3756f1', 'admin', 'client', 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000004770400000004737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000002120200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B78707400125B524F4C455F537973526F6C652869643D317371007E000D74002763726561746554696D653D547565204A616E2030312030303A30303A30302043535420323031397371007E000D7400176465736372697074696F6E3DE7AEA1E79086E59198295D7371007E000D74000E6E616D653DE7AEA1E79086E591987871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E001A787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00184C000573636F706571007E001A7870740006636C69656E74737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00187870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A6772616E745F7479706574000870617373776F7264740008757365726E616D6574000561646D696E78737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F4000000000000174000361707078017371007E0029770C000000103F40000000000000787371007E00203F40000000000000770800000010000000007870707371007E0029770C000000103F40000000000000787371007E0029770C000000103F40000000000000787372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000002120200024C000B63726564656E7469616C7371007E00054C00097072696E636970616C71007E00057871007E0003017371007E00077371007E000B0000000477040000000471007E000F71007E001171007E001371007E00157871007E0033737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F726465727871007E00203F400000000000067708000000080000000271007E002271007E002371007E002471007E002578007073720031636E2E7479636F64696E672E736373742E636F6D6D6F6E2E73656375726974792E736572766963652E5363737455736572E02D19DC81F30CD20200014C000269647400104C6A6176612F6C616E672F4C6F6E673B787200326F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657200000000000002120200075A00116163636F756E744E6F6E457870697265645A00106163636F756E744E6F6E4C6F636B65645A001563726564656E7469616C734E6F6E457870697265645A0007656E61626C65644C000B617574686F72697469657371007E001A4C000870617373776F726471007E000E4C0008757365726E616D6571007E000E7870010101017371007E0026737200116A6176612E7574696C2E54726565536574DD98509395ED875B0300007870737200466F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657224417574686F72697479436F6D70617261746F720000000000000212020000787077040000000471007E000F71007E001171007E001371007E0015787074000561646D696E7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001, NULL);
COMMIT;

-- ----------------------------
-- Table structure for oauth_approvals
-- ----------------------------
DROP TABLE IF EXISTS `oauth_approvals`;
CREATE TABLE `oauth_approvals` (
  `userId` varchar(256) DEFAULT NULL,
  `clientId` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `expiresAt` timestamp NULL DEFAULT NULL,
  `lastModifiedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details` (
  `client_id` varchar(256) NOT NULL,
  `resource_ids` varchar(256) DEFAULT NULL,
  `client_secret` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `authorized_grant_types` varchar(256) DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
BEGIN;
INSERT INTO `oauth_client_details` VALUES ('client', NULL, '$2a$10$22emI3a6/w3a4ZZIa0.pY.dvLsyx4GH.he37wULtW8nJ.TeiGUpC6', 'app', 'password', 'http://tycoding.cn', NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for oauth_client_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_token`;
CREATE TABLE `oauth_client_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(256) NOT NULL,
  `user_name` varchar(256) DEFAULT NULL,
  `client_id` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oauth_code
-- ----------------------------
DROP TABLE IF EXISTS `oauth_code`;
CREATE TABLE `oauth_code` (
  `code` varchar(256) DEFAULT NULL,
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oauth_refresh_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_token`;
CREATE TABLE `oauth_refresh_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` blob,
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `parent_id` bigint(20) NOT NULL COMMENT '上级部门ID',
  `name` varchar(20) NOT NULL COMMENT '部门名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (1, 0, '开发部');
INSERT INTO `sys_dept` VALUES (2, 1, '开发一部');
INSERT INTO `sys_dept` VALUES (3, 1, '开发二部');
INSERT INTO `sys_dept` VALUES (4, 0, '测试部');
INSERT INTO `sys_dept` VALUES (5, 4, '测试一部');
INSERT INTO `sys_dept` VALUES (6, 0, '人事部');
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(20) DEFAULT NULL COMMENT '操作用户',
  `operation` varchar(20) DEFAULT NULL COMMENT '操作描述',
  `time` bigint(20) DEFAULT NULL COMMENT '耗时(毫秒)',
  `method` varchar(100) DEFAULT NULL COMMENT '操作方法',
  `params` varchar(255) DEFAULT NULL COMMENT '操作参数',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  `location` varchar(20) DEFAULT NULL COMMENT '操作地点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='系统日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_log` VALUES (1, 'admin', '查看用户列表', 20, 'cn.tycoding.system.controller.UserController.queryList()', ' page\"QueryPage(pageCode=1, pageSize=6)\" user\"User(id=null, username=null, password=null, salt=null, deptId=null, deptName=null, createTime=null, modifyTime=null, avatar=null, phone=null, sex=null, description=null, status=null)\"', '127.0.0.1', '2019-03-13 00:42:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES (7, 'admin', '更新用户', 83, 'cn.tycoding.system.controller.UserController.update()', ' user\"UserWithRole(roleId=1, roleIds=[1])\"', '127.0.0.1', '2019-03-13 01:21:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES (10, 'admin', '删除用户', 65, 'cn.tycoding.system.controller.UserController.delete()', ' ids\"[9]\"', '127.0.0.1', '2019-03-13 05:00:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES (11, 'admin', '删除用户', 9, 'cn.tycoding.system.controller.UserController.delete()', ' ids\"[9]\"', '127.0.0.1', '2019-03-13 05:01:18', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES (12, 'admin', '删除登录日志', 39, 'cn.tycoding.monitor.controller.LoginLogController.delete()', ' ids\"[3]\"', '127.0.0.1', '2019-03-13 05:13:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES (13, 'admin', '删除日志', 44, 'cn.tycoding.monitor.controller.LogController.delete()', ' ids\"[8]\"', '127.0.0.1', '2019-03-13 05:15:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_log` VALUES (14, 'admin', '删除日志', 9, 'cn.tycoding.monitor.controller.LogController.delete()', ' ids\"[9]\"', '127.0.0.1', '2019-03-13 05:15:58', '内网IP|0|0|内网IP|内网IP');
COMMIT;

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `location` varchar(255) DEFAULT NULL COMMENT '登录地点',
  `create_time` datetime DEFAULT NULL COMMENT '登录时间',
  `device` varchar(255) DEFAULT NULL COMMENT '登录设备',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='登录日志表';

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_login_log` VALUES (1, 'admin', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2019-03-13 04:36:13', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36');
INSERT INTO `sys_login_log` VALUES (4, 'admin', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2019-03-13 06:15:56', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36');
INSERT INTO `sys_login_log` VALUES (5, 'admin', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2019-03-13 08:05:34', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36');
INSERT INTO `sys_login_log` VALUES (6, 'admin', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2019-03-13 08:52:32', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36');
INSERT INTO `sys_login_log` VALUES (7, 'admin', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2019-03-13 18:31:09', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36');
INSERT INTO `sys_login_log` VALUES (8, 'admin', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2019-03-13 20:33:47', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36');
INSERT INTO `sys_login_log` VALUES (9, 'admin', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2019-03-13 21:32:03', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36');
INSERT INTO `sys_login_log` VALUES (10, 'admin', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2019-03-14 01:03:48', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '资源编号',
  `name` varchar(20) DEFAULT NULL COMMENT '资源名称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级ID',
  `path` varchar(100) DEFAULT NULL COMMENT 'URL',
  `perms` text COMMENT '权限标识',
  `type` varchar(20) DEFAULT NULL COMMENT '类型：如button按钮 menu菜单',
  `icon` varchar(30) DEFAULT NULL COMMENT '菜单图标',
  `component` varchar(30) DEFAULT NULL COMMENT 'Vue组件',
  `hidden` tinyint(1) DEFAULT NULL COMMENT '是否隐藏',
  `frame` tinyint(1) DEFAULT NULL COMMENT '是否是外链',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, '权限管理', 0, '/auth', NULL, 'menu', 'permission', NULL, 0, 0);
INSERT INTO `sys_menu` VALUES (2, '用户管理', 1, 'user', 'user:list', 'menu', 'peoples', '/auth/user/index', 0, 0);
INSERT INTO `sys_menu` VALUES (3, '角色管理', 1, 'role', 'role:list', 'menu', 'role', '/auth/role/index', 0, 0);
INSERT INTO `sys_menu` VALUES (4, '菜单管理', 1, 'menu', 'menu:list', 'menu', 'menu', '/auth/menu/index', 0, 0);
INSERT INTO `sys_menu` VALUES (5, '部门管理', 1, 'dept', 'dept:list', 'menu', 'tree', '/auth/dept/index', 0, 0);
INSERT INTO `sys_menu` VALUES (6, '新增用户', 2, NULL, 'user:add', 'button', NULL, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (7, '修改用户', 2, NULL, 'user:update', 'button', NULL, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (8, '删除用户', 2, NULL, 'user:delete', 'button', NULL, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (9, '新增角色', 3, NULL, 'role:add', 'button', NULL, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (10, '修改角色', 3, NULL, 'role:update', 'button', NULL, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (11, '删除用户', 3, NULL, 'role:delete', 'button', NULL, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (12, '新增菜单', 4, NULL, 'menu:add', 'button', NULL, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (13, '修改菜单', 4, NULL, 'menu:update', 'button', NULL, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (14, '删除菜单', 4, NULL, 'menu:delete', 'button', NULL, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (15, '新增部门', 5, NULL, 'dept:add', 'button', NULL, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (16, '修改部门', 5, NULL, 'dept:update', 'button', NULL, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (17, '删除部门', 5, NULL, 'dept:delete', 'button', NULL, NULL, 1, 0);
INSERT INTO `sys_menu` VALUES (31, '系统管理', 0, '/system', NULL, 'menu', 'setting', NULL, 0, 0);
INSERT INTO `sys_menu` VALUES (32, '日志管理', 31, 'log', NULL, 'menu', 'log', '/system/log/index', 0, 0);
INSERT INTO `sys_menu` VALUES (61, '系统监控', 0, '/monitor', NULL, 'menu', 'monitor', NULL, 0, 0);
INSERT INTO `sys_menu` VALUES (62, '注册中心', 61, 'http://scst-nacos:8848/nacos', NULL, 'menu', 'monitor', NULL, 0, 1);
INSERT INTO `sys_menu` VALUES (63, '服务监控', 61, 'http://scst-admin:5001', NULL, 'menu', 'service-monitor', NULL, 0, 1);
INSERT INTO `sys_menu` VALUES (64, '流量监控', 61, 'http://scst-sentinel:5002', NULL, 'menu', 'service-center', NULL, 0, 1);
INSERT INTO `sys_menu` VALUES (65, '接口文档', 61, 'http://127.0.0.1:9999/swagger-ui.html', NULL, 'menu', 'documentation', NULL, 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '管理员', '2019-01-01 00:00:00', '管理员');
INSERT INTO `sys_role` VALUES (2, '测试账号', '2019-01-01 00:00:00', '测试，可查看所有页面，但无操作权限');
INSERT INTO `sys_role` VALUES (3, '用户管理员', '2019-01-01 00:00:00', '负责用户的增删改查操作');
INSERT INTO `sys_role` VALUES (4, '系统监控员', '2019-02-14 08:51:48', '可查看系统监控信息');
INSERT INTO `sys_role` VALUES (5, '天气预报员', '2019-02-14 02:54:56', '可查看天气预报信息');
INSERT INTO `sys_role` VALUES (6, '用户查看', '2019-02-14 02:59:17', '查看用户，但无操作权限');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单/按钮ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色资源关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (1, 3);
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (1, 6);
INSERT INTO `sys_role_menu` VALUES (1, 7);
INSERT INTO `sys_role_menu` VALUES (1, 8);
INSERT INTO `sys_role_menu` VALUES (1, 9);
INSERT INTO `sys_role_menu` VALUES (1, 10);
INSERT INTO `sys_role_menu` VALUES (1, 11);
INSERT INTO `sys_role_menu` VALUES (1, 12);
INSERT INTO `sys_role_menu` VALUES (1, 13);
INSERT INTO `sys_role_menu` VALUES (1, 14);
INSERT INTO `sys_role_menu` VALUES (1, 15);
INSERT INTO `sys_role_menu` VALUES (1, 16);
INSERT INTO `sys_role_menu` VALUES (1, 17);
INSERT INTO `sys_role_menu` VALUES (1, 18);
INSERT INTO `sys_role_menu` VALUES (1, 19);
INSERT INTO `sys_role_menu` VALUES (1, 20);
INSERT INTO `sys_role_menu` VALUES (1, 21);
INSERT INTO `sys_role_menu` VALUES (1, 22);
INSERT INTO `sys_role_menu` VALUES (1, 23);
INSERT INTO `sys_role_menu` VALUES (1, 24);
INSERT INTO `sys_role_menu` VALUES (1, 25);
INSERT INTO `sys_role_menu` VALUES (1, 26);
INSERT INTO `sys_role_menu` VALUES (1, 27);
INSERT INTO `sys_role_menu` VALUES (1, 28);
INSERT INTO `sys_role_menu` VALUES (1, 29);
INSERT INTO `sys_role_menu` VALUES (1, 30);
INSERT INTO `sys_role_menu` VALUES (1, 31);
INSERT INTO `sys_role_menu` VALUES (1, 32);
INSERT INTO `sys_role_menu` VALUES (1, 33);
INSERT INTO `sys_role_menu` VALUES (1, 34);
INSERT INTO `sys_role_menu` VALUES (1, 35);
INSERT INTO `sys_role_menu` VALUES (1, 36);
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 5);
INSERT INTO `sys_role_menu` VALUES (2, 18);
INSERT INTO `sys_role_menu` VALUES (2, 19);
INSERT INTO `sys_role_menu` VALUES (2, 20);
INSERT INTO `sys_role_menu` VALUES (2, 21);
INSERT INTO `sys_role_menu` VALUES (2, 22);
INSERT INTO `sys_role_menu` VALUES (2, 23);
INSERT INTO `sys_role_menu` VALUES (2, 27);
INSERT INTO `sys_role_menu` VALUES (2, 28);
INSERT INTO `sys_role_menu` VALUES (2, 29);
INSERT INTO `sys_role_menu` VALUES (2, 30);
INSERT INTO `sys_role_menu` VALUES (2, 34);
INSERT INTO `sys_role_menu` VALUES (2, 35);
INSERT INTO `sys_role_menu` VALUES (2, 36);
INSERT INTO `sys_role_menu` VALUES (3, 2);
INSERT INTO `sys_role_menu` VALUES (3, 3);
INSERT INTO `sys_role_menu` VALUES (4, 18);
INSERT INTO `sys_role_menu` VALUES (4, 19);
INSERT INTO `sys_role_menu` VALUES (4, 20);
INSERT INTO `sys_role_menu` VALUES (4, 21);
INSERT INTO `sys_role_menu` VALUES (4, 22);
INSERT INTO `sys_role_menu` VALUES (4, 23);
INSERT INTO `sys_role_menu` VALUES (5, 34);
INSERT INTO `sys_role_menu` VALUES (5, 35);
INSERT INTO `sys_role_menu` VALUES (6, 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `avatar` varchar(100) DEFAULT NULL COMMENT '头像',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态 0锁定 1有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'admin', '$2a$10$I/SMezVZBVuMRfChtqxe7O0pdgmZff37QRPkTJnNQth3ONBrQ3IUK', 3, '2019-01-01 00:00:00', '/img/avatar/default.jpg', '19809587839', 1);
INSERT INTO `sys_user` VALUES (2, 'tycoding', '$2a$10$I/SMezVZBVuMRfChtqxe7O0pdgmZff37QRPkTJnNQth3ONBrQ3IUK', 5, '2019-01-01 00:00:00', '/img/avatar/20180414165754.jpg', '18798797687', 1);
INSERT INTO `sys_user` VALUES (3, 'tumo', '$2a$10$I/SMezVZBVuMRfChtqxe7O0pdgmZff37QRPkTJnNQth3ONBrQ3IUK', 6, '2019-02-03 03:37:34', '/img/avatar/20180414165827.jpg', '781797907', 1);
INSERT INTO `sys_user` VALUES (4, 'monitor', '$2a$10$I/SMezVZBVuMRfChtqxe7O0pdgmZff37QRPkTJnNQth3ONBrQ3IUK', 1, '2019-02-03 03:37:34', '/img/avatar/20180414165827.jpg', '18798797687', 1);
INSERT INTO `sys_user` VALUES (5, 'synoptic', '$2a$10$I/SMezVZBVuMRfChtqxe7O0pdgmZff37QRPkTJnNQth3ONBrQ3IUK', 1, '2019-02-03 03:37:34', '/img/avatar/20180414165827.jpg', '18798797687', 0);
INSERT INTO `sys_user` VALUES (6, 'user', '$2a$10$I/SMezVZBVuMRfChtqxe7O0pdgmZff37QRPkTJnNQth3ONBrQ3IUK', 1, '2019-02-03 03:37:34', '/img/avatar/20180414165827.jpg', '18798797687', 0);
INSERT INTO `sys_user` VALUES (8, 'test2', 'sd', 1, '2020-07-18 07:29:27', '/img/avatar/20180414165920.jpg', '12', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 3);
INSERT INTO `sys_user_role` VALUES (3, 4);
INSERT INTO `sys_user_role` VALUES (4, 4);
INSERT INTO `sys_user_role` VALUES (4, 5);
INSERT INTO `sys_user_role` VALUES (5, 5);
INSERT INTO `sys_user_role` VALUES (6, 6);
INSERT INTO `sys_user_role` VALUES (8, 4);
INSERT INTO `sys_user_role` VALUES (8, 6);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
