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

 Date: 23/04/2021 08:57:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for now_merchant_query_state
-- ----------------------------
DROP TABLE IF EXISTS `now_merchant_query_state`;
CREATE TABLE `now_merchant_query_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `app_id` varchar(32) NOT NULL COMMENT '商户应用标识',
  `mch_id` varchar(32) NOT NULL COMMENT '你好现在商户号',
  `sub_mch_id` varchar(32) DEFAULT NULL COMMENT '子商户号',
  `legal_id_card` varchar(32) DEFAULT NULL COMMENT '法人身份证号',
  `card_no` varchar(32) DEFAULT NULL COMMENT '结算卡号',
  `device_id` varchar(4) NOT NULL COMMENT '设备类型 14小程序 05被扫支付 20聚合动态码 0600公众号 0603卡牌',
  `channel_id` varchar(2) NOT NULL COMMENT '渠道类型 13微信 12支付宝',
  `audit_status` varchar(2) DEFAULT NULL COMMENT '审核状态 INIT待审核 PROCESSING审核中 PROCESS_SUCCESS审核通过 PROCESS_REJECT审核拒绝 PROCESS_BACK审核回退 PROCESSING_PRODUCT_INFO_SUCCESS产品提前开通',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updater` varchar(30) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `delete_flag` char(1) NOT NULL DEFAULT 'N' COMMENT '删除标志',
  `response_code` varchar(32) DEFAULT NULL COMMENT '现在支付响应码 SUCCESS成功 FAIL失败 UNKNOWN未知',
  `response_msg` varchar(64) DEFAULT NULL COMMENT '现在支付响应信息',
  `state` varchar(10) DEFAULT NULL COMMENT '螳螂业务状态 01未提交 02审核中 03审核成功 04审核失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=467 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='现在支付商户开户结果查询';

-- ----------------------------
-- Records of now_merchant_query_state
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
