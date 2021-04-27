/*
 Navicat Premium Data Transfer

 Source Server         : aliyuncs
 Source Server Type    : MySQL
 Source Server Version : 50616
 Source Host           : pc-bp1lsgy6vl6yrrl81-test.rwlb.rds.aliyuncs.com:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 50616
 File Encoding         : 65001

 Date: 23/04/2021 09:00:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_sys_parameter
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_parameter`;
CREATE TABLE `t_sys_parameter` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_id` int(11) DEFAULT NULL COMMENT '机构ID',
  `param_key` varchar(64) DEFAULT NULL COMMENT '参数key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT '参数值',
  `server_id` int(11) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL COMMENT '参数描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_param_key` (`company_id`,`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统参数表';

-- ----------------------------
-- Records of t_sys_parameter
-- ----------------------------
BEGIN;
INSERT INTO `t_sys_parameter` VALUES (9, 7011, 'PERSON', '自然人', NULL, '现在支付商户类型', '2021-04-14 15:05:00');
INSERT INTO `t_sys_parameter` VALUES (10, 7011, 'INDIVIDUAL', '个体户', NULL, '现在支付商户类型', '2021-04-14 15:16:11');
INSERT INTO `t_sys_parameter` VALUES (11, 7011, 'ENTERPRISE', '企业', NULL, '现在支付商户类型', '2021-04-14 15:16:29');
INSERT INTO `t_sys_parameter` VALUES (12, 7011, 'UNI_CREDIT_CODE', '统一社会信用代码证', NULL, '现在支付证件类型', '2021-04-14 15:17:26');
INSERT INTO `t_sys_parameter` VALUES (14, 7011, 'CORP_CODE', '营业执照', NULL, '现在支付证件类型', '2021-04-14 15:18:37');
INSERT INTO `t_sys_parameter` VALUES (15, 7011, 'TO_BUSINESS', '对公', NULL, '现在支付结算银行卡类型', '2021-04-14 15:19:56');
INSERT INTO `t_sys_parameter` VALUES (16, 7011, 'TO_PERSONAL', '对私', NULL, '现在支付结算银行卡类型', '2021-04-14 15:20:28');
INSERT INTO `t_sys_parameter` VALUES (17, 7011, '14', '小程序', NULL, '现在支付设备类型', '2021-04-14 15:23:29');
INSERT INTO `t_sys_parameter` VALUES (18, 7011, '05', '被扫支付', NULL, '现在支付设备类型', '2021-04-14 15:24:06');
INSERT INTO `t_sys_parameter` VALUES (19, 7011, '20', '聚合动态码', NULL, '现在支付设备类型', '2021-04-14 15:28:25');
INSERT INTO `t_sys_parameter` VALUES (20, 7011, '0600', '公众号', NULL, '现在支付设备类型', '2021-04-14 15:38:19');
INSERT INTO `t_sys_parameter` VALUES (21, 7011, '0603', '卡牌', NULL, '现在支付设备类型', '2021-04-14 15:39:03');
INSERT INTO `t_sys_parameter` VALUES (22, 7011, '13', '微信', NULL, '现在支付渠道类型', '2021-04-14 15:40:26');
INSERT INTO `t_sys_parameter` VALUES (23, 7011, '12', '支付宝', NULL, '现在支付渠道类型', '2021-04-14 15:40:48');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
