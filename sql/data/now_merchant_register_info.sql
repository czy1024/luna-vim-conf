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

 Date: 23/04/2021 08:56:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for now_merchant_register_info
-- ----------------------------
DROP TABLE IF EXISTS `now_merchant_register_info`;
CREATE TABLE `now_merchant_register_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '子商户名称',
  `app_id` varchar(32) NOT NULL COMMENT '商户应用标识',
  `mch_id` varchar(32) NOT NULL COMMENT '你好现在商户号',
  `mch_type` varchar(16) NOT NULL COMMENT '商户类型 PERSON:自然人 INDIVIDUAL：个体户 ENTERPRISE:企业',
  `mer_full_name` varchar(64) DEFAULT NULL COMMENT '商户全称',
  `mer_short_name` varchar(64) DEFAULT NULL COMMENT '商户简称',
  `mer_cert_type` varchar(32) DEFAULT NULL COMMENT '证件类型 UNI_CREDIT_CODE=统一社会信用代码证 CORP_CODE＝营业执照',
  `three_in_one` varchar(8) NOT NULL COMMENT '是否为三证合一 true false',
  `mer_cert_no` varchar(32) DEFAULT NULL COMMENT '证件号',
  `tax_regist_cert` varchar(64) DEFAULT NULL COMMENT '税务登记证编号',
  `account_license` varchar(64) DEFAULT NULL COMMENT '开户许可证编号',
  `org_code` varchar(64) DEFAULT NULL COMMENT '组织机构代码证',
  `org_code_expiry` varchar(64) DEFAULT NULL COMMENT '组织机构代理证有效期 格式：YYYY-MM-DD',
  `is_org_code_long` varchar(64) DEFAULT NULL COMMENT '组织机构代码证是否长期有效 true，false',
  `id_card_front` varchar(64) NOT NULL COMMENT '法人身份证正面图片识别码',
  `id_card_back` varchar(64) DEFAULT NULL COMMENT '法人身份证反面图片识别码',
  `corp_code` varchar(64) DEFAULT NULL COMMENT '营业执照图片识别码',
  `tax_code` varchar(64) DEFAULT NULL COMMENT '税务登记证图片识别码',
  `org_pic_code` varchar(64) DEFAULT NULL COMMENT '组织机构代码证图片识别码',
  `uni_credit_code` varchar(64) DEFAULT NULL COMMENT '统一社会信用代码证图片识别码',
  `op_bank_code` varchar(64) DEFAULT NULL COMMENT '银行开户许可证',
  `settle_bank_card` varchar(64) DEFAULT NULL COMMENT '结算银行卡图片识别码',
  `hand_id_card` varchar(64) NOT NULL COMMENT '法人手持营业执照和身份证图片识别码',
  `legal_name` varchar(32) NOT NULL COMMENT '法人姓名',
  `legalId_card` varchar(32) NOT NULL COMMENT '法人身份证号',
  `mer_contact_name` varchar(32) NOT NULL COMMENT '联系人姓名',
  `mer_contact_phone` varchar(16) NOT NULL COMMENT '联系人手机号',
  `mer_province` varchar(16) NOT NULL COMMENT '所属省',
  `mer_city` varchar(16) NOT NULL COMMENT '所属市',
  `mer_district` varchar(16) NOT NULL COMMENT '所属区',
  `mer_address` varchar(256) NOT NULL COMMENT '详细地址',
  `card_type` varchar(16) NOT NULL COMMENT '结算银行卡类型 TO_BUSINESS:对公 TO_PERSONAL:对私',
  `card_no` varchar(64) DEFAULT NULL COMMENT '结算银行卡号',
  `head_bank_code` varchar(64) DEFAULT NULL COMMENT '开户行总行编码',
  `bank_code` varchar(64) DEFAULT NULL COMMENT '开户行编码',
  `bank_city` varchar(32) DEFAULT NULL COMMENT '开户行省',
  `bank_province` varchar(32) DEFAULT NULL,
  `device_id` char(4) NOT NULL COMMENT '设备类型 14小程序 05被扫支付 20聚合动态码 0600公众号 0603卡牌',
  `channel_id` char(2) DEFAULT NULL COMMENT '渠道类型 13微信 12支付宝 ',
  `sub_mch_id` varchar(64) DEFAULT NULL COMMENT '子商户号',
  `audit_status` char(2) DEFAULT NULL COMMENT '审核状态  INIT待审核 PROCESSING审核中 PROCESS_SUCCESS审核通过 PROCESS_REJECT审核拒绝 PROCESS_BACK审核回退 PROCESSING_PRODUCT_INFO_SUCCESS产品提前开通',
  `creater` varchar(30) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `updater` varchar(30) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `delete_flag` char(1) NOT NULL DEFAULT 'N' COMMENT '删除标志',
  `response_code` varchar(32) DEFAULT NULL COMMENT '现在支付响应码 SUCCESS成功 FAIL失败 UNKNOWN未知',
  `response_msg` varchar(64) DEFAULT NULL COMMENT '现在支付响应信息',
  `state` varchar(10) DEFAULT NULL COMMENT '螳螂业务状态 01未提交 02审核中 03审核成功 04审核失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=468 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='现在支付商户开户申请';

-- ----------------------------
-- Records of now_merchant_register_info
-- ----------------------------
BEGIN;
INSERT INTO `now_merchant_register_info` VALUES (467, NULL, '测试', '', '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '', '0000-00-00 00:00:00', NULL, NULL, 'N', NULL, NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
