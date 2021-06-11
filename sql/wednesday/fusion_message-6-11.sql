/*
 Navicat Premium Data Transfer

 Source Server         : luna-xiccc-distribute-winserver
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : f.xicc.cc:3930
 Source Schema         : fusion_message

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 11/06/2021 16:20:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_template
-- ----------------------------
DROP TABLE IF EXISTS `tb_template`;
CREATE TABLE `tb_template` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `modified_time` datetime NOT NULL,
  `subject` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_template
-- ----------------------------
BEGIN;
INSERT INTO `tb_template` VALUES (13, '2020-02-05 20:41:33', '2020-02-05 20:41:31', '您已重置密码', '您已重置密码，新密码为：${newPassword}，请妥善保存。');
INSERT INTO `tb_template` VALUES (14, '2020-05-24 22:04:16', '2020-05-24 22:04:18', 'HCE新平台迁移完毕', 'HCE分布式平台的用户您好：\r\n\r\n我们很高兴的通知您，平台升级已经完成，您可以使用您之前的用户名和密码登录新平台，新平台地址为：https://wed.iteknical.com\r\n我们强烈建议您登录新平台后先修改密码。\r\n\r\n新平台目前提供官方客户端和独立的Nicehash Miner以供运算获取收益。\r\n\r\n对于最近想购买新硬件的用户，我们也提供了收益计算器以供参考：https://wed.iteknical.com/wednesday/profitCalc\r\n\r\n祝您生活愉快。\r\nHCE分布式团队');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
