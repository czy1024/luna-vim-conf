/*
 Navicat Premium Data Transfer

 Source Server         : luna-local
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : localhost:3306
 Source Schema         : luna-csi

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 08/05/2021 08:47:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_anno
-- ----------------------------
DROP TABLE IF EXISTS `tb_anno`;
CREATE TABLE `tb_anno` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '公告编号',
  `user_id` bigint(20) NOT NULL COMMENT '创建人',
  `anno_title` varchar(255) DEFAULT NULL COMMENT '公告标题',
  `anno_content` text COMMENT '公告内容',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL COMMENT '锁',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='通知公告';

-- ----------------------------
-- Records of tb_anno
-- ----------------------------
BEGIN;
INSERT INTO `tb_anno` VALUES (1, 26, '你好中国1', '你好中国', '2021-05-06 15:22:25', '2021-05-06 16:00:43', 3);
INSERT INTO `tb_anno` VALUES (2, 26, '你好中国', '你好中国', '2021-05-06 15:23:11', '2021-05-06 15:23:11', 0);
INSERT INTO `tb_anno` VALUES (3, 26, '你好中国', '你好中国', '2021-05-06 15:23:29', '2021-05-06 15:25:38', 1);
INSERT INTO `tb_anno` VALUES (4, 26, '你好中国', '你好中国', '2021-05-06 15:23:29', '2021-05-06 15:25:38', 1);
INSERT INTO `tb_anno` VALUES (5, 26, '你好中国', '你好中国', '2021-05-06 15:23:29', '2021-05-06 15:25:38', 1);
INSERT INTO `tb_anno` VALUES (6, 26, '1231321', '1231321', '2021-05-06 16:05:44', '2021-05-06 16:05:44', 0);
INSERT INTO `tb_anno` VALUES (7, 26, '你好中国', 'request', '2021-05-06 17:30:04', '2021-05-06 17:30:04', 0);
INSERT INTO `tb_anno` VALUES (8, 26, '你好中国', '你好中国', '2021-05-06 18:36:13', '2021-05-06 18:36:13', 0);
COMMIT;

-- ----------------------------
-- Table structure for tb_dept
-- ----------------------------
DROP TABLE IF EXISTS `tb_dept`;
CREATE TABLE `tb_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门编号',
  `dept_name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `dept_remark` varchar(300) DEFAULT NULL,
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL COMMENT '锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of tb_dept
-- ----------------------------
BEGIN;
INSERT INTO `tb_dept` VALUES (4, '技术部', '备注', '2021-04-28 18:34:09', '2021-04-28 18:34:09', 0);
INSERT INTO `tb_dept` VALUES (6, '市场部', '备注', '2021-04-28 18:34:10', '2021-04-29 19:39:13', 4);
INSERT INTO `tb_dept` VALUES (8, '销售部', '备注', '2021-04-28 18:34:11', '2021-04-28 18:34:11', 4);
INSERT INTO `tb_dept` VALUES (9, '后勤部', '备注', '2021-04-28 18:34:11', '2021-04-28 18:34:11', 4);
INSERT INTO `tb_dept` VALUES (10, '总裁办', '备注', '2021-04-28 18:34:12', '2021-04-28 18:34:12', 0);
INSERT INTO `tb_dept` VALUES (25, '行政办', '行政办', '2021-04-30 11:01:41', '2021-04-30 11:01:41', 0);
COMMIT;

-- ----------------------------
-- Table structure for tb_document
-- ----------------------------
DROP TABLE IF EXISTS `tb_document`;
CREATE TABLE `tb_document` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文档编号',
  `create_by` bigint(20) NOT NULL COMMENT '创建人',
  `file_title` varchar(255) DEFAULT NULL COMMENT '文档标题',
  `file_description` varchar(255) DEFAULT NULL COMMENT '文档描述',
  `file_url` varchar(255) DEFAULT NULL COMMENT '文档地址',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL COMMENT '锁',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COMMENT='文档信息表';

-- ----------------------------
-- Records of tb_document
-- ----------------------------
BEGIN;
INSERT INTO `tb_document` VALUES (47, 26, '房间打扫完成', '房间打扫完成', 'http://127.0.0.1:8081/Users/luna_mac/csi/2021/05/06/270333723d264a82a7afbd4037c77430.zip', '2021-05-06 15:10:53', '2021-05-06 15:10:53', 0);
INSERT INTO `tb_document` VALUES (48, 26, '房间打扫完成', '房间打扫完成', 'http://127.0.0.1:8081/Users/luna_mac/csi/2021/05/06/fc7b79c8d411442284c6bfd7f5be4917.zip', '2021-05-06 15:11:12', '2021-05-06 15:11:12', 0);
INSERT INTO `tb_document` VALUES (49, 26, '房间打扫完成', '房间打扫完成', 'http://127.0.0.1:8081/Users/luna_mac/csi/2021/05/06/799f5483d65f49b6a7e521dc0bd5370d.zip', '2021-05-06 15:11:32', '2021-05-06 15:11:32', 0);
INSERT INTO `tb_document` VALUES (50, 26, '房间打扫完成', '房间打扫完成', 'http://127.0.0.1:8081/Users/luna_mac/csi/2021/05/06/b65fb0961e7d40debbcb9ffe38e444eb.zip', '2021-05-06 15:11:34', '2021-05-06 15:11:34', 0);
INSERT INTO `tb_document` VALUES (51, 26, '房间打扫完成', '房间打扫完成', 'http://127.0.0.1:8081/Users/luna_mac/csi/2021/05/06/c287d8d75cc64ad08691a903ec7c48c0.zip', '2021-05-06 15:11:36', '2021-05-06 15:11:36', 0);
INSERT INTO `tb_document` VALUES (52, 26, '房间打扫完成', '房间打扫完成', 'http://127.0.0.1:8081/Users/luna_mac/csi/2021/05/06/f739939c046a458e932789f33bda6b2f.zip', '2021-05-06 15:11:38', '2021-05-06 15:11:38', 0);
INSERT INTO `tb_document` VALUES (53, 26, '你好中国', '你好中国', 'http://127.0.0.1:8081/Users/luna_mac/csi/2021/05/07/0466064012a046fcac12780d8a61b3d1.zip', '2021-05-07 18:54:19', '2021-05-07 18:54:19', 0);
COMMIT;

-- ----------------------------
-- Table structure for tb_emp
-- ----------------------------
DROP TABLE IF EXISTS `tb_emp`;
CREATE TABLE `tb_emp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门编号',
  `job_id` bigint(20) NOT NULL COMMENT '职位编号',
  `emp_name` varchar(20) DEFAULT NULL COMMENT '员工名称',
  `card_id` varchar(18) DEFAULT NULL COMMENT '身份码',
  `emp_address` varchar(50) DEFAULT NULL COMMENT '员工地址',
  `post_code` varchar(50) DEFAULT NULL,
  `emp_tel` varchar(16) DEFAULT NULL COMMENT '员工电话',
  `emp_phone` varchar(11) DEFAULT NULL COMMENT '员工手机',
  `qq_num` varchar(10) DEFAULT NULL COMMENT 'QQ',
  `emp_email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `emp_sex` int(11) DEFAULT NULL COMMENT '性别',
  `emp_party` varchar(10) DEFAULT NULL COMMENT '政治面貌',
  `emp_birthday` datetime DEFAULT NULL COMMENT '生日',
  `emp_race` varchar(100) DEFAULT NULL COMMENT '民族',
  `emp_edu` varchar(10) DEFAULT NULL COMMENT '学位',
  `emp_major` varchar(20) DEFAULT NULL COMMENT '经理',
  `emp_hobby` varchar(100) DEFAULT NULL COMMENT '爱好',
  `emp_remark` varchar(500) DEFAULT NULL,
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL COMMENT '锁',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_empdepID` (`dept_id`),
  KEY `FK_empjobID` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='员工信息表';

-- ----------------------------
-- Records of tb_emp
-- ----------------------------
BEGIN;
INSERT INTO `tb_emp` VALUES (1, 4, 5, '小明', '500384199911072412', '江苏南通', '408400', '028-87786543', '15696756584', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-27 08:00:00', '汉族', '本科', '1', '乒乓球', NULL, '2021-04-28 19:07:51', '2021-05-06 14:14:17', 1);
INSERT INTO `tb_emp` VALUES (2, 6, 1, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '1', '乒乓球', NULL, '2021-04-28 19:10:52', '2021-04-28 19:10:52', 0);
INSERT INTO `tb_emp` VALUES (3, 8, 1, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '1', '乒乓球', NULL, '2021-04-28 19:10:57', '2021-04-28 19:49:58', 1);
INSERT INTO `tb_emp` VALUES (4, 9, 1, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '1', '乒乓球', NULL, '2021-04-28 19:10:58', '2021-04-28 19:49:58', 1);
INSERT INTO `tb_emp` VALUES (5, 4, 5, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-28 19:10:59', '2021-04-28 19:49:58', 1);
INSERT INTO `tb_emp` VALUES (6, 6, 1, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:21', '2021-04-29 20:53:21', 0);
INSERT INTO `tb_emp` VALUES (7, 8, 1, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756582', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-10 08:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:21', '2021-04-30 10:52:57', 1);
INSERT INTO `tb_emp` VALUES (8, 9, 1, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:21', '2021-04-29 20:53:21', 0);
INSERT INTO `tb_emp` VALUES (9, 10, 1, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '1', '乒乓球', NULL, '2021-04-29 20:53:27', '2021-04-29 20:53:27', 0);
INSERT INTO `tb_emp` VALUES (10, 4, 5, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:27', '2021-04-29 20:53:27', 0);
INSERT INTO `tb_emp` VALUES (11, 6, 1, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:27', '2021-04-29 20:53:27', 0);
INSERT INTO `tb_emp` VALUES (12, 8, 1, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:28', '2021-04-29 20:53:28', 0);
INSERT INTO `tb_emp` VALUES (13, 9, 1, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:28', '2021-04-29 20:53:28', 0);
INSERT INTO `tb_emp` VALUES (14, 10, 1, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:28', '2021-04-29 20:53:28', 0);
INSERT INTO `tb_emp` VALUES (15, 4, 5, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:28', '2021-04-29 20:53:28', 0);
INSERT INTO `tb_emp` VALUES (16, 6, 1, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:28', '2021-04-29 20:53:28', 0);
INSERT INTO `tb_emp` VALUES (17, 8, 1, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:28', '2021-04-29 20:53:28', 0);
INSERT INTO `tb_emp` VALUES (18, 9, 1, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:29', '2021-04-29 20:53:29', 0);
INSERT INTO `tb_emp` VALUES (19, 10, 1, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:29', '2021-04-29 20:53:29', 0);
INSERT INTO `tb_emp` VALUES (20, 4, 5, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:29', '2021-04-29 20:53:29', 0);
INSERT INTO `tb_emp` VALUES (21, 6, 1, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:29', '2021-04-29 20:53:29', 0);
INSERT INTO `tb_emp` VALUES (22, 8, 1, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:29', '2021-04-29 20:53:29', 0);
INSERT INTO `tb_emp` VALUES (23, 9, 1, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:29', '2021-04-29 20:53:29', 0);
INSERT INTO `tb_emp` VALUES (24, 10, 1, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:30', '2021-04-29 20:53:30', 0);
INSERT INTO `tb_emp` VALUES (25, 4, 5, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:30', '2021-04-29 20:53:30', 0);
INSERT INTO `tb_emp` VALUES (26, 6, 1, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:30', '2021-04-29 20:53:30', 0);
INSERT INTO `tb_emp` VALUES (27, 8, 1, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:30', '2021-04-29 20:53:30', 0);
INSERT INTO `tb_emp` VALUES (28, 9, 1, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:30', '2021-04-29 20:53:30', 0);
INSERT INTO `tb_emp` VALUES (29, 10, 1, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:30', '2021-04-29 20:53:30', 0);
INSERT INTO `tb_emp` VALUES (30, 4, 5, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:30', '2021-04-29 20:53:30', 0);
INSERT INTO `tb_emp` VALUES (31, 6, 1, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:30', '2021-04-29 20:53:30', 0);
INSERT INTO `tb_emp` VALUES (32, 9, 1, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:30', '2021-04-29 20:53:30', 0);
INSERT INTO `tb_emp` VALUES (33, 8, 1, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:31', '2021-04-29 20:53:31', 0);
INSERT INTO `tb_emp` VALUES (34, 4, 5, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:31', '2021-04-29 20:53:31', 0);
INSERT INTO `tb_emp` VALUES (35, 4, 5, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:31', '2021-04-29 20:53:31', 0);
INSERT INTO `tb_emp` VALUES (36, 4, 3, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:32', '2021-04-29 20:53:32', 0);
INSERT INTO `tb_emp` VALUES (37, 4, 3, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:32', '2021-04-29 20:53:32', 0);
INSERT INTO `tb_emp` VALUES (38, 4, 3, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:32', '2021-04-29 20:53:32', 0);
INSERT INTO `tb_emp` VALUES (39, 4, 3, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:32', '2021-04-29 20:53:32', 0);
INSERT INTO `tb_emp` VALUES (40, 4, 3, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:32', '2021-04-29 20:53:32', 0);
INSERT INTO `tb_emp` VALUES (41, 4, 3, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:32', '2021-04-29 20:53:32', 0);
INSERT INTO `tb_emp` VALUES (42, 4, 3, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:33', '2021-04-29 20:53:33', 0);
INSERT INTO `tb_emp` VALUES (43, 4, 2, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:33', '2021-04-29 20:53:33', 0);
INSERT INTO `tb_emp` VALUES (44, 4, 2, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:33', '2021-04-29 20:53:33', 0);
INSERT INTO `tb_emp` VALUES (45, 4, 2, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:33', '2021-04-29 20:53:33', 0);
INSERT INTO `tb_emp` VALUES (46, 4, 2, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:33', '2021-04-29 20:53:33', 0);
INSERT INTO `tb_emp` VALUES (47, 4, 2, '小明', '500384199911072412', '江苏南通', '408400', '-87786515', '15696756583', '1173282254', '15696756582@163.com', 1, '共青团员', '1999-11-07 00:00:00', '汉族', '本科', '0', '乒乓球', NULL, '2021-04-29 20:53:33', '2021-04-29 20:53:33', 0);
INSERT INTO `tb_emp` VALUES (48, 10, 76, '小红', '500384199911072412', '江苏南通', '408400', '028-87786543', '15696756582', '1173282254', '15696756582@163.com', 1, '共青团员', '2021-03-31 08:00:00', '汉族', '研究生', '0', '唱歌', NULL, '2021-04-30 11:20:44', '2021-04-30 11:20:44', 0);
INSERT INTO `tb_emp` VALUES (49, 4, 3, '小张', '500384199911072412', '江苏南通', '408400', '028-87786543', '15696756582', '1173282254', '15696756582@163.com', 1, '共青团员', '2021-04-14 08:00:00', '汉族', '研究生', '0', '唱歌', NULL, '2021-04-30 11:24:55', '2021-04-30 11:24:55', 0);
INSERT INTO `tb_emp` VALUES (50, 4, 4, '小话', '500384199911072412', '江苏南通', '408400', '028-87786543', '15696756582', '1173282254', '15696756582@163.com', 1, '共青团员', '2021-04-14 08:00:00', '汉族', '研究生', '1', '唱歌', NULL, '2021-04-30 11:32:02', '2021-04-30 11:32:02', 0);
COMMIT;

-- ----------------------------
-- Table structure for tb_job
-- ----------------------------
DROP TABLE IF EXISTS `tb_job`;
CREATE TABLE `tb_job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '职位编号',
  `job_name` varchar(50) DEFAULT NULL COMMENT '职位名称',
  `job_remark` varchar(300) DEFAULT NULL,
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL COMMENT '锁',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unique_jobName` (`job_name`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='职位表';

-- ----------------------------
-- Records of tb_job
-- ----------------------------
BEGIN;
INSERT INTO `tb_job` VALUES (1, 'C程序员', 'C程序员', '2021-04-28 19:42:05', '2021-04-29 20:33:52', 1);
INSERT INTO `tb_job` VALUES (2, 'C#程序员', 'C#程序员', '2021-04-28 19:42:05', '2021-04-28 19:42:05', 0);
INSERT INTO `tb_job` VALUES (3, 'C++程序员', 'C++程序员', '2021-04-29 19:54:03', '2021-04-29 19:54:03', 0);
INSERT INTO `tb_job` VALUES (5, 'JAVA程序员', 'JAVA程序员', '2021-05-07 18:58:47', '2021-05-07 18:58:50', 0);
INSERT INTO `tb_job` VALUES (76, '行政助理', '行政助理', '2021-04-30 11:05:01', '2021-04-30 11:05:01', 0);
COMMIT;

-- ----------------------------
-- Table structure for tb_role_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_user`;
CREATE TABLE `tb_role_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role_name` varchar(20) NOT NULL COMMENT '角色名称',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户编号',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL COMMENT '锁',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of tb_role_user
-- ----------------------------
BEGIN;
INSERT INTO `tb_role_user` VALUES (1, '超级管理员', 2, '2021-04-28 22:03:34', '2021-04-28 22:08:32', 1);
INSERT INTO `tb_role_user` VALUES (2, '管理员', 2, '2021-04-28 22:06:26', '2021-04-28 22:06:26', 0);
INSERT INTO `tb_role_user` VALUES (4, '管理员', 4, '2021-04-28 22:06:53', '2021-04-28 22:06:53', 0);
INSERT INTO `tb_role_user` VALUES (5, '超级管理员', 2, '2021-04-28 22:06:53', '2021-04-28 22:10:31', 1);
INSERT INTO `tb_role_user` VALUES (8, '超级管理员', 2, '2021-04-28 22:09:34', '2021-04-28 22:10:04', 1);
COMMIT;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `gender` char(1) DEFAULT NULL COMMENT '性别',
  `cellphone` varchar(255) DEFAULT NULL COMMENT '手机',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `status` int(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '状态',
  `faceurl` varchar(255) DEFAULT NULL COMMENT '人脸图片',
  `facedata` varchar(255) DEFAULT NULL COMMENT '人脸key',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL COMMENT '锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='用户表\n';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
BEGIN;
INSERT INTO `tb_user` VALUES (26, 'admin123', '0c909a141f1f2c0a1cb602b0b2d7d050', '1', '15696756582', '15696756582@163.com', 0, NULL, NULL, '2021-04-28 17:16:04', '2021-05-07 22:38:05', 15);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
