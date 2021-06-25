/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 127.0.0.1:3306
 Source Schema         : tumo_cloud

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 23/06/2021 20:37:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
INSERT INTO `oauth_client_details` VALUES ('client', NULL, '$2a$10$22emI3a6/w3a4ZZIa0.pY.dvLsyx4GH.he37wULtW8nJ.TeiGUpC6', 'app', 'password,refresh_token', 'http://tycoding.cn', NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for oss_file
-- ----------------------------
DROP TABLE IF EXISTS `oss_file`;
CREATE TABLE `oss_file` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `origin_name` varchar(255) DEFAULT NULL COMMENT '原始文件名称',
  `target_name` varchar(255) DEFAULT NULL COMMENT '文件存储名称',
  `bucket` varchar(255) DEFAULT NULL COMMENT '桶路径',
  `url` varchar(255) DEFAULT NULL COMMENT '文件地址',
  `type` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `size` bigint(20) DEFAULT NULL COMMENT '文件大小',
  `des` varchar(255) DEFAULT NULL COMMENT '文件描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='资源文件表';

-- ----------------------------
-- Records of oss_file
-- ----------------------------
BEGIN;
INSERT INTO `oss_file` VALUES (1406806797079207938, 'Tumo-Boot.png', '1406806773846958081.png', '/20210621', 'http://127.0.0.1:8010/upload/20210621/1406806773846958081.png', 'png', 6204, 'Tumo-Boot.png', '2021-06-21 10:50:46');
INSERT INTO `oss_file` VALUES (1406806797087596545, 'tycoding.png', '1406806773855346690.png', '/20210621', 'http://127.0.0.1:8010/upload/20210621/1406806773855346690.png', 'jpg', 29618, 'tycoding.png', '2021-06-21 10:50:46');
INSERT INTO `oss_file` VALUES (1406807093503254530, '-IMlv9Jlb24.jpg', '1406807084368060418.jpg', '/20210621', 'http://127.0.0.1:8010/upload/20210621/1406807084368060418.jpg', 'jpg', 1068588, '-IMlv9Jlb24.jpg', '2021-06-21 10:52:00');
INSERT INTO `oss_file` VALUES (1406807206313254913, '4vnhzDmeemc.jpg', '1406807200369926145.jpg', '/20210621', 'http://127.0.0.1:8010/upload/20210621/1406807200369926145.jpg', 'jpg', 1378665, '4vnhzDmeemc.jpg', '2021-06-21 10:52:28');
INSERT INTO `oss_file` VALUES (1406807907709935617, '6XwGBplrZH4.jpg', '1406807869264945154.jpg', '/20210621', 'http://127.0.0.1:8010/upload/20210621/1406807869264945154.jpg', 'jpg', 524543, '6XwGBplrZH4.jpg', '2021-06-21 10:55:07');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` bigint(20) NOT NULL COMMENT '部门ID',
  `parent_id` bigint(20) NOT NULL COMMENT '上级部门ID',
  `name` varchar(20) NOT NULL COMMENT '部门名称',
  `order_no` int(11) DEFAULT NULL COMMENT '排序',
  `des` varchar(100) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (1362597682681577273, 0, '测试部门', 1, '测试');
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL COMMENT '编号',
  `type` int(10) DEFAULT NULL COMMENT '日志类型，1正常 2异常 ',
  `username` varchar(20) DEFAULT NULL COMMENT '操作用户',
  `operation` varchar(20) DEFAULT NULL COMMENT '操作描述',
  `url` varchar(255) DEFAULT NULL COMMENT '请求URL',
  `time` bigint(20) DEFAULT NULL COMMENT '耗时(毫秒)',
  `method` varchar(100) DEFAULT NULL COMMENT '操作方法',
  `params` varchar(255) DEFAULT NULL COMMENT '操作参数',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户代理',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_log` VALUES (1403181759507488770, 2, NULL, '请求未授权', '/tumo-boot/upms/menu/build', NULL, NULL, '_t=%5B1623379574619%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-11 10:46:16');
INSERT INTO `sys_log` VALUES (1403265277214437377, 1, 'administrator', '删除用户', '/tumo-boot/upms/user/1', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.delete()', '', '192.168.1.166', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-11 16:18:08');
INSERT INTO `sys_log` VALUES (1403265830640201730, 1, 'administrator', '删除用户', '/tumo-boot/upms/user/1', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.delete()', '', '192.168.1.166', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-11 16:20:20');
INSERT INTO `sys_log` VALUES (1403269608902766594, 2, 'administrator', '服务器异常', '/tumo-boot/upms/user/1', NULL, NULL, '', '192.168.1.166', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-11 16:35:21');
INSERT INTO `sys_log` VALUES (1403275117632618497, 2, 'administrator', '服务器异常', '/tumo-boot/upms/user/1', NULL, NULL, '', '192.168.1.166', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-11 16:57:14');
INSERT INTO `sys_log` VALUES (1403275215355707394, 2, 'administrator', '服务器异常', '/tumo-boot/upms/user/1', NULL, NULL, '', '192.168.1.166', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-11 16:57:38');
INSERT INTO `sys_log` VALUES (1403275296792313858, 2, 'administrator', '服务器异常', '/tumo-boot/upms/user/1', NULL, NULL, '', '192.168.1.166', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-11 16:57:57');
INSERT INTO `sys_log` VALUES (1403275335606403073, 2, 'administrator', '服务器异常', '/tumo-boot/upms/user/1', NULL, NULL, '', '192.168.1.166', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-11 16:58:06');
INSERT INTO `sys_log` VALUES (1403275963657289729, 2, 'administrator', '服务器异常', '/tumo-boot/upms/user/1', NULL, NULL, '', '192.168.1.166', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-11 17:00:36');
INSERT INTO `sys_log` VALUES (1403277378272104450, 2, 'administrator', '服务器异常', '/tumo-boot/upms/user/1', NULL, NULL, '', '192.168.1.166', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-11 17:06:13');
INSERT INTO `sys_log` VALUES (1403291012624859137, 2, 'administrator', '没有访问权限', '/tumo-boot/upms/user/1', NULL, NULL, '', '192.168.1.166', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-11 18:00:24');
INSERT INTO `sys_log` VALUES (1403338402297958402, 2, NULL, '请求未授权', '/tumo-boot/auth/logout', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-11 21:08:40');
INSERT INTO `sys_log` VALUES (1403349547129917442, 2, 'administrator', '服务器异常', '/tumo-boot/upms/user/checkName', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-11 21:53:00');
INSERT INTO `sys_log` VALUES (1403504660253421569, 1, 'administrator', '修改角色', '/tumo-boot/upms/role', 0, 'cn.tycoding.boot.modules.upms.controller.SysRoleController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-12 08:09:21');
INSERT INTO `sys_log` VALUES (1403531707617079298, 2, NULL, '请求未授权', '/tumo-boot/upms/menu/build', NULL, NULL, '_t=%5B1623463007022%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-12 09:56:48');
INSERT INTO `sys_log` VALUES (1403542523435257858, 1, 'administrator', '新增菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-12 10:39:49');
INSERT INTO `sys_log` VALUES (1403542705770041345, 1, 'administrator', '新增菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-12 10:40:32');
INSERT INTO `sys_log` VALUES (1403581011010445313, 1, 'administrator', '修改菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-12 13:12:45');
INSERT INTO `sys_log` VALUES (1403581109656281089, 1, 'administrator', '修改菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-12 13:13:08');
INSERT INTO `sys_log` VALUES (1403581335393722370, 1, 'administrator', '修改菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-12 13:14:02');
INSERT INTO `sys_log` VALUES (1403581377647140865, 1, 'administrator', '修改菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-12 13:14:12');
INSERT INTO `sys_log` VALUES (1403581490029322242, 1, 'administrator', '新增菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-12 13:14:39');
INSERT INTO `sys_log` VALUES (1403582157879959553, 1, 'administrator', '修改菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-12 13:17:18');
INSERT INTO `sys_log` VALUES (1403590687764717569, 2, NULL, '请求未授权', '/tumo-boot/auth/token/page', NULL, NULL, 'page=%5B1%5D&limit=%5B10%5D&_t=%5B1623477071949%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-12 13:51:12');
INSERT INTO `sys_log` VALUES (1404052101824409602, 2, NULL, '请求未授权', '/tumo-boot/upms/menu/build', NULL, NULL, '_t=%5B1623587075767%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-13 20:24:39');
INSERT INTO `sys_log` VALUES (1404259584769671169, 2, NULL, '请求未授权', '/tumo-boot/upms/menu/build', NULL, NULL, '_t=%5B1623636544091%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-14 10:09:07');
INSERT INTO `sys_log` VALUES (1404788133213663233, 2, NULL, '请求未授权', '/tumo-boot/upms/menu/build', NULL, NULL, '_t=%5B1623762560128%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 21:09:20');
INSERT INTO `sys_log` VALUES (1404788349027381249, 2, 'administrator', '没有访问权限', '/tumo-boot/upms/user/1362598312234024962', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 21:10:17');
INSERT INTO `sys_log` VALUES (1404794150051848193, 2, 'administrator', '没有访问权限', '/tumo-boot/upms/user/1362598312234024962', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 21:33:20');
INSERT INTO `sys_log` VALUES (1404796479710896129, 1, 'administrator', '新增菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 21:42:35');
INSERT INTO `sys_log` VALUES (1404796557972414466, 1, 'administrator', '修改菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 21:42:54');
INSERT INTO `sys_log` VALUES (1404796621566451713, 1, 'administrator', '修改菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 21:43:09');
INSERT INTO `sys_log` VALUES (1404798494981693442, 1, 'administrator', '修改菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 21:50:36');
INSERT INTO `sys_log` VALUES (1404798583976435713, 1, 'administrator', '修改菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 21:50:57');
INSERT INTO `sys_log` VALUES (1404798622836662273, 1, 'administrator', '修改菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 21:51:06');
INSERT INTO `sys_log` VALUES (1404798663450107906, 1, 'administrator', '修改菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 21:51:16');
INSERT INTO `sys_log` VALUES (1404798718777171970, 1, 'administrator', '修改菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 21:51:29');
INSERT INTO `sys_log` VALUES (1404798751589212162, 1, 'administrator', '修改菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 21:51:37');
INSERT INTO `sys_log` VALUES (1404798794132037633, 1, 'administrator', '修改菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 21:51:47');
INSERT INTO `sys_log` VALUES (1404799224647983105, 1, 'administrator', '新增菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 21:53:30');
INSERT INTO `sys_log` VALUES (1404799496556322818, 1, 'administrator', '新增菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 21:54:35');
INSERT INTO `sys_log` VALUES (1404799803503878146, 1, 'administrator', '新增菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 21:55:48');
INSERT INTO `sys_log` VALUES (1404800163828146177, 1, 'administrator', '新增菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 21:57:14');
INSERT INTO `sys_log` VALUES (1404800287165849601, 1, 'administrator', '修改菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 21:57:43');
INSERT INTO `sys_log` VALUES (1404800341918294017, 1, 'administrator', '修改菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 21:57:56');
INSERT INTO `sys_log` VALUES (1404800612065026049, 1, 'administrator', '新增菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 21:59:01');
INSERT INTO `sys_log` VALUES (1404800661301960706, 1, 'administrator', '修改菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 21:59:12');
INSERT INTO `sys_log` VALUES (1404800825437659138, 1, 'administrator', '新增菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 21:59:51');
INSERT INTO `sys_log` VALUES (1404804356550893569, 1, 'administrator', '删除角色', '/tumo-boot/upms/role/1362304631325192103', 0, 'cn.tycoding.boot.modules.upms.controller.SysRoleController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 22:13:53');
INSERT INTO `sys_log` VALUES (1404804356689305602, 2, 'administrator', '业务异常', '/tumo-boot/upms/role/1362304631325192103', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 22:13:53');
INSERT INTO `sys_log` VALUES (1404805390383915010, 1, 'administrator', '新增角色', '/tumo-boot/upms/role', 0, 'cn.tycoding.boot.modules.upms.controller.SysRoleController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 22:18:00');
INSERT INTO `sys_log` VALUES (1404805459946446849, 1, 'administrator', '删除角色', '/tumo-boot/upms/role/1362597571041787906', 0, 'cn.tycoding.boot.modules.upms.controller.SysRoleController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 22:18:16');
INSERT INTO `sys_log` VALUES (1404805706181451777, 1, 'administrator', '新增用户', '/tumo-boot/upms/user', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 22:19:15');
INSERT INTO `sys_log` VALUES (1404805707162918913, 2, 'administrator', '业务异常', '/tumo-boot/upms/user', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 22:19:15');
INSERT INTO `sys_log` VALUES (1404807633644433409, 1, 'administrator', '新增用户', '/tumo-boot/upms/user', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 22:26:55');
INSERT INTO `sys_log` VALUES (1404809974137368577, 1, 'administrator', '修改用户', '/tumo-boot/upms/user', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '2021-06-15 22:36:13');
INSERT INTO `sys_log` VALUES (1405743195870031873, 1, 'administrator', '修改角色', '/tumo-boot/upms/role', 0, 'cn.tycoding.boot.modules.upms.controller.SysRoleController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:24:30');
INSERT INTO `sys_log` VALUES (1405746205211811842, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623990987259%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:36:27');
INSERT INTO `sys_log` VALUES (1405746205211811843, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623990987208%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:36:27');
INSERT INTO `sys_log` VALUES (1405746205236977665, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623990987248%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:36:27');
INSERT INTO `sys_log` VALUES (1405746205253754881, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623990987230%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:36:27');
INSERT INTO `sys_log` VALUES (1405746208307208193, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623990988160%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:36:28');
INSERT INTO `sys_log` VALUES (1405746208315596802, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623990988151%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:36:28');
INSERT INTO `sys_log` VALUES (1405746208382705666, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623990988171%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:36:28');
INSERT INTO `sys_log` VALUES (1405746208386899969, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623990988187%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:36:28');
INSERT INTO `sys_log` VALUES (1405746309381545985, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623991011792%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:36:52');
INSERT INTO `sys_log` VALUES (1405746309406711810, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623991011894%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:36:52');
INSERT INTO `sys_log` VALUES (1405746309503180802, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623991012041%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:36:52');
INSERT INTO `sys_log` VALUES (1405746309821947906, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623991012061%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:36:52');
INSERT INTO `sys_log` VALUES (1405746313399689217, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623991012677%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:36:53');
INSERT INTO `sys_log` VALUES (1405746313898811394, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623991012868%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:36:53');
INSERT INTO `sys_log` VALUES (1405746313932365825, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623991012927%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:36:53');
INSERT INTO `sys_log` VALUES (1405746313953337346, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623991012914%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:36:53');
INSERT INTO `sys_log` VALUES (1405746316427976706, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623991013768%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:36:54');
INSERT INTO `sys_log` VALUES (1405746316432171010, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623991013805%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:36:54');
INSERT INTO `sys_log` VALUES (1405746317300391938, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623991013851%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:36:54');
INSERT INTO `sys_log` VALUES (1405746317824679938, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623991013856%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:36:54');
INSERT INTO `sys_log` VALUES (1405746339064635394, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623991018993%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:36:59');
INSERT INTO `sys_log` VALUES (1405746339102384129, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623991019058%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:36:59');
INSERT INTO `sys_log` VALUES (1405746339131744258, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623991019109%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:36:59');
INSERT INTO `sys_log` VALUES (1405746339131744259, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623991019127%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:36:59');
INSERT INTO `sys_log` VALUES (1405746341556051970, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623991019728%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:37:00');
INSERT INTO `sys_log` VALUES (1405746341556051971, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623991019808%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:37:00');
INSERT INTO `sys_log` VALUES (1405746341556051972, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623991019737%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:37:00');
INSERT INTO `sys_log` VALUES (1405746341908373505, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623991019814%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:37:00');
INSERT INTO `sys_log` VALUES (1405746344097800193, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623991020369%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:37:01');
INSERT INTO `sys_log` VALUES (1405746344097800194, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623991020382%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:37:01');
INSERT INTO `sys_log` VALUES (1405746344097800195, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623991020444%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:37:01');
INSERT INTO `sys_log` VALUES (1405746344097800196, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623991020484%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:37:01');
INSERT INTO `sys_log` VALUES (1405747609846472706, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623991322237%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:42:02');
INSERT INTO `sys_log` VALUES (1405747609875832833, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623991322231%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:42:02');
INSERT INTO `sys_log` VALUES (1405747609892610049, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623991322249%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:42:02');
INSERT INTO `sys_log` VALUES (1405747609905192961, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623991322242%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:42:02');
INSERT INTO `sys_log` VALUES (1405747753526550529, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623991356530%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:42:37');
INSERT INTO `sys_log` VALUES (1405747753539133441, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623991356539%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:42:37');
INSERT INTO `sys_log` VALUES (1405747753576882177, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623991356545%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:42:37');
INSERT INTO `sys_log` VALUES (1405747753740460033, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623991356550%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:42:37');
INSERT INTO `sys_log` VALUES (1405747830018072577, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623991374767%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:42:55');
INSERT INTO `sys_log` VALUES (1405747830030655489, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623991374778%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:42:55');
INSERT INTO `sys_log` VALUES (1405747830076792834, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623991374787%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:42:55');
INSERT INTO `sys_log` VALUES (1405747830122930178, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623991374791%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:42:55');
INSERT INTO `sys_log` VALUES (1405751174463807490, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623992172156%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:56:12');
INSERT INTO `sys_log` VALUES (1405751174501556226, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623992172170%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:56:12');
INSERT INTO `sys_log` VALUES (1405751174514139137, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623992172181%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:56:12');
INSERT INTO `sys_log` VALUES (1405751174556082178, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623992172190%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:56:12');
INSERT INTO `sys_log` VALUES (1405751178263846914, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623992173087%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:56:13');
INSERT INTO `sys_log` VALUES (1405751178276429826, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623992173097%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:56:13');
INSERT INTO `sys_log` VALUES (1405751178297401346, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623992173112%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:56:13');
INSERT INTO `sys_log` VALUES (1405751178318372866, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623992173104%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 12:56:13');
INSERT INTO `sys_log` VALUES (1405761130047004673, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623994545704%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 13:35:46');
INSERT INTO `sys_log` VALUES (1405761130072170497, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623994545718%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 13:35:46');
INSERT INTO `sys_log` VALUES (1405761130097336322, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623994545730%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 13:35:46');
INSERT INTO `sys_log` VALUES (1405761130114113538, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623994545738%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 13:35:46');
INSERT INTO `sys_log` VALUES (1405761134622990338, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623994546875%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 13:35:47');
INSERT INTO `sys_log` VALUES (1405761134635573250, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623994546881%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 13:35:47');
INSERT INTO `sys_log` VALUES (1405761134639767554, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623994546894%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 13:35:47');
INSERT INTO `sys_log` VALUES (1405761134643961858, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623994546888%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 13:35:47');
INSERT INTO `sys_log` VALUES (1405769710930288642, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623996591158%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 14:09:52');
INSERT INTO `sys_log` VALUES (1405769711081283585, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623996591293%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 14:09:52');
INSERT INTO `sys_log` VALUES (1405769711148392450, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623996591311%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 14:09:52');
INSERT INTO `sys_log` VALUES (1405769711383273473, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623996591383%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 14:09:52');
INSERT INTO `sys_log` VALUES (1405769713568505858, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623996591986%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 14:09:52');
INSERT INTO `sys_log` VALUES (1405769713576894466, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623996592052%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 14:09:52');
INSERT INTO `sys_log` VALUES (1405769713597865985, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623996591992%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 14:09:52');
INSERT INTO `sys_log` VALUES (1405769713597865986, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1362598312234024962%5D&password=%5B123456%5D&_t=%5B1623996592058%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 14:09:52');
INSERT INTO `sys_log` VALUES (1405780992572055553, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1623999281361%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 14:54:41');
INSERT INTO `sys_log` VALUES (1405813633925046274, 2, 'administrator', '服务器异常', '/tumo-boot/upms/user/resetPass', NULL, NULL, 'id=%5B%7B%22isTrusted%22%3Atrue%7D%5D&password=%5B123456%5D&_t=%5B1624007063660%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 17:04:24');
INSERT INTO `sys_log` VALUES (1405813869741400066, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1624007119932%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 17:05:20');
INSERT INTO `sys_log` VALUES (1405814199422083073, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1624007198539%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 17:06:39');
INSERT INTO `sys_log` VALUES (1405815911092379649, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1624007606640%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 17:13:27');
INSERT INTO `sys_log` VALUES (1405816163417513985, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/resetPass', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.resetPass()', 'id=%5B1404807635385069569%5D&password=%5B123456%5D&_t=%5B1624007666784%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 17:14:27');
INSERT INTO `sys_log` VALUES (1405885524016861185, 1, 'demo', '删除用户', '/tumo-boot/upms/user/1362304631325102103', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 21:50:04');
INSERT INTO `sys_log` VALUES (1405885524193021954, 2, 'demo', '服务器异常', '/tumo-boot/upms/user/1362304631325102103', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-18 21:50:04');
INSERT INTO `sys_log` VALUES (1405921742381273090, 2, 'anonymousUser', '服务器异常', '/tumo-boot/auth/captcha', NULL, NULL, '_t=%5B1624032808872%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-19 00:13:59');
INSERT INTO `sys_log` VALUES (1406045086825013249, 1, 'administrator', '新增菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-19 08:24:06');
INSERT INTO `sys_log` VALUES (1406045546776584193, 1, 'administrator', '新增菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-19 08:25:56');
INSERT INTO `sys_log` VALUES (1406045741782360066, 1, 'administrator', '新增菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-19 08:26:43');
INSERT INTO `sys_log` VALUES (1406045819435704322, 1, 'administrator', '删除菜单', '/tumo-boot/upms/menu/1406045741832691713', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-19 08:27:01');
INSERT INTO `sys_log` VALUES (1406045997001564162, 1, 'demo', '删除菜单', '/tumo-boot/upms/menu/1406045546822721538', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-19 08:27:43');
INSERT INTO `sys_log` VALUES (1406050048038645762, 1, 'demo', '新增部门', '/tumo-boot/upms/dept', 0, 'cn.tycoding.boot.modules.upms.controller.SysDeptController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-19 08:43:49');
INSERT INTO `sys_log` VALUES (1406050988368048129, 1, 'demo', '删除部门', '/tumo-boot/upms/dept/1406050048185446402', 0, 'cn.tycoding.boot.modules.upms.controller.SysDeptController.delete()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-19 08:47:33');
INSERT INTO `sys_log` VALUES (1406051723289817090, 2, 'demo', '演示环境，请勿操作!', '/tumo-boot/upms/dept/1406050048185446402', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-19 08:50:28');
INSERT INTO `sys_log` VALUES (1406051788737736706, 2, 'demo', '演示环境，请勿操作!', '/tumo-boot/upms/dept', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-19 08:50:44');
INSERT INTO `sys_log` VALUES (1406052047580819457, 2, 'demo', '服务器异常', '/tumo-boot/upms/user/resetPass', NULL, NULL, 'id=%5B1362304631325102103%5D&password=%5B123456%5D&_t=%5B1624063905874%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-19 08:51:46');
INSERT INTO `sys_log` VALUES (1406052267546898433, 2, 'demo', '演示环境，请勿操作!', '/tumo-boot/upms/user/reset', NULL, NULL, 'id=%5B1362304631325102103%5D&_t=%5B1624063958379%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-19 08:52:38');
INSERT INTO `sys_log` VALUES (1406052288312897538, 2, 'demo', '演示环境，请勿操作!', '/tumo-boot/upms/user/1362304631325102103', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-19 08:52:43');
INSERT INTO `sys_log` VALUES (1406052922806235137, 1, 'administrator', '修改菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-19 08:55:15');
INSERT INTO `sys_log` VALUES (1406052981664903169, 1, 'administrator', '修改菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-19 08:55:29');
INSERT INTO `sys_log` VALUES (1406054405450756097, 1, 'administrator', '新增菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-19 09:01:08');
INSERT INTO `sys_log` VALUES (1406054405509476354, 2, 'administrator', '服务器异常', '/tumo-boot/upms/menu', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-19 09:01:08');
INSERT INTO `sys_log` VALUES (1406057138433953793, 1, 'administrator', '新增菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-19 09:12:00');
INSERT INTO `sys_log` VALUES (1406058379922771969, 1, 'administrator', '新增菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-19 09:16:56');
INSERT INTO `sys_log` VALUES (1406058753496846338, 1, 'administrator', '新增菜单', '/tumo-boot/upms/menu', 0, 'cn.tycoding.boot.modules.upms.controller.SysMenuController.add()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-19 09:18:25');
INSERT INTO `sys_log` VALUES (1406063438270173186, 1, 'administrator', '修改用户', '/tumo-boot/upms/user', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.update()', '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-19 09:37:02');
INSERT INTO `sys_log` VALUES (1406063617488588801, 1, 'administrator', '重置密码', '/tumo-boot/upms/user/reset', 0, 'cn.tycoding.boot.modules.upms.controller.SysUserController.reset()', 'id=%5B1362304631325102103%5D&password=%5B123456%5D&_t=%5B1624066664391%5D', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36', '2021-06-19 09:37:44');
INSERT INTO `sys_log` VALUES (1406805051896422401, 2, 'administrator', '服务器异常', '/tumo-boot/resource/oss/put-list', NULL, NULL, '', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36', '2021-06-21 10:43:56');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级ID',
  `path` varchar(255) DEFAULT NULL COMMENT '菜单路径',
  `perms` varchar(255) DEFAULT NULL COMMENT '权限标识',
  `type` varchar(20) DEFAULT NULL COMMENT '菜单类型',
  `order_no` int(11) DEFAULT NULL COMMENT '排序',
  `icon` varchar(100) DEFAULT NULL COMMENT '菜单图标',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `is_disabled` tinyint(1) DEFAULT NULL COMMENT '是否禁用',
  `is_ext` tinyint(1) DEFAULT NULL COMMENT '是否外链',
  `is_keepalive` tinyint(1) DEFAULT NULL COMMENT '是否缓存',
  `is_show` tinyint(1) DEFAULT NULL COMMENT '是否显示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1402556566351122433, '权限模块', 0, '/upms', '', 'menu', 100, 'ant-design:setting-outlined', 'Layout', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402557067260071938, '用户管理', 1402556566351122433, 'user', '', 'menu', 101, 'ant-design:user-switch-outlined', '/modules/upms/user/index', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402557067260071948, '用户查看', 1402557067260071938, NULL, 'upms:user:view', 'button', 102, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402562175471669250, '用户新增', 1402557067260071938, NULL, 'upms:user:add', 'button', 103, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402563862928248833, '用户修改', 1402557067260071938, NULL, 'upms:user:update', 'button', 104, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402564440660070202, '重置密码', 1402557067260071938, NULL, 'upms:user:reset', 'button', 106, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402564440660070402, '用户删除', 1402557067260071938, NULL, 'upms:user:delete', 'button', 105, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402891854378217473, '角色管理', 1402556566351122433, 'role', '', 'menu', 110, 'ant-design:user-switch-outlined', '/modules/upms/role/index', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402891854378217483, '角色查看', 1402891854378217473, NULL, 'upms:role:view', 'button', 111, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402895826841288705, '角色新增', 1402891854378217473, NULL, 'upms:role:add', 'button', 112, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402895916096077825, '角色修改', 1402891854378217473, NULL, 'upms:role:update', 'button', 113, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402896004537171970, '角色删除', 1402891854378217473, NULL, 'upms:role:delete', 'button', 114, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402896397505708033, '部门管理', 1402556566351122433, 'dept', '', 'menu', 120, 'ant-design:audit-outlined', '/modules/upms/dept/index', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402896397505708133, '部门查看', 1402896397505708033, NULL, 'upms:dept:view', 'button', 121, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402896819314278401, '部门新增', 1402896397505708033, NULL, 'upms:dept:add', 'button', 122, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402896925455335425, '部门修改', 1402896397505708033, NULL, 'upms:dept:update', 'button', 123, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402897035325128705, '部门删除', 1402896397505708033, NULL, 'upms:dept:delete', 'button', 124, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402897356944359426, '菜单管理', 1402556566351122433, 'menu', '', 'menu', 130, 'ant-design:unordered-list-outlined', '/modules/upms/menu/index', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402897356944359526, '菜单查看', 1402897356944359426, NULL, 'upms:menu:view', 'button', 131, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402897461059567617, '菜单新增', 1402897356944359426, NULL, 'upms:menu:add', 'button', 132, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402897607436582914, '菜单修改', 1402897356944359426, NULL, 'upms:menu:update', 'button', 133, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402897754488881153, '菜单删除', 1402897356944359426, NULL, 'upms:menu:delete', 'button', 134, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402900711645126657, '资源模块', NULL, '/resource', '', 'menu', 200, 'ant-design:fork-outlined', 'Layout', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402901682110603265, '系统日志', 1402900711645126657, 'log', '', 'menu', 210, 'ant-design:thunderbolt-filled', '/modules/resource/log/index', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402901682110603365, '日志查看', 1402901682110603265, NULL, 'resource:log:view', 'button', 211, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402902022428041217, '日志删除', 1402901682110603265, NULL, 'resource:log:delete', 'button', 212, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402902525295730689, '文件管理', 1402900711645126657, 'file', '', 'menu', 220, 'ant-design:folder-open-twotone', '/modules/resource/oss/index', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402902525295730789, '文件查看', 1402902525295730689, NULL, 'resource:oss:view', 'button', 221, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402902709501173762, '文件新增', 1402902525295730689, NULL, 'resource:oss:add', 'button', 222, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402902826891354113, '文件修改', 1402902525295730689, NULL, 'resource:oss:update', 'button', 223, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402903214973526017, '文件删除', 1402902525295730689, NULL, 'resource:oss:delete', 'button', 224, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1403542523561086978, '令牌管理', 1402900711645126657, 'token', '', 'menu', 201, 'ant-design:property-safety-outlined', '/modules/resource/token/index', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1403542523561087978, '令牌查看', 1403542523561086978, NULL, 'resource:token:view', 'button', 202, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1403542523561187978, '令牌详情', 1403542523561086978, NULL, 'resource:token:info', 'button', 203, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1403542705811984386, '令牌删除', 1403542523561086978, NULL, 'resource:token:delete', 'button', 204, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1403549005811984386, '项目文档', NULL, '/doc', 'doc:view', 'menu', 300, 'ant-design:rocket-outlined', '', 0, 1, 1, 1);
INSERT INTO `sys_menu` VALUES (1406057138559782913, 'API文档', 1403549005811984386, 'http://127.0.0.1:8010/doc.html', 'doc:api:view', 'menu', 301, 'ant-design:tag-outlined', NULL, 0, 1, 1, 1);
INSERT INTO `sys_menu` VALUES (1406058379956326402, '开发文档', 1403549005811984386, 'http://docs.boot.tycoding.cn/', 'doc:dev:view', 'menu', 302, 'ant-design:star-outlined', NULL, 0, 1, 1, 1);
INSERT INTO `sys_menu` VALUES (1406058753513623553, '开源地址', 1403549005811984386, 'https://github.com/Tumo-Team/Tumo-Boot', 'doc:git:view', 'menu', 303, 'ant-design:github-filled', NULL, 0, 1, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级节点',
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `alias` varchar(20) DEFAULT NULL COMMENT '角色别名',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态 0锁定 1有效',
  `des` varchar(100) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1362304631325192103, 0, '超级管理员', 'administrator', 1, '超级管理员管理员，不受权限控制');
INSERT INTO `sys_role` VALUES (1404805390442635266, 0, '演示环境角色', 'demo_env', 1, '演示环境使用角色，没有页面操作权限');
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
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402556566351122433);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402557067260071938);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402557067260071948);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402562175471669250);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402563862928248833);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402564440660070402);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402891854378217473);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402891854378217483);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402895826841288705);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402895916096077825);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402896004537171970);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402896397505708033);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402896397505708133);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402896819314278401);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402896925455335425);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402897035325128705);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402897356944359426);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402897356944359526);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402897461059567617);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402897607436582914);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402897754488881153);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402900711645126657);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402901682110603265);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402901682110603365);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402902022428041217);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402902525295730689);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402902525295730789);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402902709501173762);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402902826891354113);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1402903214973526017);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1403542523561086978);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1403542523561087978);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1403542523561187978);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1403542705811984386);
INSERT INTO `sys_role_menu` VALUES (1404805390442635266, 1403549005811984386);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL COMMENT '用户ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `real_name` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `sex` varchar(10) DEFAULT NULL COMMENT '性别',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  `avatar` varchar(100) DEFAULT NULL COMMENT '头像',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态 0锁定 1有效',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1362304631325102103, 'administrator', '$2a$10$ax1tsaE7fqB03iMQ/zeV8OAQ4bcTu5ik92XUfzUsP2XVrEXsFO/pS', '超级管理员', '女', '19809587830', 'tycoding@sina.com', 1362597682681577473, '/upload/default.png', 1, '2019-01-01 00:00:00');
INSERT INTO `sys_user` VALUES (1362598312234024962, 'tycoding', '$2a$10$KBNb3GXoL4KKy55reaxnq.y0SgPWy2C6GT5yDqUuCSzCpqVBBGORK', '涂陌', '男', '19823879128', 'tycoding@sina.com', 1362597682681577473, '/upload/default.png', 1, '2021-02-19 11:02:08');
INSERT INTO `sys_user` VALUES (1404807635385069569, 'demo', '$2a$10$/07tXYxlTY/iJfVZOU.8AeeZiQLX3MIQWUGwV9/N3wH6nMUbYFpl2', '演示环境账号', '男', '18929809812', 'ty@qq.com', 1362597682681577273, '/upload/default.png', 1, '2021-06-15 22:26:55');
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
INSERT INTO `sys_user_role` VALUES (1362304631325102103, 1362304631325192103);
INSERT INTO `sys_user_role` VALUES (1404807635385069569, 1404805390442635266);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
