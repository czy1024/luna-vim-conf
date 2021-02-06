/*
 Navicat Premium Data Transfer

 Source Server         : luna-mysql-collage
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : cdb-5w1wgodg.bj.tencentcdb.com:10067
 Source Schema         : genesis-yctc

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 06/12/2020 16:08:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'edu.yctc.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F50455254494553737200276564752E796374632E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E0009787200286564752E796374632E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000132740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'edu.yctc.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F50455254494553737200276564752E796374632E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E0009787200286564752E796374632E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'edu.yctc.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F50455254494553737200276564752E796374632E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E0009787200286564752E796374632E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('lunaScheduler', 'improve1585894432841', 1585895837645, 15000);
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RuoyiScheduler', 'improve1587213465172', 1587213568131, 15000);

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `int_prop_1` int(11) NULL DEFAULT NULL,
  `int_prop_2` int(11) NULL DEFAULT NULL,
  `long_prop_1` bigint(20) NULL DEFAULT NULL,
  `long_prop_2` bigint(20) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint(13) NULL DEFAULT NULL,
  `prev_fire_time` bigint(13) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(2) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `QRTZ_TRIGGERS_ibfk_1`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1587213470000, -1, 5, 'PAUSED', 'CRON', 1587213466000, 0, NULL, 1, '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1587213480000, -1, 5, 'PAUSED', 'CRON', 1587213468000, 0, NULL, 2, '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1587213480000, -1, 5, 'PAUSED', 'CRON', 1587213470000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (4, 'tb_student', '学生信息表', 'Student', 'crud', 'com.ruoyi.system', 'system', 'student', '学生信息', 'luna', NULL, 'admin', '2020-03-25 23:08:02', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (5, 'sys_file_info', '文件信息表', 'FileInfo', 'crud', 'com.luna.project.system', 'system', 'info', '文件信息', 'luna', NULL, 'admin', '2020-03-28 15:29:22', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (6, 'sys_cuisine', '菜品信息表', 'Cuisine', 'crud', 'com.luna.project.system', 'system', 'cuisine', '菜品信息', 'luna', NULL, 'admin', '2020-03-28 20:59:15', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (7, 'sys_academy', '学院', 'Academy', 'crud', 'com.yctc.project.system', 'system', 'academy', '学院', 'yctc', NULL, 'admin', '2020-04-15 22:01:43', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (8, 'sys_classroom', '教室', 'Classroom', 'crud', 'com.yctc.project.system', 'system', 'classroom', '教室', 'yctc', NULL, 'admin', '2020-04-15 23:38:03', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (11, 'sys_classes', '班级信息', 'Classes', 'crud', 'edu.yctc.project.system', 'system', 'classes', '班级信息', 'yctc', NULL, 'admin', '2020-04-16 18:25:24', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (12, 'sys_course', '课程信息', 'Course', 'crud', 'edu.yctc.project.system', 'system', 'course', '课程信息', 'yctc', NULL, 'admin', '2020-04-16 20:55:59', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (13, 'sys_equipment', '设备信息', 'Equipment', 'crud', 'edu.yctc.project.system', 'system', 'equipment', '设备信息', 'yctc', NULL, 'admin', '2020-04-16 21:50:19', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (14, 'sys_building_floor', '楼层信息', 'BuildingFloor', 'crud', 'edu.yctc.project.system', 'system', 'floor', '楼层信息', 'yctc', NULL, 'admin', '2020-04-16 22:01:21', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (15, 'sys_lesson', '课时信息表', 'Lesson', 'crud', 'edu.yctc.project.system', 'system', 'lesson', '课时信息', 'yctc', NULL, 'admin', '2020-04-16 22:05:23', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (16, 'sys_knowledge', '知识点概览', 'Knowledge', 'crud', 'edu.yctc.project.system', 'system', 'knowledge', '知识点概览', 'yctc', NULL, 'admin', '2020-04-16 22:27:55', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (17, 'sys_attendance', '学生考勤点名汇总表', 'Attendance', 'crud', 'edu.yctc.project.system', 'system', 'attendance', '学生考勤点名汇总', 'yctc', NULL, 'admin', '2020-04-16 22:29:40', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (18, 'sys_class_score', '学生上课评分汇总', 'ClassScore', 'crud', 'edu.yctc.project.system', 'system', 'score', '学生上课评分汇总', 'yctc', NULL, 'admin', '2020-04-16 22:31:49', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (19, 'sys_classroom_state', '教室占用情况', 'ClassroomState', 'crud', 'edu.yctc.project.system', 'system', 'state', '教室占用情况', 'yctc', NULL, 'admin', '2020-04-16 22:33:27', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (20, 'sys-info', '学生/老师档案表', 'Sys-info', 'crud', 'edu.yctc.project.system', 'system', 'sys-info', '学生/老师档案', 'yctc', NULL, 'admin', '2020-04-17 13:35:43', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (22, 'sys_infost', '学生/老师档案表', 'Infost', 'crud', 'edu.yctc.project.system', 'system', 'infost', '学生/老师档案', 'yctc', NULL, 'admin', '2020-04-17 13:59:47', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (23, 'sys_student_state', '学生上课状态信息汇总', 'StudentState', 'crud', 'edu.yctc.project.system', 'system', 'state', '学生上课状态信息汇总', 'yctc', NULL, 'admin', '2020-04-17 15:29:43', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (24, 'sys_student_courseState', '学生上课状态信息汇总', 'StudentCoursestate', 'crud', 'edu.yctc.project.system', 'system', 'courseState', '学生上课状态信息汇总', 'yctc', NULL, 'admin', '2020-04-17 15:33:15', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (25, 'sys_student_course', '学生课程信息', 'StudentCourse', 'crud', 'edu.yctc.project.system', 'system', 'course', '学生课程信息', 'yctc', NULL, 'admin', '2020-04-18 13:20:12', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (26, 'sys_course_stu', '学生课程信息', 'CourseStu', 'crud', 'edu.yctc.project.system', 'system', 'stu', '学生课程信息', 'yctc', NULL, 'admin', '2020-04-18 13:22:56', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (27, 'sys_lesson_tea', '老师授课信息', 'LessonTea', 'crud', 'edu.yctc.project.system', 'system', 'tea', '老师授课信息', 'yctc', NULL, 'admin', '2020-04-18 13:26:05', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (28, 'sys_knowledge_lesson', '课时知识点信息', 'KnowledgeLesson', 'crud', 'edu.yctc.project.system', 'system', 'lesson', '课时知识点信息', 'yctc', NULL, 'admin', '2020-04-18 17:48:28', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (29, 'sys_lesson_knowledge', '课时知识点信息', 'LessonKnowledge', 'crud', 'edu.yctc.project.system', 'system', 'knowledge', '课时知识点信息', 'yctc', NULL, 'admin', '2020-04-18 17:50:15', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (30, 'sys_lesson_know', '课时知识点信息', 'LessonKnow', 'crud', 'edu.yctc.project.system', 'system', 'know', '课时知识点信息', 'yctc', NULL, 'admin', '2020-04-18 17:50:51', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 202 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (22, '4', 'student_id', '编号', 'int(11)', 'Long', 'studentId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-03-25 23:08:02', '', NULL);
INSERT INTO `gen_table_column` VALUES (23, '4', 'student_name', '学生名称', 'varchar(30)', 'String', 'studentName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-03-25 23:08:02', '', NULL);
INSERT INTO `gen_table_column` VALUES (24, '4', 'student_age', '年龄', 'int(3)', 'Integer', 'studentAge', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-03-25 23:08:02', '', NULL);
INSERT INTO `gen_table_column` VALUES (25, '4', 'student_sex', '性别（0男 1女 2未知）', 'char(1)', 'String', 'studentSex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2020-03-25 23:08:02', '', NULL);
INSERT INTO `gen_table_column` VALUES (26, '4', 'student_status', '状态（0正常 1停用）', 'char(1)', 'String', 'studentStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2020-03-25 23:08:02', '', NULL);
INSERT INTO `gen_table_column` VALUES (27, '4', 'student_birthday', '生日', 'datetime', 'Date', 'studentBirthday', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2020-03-25 23:08:02', '', NULL);
INSERT INTO `gen_table_column` VALUES (28, '4', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 7, 'admin', '2020-03-25 23:08:03', '', NULL);
INSERT INTO `gen_table_column` VALUES (29, '5', 'file_id', '文件id', 'int(11)', 'Long', 'fileId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-03-28 15:29:22', '', NULL);
INSERT INTO `gen_table_column` VALUES (30, '5', 'file_name', '文件名称', 'varchar(50)', 'String', 'fileName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-03-28 15:29:22', '', NULL);
INSERT INTO `gen_table_column` VALUES (31, '5', 'file_path', '文件路径', 'varchar(255)', 'String', 'filePath', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-03-28 15:29:22', '', NULL);
INSERT INTO `gen_table_column` VALUES (32, '6', 'cuisine_id', '菜品id', 'int(11)', 'Long', 'cuisineId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-03-28 20:59:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (33, '6', 'cuisine_name', '菜品名称', 'varchar(50)', 'String', 'cuisineName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-03-28 20:59:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (34, '6', 'cuisine_path', '菜品图片路径', 'varchar(255)', 'String', 'cuisinePath', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-03-28 20:59:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (35, '6', 'cuisine_number', '今日菜品份数', 'int(3)', 'Integer', 'cuisineNumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-03-28 20:59:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (36, '6', 'cuisine_price', '菜品价格', 'double(5,2)', 'Double', 'cuisinePrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-03-28 20:59:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (37, '7', 'id', '编号', 'bigint(20) unsigned', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-04-15 22:01:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (38, '7', 'academy', '学院名称\r\n', 'varchar(50)', 'String', 'academy', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-04-15 22:01:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (39, '7', 'create_time', '创建时间', 'datetime(6)', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 3, 'admin', '2020-04-15 22:01:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (40, '7', 'modify_time', '修改时间', 'datetime(6)', 'Date', 'modifyTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2020-04-15 22:01:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (41, '8', 'id', '教室id', 'bigint(20) unsigned', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-04-15 23:38:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (42, '8', 'building_floor_id', '楼层号id', 'bigint(20) unsigned', 'Long', 'buildingFloorId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-04-15 23:38:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (43, '8', 'number', '楼层号', 'varchar(10)', 'String', 'number', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-04-15 23:38:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (44, '8', 'equipment_id', '设备id', 'varchar(20)', 'String', 'equipmentId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-04-15 23:38:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (45, '8', 'create_time', '创建时间', 'datetime(6)', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2020-04-15 23:38:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (46, '8', 'modify_time', '修改时间', 'datetime(6)', 'Date', 'modifyTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2020-04-15 23:38:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (55, '11', 'id', '编号', 'bigint(20) unsigned', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-04-16 18:25:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (56, '11', 'academy_id', '学院编号', 'bigint(20) unsigned', 'Long', 'academyId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-04-16 18:25:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (57, '11', 'dept_id', '专业编号', 'bigint(20) unsigned', 'Long', 'deptId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-04-16 18:25:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (58, '11', 'number', '班级编号', 'varchar(50)', 'String', 'number', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-04-16 18:25:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (59, '12', 'id', '课程id', 'bigint(20) unsigned', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-04-16 20:55:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (60, '12', 'number', '课程号', 'varchar(10)', 'String', 'number', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-04-16 20:55:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (61, '12', 'name', '课程名称', 'varchar(50)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2020-04-16 20:55:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (62, '12', 'lesson_sum', '课时(第几课时)', 'int(11)', 'Long', 'lessonSum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-04-16 20:55:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (63, '12', 'year', '开课学年', 'varchar(50)', 'String', 'year', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-04-16 20:55:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (64, '12', 'term', '开课学期', 'int(11) unsigned', 'Long', 'term', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-04-16 20:56:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (65, '12', 'dept_id', '开课专业', 'bigint(20) unsigned', 'Long', 'deptId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-04-16 20:56:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (66, '12', 'classes_id', '开课班级', 'varchar(50)', 'String', 'classesId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2020-04-16 20:56:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (67, '13', 'id', '设备id', 'bigint(20) unsigned', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-04-16 21:50:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (68, '13', 'number', '设备编号', 'varchar(50)', 'String', 'number', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-04-16 21:50:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (69, '13', 'name', '设备名称', 'varchar(50)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2020-04-16 21:50:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (70, '13', 'video', '视频播放地址', 'varchar(255)', 'String', 'video', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-04-16 21:50:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (71, '13', 'create_time', '创建时间', 'datetime(6)', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2020-04-16 21:50:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (72, '13', 'modify_time', '修改时间', 'datetime(6)', 'Date', 'modifyTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2020-04-16 21:50:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (73, '14', 'id', '编号', 'bigint(20) unsigned', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-04-16 22:01:22', '', NULL);
INSERT INTO `gen_table_column` VALUES (74, '14', 'building', '楼号', 'varchar(50)', 'String', 'building', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-04-16 22:01:22', '', NULL);
INSERT INTO `gen_table_column` VALUES (75, '14', 'floor', '楼层', 'varchar(50)', 'String', 'floor', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 3, 'admin', '2020-04-16 22:01:22', '', NULL);
INSERT INTO `gen_table_column` VALUES (76, '14', 'create_time', '创建时间', 'datetime(6)', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'admin', '2020-04-16 22:01:22', '', NULL);
INSERT INTO `gen_table_column` VALUES (77, '14', 'modify_time', '修改时间', 'datetime(6)', 'Date', 'modifyTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2020-04-16 22:01:22', '', NULL);
INSERT INTO `gen_table_column` VALUES (78, '15', 'id', '编号', 'bigint(20) unsigned', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-04-16 22:05:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (79, '15', 'course_id', '课程编号', 'bigint(20) unsigned', 'Long', 'courseId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-04-16 22:05:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (80, '15', 'number', '课时', 'int(11) unsigned', 'Long', 'number', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-04-16 22:05:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (81, '15', 'classroom_id', '教室', 'bigint(20) unsigned', 'Long', 'classroomId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-04-16 22:05:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (82, '15', 'begin', '上课时间', 'datetime(6)', 'Date', 'begin', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2020-04-16 22:05:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (83, '15', 'end', '下课时间', 'datetime(6)', 'Date', 'end', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2020-04-16 22:05:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (84, '15', 'create_time', '创建时间', 'datetime(6)', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2020-04-16 22:05:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (85, '15', 'modify_time', '修改时间', 'datetime(6)', 'Date', 'modifyTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2020-04-16 22:05:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (86, '16', 'id', '编号', 'bigint(20) unsigned', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-04-16 22:27:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (87, '16', 'content', '知识点描述', 'varchar(255)', 'String', 'content', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-04-16 22:27:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (88, '16', 'length', '预计时长', 'double(20,1) unsigned', 'Double', 'length', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-04-16 22:27:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (89, '16', 'create_time', '创建时间', 'datetime(6)', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'admin', '2020-04-16 22:27:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (90, '16', 'modify_time', '修改时间', 'datetime(6)', 'Date', 'modifyTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2020-04-16 22:27:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (91, '17', 'id', '编号', 'bigint(20) unsigned', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-04-16 22:29:41', '', NULL);
INSERT INTO `gen_table_column` VALUES (92, '17', 'user_id', '用户编号', 'bigint(20) unsigned', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-04-16 22:29:41', '', NULL);
INSERT INTO `gen_table_column` VALUES (93, '17', 'lesson_id', '课时编号', 'bigint(20) unsigned', 'Long', 'lessonId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-04-16 22:29:41', '', NULL);
INSERT INTO `gen_table_column` VALUES (94, '17', 'attend_state', '出勤情况', 'int(11) unsigned', 'Long', 'attendState', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-04-16 22:29:41', '', NULL);
INSERT INTO `gen_table_column` VALUES (95, '17', 'create_time', '创建时间', 'datetime(6)', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2020-04-16 22:29:41', '', NULL);
INSERT INTO `gen_table_column` VALUES (96, '17', 'modify_time', '修改时间', 'datetime(6)', 'Date', 'modifyTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2020-04-16 22:29:41', '', NULL);
INSERT INTO `gen_table_column` VALUES (97, '18', 'id', '编号', 'bigint(20) unsigned', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-04-16 22:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (98, '18', 'user_id', '用户编号', 'bigint(20) unsigned', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-04-16 22:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (99, '18', 'lesson_id', '课时编号', 'bigint(20) unsigned', 'Long', 'lessonId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-04-16 22:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (100, '18', 'score', '课程评分', 'double(8,3) unsigned zerofill', 'Double', 'score', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-04-16 22:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (101, '18', 'create_time', '创建时间', 'datetime(6)', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2020-04-16 22:31:50', '', NULL);
INSERT INTO `gen_table_column` VALUES (102, '18', 'modify_time', '修改时间', 'datetime(6)', 'Date', 'modifyTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2020-04-16 22:31:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (103, '19', 'id', '编号', 'bigint(20) unsigned', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-04-16 22:33:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (104, '19', 'classroom_id', '教室编号', 'bigint(20) unsigned', 'Long', 'classroomId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-04-16 22:33:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (105, '19', 'lesson_id', '课时编号', 'bigint(20) unsigned', 'Long', 'lessonId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-04-16 22:33:28', '', NULL);
INSERT INTO `gen_table_column` VALUES (106, '19', 'state', '教室状态', 'int(11)', 'Long', 'state', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-04-16 22:33:28', '', NULL);
INSERT INTO `gen_table_column` VALUES (107, '19', 'create_time', '创建时间', 'datetime(6)', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2020-04-16 22:33:28', '', NULL);
INSERT INTO `gen_table_column` VALUES (108, '19', 'modify_time', '修改时间', 'datetime(6)', 'Date', 'modifyTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2020-04-16 22:33:28', '', NULL);
INSERT INTO `gen_table_column` VALUES (109, '20', 'id', '学生编号', 'bigint(20) unsigned', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-04-17 13:35:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (110, '20', 'user_id', '用户编号', 'bigint(20)', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-04-17 13:35:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (111, '20', 'academy_id', '学院编号', 'bigint(20) unsigned', 'Long', 'academyId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-04-17 13:35:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (112, '20', 'class_id', '班级编号', 'bigint(20) unsigned', 'Long', 'classId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-04-17 13:35:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (113, '20', 'number', '学号/工号', 'varchar(10)', 'String', 'number', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-04-17 13:35:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (114, '20', 'name', '姓名', 'varchar(255)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2020-04-17 13:35:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (115, '20', 'type', '用户类别', 'int(11) unsigned', 'Long', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 7, 'admin', '2020-04-17 13:35:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (116, '20', 'sex', '性别', 'varchar(2)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 8, 'admin', '2020-04-17 13:35:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (117, '20', 'id_card_number', '身份证号', 'varchar(18)', 'String', 'idCardNumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2020-04-17 13:35:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (118, '20', 'phone', '手机号', 'varchar(11)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2020-04-17 13:35:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (119, '20', 'mail', '邮箱', 'varchar(50)', 'String', 'mail', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2020-04-17 13:35:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (120, '20', 'picture', '人脸照片', 'varchar(255)', 'String', 'picture', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2020-04-17 13:35:45', '', NULL);
INSERT INTO `gen_table_column` VALUES (121, '20', 'face_token', '人脸标识', 'varchar(32)', 'String', 'faceToken', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2020-04-17 13:35:45', '', NULL);
INSERT INTO `gen_table_column` VALUES (122, '20', 'create_time', '创建时间', 'datetime(6)', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2020-04-17 13:35:45', '', NULL);
INSERT INTO `gen_table_column` VALUES (123, '20', 'modify_time', '修改时间', 'datetime(6)', 'Date', 'modifyTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 15, 'admin', '2020-04-17 13:35:45', '', NULL);
INSERT INTO `gen_table_column` VALUES (139, '22', 'id', '学生编号', 'bigint(20) unsigned', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-04-17 13:59:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (140, '22', 'user_id', '用户编号', 'bigint(20)', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-04-17 13:59:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (141, '22', 'academy_id', '学院编号', 'bigint(20) unsigned', 'Long', 'academyId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-04-17 13:59:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (142, '22', 'class_id', '班级编号', 'bigint(20) unsigned', 'Long', 'classId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-04-17 13:59:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (143, '22', 'number', '学号/工号', 'varchar(10)', 'String', 'number', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-04-17 13:59:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (144, '22', 'name', '姓名', 'varchar(255)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2020-04-17 13:59:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (145, '22', 'type', '用户类别', 'int(11) unsigned', 'Long', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 7, 'admin', '2020-04-17 13:59:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (146, '22', 'sex', '性别', 'varchar(2)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 8, 'admin', '2020-04-17 13:59:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (147, '22', 'id_card_number', '身份证号', 'varchar(18)', 'String', 'idCardNumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2020-04-17 13:59:49', '', NULL);
INSERT INTO `gen_table_column` VALUES (148, '22', 'phone', '手机号', 'varchar(11)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2020-04-17 13:59:49', '', NULL);
INSERT INTO `gen_table_column` VALUES (149, '22', 'mail', '邮箱', 'varchar(50)', 'String', 'mail', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2020-04-17 13:59:49', '', NULL);
INSERT INTO `gen_table_column` VALUES (150, '22', 'picture', '人脸照片', 'varchar(255)', 'String', 'picture', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2020-04-17 13:59:49', '', NULL);
INSERT INTO `gen_table_column` VALUES (151, '22', 'face_token', '人脸标识', 'varchar(32)', 'String', 'faceToken', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2020-04-17 13:59:49', '', NULL);
INSERT INTO `gen_table_column` VALUES (152, '22', 'create_time', '创建时间', 'datetime(6)', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2020-04-17 13:59:49', '', NULL);
INSERT INTO `gen_table_column` VALUES (153, '22', 'modify_time', '修改时间', 'datetime(6)', 'Date', 'modifyTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 15, 'admin', '2020-04-17 13:59:49', '', NULL);
INSERT INTO `gen_table_column` VALUES (154, '23', 'id', NULL, 'bigint(20) unsigned', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-04-17 15:29:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (155, '23', 'user_id', '用户id', 'bigint(20) unsigned', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-04-17 15:29:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (156, '23', 'lesson_id', '课时id', 'bigint(20) unsigned', 'Long', 'lessonId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-04-17 15:29:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (157, '23', 'state', '学生上课状态', 'int(11) unsigned', 'Long', 'state', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-04-17 15:29:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (158, '23', 'scan_start_time', '扫描开始时间', 'datetime(6)', 'Date', 'scanStartTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2020-04-17 15:29:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (159, '23', 'scan_end_time', '扫描结束时间', 'datetime(6)', 'Date', 'scanEndTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2020-04-17 15:29:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (160, '23', 'face_token', '人脸标识', 'varchar(32)', 'String', 'faceToken', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-04-17 15:29:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (161, '23', 'create_time', '创建时间', 'datetime(6)', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2020-04-17 15:29:45', '', NULL);
INSERT INTO `gen_table_column` VALUES (162, '23', 'modify_time', '修改时间', 'datetime(6)', 'Date', 'modifyTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2020-04-17 15:29:45', '', NULL);
INSERT INTO `gen_table_column` VALUES (163, '24', 'id', NULL, 'bigint(20) unsigned', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-04-17 15:33:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (164, '24', 'user_id', '用户id', 'bigint(20) unsigned', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-04-17 15:33:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (165, '24', 'lesson_id', '课时id', 'bigint(20) unsigned', 'Long', 'lessonId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-04-17 15:33:15', '', NULL);
INSERT INTO `gen_table_column` VALUES (166, '24', 'state', '学生上课状态', 'int(11) unsigned', 'Long', 'state', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-04-17 15:33:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (167, '24', 'scan_start_time', '扫描开始时间', 'datetime(6)', 'Date', 'scanStartTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2020-04-17 15:33:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (168, '24', 'scan_end_time', '扫描结束时间', 'datetime(6)', 'Date', 'scanEndTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2020-04-17 15:33:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (169, '24', 'face_token', '人脸标识', 'varchar(32)', 'String', 'faceToken', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-04-17 15:33:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (170, '24', 'create_time', '创建时间', 'datetime(6)', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2020-04-17 15:33:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (171, '24', 'modify_time', '修改时间', 'datetime(6)', 'Date', 'modifyTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2020-04-17 15:33:17', '', NULL);
INSERT INTO `gen_table_column` VALUES (172, '25', 'id', '编号', 'bigint(20) unsigned', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-04-18 13:20:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (173, '25', 'user_id', '用户编号', 'bigint(20) unsigned', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-04-18 13:20:12', '', NULL);
INSERT INTO `gen_table_column` VALUES (174, '25', 'course_id', '课程编号', 'bigint(20) unsigned', 'Long', 'courseId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-04-18 13:20:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (175, '25', 'create_time', '创建时间', 'datetime(6)', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'admin', '2020-04-18 13:20:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (176, '25', 'modify_time', '修改时间', 'datetime(6)', 'Date', 'modifyTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2020-04-18 13:20:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (177, '26', 'id', '编号', 'bigint(20) unsigned', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-04-18 13:22:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (178, '26', 'user_id', '用户编号', 'bigint(20) unsigned', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-04-18 13:22:56', '', NULL);
INSERT INTO `gen_table_column` VALUES (179, '26', 'course_id', '课程编号', 'bigint(20) unsigned', 'Long', 'courseId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-04-18 13:22:57', '', NULL);
INSERT INTO `gen_table_column` VALUES (180, '26', 'create_time', '创建时间', 'datetime(6)', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'admin', '2020-04-18 13:22:57', '', NULL);
INSERT INTO `gen_table_column` VALUES (181, '26', 'modify_time', '修改时间', 'datetime(6)', 'Date', 'modifyTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2020-04-18 13:22:57', '', NULL);
INSERT INTO `gen_table_column` VALUES (182, '27', 'id', '编号', 'bigint(20) unsigned', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-04-18 13:26:05', '', NULL);
INSERT INTO `gen_table_column` VALUES (183, '27', 'user_id', '老师编号', 'bigint(20)', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-04-18 13:26:05', '', NULL);
INSERT INTO `gen_table_column` VALUES (184, '27', 'lesson_id', '授课课时编号', 'bigint(20) unsigned', 'Long', 'lessonId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-04-18 13:26:05', '', NULL);
INSERT INTO `gen_table_column` VALUES (185, '27', 'create_time', '创建时间', 'datetime(6)', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'admin', '2020-04-18 13:26:05', '', NULL);
INSERT INTO `gen_table_column` VALUES (186, '27', 'modify_time', '修改时间', 'datetime(6)', 'Date', 'modifyTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2020-04-18 13:26:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (187, '28', 'id', NULL, 'bigint(20) unsigned', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-04-18 17:48:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (188, '28', 'lesson_id', '课程编号', 'bigint(20) unsigned', 'Long', 'lessonId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-04-18 17:48:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (189, '28', 'knowledge_id', '知识点编号', 'bigint(20)', 'Long', 'knowledgeId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-04-18 17:48:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (190, '28', 'create_time', '创建时间', 'datetime(6)', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'admin', '2020-04-18 17:48:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (191, '28', 'modify_time', '修改时间', 'datetime(6)', 'Date', 'modifyTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2020-04-18 17:48:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (192, '29', 'id', NULL, 'bigint(20) unsigned', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-04-18 17:50:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (193, '29', 'lesson_id', '课程编号', 'bigint(20) unsigned', 'Long', 'lessonId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-04-18 17:50:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (194, '29', 'knowledge_id', '知识点编号', 'bigint(20)', 'Long', 'knowledgeId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-04-18 17:50:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (195, '29', 'create_time', '创建时间', 'datetime(6)', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'admin', '2020-04-18 17:50:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (196, '29', 'modify_time', '修改时间', 'datetime(6)', 'Date', 'modifyTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2020-04-18 17:50:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (197, '30', 'id', NULL, 'bigint(20) unsigned', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-04-18 17:50:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (198, '30', 'lesson_id', '课程编号', 'bigint(20) unsigned', 'Long', 'lessonId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-04-18 17:50:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (199, '30', 'knowledge_id', '知识点编号', 'bigint(20)', 'Long', 'knowledgeId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-04-18 17:50:51', '', NULL);
INSERT INTO `gen_table_column` VALUES (200, '30', 'create_time', '创建时间', 'datetime(6)', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'admin', '2020-04-18 17:50:52', '', NULL);
INSERT INTO `gen_table_column` VALUES (201, '30', 'modify_time', '修改时间', 'datetime(6)', 'Date', 'modifyTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2020-04-18 17:50:52', '', NULL);

-- ----------------------------
-- Table structure for sys_academy
-- ----------------------------
DROP TABLE IF EXISTS `sys_academy`;
CREATE TABLE `sys_academy`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `academy` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学院名称',
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_academy`(`academy`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = big5 COLLATE = big5_chinese_ci COMMENT = '学院' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_academy
-- ----------------------------
INSERT INTO `sys_academy` VALUES (1, '信息工程学院', '2019-03-05 21:51:11.000000', '2019-03-05 21:51:11.000000');
INSERT INTO `sys_academy` VALUES (2, '文学院', '2020-04-15 09:10:39.941000', '2020-04-17 19:15:40.000000');
INSERT INTO `sys_academy` VALUES (3, '教育与科学学院', '2020-04-17 19:16:04.000000', '2020-04-17 19:16:06.000000');

-- ----------------------------
-- Table structure for sys_attendance
-- ----------------------------
DROP TABLE IF EXISTS `sys_attendance`;
CREATE TABLE `sys_attendance`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '用户编号',
  `lesson_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '课时编号',
  `attend_state` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '出勤情况',
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_attendance`(`user_id`, `lesson_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_lesson_id`(`lesson_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生考勤点名汇总表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_attendance
-- ----------------------------
INSERT INTO `sys_attendance` VALUES (1695, 1, 582, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1696, 1, 583, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1697, 1, 584, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1698, 1, 585, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1699, 1, 586, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1700, 1, 587, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1701, 1, 588, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1702, 1, 589, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1703, 1, 590, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1704, 1, 591, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1705, 1, 592, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1706, 1, 593, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1707, 1, 594, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1708, 1, 595, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1709, 2, 582, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1710, 2, 583, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1711, 2, 584, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1712, 2, 585, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1713, 2, 586, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1714, 2, 587, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1715, 2, 588, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1716, 2, 589, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1717, 2, 590, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1718, 2, 591, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1719, 2, 592, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1720, 2, 593, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1721, 2, 594, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1722, 2, 595, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1723, 3, 582, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1724, 3, 583, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1725, 3, 584, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1726, 3, 585, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1727, 3, 586, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1728, 3, 587, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1729, 3, 588, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1730, 3, 589, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1731, 3, 590, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1732, 3, 591, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1733, 3, 592, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1734, 3, 593, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1735, 3, 594, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1736, 3, 595, 1, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1737, 4, 582, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1738, 4, 583, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1739, 4, 584, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1740, 4, 585, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1741, 4, 586, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1742, 4, 587, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1743, 4, 588, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1744, 4, 589, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1745, 4, 590, 1, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1746, 4, 591, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1747, 4, 592, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1748, 4, 593, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1749, 4, 594, 1, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1750, 4, 595, 1, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1751, 5, 582, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1752, 5, 583, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1753, 5, 584, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1754, 5, 585, 1, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1755, 5, 586, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1756, 5, 587, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1757, 5, 588, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1758, 5, 589, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1759, 5, 590, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1760, 5, 591, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1761, 5, 592, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1762, 5, 593, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1763, 5, 594, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1764, 5, 595, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1765, 6, 582, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1766, 6, 583, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1767, 6, 584, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1768, 6, 585, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1769, 6, 586, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1770, 6, 587, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1771, 6, 588, 1, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1772, 6, 589, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1773, 6, 590, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1774, 6, 591, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1775, 6, 592, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1776, 6, 593, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1777, 6, 594, 1, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1778, 6, 595, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1779, 7, 582, 1, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1780, 7, 583, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1781, 7, 584, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1782, 7, 585, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1783, 7, 586, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1784, 7, 587, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1785, 7, 588, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1786, 7, 589, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1787, 7, 590, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1788, 7, 591, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1789, 7, 592, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1790, 7, 593, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1791, 7, 594, 1, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1792, 7, 595, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1793, 8, 582, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1794, 8, 583, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1795, 8, 584, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1796, 8, 585, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1797, 8, 586, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1798, 8, 587, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1799, 8, 588, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1800, 8, 589, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1801, 8, 590, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1802, 8, 591, 1, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1803, 8, 592, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1804, 8, 593, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1805, 8, 594, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1806, 8, 595, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1807, 9, 582, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1808, 9, 583, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1809, 9, 584, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1810, 9, 585, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1811, 9, 586, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1812, 9, 587, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1813, 9, 588, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1814, 9, 589, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1815, 9, 590, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1816, 9, 591, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1817, 9, 592, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1818, 9, 593, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1819, 9, 594, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1820, 9, 595, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1821, 10, 582, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1822, 10, 583, 1, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1823, 10, 584, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1824, 10, 585, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1825, 10, 586, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1826, 10, 587, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1827, 10, 588, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1828, 10, 589, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1829, 10, 590, 1, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1830, 10, 591, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1831, 10, 592, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1832, 10, 593, 0, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1833, 10, 594, 1, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1834, 10, 595, 1, '2020-04-18 00:52:10.964000', '2020-04-18 00:52:10.964000');
INSERT INTO `sys_attendance` VALUES (1835, 11, 596, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1836, 11, 597, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1837, 11, 598, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1838, 11, 599, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1839, 11, 600, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1840, 11, 601, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1841, 11, 602, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1842, 11, 603, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1843, 11, 604, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1844, 11, 605, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1845, 11, 606, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1846, 11, 607, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1847, 11, 608, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1848, 11, 609, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1849, 12, 596, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1850, 12, 597, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1851, 12, 598, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1852, 12, 599, 1, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1853, 12, 600, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1854, 12, 601, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1855, 12, 602, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1856, 12, 603, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1857, 12, 604, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1858, 12, 605, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1859, 12, 606, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1860, 12, 607, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1861, 12, 608, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1862, 12, 609, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1863, 13, 596, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1864, 13, 597, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1865, 13, 598, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1866, 13, 599, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1867, 13, 600, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1868, 13, 601, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1869, 13, 602, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1870, 13, 603, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1871, 13, 604, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1872, 13, 605, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1873, 13, 606, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1874, 13, 607, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1875, 13, 608, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1876, 13, 609, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1877, 14, 596, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1878, 14, 597, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1879, 14, 598, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1880, 14, 599, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1881, 14, 600, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1882, 14, 601, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1883, 14, 602, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1884, 14, 603, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1885, 14, 604, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1886, 14, 605, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1887, 14, 606, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1888, 14, 607, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1889, 14, 608, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1890, 14, 609, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1891, 15, 596, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1892, 15, 597, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1893, 15, 598, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1894, 15, 599, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1895, 15, 600, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1896, 15, 601, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1897, 15, 602, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1898, 15, 603, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1899, 15, 604, 1, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1900, 15, 605, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1901, 15, 606, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1902, 15, 607, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1903, 15, 608, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1904, 15, 609, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1905, 16, 596, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1906, 16, 597, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1907, 16, 598, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1908, 16, 599, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1909, 16, 600, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1910, 16, 601, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1911, 16, 602, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1912, 16, 603, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1913, 16, 604, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1914, 16, 605, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1915, 16, 606, 1, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1916, 16, 607, 1, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1917, 16, 608, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1918, 16, 609, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1919, 17, 596, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1920, 17, 597, 1, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1921, 17, 598, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1922, 17, 599, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1923, 17, 600, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1924, 17, 601, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1925, 17, 602, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1926, 17, 603, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1927, 17, 604, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1928, 17, 605, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1929, 17, 606, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1930, 17, 607, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1931, 17, 608, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1932, 17, 609, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1933, 18, 596, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1934, 18, 597, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1935, 18, 598, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1936, 18, 599, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1937, 18, 600, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1938, 18, 601, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1939, 18, 602, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1940, 18, 603, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1941, 18, 604, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1942, 18, 605, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1943, 18, 606, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1944, 18, 607, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1945, 18, 608, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1946, 18, 609, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1947, 19, 596, 1, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1948, 19, 597, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1949, 19, 598, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1950, 19, 599, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1951, 19, 600, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1952, 19, 601, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1953, 19, 602, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1954, 19, 603, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1955, 19, 604, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1956, 19, 605, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1957, 19, 606, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1958, 19, 607, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1959, 19, 608, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1960, 19, 609, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1961, 20, 596, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1962, 20, 597, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1963, 20, 598, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1964, 20, 599, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1965, 20, 600, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1966, 20, 601, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1967, 20, 602, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1968, 20, 603, 1, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1969, 20, 604, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1970, 20, 605, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1971, 20, 606, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1972, 20, 607, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1973, 20, 608, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1974, 20, 609, 0, '2020-04-18 00:53:41.092000', '2020-04-18 00:53:41.092000');
INSERT INTO `sys_attendance` VALUES (1975, 21, 610, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (1976, 21, 611, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (1977, 21, 612, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (1978, 21, 613, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (1979, 21, 614, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (1980, 21, 615, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (1981, 21, 616, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (1982, 21, 617, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (1983, 21, 618, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (1984, 21, 619, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (1985, 21, 620, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (1986, 21, 621, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (1987, 21, 622, 1, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (1988, 21, 623, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (1989, 22, 610, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (1990, 22, 611, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (1991, 22, 612, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (1992, 22, 613, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (1993, 22, 614, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (1994, 22, 615, 1, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (1995, 22, 616, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (1996, 22, 617, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (1997, 22, 618, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (1998, 22, 619, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (1999, 22, 620, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2000, 22, 621, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2001, 22, 622, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2002, 22, 623, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2003, 23, 610, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2004, 23, 611, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2005, 23, 612, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2006, 23, 613, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2007, 23, 614, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2008, 23, 615, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2009, 23, 616, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2010, 23, 617, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2011, 23, 618, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2012, 23, 619, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2013, 23, 620, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2014, 23, 621, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2015, 23, 622, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2016, 23, 623, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2017, 24, 610, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2018, 24, 611, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2019, 24, 612, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2020, 24, 613, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2021, 24, 614, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2022, 24, 615, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2023, 24, 616, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2024, 24, 617, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2025, 24, 618, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2026, 24, 619, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2027, 24, 620, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2028, 24, 621, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2029, 24, 622, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2030, 24, 623, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2031, 25, 610, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2032, 25, 611, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2033, 25, 612, 1, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2034, 25, 613, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2035, 25, 614, 1, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2036, 25, 615, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2037, 25, 616, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2038, 25, 617, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2039, 25, 618, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2040, 25, 619, 1, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2041, 25, 620, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2042, 25, 621, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2043, 25, 622, 1, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2044, 25, 623, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2045, 26, 610, 1, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2046, 26, 611, 1, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2047, 26, 612, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2048, 26, 613, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2049, 26, 614, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2050, 26, 615, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2051, 26, 616, 1, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2052, 26, 617, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2053, 26, 618, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2054, 26, 619, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2055, 26, 620, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2056, 26, 621, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2057, 26, 622, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2058, 26, 623, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2059, 27, 610, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2060, 27, 611, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2061, 27, 612, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2062, 27, 613, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2063, 27, 614, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2064, 27, 615, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2065, 27, 616, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2066, 27, 617, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2067, 27, 618, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2068, 27, 619, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2069, 27, 620, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2070, 27, 621, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2071, 27, 622, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2072, 27, 623, 1, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2073, 28, 610, 1, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2074, 28, 611, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2075, 28, 612, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2076, 28, 613, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2077, 28, 614, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2078, 28, 615, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2079, 28, 616, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2080, 28, 617, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2081, 28, 618, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2082, 28, 619, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2083, 28, 620, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2084, 28, 621, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2085, 28, 622, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2086, 28, 623, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2087, 29, 610, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2088, 29, 611, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2089, 29, 612, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2090, 29, 613, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2091, 29, 614, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2092, 29, 615, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2093, 29, 616, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2094, 29, 617, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2095, 29, 618, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2096, 29, 619, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2097, 29, 620, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2098, 29, 621, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2099, 29, 622, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');
INSERT INTO `sys_attendance` VALUES (2100, 29, 623, 0, '2020-04-18 00:55:15.111000', '2020-04-18 00:55:15.111000');

-- ----------------------------
-- Table structure for sys_building_floor
-- ----------------------------
DROP TABLE IF EXISTS `sys_building_floor`;
CREATE TABLE `sys_building_floor`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `building` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '楼号',
  `floor` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '楼层',
  `create_time` datetime(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `modify_time` datetime(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = big5 COLLATE = big5_chinese_ci COMMENT = '楼层信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_building_floor
-- ----------------------------
INSERT INTO `sys_building_floor` VALUES (1, '主楼', '一楼', '2020-04-17 19:28:40.380890', '2020-04-17 19:28:40.380890');
INSERT INTO `sys_building_floor` VALUES (2, '主楼', '二楼', '2019-03-04 13:07:12.000000', '2019-03-04 13:08:03.000000');
INSERT INTO `sys_building_floor` VALUES (3, '主楼', '三楼', '2019-03-04 13:07:12.000000', '2019-03-04 13:08:03.000000');
INSERT INTO `sys_building_floor` VALUES (4, '主楼', '四楼', '2020-04-17 19:29:29.828814', '2020-04-17 19:29:29.828814');
INSERT INTO `sys_building_floor` VALUES (5, '主楼', '五楼', '2020-04-17 19:29:29.982756', '2020-04-17 19:29:29.982756');
INSERT INTO `sys_building_floor` VALUES (6, '三号楼', '一楼', '2020-04-17 19:29:30.136689', '2020-04-17 19:29:30.136689');
INSERT INTO `sys_building_floor` VALUES (7, '三号楼', '二楼', '2020-04-17 19:29:45.212309', '2020-04-17 19:29:45.212309');
INSERT INTO `sys_building_floor` VALUES (8, '三号楼', '三楼', '2020-04-17 19:29:45.365259', '2020-04-17 19:29:45.365259');
INSERT INTO `sys_building_floor` VALUES (10, '四号楼', '一楼', '2020-04-17 19:29:54.698256', '2020-04-17 19:29:54.698256');
INSERT INTO `sys_building_floor` VALUES (11, '四号楼', '二楼', '2020-04-17 19:30:02.982706', '2020-04-17 19:30:02.982706');
INSERT INTO `sys_building_floor` VALUES (12, '四号楼', '三楼', '2020-04-17 19:30:11.762113', '2020-04-17 19:30:11.762113');
INSERT INTO `sys_building_floor` VALUES (13, '五号楼', '一楼', '2020-04-17 19:30:24.645943', '2020-04-17 19:30:24.645943');
INSERT INTO `sys_building_floor` VALUES (14, '五号楼', '二楼', '2020-04-17 19:30:43.248482', '2020-04-17 19:30:43.248482');
INSERT INTO `sys_building_floor` VALUES (15, '五号楼', '三楼', '2020-04-17 19:30:43.404299', '2020-04-17 19:30:43.404299');
INSERT INTO `sys_building_floor` VALUES (16, '六号楼', '一楼', '2020-04-17 19:30:46.739178', '2020-04-17 19:30:46.739178');
INSERT INTO `sys_building_floor` VALUES (17, '五号楼', '二楼', '2020-04-17 19:30:46.894115', '2020-04-17 19:30:46.894115');
INSERT INTO `sys_building_floor` VALUES (18, '五号楼', '三楼', '2020-04-17 19:30:47.055979', '2020-04-17 19:30:47.055979');

-- ----------------------------
-- Table structure for sys_checkpicture
-- ----------------------------
DROP TABLE IF EXISTS `sys_checkpicture`;
CREATE TABLE `sys_checkpicture`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pictureId` int(255) NULL DEFAULT NULL,
  `intflag` int(11) NULL DEFAULT NULL,
  `knowledgeid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 393 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_checkpicture
-- ----------------------------
INSERT INTO `sys_checkpicture` VALUES (51, 1, 2, 331);
INSERT INTO `sys_checkpicture` VALUES (52, 2, 1, 331);
INSERT INTO `sys_checkpicture` VALUES (53, 3, 1, 331);
INSERT INTO `sys_checkpicture` VALUES (54, 4, 1, 331);
INSERT INTO `sys_checkpicture` VALUES (55, 5, 1, 331);
INSERT INTO `sys_checkpicture` VALUES (56, 6, 2, 2);
INSERT INTO `sys_checkpicture` VALUES (57, 7, 2, 2);
INSERT INTO `sys_checkpicture` VALUES (58, 8, 2, 2);
INSERT INTO `sys_checkpicture` VALUES (59, 9, 2, 2);
INSERT INTO `sys_checkpicture` VALUES (60, 10, 2, 2);
INSERT INTO `sys_checkpicture` VALUES (61, 11, 1, 331);
INSERT INTO `sys_checkpicture` VALUES (62, 12, 1, 331);
INSERT INTO `sys_checkpicture` VALUES (63, 13, 1, 331);
INSERT INTO `sys_checkpicture` VALUES (64, 14, 1, 331);
INSERT INTO `sys_checkpicture` VALUES (65, 15, 1, 331);
INSERT INTO `sys_checkpicture` VALUES (66, 16, 1, 360);
INSERT INTO `sys_checkpicture` VALUES (67, 17, 1, 360);
INSERT INTO `sys_checkpicture` VALUES (68, 18, 1, 360);
INSERT INTO `sys_checkpicture` VALUES (69, 19, 1, 360);
INSERT INTO `sys_checkpicture` VALUES (70, 20, 2, 360);
INSERT INTO `sys_checkpicture` VALUES (71, 21, 2, 360);
INSERT INTO `sys_checkpicture` VALUES (72, 22, 2, 360);
INSERT INTO `sys_checkpicture` VALUES (73, 23, 2, 362);
INSERT INTO `sys_checkpicture` VALUES (74, 24, 2, 362);
INSERT INTO `sys_checkpicture` VALUES (75, 25, 1, 362);
INSERT INTO `sys_checkpicture` VALUES (76, 26, 1, 362);
INSERT INTO `sys_checkpicture` VALUES (77, 27, 1, 362);
INSERT INTO `sys_checkpicture` VALUES (78, 28, 1, 363);
INSERT INTO `sys_checkpicture` VALUES (79, 29, 1, 363);
INSERT INTO `sys_checkpicture` VALUES (80, 30, 2, 363);
INSERT INTO `sys_checkpicture` VALUES (81, 31, 2, 363);
INSERT INTO `sys_checkpicture` VALUES (82, 32, 2, 363);
INSERT INTO `sys_checkpicture` VALUES (83, 33, 2, 364);
INSERT INTO `sys_checkpicture` VALUES (84, 34, 2, 364);
INSERT INTO `sys_checkpicture` VALUES (85, 35, 1, 364);
INSERT INTO `sys_checkpicture` VALUES (86, 36, 1, 364);
INSERT INTO `sys_checkpicture` VALUES (87, 37, 1, 364);
INSERT INTO `sys_checkpicture` VALUES (88, 38, 1, 365);
INSERT INTO `sys_checkpicture` VALUES (89, 39, 1, 365);
INSERT INTO `sys_checkpicture` VALUES (90, 40, 1, 365);
INSERT INTO `sys_checkpicture` VALUES (91, 41, 2, 365);
INSERT INTO `sys_checkpicture` VALUES (92, 42, 2, 365);
INSERT INTO `sys_checkpicture` VALUES (93, 43, 2, 342);
INSERT INTO `sys_checkpicture` VALUES (94, 44, 2, 342);
INSERT INTO `sys_checkpicture` VALUES (95, 45, 2, 342);
INSERT INTO `sys_checkpicture` VALUES (96, 46, 2, 342);
INSERT INTO `sys_checkpicture` VALUES (97, 47, 2, 342);
INSERT INTO `sys_checkpicture` VALUES (98, 48, 1, 343);
INSERT INTO `sys_checkpicture` VALUES (99, 49, 1, 343);
INSERT INTO `sys_checkpicture` VALUES (100, 50, 1, 343);
INSERT INTO `sys_checkpicture` VALUES (332, 587, 2, 360);
INSERT INTO `sys_checkpicture` VALUES (333, 588, 2, 360);
INSERT INTO `sys_checkpicture` VALUES (334, 589, 2, 360);
INSERT INTO `sys_checkpicture` VALUES (335, 590, 2, 360);
INSERT INTO `sys_checkpicture` VALUES (336, 591, 2, 360);
INSERT INTO `sys_checkpicture` VALUES (337, 592, 2, 360);
INSERT INTO `sys_checkpicture` VALUES (338, 593, 2, 360);
INSERT INTO `sys_checkpicture` VALUES (339, 594, 2, 360);
INSERT INTO `sys_checkpicture` VALUES (340, 595, 2, 360);
INSERT INTO `sys_checkpicture` VALUES (341, 596, 1, 360);
INSERT INTO `sys_checkpicture` VALUES (342, 597, 1, 360);
INSERT INTO `sys_checkpicture` VALUES (343, 598, 1, 361);
INSERT INTO `sys_checkpicture` VALUES (344, 599, 1, 361);
INSERT INTO `sys_checkpicture` VALUES (345, 600, 1, 362);
INSERT INTO `sys_checkpicture` VALUES (346, 601, 1, 362);
INSERT INTO `sys_checkpicture` VALUES (347, 602, 1, 362);
INSERT INTO `sys_checkpicture` VALUES (348, 603, 1, 364);
INSERT INTO `sys_checkpicture` VALUES (349, 604, 1, 363);
INSERT INTO `sys_checkpicture` VALUES (350, 605, 1, 363);
INSERT INTO `sys_checkpicture` VALUES (351, 606, 1, 363);
INSERT INTO `sys_checkpicture` VALUES (352, 607, 1, 363);
INSERT INTO `sys_checkpicture` VALUES (353, 608, 1, 365);
INSERT INTO `sys_checkpicture` VALUES (354, 609, 1, 366);
INSERT INTO `sys_checkpicture` VALUES (355, 610, 1, 366);
INSERT INTO `sys_checkpicture` VALUES (356, 611, 1, 366);
INSERT INTO `sys_checkpicture` VALUES (357, 612, 1, 366);
INSERT INTO `sys_checkpicture` VALUES (358, 613, 1, 366);
INSERT INTO `sys_checkpicture` VALUES (359, 614, 1, 366);
INSERT INTO `sys_checkpicture` VALUES (360, 615, 1, 366);
INSERT INTO `sys_checkpicture` VALUES (361, 616, 1, 366);
INSERT INTO `sys_checkpicture` VALUES (362, 617, 1, 367);
INSERT INTO `sys_checkpicture` VALUES (363, 618, 1, 367);
INSERT INTO `sys_checkpicture` VALUES (364, 619, 1, 368);
INSERT INTO `sys_checkpicture` VALUES (365, 620, 2, 368);
INSERT INTO `sys_checkpicture` VALUES (366, 621, 2, 368);
INSERT INTO `sys_checkpicture` VALUES (367, 622, 2, 368);
INSERT INTO `sys_checkpicture` VALUES (368, 623, 1, 369);
INSERT INTO `sys_checkpicture` VALUES (369, 624, 1, 369);
INSERT INTO `sys_checkpicture` VALUES (370, 625, 1, 369);
INSERT INTO `sys_checkpicture` VALUES (371, 626, 1, 370);
INSERT INTO `sys_checkpicture` VALUES (372, 627, 1, 370);
INSERT INTO `sys_checkpicture` VALUES (373, 628, 1, 370);
INSERT INTO `sys_checkpicture` VALUES (374, 629, 1, 370);
INSERT INTO `sys_checkpicture` VALUES (375, 630, 1, 371);
INSERT INTO `sys_checkpicture` VALUES (376, 631, 1, 372);
INSERT INTO `sys_checkpicture` VALUES (377, 632, 2, 372);
INSERT INTO `sys_checkpicture` VALUES (378, 633, 2, 372);
INSERT INTO `sys_checkpicture` VALUES (379, 634, 2, 372);
INSERT INTO `sys_checkpicture` VALUES (380, 635, 2, 372);
INSERT INTO `sys_checkpicture` VALUES (381, 636, 1, 371);
INSERT INTO `sys_checkpicture` VALUES (382, 637, 2, 371);
INSERT INTO `sys_checkpicture` VALUES (383, 638, 2, 371);
INSERT INTO `sys_checkpicture` VALUES (384, 639, 2, 371);
INSERT INTO `sys_checkpicture` VALUES (385, 640, 2, 371);
INSERT INTO `sys_checkpicture` VALUES (386, NULL, NULL, NULL);
INSERT INTO `sys_checkpicture` VALUES (387, NULL, NULL, NULL);
INSERT INTO `sys_checkpicture` VALUES (388, NULL, NULL, NULL);
INSERT INTO `sys_checkpicture` VALUES (389, NULL, NULL, NULL);
INSERT INTO `sys_checkpicture` VALUES (390, NULL, NULL, NULL);
INSERT INTO `sys_checkpicture` VALUES (391, NULL, NULL, NULL);
INSERT INTO `sys_checkpicture` VALUES (392, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_class_score
-- ----------------------------
DROP TABLE IF EXISTS `sys_class_score`;
CREATE TABLE `sys_class_score`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '用户编号',
  `lesson_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '课时编号',
  `score` double(8, 3) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '课程评分',
  `create_time` datetime(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `modify_time` datetime(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2335 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生上课评分汇总' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_class_score
-- ----------------------------
INSERT INTO `sys_class_score` VALUES (1676, 1, 582, 0064.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1677, 1, 583, 0097.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1678, 1, 584, 0088.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1679, 1, 585, 0071.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1680, 1, 586, 0058.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1681, 1, 587, 0067.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1682, 1, 588, 0094.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1683, 1, 589, 0067.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1684, 1, 590, 0069.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1685, 1, 591, 0079.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1686, 1, 592, 0097.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1687, 1, 593, 0076.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1688, 1, 594, 0079.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1689, 1, 595, 0076.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1690, 2, 582, 0079.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1691, 2, 583, 0062.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1692, 2, 584, 0064.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1693, 2, 585, 0051.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1694, 2, 586, 0052.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1695, 2, 587, 0093.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1696, 2, 588, 0096.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1697, 2, 589, 0089.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1698, 2, 590, 0079.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1699, 2, 591, 0067.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1700, 2, 592, 0051.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1701, 2, 593, 0088.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1702, 2, 594, 0089.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1703, 2, 595, 0091.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1704, 3, 582, 0074.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1705, 3, 583, 0080.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1706, 3, 584, 0063.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1707, 3, 585, 0096.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1708, 3, 586, 0057.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1709, 3, 587, 0079.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1710, 3, 588, 0051.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1711, 3, 589, 0076.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1712, 3, 590, 0074.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1713, 3, 591, 0068.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1714, 3, 592, 0071.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1715, 3, 593, 0085.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1716, 3, 594, 0070.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1717, 3, 595, 0085.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1718, 4, 582, 0096.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1719, 4, 583, 0077.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1720, 4, 584, 0076.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1721, 4, 585, 0056.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1722, 4, 586, 0064.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1723, 4, 587, 0057.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1724, 4, 588, 0079.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1725, 4, 589, 0091.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1726, 4, 590, 0092.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1727, 4, 591, 0071.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1728, 4, 592, 0079.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1729, 4, 593, 0075.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1730, 4, 594, 0058.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1731, 4, 595, 0051.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1732, 5, 582, 0099.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1733, 5, 583, 0071.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1734, 5, 584, 0094.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1735, 5, 585, 0079.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1736, 5, 586, 0097.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1737, 5, 587, 0084.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1738, 5, 588, 0094.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1739, 5, 589, 0090.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1740, 5, 590, 0055.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1741, 5, 591, 0061.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1742, 5, 592, 0069.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1743, 5, 593, 0079.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1744, 5, 594, 0075.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1745, 5, 595, 0071.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1746, 6, 582, 0095.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1747, 6, 583, 0084.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1748, 6, 584, 0061.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1749, 6, 585, 0076.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1750, 6, 586, 0096.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1751, 6, 587, 0097.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1752, 6, 588, 0080.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1753, 6, 589, 0057.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1754, 6, 590, 0097.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1755, 6, 591, 0093.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1756, 6, 592, 0071.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1757, 6, 593, 0065.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1758, 6, 594, 0071.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1759, 6, 595, 0079.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1760, 7, 582, 0093.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1761, 7, 583, 0052.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1762, 7, 584, 0086.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1763, 7, 585, 0072.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1764, 7, 586, 0086.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1765, 7, 587, 0093.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1766, 7, 588, 0092.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1767, 7, 589, 0088.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1768, 7, 590, 0068.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1769, 7, 591, 0072.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1770, 7, 592, 0059.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1771, 7, 593, 0093.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1772, 7, 594, 0076.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1773, 7, 595, 0097.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1774, 8, 582, 0079.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1775, 8, 583, 0057.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1776, 8, 584, 0098.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1777, 8, 585, 0066.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1778, 8, 586, 0060.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1779, 8, 587, 0093.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1780, 8, 588, 0075.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1781, 8, 589, 0086.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1782, 8, 590, 0055.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1783, 8, 591, 0054.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1784, 8, 592, 0094.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1785, 8, 593, 0064.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1786, 8, 594, 0094.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1787, 8, 595, 0081.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1788, 9, 582, 0085.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1789, 9, 583, 0081.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1790, 9, 584, 0094.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1791, 9, 585, 0064.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1792, 9, 586, 0061.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1793, 9, 587, 0097.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1794, 9, 588, 0062.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1795, 9, 589, 0085.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1796, 9, 590, 0071.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1797, 9, 591, 0059.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1798, 9, 592, 0080.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1799, 9, 593, 0071.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1800, 9, 594, 0092.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1801, 9, 595, 0081.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1802, 10, 582, 0086.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1803, 10, 583, 0072.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1804, 10, 584, 0080.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1805, 10, 585, 0095.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1806, 10, 586, 0069.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1807, 10, 587, 0065.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1808, 10, 588, 0068.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1809, 10, 589, 0073.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1810, 10, 590, 0050.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1811, 10, 591, 0088.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1812, 10, 592, 0084.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1813, 10, 593, 0066.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1814, 10, 594, 0056.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1815, 10, 595, 0085.000, '2020-04-18 01:01:40.297000', '2020-04-18 01:01:40.297000');
INSERT INTO `sys_class_score` VALUES (1816, 11, 596, 0073.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1817, 11, 597, 0092.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1818, 11, 598, 0057.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1819, 11, 599, 0074.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1820, 11, 600, 0070.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1821, 11, 601, 0058.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1822, 11, 602, 0056.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1823, 11, 603, 0056.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1824, 11, 604, 0081.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1825, 11, 605, 0052.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1826, 11, 606, 0089.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1827, 11, 607, 0078.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1828, 11, 608, 0058.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1829, 11, 609, 0098.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1830, 12, 596, 0091.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1831, 12, 597, 0069.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1832, 12, 598, 0099.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1833, 12, 599, 0051.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1834, 12, 600, 0063.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1835, 12, 601, 0066.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1836, 12, 602, 0087.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1837, 12, 603, 0061.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1838, 12, 604, 0078.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1839, 12, 605, 0071.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1840, 12, 606, 0065.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1841, 12, 607, 0088.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1842, 12, 608, 0089.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1843, 12, 609, 0050.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1844, 13, 596, 0088.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1845, 13, 597, 0096.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1846, 13, 598, 0091.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1847, 13, 599, 0089.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1848, 13, 600, 0082.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1849, 13, 601, 0052.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1850, 13, 602, 0099.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1851, 13, 603, 0078.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1852, 13, 604, 0098.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1853, 13, 605, 0088.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1854, 13, 606, 0092.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1855, 13, 607, 0096.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1856, 13, 608, 0093.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1857, 13, 609, 0067.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1858, 14, 596, 0059.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1859, 14, 597, 0057.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1860, 14, 598, 0064.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1861, 14, 599, 0096.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1862, 14, 600, 0055.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1863, 14, 601, 0077.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1864, 14, 602, 0075.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1865, 14, 603, 0076.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1866, 14, 604, 0069.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1867, 14, 605, 0062.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1868, 14, 606, 0097.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1869, 14, 607, 0056.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1870, 14, 608, 0069.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1871, 14, 609, 0098.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1872, 15, 596, 0075.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1873, 15, 597, 0056.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1874, 15, 598, 0092.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1875, 15, 599, 0080.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1876, 15, 600, 0089.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1877, 15, 601, 0055.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1878, 15, 602, 0097.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1879, 15, 603, 0064.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1880, 15, 604, 0057.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1881, 15, 605, 0066.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1882, 15, 606, 0074.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1883, 15, 607, 0069.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1884, 15, 608, 0065.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1885, 15, 609, 0071.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1886, 16, 596, 0078.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1887, 16, 597, 0094.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1888, 16, 598, 0079.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1889, 16, 599, 0082.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1890, 16, 600, 0069.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1891, 16, 601, 0096.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1892, 16, 602, 0085.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1893, 16, 603, 0073.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1894, 16, 604, 0072.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1895, 16, 605, 0076.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1896, 16, 606, 0075.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1897, 16, 607, 0077.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1898, 16, 608, 0073.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1899, 16, 609, 0065.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1900, 17, 596, 0061.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1901, 17, 597, 0071.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1902, 17, 598, 0075.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1903, 17, 599, 0093.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1904, 17, 600, 0091.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1905, 17, 601, 0064.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1906, 17, 602, 0071.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1907, 17, 603, 0099.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1908, 17, 604, 0067.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1909, 17, 605, 0087.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1910, 17, 606, 0096.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1911, 17, 607, 0079.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1912, 17, 608, 0065.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1913, 17, 609, 0054.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1914, 18, 596, 0097.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1915, 18, 597, 0051.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1916, 18, 598, 0055.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1917, 18, 599, 0075.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1918, 18, 600, 0082.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1919, 18, 601, 0068.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1920, 18, 602, 0099.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1921, 18, 603, 0065.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1922, 18, 604, 0063.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1923, 18, 605, 0091.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1924, 18, 606, 0050.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1925, 18, 607, 0079.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1926, 18, 608, 0079.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1927, 18, 609, 0089.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1928, 19, 596, 0073.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1929, 19, 597, 0091.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1930, 19, 598, 0082.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1931, 19, 599, 0094.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1932, 19, 600, 0052.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1933, 19, 601, 0054.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1934, 19, 602, 0089.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1935, 19, 603, 0064.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1936, 19, 604, 0072.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1937, 19, 605, 0069.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1938, 19, 606, 0076.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1939, 19, 607, 0070.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1940, 19, 608, 0054.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1941, 19, 609, 0078.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1942, 20, 596, 0051.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1943, 20, 597, 0058.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1944, 20, 598, 0062.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1945, 20, 599, 0080.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1946, 20, 600, 0085.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1947, 20, 601, 0092.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1948, 20, 602, 0085.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1949, 20, 603, 0094.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1950, 20, 604, 0087.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1951, 20, 605, 0053.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1952, 20, 606, 0073.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1953, 20, 607, 0095.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1954, 20, 608, 0090.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1955, 20, 609, 0086.000, '2020-04-18 01:03:14.632000', '2020-04-18 01:03:14.632000');
INSERT INTO `sys_class_score` VALUES (1956, 21, 610, 0051.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1957, 21, 611, 0083.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1958, 21, 612, 0075.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1959, 21, 613, 0096.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1960, 21, 614, 0050.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1961, 21, 615, 0057.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1962, 21, 616, 0092.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1963, 21, 617, 0050.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1964, 21, 618, 0071.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1965, 21, 619, 0063.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1966, 21, 620, 0065.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1967, 21, 621, 0088.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1968, 21, 622, 0075.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1969, 21, 623, 0075.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1970, 22, 610, 0062.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1971, 22, 611, 0050.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1972, 22, 612, 0084.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1973, 22, 613, 0079.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1974, 22, 614, 0094.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1975, 22, 615, 0096.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1976, 22, 616, 0083.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1977, 22, 617, 0085.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1978, 22, 618, 0055.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1979, 22, 619, 0093.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1980, 22, 620, 0089.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1981, 22, 621, 0074.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1982, 22, 622, 0053.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1983, 22, 623, 0072.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1984, 23, 610, 0087.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1985, 23, 611, 0050.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1986, 23, 612, 0097.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1987, 23, 613, 0091.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1988, 23, 614, 0072.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1989, 23, 615, 0090.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1990, 23, 616, 0097.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1991, 23, 617, 0090.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1992, 23, 618, 0083.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1993, 23, 619, 0094.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1994, 23, 620, 0062.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1995, 23, 621, 0072.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1996, 23, 622, 0096.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1997, 23, 623, 0054.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1998, 24, 610, 0061.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (1999, 24, 611, 0056.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2000, 24, 612, 0084.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2001, 24, 613, 0057.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2002, 24, 614, 0098.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2003, 24, 615, 0098.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2004, 24, 616, 0052.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2005, 24, 617, 0075.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2006, 24, 618, 0059.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2007, 24, 619, 0080.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2008, 24, 620, 0066.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2009, 24, 621, 0052.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2010, 24, 622, 0079.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2011, 24, 623, 0085.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2012, 25, 610, 0094.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2013, 25, 611, 0050.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2014, 25, 612, 0065.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2015, 25, 613, 0092.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2016, 25, 614, 0054.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2017, 25, 615, 0062.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2018, 25, 616, 0060.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2019, 25, 617, 0093.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2020, 25, 618, 0055.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2021, 25, 619, 0053.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2022, 25, 620, 0081.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2023, 25, 621, 0078.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2024, 25, 622, 0090.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2025, 25, 623, 0062.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2026, 26, 610, 0076.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2027, 26, 611, 0056.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2028, 26, 612, 0057.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2029, 26, 613, 0062.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2030, 26, 614, 0096.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2031, 26, 615, 0083.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2032, 26, 616, 0055.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2033, 26, 617, 0068.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2034, 26, 618, 0052.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2035, 26, 619, 0055.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2036, 26, 620, 0057.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2037, 26, 621, 0084.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2038, 26, 622, 0061.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2039, 26, 623, 0050.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2040, 27, 610, 0065.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2041, 27, 611, 0078.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2042, 27, 612, 0076.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2043, 27, 613, 0087.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2044, 27, 614, 0093.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2045, 27, 615, 0095.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2046, 27, 616, 0088.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2047, 27, 617, 0099.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2048, 27, 618, 0070.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2049, 27, 619, 0054.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2050, 27, 620, 0094.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2051, 27, 621, 0088.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2052, 27, 622, 0066.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2053, 27, 623, 0076.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2054, 28, 610, 0079.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2055, 28, 611, 0070.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2056, 28, 612, 0088.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2057, 28, 613, 0062.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2058, 28, 614, 0088.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2059, 28, 615, 0078.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2060, 28, 616, 0056.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2061, 28, 617, 0092.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2062, 28, 618, 0068.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2063, 28, 619, 0092.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2064, 28, 620, 0053.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2065, 28, 621, 0085.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2066, 28, 622, 0056.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2067, 28, 623, 0053.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2068, 29, 610, 0069.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2069, 29, 611, 0067.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2070, 29, 612, 0075.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2071, 29, 613, 0065.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2072, 29, 614, 0094.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2073, 29, 615, 0076.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2074, 29, 616, 0061.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2075, 29, 617, 0098.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2076, 29, 618, 0078.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2077, 29, 619, 0080.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2078, 29, 620, 0071.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2079, 29, 621, 0071.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2080, 29, 622, 0059.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2081, 29, 623, 0085.000, '2020-04-18 01:05:03.100000', '2020-04-18 01:05:03.100000');
INSERT INTO `sys_class_score` VALUES (2083, 21, 610, 0082.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2084, 21, 611, 0089.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2085, 21, 612, 0077.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2086, 21, 613, 0058.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2087, 21, 614, 0095.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2088, 21, 615, 0070.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2089, 21, 616, 0077.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2090, 21, 617, 0066.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2091, 21, 618, 0074.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2092, 21, 619, 0057.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2093, 21, 620, 0083.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2094, 21, 621, 0093.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2095, 21, 622, 0057.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2096, 21, 623, 0051.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2097, 22, 610, 0085.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2098, 22, 611, 0069.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2099, 22, 612, 0051.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2100, 22, 613, 0098.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2101, 22, 614, 0079.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2102, 22, 615, 0092.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2103, 22, 616, 0081.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2104, 22, 617, 0087.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2105, 22, 618, 0051.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2106, 22, 619, 0066.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2107, 22, 620, 0070.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2108, 22, 621, 0054.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2109, 22, 622, 0077.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2110, 22, 623, 0052.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2111, 23, 610, 0053.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2112, 23, 611, 0054.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2113, 23, 612, 0090.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2114, 23, 613, 0094.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2115, 23, 614, 0072.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2116, 23, 615, 0076.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2117, 23, 616, 0095.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2118, 23, 617, 0063.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2119, 23, 618, 0098.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2120, 23, 619, 0068.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2121, 23, 620, 0090.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2122, 23, 621, 0071.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2123, 23, 622, 0089.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2124, 23, 623, 0076.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2125, 24, 610, 0088.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2126, 24, 611, 0099.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2127, 24, 612, 0069.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2128, 24, 613, 0058.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2129, 24, 614, 0052.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2130, 24, 615, 0099.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2131, 24, 616, 0084.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2132, 24, 617, 0051.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2133, 24, 618, 0096.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2134, 24, 619, 0074.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2135, 24, 620, 0057.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2136, 24, 621, 0057.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2137, 24, 622, 0082.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2138, 24, 623, 0072.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2139, 25, 610, 0062.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2140, 25, 611, 0093.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2141, 25, 612, 0067.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2142, 25, 613, 0050.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2143, 25, 614, 0053.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2144, 25, 615, 0052.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2145, 25, 616, 0051.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2146, 25, 617, 0063.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2147, 25, 618, 0059.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2148, 25, 619, 0058.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2149, 25, 620, 0084.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2150, 25, 621, 0063.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2151, 25, 622, 0082.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2152, 25, 623, 0059.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2153, 26, 610, 0082.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2154, 26, 611, 0060.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2155, 26, 612, 0067.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2156, 26, 613, 0067.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2157, 26, 614, 0060.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2158, 26, 615, 0073.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2159, 26, 616, 0090.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2160, 26, 617, 0082.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2161, 26, 618, 0089.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2162, 26, 619, 0063.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2163, 26, 620, 0050.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2164, 26, 621, 0097.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2165, 26, 622, 0066.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2166, 26, 623, 0074.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2167, 27, 610, 0090.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2168, 27, 611, 0072.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2169, 27, 612, 0077.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2170, 27, 613, 0067.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2171, 27, 614, 0098.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2172, 27, 615, 0078.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2173, 27, 616, 0089.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2174, 27, 617, 0092.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2175, 27, 618, 0094.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2176, 27, 619, 0074.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2177, 27, 620, 0099.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2178, 27, 621, 0078.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2179, 27, 622, 0088.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2180, 27, 623, 0092.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2181, 28, 610, 0087.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2182, 28, 611, 0092.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2183, 28, 612, 0084.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2184, 28, 613, 0071.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2185, 28, 614, 0091.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2186, 28, 615, 0085.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2187, 28, 616, 0074.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2188, 28, 617, 0075.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2189, 28, 618, 0086.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2190, 28, 619, 0058.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2191, 28, 620, 0074.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2192, 28, 621, 0089.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2193, 28, 622, 0099.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2194, 28, 623, 0087.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2195, 29, 610, 0061.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2196, 29, 611, 0055.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2197, 29, 612, 0096.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2198, 29, 613, 0086.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2199, 29, 614, 0092.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2200, 29, 615, 0068.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2201, 29, 616, 0077.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2202, 29, 617, 0085.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2203, 29, 618, 0091.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2204, 29, 619, 0065.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2205, 29, 620, 0062.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2206, 29, 621, 0067.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2207, 29, 622, 0097.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2208, 29, 623, 0098.000, '2020-04-18 19:49:33.826000', '2020-04-18 19:49:33.826000');
INSERT INTO `sys_class_score` VALUES (2209, 21, 610, 0075.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2210, 21, 611, 0075.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2211, 21, 612, 0059.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2212, 21, 613, 0090.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2213, 21, 614, 0061.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2214, 21, 615, 0094.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2215, 21, 616, 0092.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2216, 21, 617, 0098.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2217, 21, 618, 0099.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2218, 21, 619, 0052.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2219, 21, 620, 0094.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2220, 21, 621, 0066.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2221, 21, 622, 0094.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2222, 21, 623, 0074.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2223, 22, 610, 0082.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2224, 22, 611, 0093.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2225, 22, 612, 0056.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2226, 22, 613, 0080.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2227, 22, 614, 0091.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2228, 22, 615, 0068.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2229, 22, 616, 0083.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2230, 22, 617, 0062.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2231, 22, 618, 0072.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2232, 22, 619, 0064.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2233, 22, 620, 0075.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2234, 22, 621, 0074.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2235, 22, 622, 0094.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2236, 22, 623, 0093.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2237, 23, 610, 0084.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2238, 23, 611, 0076.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2239, 23, 612, 0051.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2240, 23, 613, 0060.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2241, 23, 614, 0093.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2242, 23, 615, 0057.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2243, 23, 616, 0054.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2244, 23, 617, 0081.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2245, 23, 618, 0058.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2246, 23, 619, 0060.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2247, 23, 620, 0076.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2248, 23, 621, 0081.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2249, 23, 622, 0094.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2250, 23, 623, 0061.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2251, 24, 610, 0088.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2252, 24, 611, 0051.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2253, 24, 612, 0058.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2254, 24, 613, 0057.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2255, 24, 614, 0074.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2256, 24, 615, 0089.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2257, 24, 616, 0061.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2258, 24, 617, 0083.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2259, 24, 618, 0072.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2260, 24, 619, 0089.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2261, 24, 620, 0085.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2262, 24, 621, 0054.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2263, 24, 622, 0089.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2264, 24, 623, 0062.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2265, 25, 610, 0058.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2266, 25, 611, 0084.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2267, 25, 612, 0069.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2268, 25, 613, 0085.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2269, 25, 614, 0065.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2270, 25, 615, 0056.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2271, 25, 616, 0085.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2272, 25, 617, 0054.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2273, 25, 618, 0087.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2274, 25, 619, 0090.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2275, 25, 620, 0055.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2276, 25, 621, 0083.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2277, 25, 622, 0061.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2278, 25, 623, 0053.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2279, 26, 610, 0075.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2280, 26, 611, 0083.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2281, 26, 612, 0096.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2282, 26, 613, 0056.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2283, 26, 614, 0075.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2284, 26, 615, 0061.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2285, 26, 616, 0071.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2286, 26, 617, 0070.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2287, 26, 618, 0089.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2288, 26, 619, 0075.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2289, 26, 620, 0093.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2290, 26, 621, 0054.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2291, 26, 622, 0095.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2292, 26, 623, 0050.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2293, 27, 610, 0084.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2294, 27, 611, 0062.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2295, 27, 612, 0054.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2296, 27, 613, 0058.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2297, 27, 614, 0091.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2298, 27, 615, 0055.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2299, 27, 616, 0081.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2300, 27, 617, 0083.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2301, 27, 618, 0077.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2302, 27, 619, 0065.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2303, 27, 620, 0095.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2304, 27, 621, 0062.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2305, 27, 622, 0078.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2306, 27, 623, 0052.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2307, 28, 610, 0099.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2308, 28, 611, 0088.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2309, 28, 612, 0056.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2310, 28, 613, 0054.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2311, 28, 614, 0056.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2312, 28, 615, 0088.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2313, 28, 616, 0075.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2314, 28, 617, 0090.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2315, 28, 618, 0066.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2316, 28, 619, 0068.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2317, 28, 620, 0062.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2318, 28, 621, 0074.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2319, 28, 622, 0081.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2320, 28, 623, 0069.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2321, 29, 610, 0071.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2322, 29, 611, 0067.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2323, 29, 612, 0091.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2324, 29, 613, 0061.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2325, 29, 614, 0074.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2326, 29, 615, 0069.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2327, 29, 616, 0097.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2328, 29, 617, 0095.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2329, 29, 618, 0075.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2330, 29, 619, 0063.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2331, 29, 620, 0099.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2332, 29, 621, 0096.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2333, 29, 622, 0056.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');
INSERT INTO `sys_class_score` VALUES (2334, 29, 623, 0052.000, '2020-04-18 19:52:11.931000', '2020-04-18 19:52:11.931000');

-- ----------------------------
-- Table structure for sys_classes
-- ----------------------------
DROP TABLE IF EXISTS `sys_classes`;
CREATE TABLE `sys_classes`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `academy_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '学院编号',
  `dept_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '专业编号',
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = big5 COLLATE = big5_chinese_ci COMMENT = '班级信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_classes
-- ----------------------------
INSERT INTO `sys_classes` VALUES (1, 1, 103, '1801');
INSERT INTO `sys_classes` VALUES (2, 1, 104, '1802');
INSERT INTO `sys_classes` VALUES (3, 1, 105, '1803');
INSERT INTO `sys_classes` VALUES (4, 1, 106, '1804');
INSERT INTO `sys_classes` VALUES (5, 1, 107, '1805');
INSERT INTO `sys_classes` VALUES (6, 1, 105, '1806');
INSERT INTO `sys_classes` VALUES (7, 1, 106, '1807');
INSERT INTO `sys_classes` VALUES (8, 1, 103, '1808');
INSERT INTO `sys_classes` VALUES (9, 1, 104, '1809');
INSERT INTO `sys_classes` VALUES (10, 2, 108, '1801');
INSERT INTO `sys_classes` VALUES (11, 2, 109, '1802');

-- ----------------------------
-- Table structure for sys_classroom
-- ----------------------------
DROP TABLE IF EXISTS `sys_classroom`;
CREATE TABLE `sys_classroom`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '教室id',
  `building_floor_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '楼层号id',
  `number` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '楼层号',
  `equipment_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备id',
  `create_time` datetime(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '创建时间',
  `modify_time` datetime(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '教室' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_classroom
-- ----------------------------
INSERT INTO `sys_classroom` VALUES (1, 1, 'A101', '1', '2020-04-17 19:34:12.648432', '2020-04-17 19:34:12.648432');
INSERT INTO `sys_classroom` VALUES (2, 1, 'A102', '2', '2020-04-17 19:34:22.367133', '2020-04-17 19:34:22.367133');
INSERT INTO `sys_classroom` VALUES (3, 1, 'A103', '3', '2020-04-17 19:34:22.521514', '2020-04-17 19:34:22.521514');
INSERT INTO `sys_classroom` VALUES (4, 1, 'A104', '4', '2020-04-17 19:34:22.734034', '2020-04-17 19:34:22.734034');
INSERT INTO `sys_classroom` VALUES (5, 1, 'A105', '5', '2020-04-17 19:34:22.894926', '2020-04-17 19:34:22.894926');
INSERT INTO `sys_classroom` VALUES (6, 1, 'A106', '6', '2020-04-17 19:34:23.047838', '2020-04-17 19:34:23.047838');
INSERT INTO `sys_classroom` VALUES (7, 1, 'B101', '7', '2020-04-17 19:34:23.201733', '2020-04-17 19:34:23.201733');
INSERT INTO `sys_classroom` VALUES (8, 1, 'B102', '8', '2020-04-17 19:34:23.354982', '2020-04-17 19:34:23.354982');
INSERT INTO `sys_classroom` VALUES (9, 1, 'B103', '9', '2020-04-17 19:34:23.509578', '2020-04-17 19:34:23.509578');
INSERT INTO `sys_classroom` VALUES (10, 1, 'B104', '10', '2020-04-17 19:34:23.662553', '2020-04-17 19:34:23.662553');
INSERT INTO `sys_classroom` VALUES (11, 1, 'B105', '11', '2020-04-17 19:34:23.815493', '2020-04-17 19:34:23.815493');
INSERT INTO `sys_classroom` VALUES (12, 1, 'B106', '12', '2020-04-17 19:34:23.980359', '2020-04-17 19:34:23.980359');
INSERT INTO `sys_classroom` VALUES (13, 2, 'A201', '13', '2020-04-17 19:35:15.695950', '2020-04-17 19:35:15.695950');
INSERT INTO `sys_classroom` VALUES (14, 2, 'A202', '14', '2020-04-17 19:35:25.821420', '2020-04-17 19:35:25.821420');
INSERT INTO `sys_classroom` VALUES (15, 2, 'A203', '15', '2020-04-17 19:35:29.271761', '2020-04-17 19:35:29.271761');
INSERT INTO `sys_classroom` VALUES (16, 2, 'A204', '16', '2020-04-17 19:35:33.273392', '2020-04-17 19:35:33.273392');
INSERT INTO `sys_classroom` VALUES (17, 2, 'A205', '17', '2020-04-17 19:35:36.122565', '2020-04-17 19:35:36.122565');
INSERT INTO `sys_classroom` VALUES (18, 2, 'A206', '18', '2020-04-17 19:35:38.556055', '2020-04-17 19:35:38.556055');
INSERT INTO `sys_classroom` VALUES (19, 2, 'B201', '19', '2020-04-17 19:35:53.842154', '2020-04-17 19:35:53.842154');

-- ----------------------------
-- Table structure for sys_classroom_state
-- ----------------------------
DROP TABLE IF EXISTS `sys_classroom_state`;
CREATE TABLE `sys_classroom_state`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `classroom_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '教室编号',
  `lesson_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '课时编号',
  `state` int(11) NULL DEFAULT NULL COMMENT '教室状态',
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_lesson_id`(`lesson_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 326 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '教室占用情况' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_classroom_state
-- ----------------------------
INSERT INTO `sys_classroom_state` VALUES (255, 1, 1, 0, '2020-04-17 22:24:43.000000', '2020-04-17 22:24:43.000000');
INSERT INTO `sys_classroom_state` VALUES (256, 2, 2, 0, '2020-04-17 22:24:43.000000', '2020-04-17 22:24:43.000000');
INSERT INTO `sys_classroom_state` VALUES (257, 3, 3, 0, '2020-04-17 22:24:43.000000', '2020-04-17 22:24:43.000000');
INSERT INTO `sys_classroom_state` VALUES (258, 4, 4, 0, '2020-04-17 22:24:43.000000', '2020-04-17 22:24:43.000000');
INSERT INTO `sys_classroom_state` VALUES (259, 5, 5, 0, '2020-04-17 22:24:43.000000', '2020-04-17 22:24:43.000000');
INSERT INTO `sys_classroom_state` VALUES (260, 6, 6, 0, '2020-04-17 22:24:43.000000', '2020-04-17 22:24:43.000000');
INSERT INTO `sys_classroom_state` VALUES (261, 7, 7, 0, '2020-04-17 22:24:43.000000', '2020-04-17 22:24:43.000000');
INSERT INTO `sys_classroom_state` VALUES (262, 8, 8, 0, '2020-04-17 22:24:43.000000', '2020-04-17 22:24:43.000000');
INSERT INTO `sys_classroom_state` VALUES (263, 9, 9, 0, '2020-04-17 22:24:43.000000', '2020-04-17 22:24:43.000000');
INSERT INTO `sys_classroom_state` VALUES (264, 10, 10, 0, '2020-04-17 22:24:43.000000', '2020-04-17 22:24:43.000000');
INSERT INTO `sys_classroom_state` VALUES (265, 11, 11, 0, '2020-04-17 22:24:43.000000', '2020-04-17 22:24:43.000000');
INSERT INTO `sys_classroom_state` VALUES (266, 12, 12, 0, '2020-04-17 22:24:43.000000', '2020-04-17 22:24:43.000000');
INSERT INTO `sys_classroom_state` VALUES (267, 13, 13, 0, '2020-04-17 22:24:43.000000', '2020-04-17 22:24:43.000000');
INSERT INTO `sys_classroom_state` VALUES (268, 14, 14, 0, '2020-04-17 22:24:43.000000', '2020-04-17 22:24:43.000000');
INSERT INTO `sys_classroom_state` VALUES (269, 1, 15, 0, '2020-04-17 22:24:43.000000', '2020-04-17 22:24:43.000000');
INSERT INTO `sys_classroom_state` VALUES (270, 2, 16, 0, '2020-04-17 22:24:43.000000', '2020-04-17 22:24:43.000000');
INSERT INTO `sys_classroom_state` VALUES (271, 3, 17, 0, '2020-04-17 22:24:43.000000', '2020-04-17 22:24:43.000000');
INSERT INTO `sys_classroom_state` VALUES (272, 4, 18, 0, '2020-04-17 22:24:43.000000', '2020-04-17 22:24:43.000000');
INSERT INTO `sys_classroom_state` VALUES (273, 5, 19, 0, '2020-04-17 22:24:43.000000', '2020-04-17 22:24:43.000000');
INSERT INTO `sys_classroom_state` VALUES (274, 6, 20, 0, '2020-04-17 22:24:43.000000', '2020-04-17 22:24:43.000000');
INSERT INTO `sys_classroom_state` VALUES (275, 7, 21, 0, '2020-04-17 22:24:43.000000', '2020-04-17 22:24:43.000000');
INSERT INTO `sys_classroom_state` VALUES (276, 8, 22, 0, '2020-04-17 22:24:43.000000', '2020-04-17 22:24:43.000000');
INSERT INTO `sys_classroom_state` VALUES (277, 9, 23, 0, '2020-04-17 22:24:43.000000', '2020-04-17 22:24:43.000000');
INSERT INTO `sys_classroom_state` VALUES (278, 10, 24, 0, '2020-04-17 22:24:43.000000', '2020-04-17 22:24:43.000000');
INSERT INTO `sys_classroom_state` VALUES (279, 11, 25, 0, '2020-04-17 22:24:43.000000', '2020-04-17 22:24:43.000000');
INSERT INTO `sys_classroom_state` VALUES (280, 12, 26, 0, '2020-04-17 22:24:43.000000', '2020-04-17 22:24:43.000000');
INSERT INTO `sys_classroom_state` VALUES (281, 13, 27, 0, '2020-04-17 22:24:43.000000', '2020-04-17 22:24:43.000000');
INSERT INTO `sys_classroom_state` VALUES (282, 14, 28, 0, '2020-04-17 22:24:43.000000', '2020-04-17 22:24:43.000000');
INSERT INTO `sys_classroom_state` VALUES (283, 1, 582, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (284, 2, 583, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (285, 3, 584, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (286, 4, 585, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (287, 5, 586, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (288, 6, 587, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (289, 7, 588, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (290, 8, 589, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (291, 9, 590, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (292, 10, 591, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (293, 11, 592, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (294, 12, 593, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (295, 13, 594, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (296, 14, 595, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (297, 1, 596, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (298, 2, 597, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (299, 3, 598, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (300, 4, 599, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (301, 5, 600, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (302, 6, 601, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (303, 7, 602, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (304, 8, 603, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (305, 9, 604, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (306, 10, 605, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (307, 11, 606, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (308, 12, 607, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (309, 13, 608, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (310, 14, 609, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (311, 1, 610, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (312, 2, 611, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (313, 3, 612, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (314, 4, 613, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (315, 5, 614, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (316, 6, 615, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (317, 7, 616, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (318, 8, 617, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (319, 9, 618, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (320, 10, 619, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (321, 11, 620, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (322, 12, 621, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (323, 13, 622, 1, NULL, NULL);
INSERT INTO `sys_classroom_state` VALUES (324, 14, 623, 1, NULL, NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-16 19:51:46', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (113, '开通注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2020-03-27 21:40:51', '', NULL, '开通注册功能');

-- ----------------------------
-- Table structure for sys_course
-- ----------------------------
DROP TABLE IF EXISTS `sys_course`;
CREATE TABLE `sys_course`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '课程id',
  `number` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `lesson_sum` int(11) NULL DEFAULT NULL COMMENT '课时(第几课时)',
  `year` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开课学年',
  `term` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '开课学期',
  `dept_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '开课专业',
  `classes_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开课班级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_course
-- ----------------------------
INSERT INTO `sys_course` VALUES (1, '20086401', 'C语言', 64, '2018-2019学年', 0, 103, '1');
INSERT INTO `sys_course` VALUES (2, '20086402', '人文教育', 64, '2018-2019学年', 0, 103, '1');
INSERT INTO `sys_course` VALUES (3, '20086781', '数据结构', 64, '2018-2019学年', 0, 103, '1');
INSERT INTO `sys_course` VALUES (4, '20086404', '高等数学B1', 64, '2018-2019学年', 0, 103, '1');
INSERT INTO `sys_course` VALUES (5, '20086405', '算法设计', 64, '2018-2019学年', 0, 103, '1');
INSERT INTO `sys_course` VALUES (6, '20086406', 'JAVA初级程序设计', 64, '2018-2019学年', 0, 103, '1');
INSERT INTO `sys_course` VALUES (7, '20086411', '计算机网络', 64, '2018-2019学年', 0, 103, '1');
INSERT INTO `sys_course` VALUES (8, '20086407', '操作系统', 64, '2018-2019学年', 1, 103, '1');
INSERT INTO `sys_course` VALUES (9, '20086408', '离散数学', 64, '2018-2019学年', 1, 103, '1');
INSERT INTO `sys_course` VALUES (10, '20086409', '马克思主义思想', 64, '2018-2019学年', 1, 103, '1');
INSERT INTO `sys_course` VALUES (11, '20086410', '大学英语', 64, '2018-2019学年', 1, 103, '1');
INSERT INTO `sys_course` VALUES (12, '20086510', '计算机导论', 64, '2018-2019学年', 1, 103, '1');
INSERT INTO `sys_course` VALUES (13, '20086511', '数学建模', 64, '2018-2019学年', 1, 103, '1');
INSERT INTO `sys_course` VALUES (14, '20086512', 'UML统一建模语言', 64, '2018-2019学年', 1, 103, '1');
INSERT INTO `sys_course` VALUES (15, '20087401', 'C语言', 64, '2018-2019学年', 0, 103, '2');
INSERT INTO `sys_course` VALUES (16, '2008402', '人文教育', 64, '2018-2019学年', 0, 103, '2');
INSERT INTO `sys_course` VALUES (17, '20086781', '数据结构', 64, '2018-2019学年', 0, 103, '2');
INSERT INTO `sys_course` VALUES (18, '20086404', '高等数学B1', 64, '2018-2019学年', 0, 103, '2');
INSERT INTO `sys_course` VALUES (19, '20086405', '算法设计', 64, '2018-2019学年', 0, 103, '2');
INSERT INTO `sys_course` VALUES (20, '20086406', 'JAVA初级程序设计', 64, '2018-2019学年', 0, 103, '2');
INSERT INTO `sys_course` VALUES (21, '20086411', '计算机网络', 64, '2018-2019学年', 0, 103, '2');
INSERT INTO `sys_course` VALUES (22, '20086407', '操作系统', 64, '2018-2019学年', 1, 103, '2');
INSERT INTO `sys_course` VALUES (23, '20086408', '离散数学', 64, '2018-2019学年', 1, 103, '2');
INSERT INTO `sys_course` VALUES (24, '20086409', '马克思主义思想', 64, '2018-2019学年', 1, 103, '2');
INSERT INTO `sys_course` VALUES (25, '20086410', '大学英语', 64, '2018-2019学年', 1, 103, '2');
INSERT INTO `sys_course` VALUES (26, '20086510', '计算机导论', 64, '2018-2019学年', 1, 103, '2');
INSERT INTO `sys_course` VALUES (27, '20086511', '数学建模', 64, '2018-2019学年', 1, 103, '2');
INSERT INTO `sys_course` VALUES (28, '20086512', 'UML统一建模语言', 64, '2018-2019学年', 1, 103, '2');
INSERT INTO `sys_course` VALUES (29, '20087401', 'C语言', 64, '2018-2019学年', 0, 103, '3');
INSERT INTO `sys_course` VALUES (30, '2008402', '人文教育', 64, '2018-2019学年', 0, 103, '3');
INSERT INTO `sys_course` VALUES (31, '20086781', '数据结构', 64, '2018-2019学年', 0, 103, '3');
INSERT INTO `sys_course` VALUES (32, '20086404', '高等数学B1', 64, '2018-2019学年', 0, 103, '3');
INSERT INTO `sys_course` VALUES (33, '20086405', '算法设计', 64, '2018-2019学年', 0, 103, '3');
INSERT INTO `sys_course` VALUES (34, '20086406', 'JAVA初级程序设计', 64, '2018-2019学年', 0, 103, '3');
INSERT INTO `sys_course` VALUES (35, '20086411', '计算机网络', 64, '2018-2019学年', 0, 103, '3');
INSERT INTO `sys_course` VALUES (36, '20086407', '操作系统', 64, '2018-2019学年', 1, 103, '3');
INSERT INTO `sys_course` VALUES (37, '20086408', '离散数学', 64, '2018-2019学年', 1, 103, '3');
INSERT INTO `sys_course` VALUES (38, '20086409', '马克思主义思想', 64, '2018-2019学年', 1, 103, '3');
INSERT INTO `sys_course` VALUES (39, '20086410', '大学英语', 64, '2018-2019学年', 1, 103, '3');
INSERT INTO `sys_course` VALUES (40, '20086510', '计算机导论', 64, '2018-2019学年', 1, 103, '3');
INSERT INTO `sys_course` VALUES (41, '20086511', '数学建模', 64, '2018-2019学年', 1, 103, '3');
INSERT INTO `sys_course` VALUES (42, '20086512', 'UML统一建模语言', 64, '2018-2019学年', 1, 103, '3');

-- ----------------------------
-- Table structure for sys_course_stu
-- ----------------------------
DROP TABLE IF EXISTS `sys_course_stu`;
CREATE TABLE `sys_course_stu`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '用户编号',
  `course_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '课程编号',
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 662 CHARACTER SET = big5 COLLATE = big5_chinese_ci COMMENT = '学生课程信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_course_stu
-- ----------------------------
INSERT INTO `sys_course_stu` VALUES (256, 1, 1, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (257, 1, 2, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (258, 1, 3, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (259, 1, 4, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (260, 1, 5, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (261, 1, 6, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (262, 1, 7, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (263, 1, 8, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (264, 1, 9, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (265, 1, 10, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (266, 1, 11, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (267, 1, 12, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (268, 1, 13, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (269, 1, 14, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (270, 2, 1, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (271, 2, 2, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (272, 2, 3, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (273, 2, 4, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (274, 2, 5, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (275, 2, 6, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (276, 2, 7, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (277, 2, 8, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (278, 2, 9, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (279, 2, 10, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (280, 2, 11, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (281, 2, 12, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (282, 2, 13, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (283, 2, 14, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (284, 3, 1, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (285, 3, 2, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (286, 3, 3, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (287, 3, 4, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (288, 3, 5, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (289, 3, 6, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (290, 3, 7, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (291, 3, 8, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (292, 3, 9, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (293, 3, 10, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (294, 3, 11, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (295, 3, 12, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (296, 3, 13, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (297, 3, 14, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (298, 4, 1, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (299, 4, 2, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (300, 4, 3, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (301, 4, 4, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (302, 4, 5, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (303, 4, 6, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (304, 4, 7, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (305, 4, 8, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (306, 4, 9, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (307, 4, 10, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (308, 4, 11, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (309, 4, 12, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (310, 4, 13, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (311, 4, 14, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (312, 5, 1, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (313, 5, 2, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (314, 5, 3, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (315, 5, 4, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (316, 5, 5, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (317, 5, 6, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (318, 5, 7, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (319, 5, 8, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (320, 5, 9, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (321, 5, 10, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (322, 5, 11, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (323, 5, 12, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (324, 5, 13, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (325, 5, 14, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (326, 6, 1, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (327, 6, 2, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (328, 6, 3, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (329, 6, 4, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (330, 6, 5, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (331, 6, 6, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (332, 6, 7, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (333, 6, 8, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (334, 6, 9, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (335, 6, 10, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (336, 6, 11, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (337, 6, 12, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (338, 6, 13, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (339, 6, 14, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (340, 7, 1, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (341, 7, 2, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (342, 7, 3, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (343, 7, 4, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (344, 7, 5, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (345, 7, 6, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (346, 7, 7, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (347, 7, 8, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (348, 7, 9, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (349, 7, 10, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (350, 7, 11, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (351, 7, 12, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (352, 7, 13, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (353, 7, 14, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (354, 8, 1, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (355, 8, 2, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (356, 8, 3, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (357, 8, 4, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (358, 8, 5, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (359, 8, 6, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (360, 8, 7, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (361, 8, 8, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (362, 8, 9, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (363, 8, 10, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (364, 8, 11, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (365, 8, 12, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (366, 8, 13, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (367, 8, 14, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (368, 9, 1, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (369, 9, 2, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (370, 9, 3, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (371, 9, 4, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (372, 9, 5, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (373, 9, 6, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (374, 9, 7, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (375, 9, 8, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (376, 9, 9, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (377, 9, 10, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (378, 9, 11, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (379, 9, 12, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (380, 9, 13, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (381, 9, 14, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (382, 10, 1, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (383, 10, 2, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (384, 10, 3, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (385, 10, 4, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (386, 10, 5, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (387, 10, 6, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (388, 10, 7, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (389, 10, 8, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (390, 10, 9, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (391, 10, 10, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (392, 10, 11, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (393, 10, 12, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (394, 10, 13, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (395, 10, 14, '2020-04-18 14:42:13.312000', '2020-04-18 14:42:13.312000');
INSERT INTO `sys_course_stu` VALUES (396, 11, 15, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (397, 11, 16, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (398, 11, 17, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (399, 11, 18, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (400, 11, 19, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (401, 11, 20, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (402, 11, 21, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (403, 11, 22, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (404, 11, 23, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (405, 11, 24, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (406, 11, 25, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (407, 11, 26, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (408, 11, 27, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (409, 11, 28, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (410, 12, 15, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (411, 12, 16, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (412, 12, 17, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (413, 12, 18, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (414, 12, 19, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (415, 12, 20, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (416, 12, 21, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (417, 12, 22, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (418, 12, 23, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (419, 12, 24, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (420, 12, 25, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (421, 12, 26, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (422, 12, 27, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (423, 12, 28, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (424, 13, 15, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (425, 13, 16, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (426, 13, 17, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (427, 13, 18, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (428, 13, 19, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (429, 13, 20, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (430, 13, 21, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (431, 13, 22, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (432, 13, 23, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (433, 13, 24, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (434, 13, 25, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (435, 13, 26, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (436, 13, 27, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (437, 13, 28, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (438, 14, 15, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (439, 14, 16, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (440, 14, 17, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (441, 14, 18, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (442, 14, 19, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (443, 14, 20, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (444, 14, 21, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (445, 14, 22, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (446, 14, 23, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (447, 14, 24, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (448, 14, 25, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (449, 14, 26, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (450, 14, 27, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (451, 14, 28, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (452, 15, 15, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (453, 15, 16, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (454, 15, 17, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (455, 15, 18, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (456, 15, 19, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (457, 15, 20, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (458, 15, 21, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (459, 15, 22, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (460, 15, 23, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (461, 15, 24, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (462, 15, 25, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (463, 15, 26, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (464, 15, 27, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (465, 15, 28, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (466, 16, 15, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (467, 16, 16, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (468, 16, 17, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (469, 16, 18, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (470, 16, 19, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (471, 16, 20, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (472, 16, 21, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (473, 16, 22, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (474, 16, 23, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (475, 16, 24, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (476, 16, 25, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (477, 16, 26, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (478, 16, 27, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (479, 16, 28, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (480, 17, 15, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (481, 17, 16, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (482, 17, 17, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (483, 17, 18, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (484, 17, 19, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (485, 17, 20, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (486, 17, 21, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (487, 17, 22, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (488, 17, 23, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (489, 17, 24, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (490, 17, 25, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (491, 17, 26, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (492, 17, 27, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (493, 17, 28, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (494, 18, 15, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (495, 18, 16, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (496, 18, 17, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (497, 18, 18, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (498, 18, 19, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (499, 18, 20, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (500, 18, 21, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (501, 18, 22, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (502, 18, 23, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (503, 18, 24, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (504, 18, 25, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (505, 18, 26, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (506, 18, 27, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (507, 18, 28, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (508, 19, 15, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (509, 19, 16, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (510, 19, 17, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (511, 19, 18, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (512, 19, 19, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (513, 19, 20, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (514, 19, 21, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (515, 19, 22, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (516, 19, 23, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (517, 19, 24, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (518, 19, 25, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (519, 19, 26, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (520, 19, 27, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (521, 19, 28, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (522, 20, 15, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (523, 20, 16, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (524, 20, 17, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (525, 20, 18, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (526, 20, 19, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (527, 20, 20, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (528, 20, 21, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (529, 20, 22, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (530, 20, 23, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (531, 20, 24, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (532, 20, 25, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (533, 20, 26, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (534, 20, 27, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (535, 20, 28, '2020-04-18 14:43:13.850000', '2020-04-18 14:43:13.850000');
INSERT INTO `sys_course_stu` VALUES (536, 21, 29, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (537, 21, 30, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (538, 21, 31, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (539, 21, 32, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (540, 21, 33, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (541, 21, 34, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (542, 21, 35, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (543, 21, 36, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (544, 21, 37, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (545, 21, 38, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (546, 21, 39, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (547, 21, 40, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (548, 21, 41, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (549, 21, 42, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (550, 22, 29, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (551, 22, 30, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (552, 22, 31, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (553, 22, 32, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (554, 22, 33, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (555, 22, 34, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (556, 22, 35, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (557, 22, 36, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (558, 22, 37, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (559, 22, 38, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (560, 22, 39, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (561, 22, 40, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (562, 22, 41, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (563, 22, 42, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (564, 23, 29, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (565, 23, 30, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (566, 23, 31, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (567, 23, 32, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (568, 23, 33, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (569, 23, 34, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (570, 23, 35, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (571, 23, 36, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (572, 23, 37, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (573, 23, 38, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (574, 23, 39, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (575, 23, 40, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (576, 23, 41, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (577, 23, 42, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (578, 24, 29, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (579, 24, 30, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (580, 24, 31, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (581, 24, 32, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (582, 24, 33, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (583, 24, 34, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (584, 24, 35, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (585, 24, 36, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (586, 24, 37, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (587, 24, 38, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (588, 24, 39, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (589, 24, 40, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (590, 24, 41, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (591, 24, 42, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (592, 25, 29, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (593, 25, 30, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (594, 25, 31, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (595, 25, 32, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (596, 25, 33, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (597, 25, 34, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (598, 25, 35, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (599, 25, 36, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (600, 25, 37, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (601, 25, 38, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (602, 25, 39, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (603, 25, 40, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (604, 25, 41, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (605, 25, 42, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (606, 26, 29, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (607, 26, 30, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (608, 26, 31, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (609, 26, 32, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (610, 26, 33, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (611, 26, 34, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (612, 26, 35, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (613, 26, 36, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (614, 26, 37, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (615, 26, 38, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (616, 26, 39, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (617, 26, 40, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (618, 26, 41, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (619, 26, 42, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (620, 27, 29, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (621, 27, 30, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (622, 27, 31, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (623, 27, 32, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (624, 27, 33, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (625, 27, 34, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (626, 27, 35, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (627, 27, 36, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (628, 27, 37, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (629, 27, 38, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (630, 27, 39, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (631, 27, 40, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (632, 27, 41, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (633, 27, 42, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (634, 28, 29, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (635, 28, 30, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (636, 28, 31, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (637, 28, 32, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (638, 28, 33, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (639, 28, 34, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (640, 28, 35, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (641, 28, 36, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (642, 28, 37, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (643, 28, 38, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (644, 28, 39, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (645, 28, 40, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (646, 28, 41, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (647, 28, 42, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (648, 29, 29, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (649, 29, 30, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (650, 29, 31, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (651, 29, 32, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (652, 29, 33, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (653, 29, 34, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (654, 29, 35, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (655, 29, 36, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (656, 29, 37, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (657, 29, 38, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (658, 29, 39, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (659, 29, 40, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (660, 29, 41, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');
INSERT INTO `sys_course_stu` VALUES (661, 29, 42, '2020-04-18 14:44:16.100000', '2020-04-18 14:44:16.100000');

-- ----------------------------
-- Table structure for sys_cuisine
-- ----------------------------
DROP TABLE IF EXISTS `sys_cuisine`;
CREATE TABLE `sys_cuisine`  (
  `cuisine_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜品id',
  `cuisine_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜品名称',
  `cuisine_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜品图片路径',
  `cuisine_number` int(3) NULL DEFAULT 0 COMMENT '今日菜品份数',
  `cuisine_price` double(5, 2) NULL DEFAULT 0.00 COMMENT '菜品价格',
  PRIMARY KEY (`cuisine_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜品信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_cuisine
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '盐城师范学院', 0, 'luna', '15888888888', 'luna@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-16 16:56:07');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '信息工程学院', 1, 'xx', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-16 16:56:07');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '教育科学学院', 2, 'luna', '15888888888', 'luna@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-15 22:21:59');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '软件工程', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-15 22:18:33');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '物联网', 2, 'xx', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-15 22:19:40');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '数字媒体', 3, 'xx', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-15 22:19:54');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '大数据', 4, 'xx', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-15 22:20:22');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '计算机科学与技术', 5, 'xx', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-16 16:56:07');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '心理健康', 1, 'xx', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-15 22:21:45');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '小学教育', 2, 'xx', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-15 22:21:59');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (29, 10, '测试', '10', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '测试操作');
INSERT INTO `sys_dict_data` VALUES (100, 1, '学生', '0', 'sys_st_type', '', 'primary', 'Y', '0', 'admin', '2020-04-17 14:17:02', 'admin', '2020-04-17 14:17:41', '学生类别');
INSERT INTO `sys_dict_data` VALUES (101, 2, '老师', '1', 'sys_st_type', NULL, 'info', 'Y', '0', 'admin', '2020-04-17 14:17:25', '', NULL, '老师类别');
INSERT INTO `sys_dict_data` VALUES (102, 1, '认真听课', '1', 'sys_stu_state', '', 'primary', 'Y', '0', 'admin', '2020-04-17 15:51:58', 'admin', '2020-04-17 15:55:08', '学生状态-认真听课');
INSERT INTO `sys_dict_data` VALUES (103, 2, '玩手机', '2', 'sys_stu_state', '', 'warning', 'Y', '0', 'admin', '2020-04-17 15:52:37', 'admin', '2020-04-17 15:55:04', '学生状态-玩手机');
INSERT INTO `sys_dict_data` VALUES (104, 3, '发呆', '3', 'sys_stu_state', '', 'info', 'Y', '0', 'admin', '2020-04-17 15:53:05', 'admin', '2020-04-17 15:55:00', '学生状态-发呆');
INSERT INTO `sys_dict_data` VALUES (105, 4, '睡觉', '4', 'sys_stu_state', '', 'danger', 'Y', '0', 'admin', '2020-04-17 15:53:30', 'admin', '2020-04-17 15:54:56', '学生状态-睡觉');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (101, '学生/老师', 'sys_st_type', '0', 'admin', '2020-04-17 14:15:18', '', NULL, '学生/老师类别');
INSERT INTO `sys_dict_type` VALUES (102, '学生状态', 'sys_stu_state', '0', 'admin', '2020-04-17 15:39:45', '', NULL, '学生状态等级');

-- ----------------------------
-- Table structure for sys_equipment
-- ----------------------------
DROP TABLE IF EXISTS `sys_equipment`;
CREATE TABLE `sys_equipment`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '设备id',
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备名称',
  `video` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '视频播放地址',
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_equipment
-- ----------------------------
INSERT INTO `sys_equipment` VALUES (1, '1', '海康威视1-1', 'http://123.206.53.234/yctc/test1.mp4', '2020-04-18 13:16:24.289000', '2020-04-18 13:16:24.289000');
INSERT INTO `sys_equipment` VALUES (2, '1', '海康威视1-2', 'http://123.206.53.234/yctc/test1.mp4', '2020-04-18 13:16:24.289000', '2020-04-18 13:16:24.289000');
INSERT INTO `sys_equipment` VALUES (3, '1', '海康威视1-3', 'http://123.206.53.234/yctc/test1.mp4', '2020-04-18 13:16:24.289000', '2020-04-18 13:16:24.289000');
INSERT INTO `sys_equipment` VALUES (4, '1', '海康威视1-4', 'http://123.206.53.234/yctc/test1.mp4', '2020-04-18 13:16:24.289000', '2020-04-18 13:16:24.289000');
INSERT INTO `sys_equipment` VALUES (5, '1', '海康威视1-5', 'http://123.206.53.234/yctc/test1.mp4', '2020-04-18 13:16:24.289000', '2020-04-18 13:16:24.289000');
INSERT INTO `sys_equipment` VALUES (6, '1', '海康威视1-6', 'http://123.206.53.234/yctc/test1.mp4', '2020-04-18 13:16:24.289000', '2020-04-18 13:16:24.289000');
INSERT INTO `sys_equipment` VALUES (7, '1', '海康威视1-7', 'http://123.206.53.234/yctc/test1.mp4', '2020-04-18 13:16:24.289000', '2020-04-18 13:16:24.289000');
INSERT INTO `sys_equipment` VALUES (8, '1', '海康威视1-8', 'http://123.206.53.234/yctc/test1.mp4', '2020-04-18 13:16:24.289000', '2020-04-18 13:16:24.289000');
INSERT INTO `sys_equipment` VALUES (9, '1', '海康威视1-9', 'http://123.206.53.234/yctc/test1.mp4', '2020-04-18 13:16:24.289000', '2020-04-18 13:16:24.289000');
INSERT INTO `sys_equipment` VALUES (10, '1', '海康威视1-10', 'http://123.206.53.234/yctc/test1.mp4', '2020-04-18 13:16:24.289000', '2020-04-18 13:16:24.289000');
INSERT INTO `sys_equipment` VALUES (11, '1', '海康威视1-11', 'http://123.206.53.234/yctc/test1.mp4', '2020-04-18 13:16:24.289000', '2020-04-18 13:16:24.289000');
INSERT INTO `sys_equipment` VALUES (12, '1', '海康威视1-12', 'http://123.206.53.234/yctc/test1.mp4', '2020-04-18 13:16:24.289000', '2020-04-18 13:16:24.289000');
INSERT INTO `sys_equipment` VALUES (13, '1', '海康威视1-13', 'http://123.206.53.234/yctc/test1.mp4', '2020-04-18 13:16:24.289000', '2020-04-18 13:16:24.289000');
INSERT INTO `sys_equipment` VALUES (14, '1', '海康威视1-14', 'http://123.206.53.234/yctc/test1.mp4', '2020-04-18 13:16:24.289000', '2020-04-18 13:16:24.289000');
INSERT INTO `sys_equipment` VALUES (15, '1', '海康威视1-15', 'http://123.206.53.234/yctc/test1.mp4', '2020-04-18 13:16:24.289000', '2020-04-18 13:16:24.289000');
INSERT INTO `sys_equipment` VALUES (16, '1', '海康威视1-16', 'http://123.206.53.234/yctc/test1.mp4', '2020-04-18 13:16:24.289000', '2020-04-18 13:16:24.289000');
INSERT INTO `sys_equipment` VALUES (17, '1', '海康威视1-17', 'http://123.206.53.234/yctc/test1.mp4', '2020-04-18 13:16:24.289000', '2020-04-18 13:16:24.289000');
INSERT INTO `sys_equipment` VALUES (18, '1', '海康威视1-18', 'http://123.206.53.234/yctc/test1.mp4', '2020-04-18 13:16:24.289000', '2020-04-18 13:16:24.289000');
INSERT INTO `sys_equipment` VALUES (19, '1', '海康威视1-19', 'http://123.206.53.234/yctc/test1.mp4', '2020-04-18 13:16:24.289000', '2020-04-18 13:16:24.289000');
INSERT INTO `sys_equipment` VALUES (20, '2', '海康威视2-1', 'http://123.206.53.234/yctc/%E7%90%83%E6%9C%BA%E7%AE%A1%E7%90%86.mp4', '2020-04-18 13:17:43.000000', '2020-04-18 13:17:46.000000');

-- ----------------------------
-- Table structure for sys_file_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_info`;
CREATE TABLE `sys_file_info`  (
  `file_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `file_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '文件名称',
  `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '文件路径',
  PRIMARY KEY (`file_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_file_info
-- ----------------------------
INSERT INTO `sys_file_info` VALUES (3, '小黄人', '/profile/upload/2020/04/15/df072e8bbc87f777ee6149bd18fc74e4.jpg');

-- ----------------------------
-- Table structure for sys_infost
-- ----------------------------
DROP TABLE IF EXISTS `sys_infost`;
CREATE TABLE `sys_infost`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '学生编号',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户编号',
  `academy_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '学院编号',
  `class_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '班级编号',
  `number` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学号/工号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `type` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '用户类别',
  `sex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `id_card_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `mail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人脸照片',
  `face_token` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人脸标识',
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 164 CHARACTER SET = big5 COLLATE = big5_chinese_ci COMMENT = '学生/老师档案表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_infost
-- ----------------------------
INSERT INTO `sys_infost` VALUES (1, 1, 1, 1, '1812630715', '王小明', 0, '0', '320586199901011112', '17788888888', '1527215026@qq.com', 'https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1554820249936&amp;di=8871a4e90aed756b0179b2b241a5c2bc&amp;imgtype=0&amp;src=http%3A%2F%2Fimg.cwq.com%2F201612%2F1482144508944947.jpeg', 'sa65d6as53ds2a32', '2019-01-21 18:52:54.000000', '2020-04-18 13:53:00.999115');
INSERT INTO `sys_infost` VALUES (2, 2, 1, 1, '1812630901', '陈丹青', 0, '0', '320586199901011113', '17788888888', '1812630901@qq.com', 'http://123.206.53.234/yctc/1812630901.jpg', 'b99004ab1f39797cee47b46830540d03', '2019-01-25 13:37:29.000000', '2020-04-18 13:49:34.462056');
INSERT INTO `sys_infost` VALUES (3, 3, 1, 1, '1812630902', '蔡天新', 0, '0', '320586199901011114', '17788888888', '1812630902@qq.com', 'http://123.206.53.234/yctc/1812630902.jpg', '94945f66815c26a30f04781294f2664f', '2019-01-25 13:37:29.000000', '2020-04-18 13:49:34.605455');
INSERT INTO `sys_infost` VALUES (4, 4, 1, 1, '1812630904', '郭震海', 0, '0', '320586199901011115', '17788888888', '1812630904@qq.com', 'http://123.206.53.234/yctc/1812630904.jpg', 'a5ac00c998132d3397c96838b0e536a4', '2019-01-25 13:37:30.000000', '2020-04-18 13:49:34.748063');
INSERT INTO `sys_infost` VALUES (5, 5, 1, 1, '1812630905', '程鹤麟', 0, '0', '320586199901011116', '17788888888', '1812630905@qq.com', 'http://123.206.53.234/yctc/1812630905.jpg', 'fecf36ef587329c122dbcd59ea8d7679', '2019-01-25 13:37:30.000000', '2020-04-18 13:49:34.898212');
INSERT INTO `sys_infost` VALUES (6, 6, 1, 1, '1812630906', '何亚娟', 0, '1', '320586199901011117', '17788888888', '1812630906@qq.com', 'http://123.206.53.234/yctc/1812630906.jpg', '3a0bddf4fb415256344df4e2a4203cbe', '2019-01-25 13:37:30.000000', '2020-04-18 13:49:35.044606');
INSERT INTO `sys_infost` VALUES (7, 7, 1, 1, '1812630907', '杜平让', 0, '1', '320586199901011118', '17788888888', '1812630907@qq.com', 'http://123.206.53.234/yctc/1812630907.jpg', '64ba393ee94b1c7779ef8be56dedf2ca', '2019-01-25 13:37:30.000000', '2020-04-18 13:49:35.189027');
INSERT INTO `sys_infost` VALUES (8, 8, 1, 1, '1812630908', '崔卫平', 0, '1', '320586199901011119', '17788888888', '1812630908@qq.com', 'http://123.206.53.234/yctc/1812630908.jpg', 'f46dbfe1e255c6ac0bce8146638875c0', '2019-01-25 13:37:30.000000', '2020-04-18 13:49:35.334375');
INSERT INTO `sys_infost` VALUES (9, 9, 1, 1, '1812630909', '程一身', 0, '1', '320586199901011120', '17788888888', '1812630909@qq.com', 'http://123.206.53.234/yctc/1812630909.jpg', '95677fd03a94963e917645819a700df2', '2019-01-25 13:37:30.000000', '2020-04-18 13:49:35.477798');
INSERT INTO `sys_infost` VALUES (10, 10, 1, 1, '1812630910', '高建华', 0, '1', '320586199901011121', '17788888888', '1812630910@qq.com', 'http://123.206.53.234/yctc/1812630910.jpg', '271218d7cd58589a1510efe7eb1e4554', '2019-01-25 13:38:49.000000', '2020-04-18 13:49:35.624167');
INSERT INTO `sys_infost` VALUES (11, 11, 1, 2, '1812630912', '金文明', 0, '1', '320586199901011122', '17788888888', '1812630912@qq.com', 'http://123.206.53.234/yctc/1812630912.jpg', '9431b8c45e1c3dd22527999581c920b0', '2019-01-25 13:38:49.000000', '2020-04-18 13:49:35.767584');
INSERT INTO `sys_infost` VALUES (12, 12, 1, 2, '1812630913', '葛剑', 0, '1', '320586199901011123', '17788888888', '1812630913@qq.com', 'http://123.206.53.234/yctc/1812630913.jpg', '57d70109c37a4d000fa97fec5ab6ce7d', '2019-01-25 13:38:49.000000', '2020-04-18 13:49:35.911026');
INSERT INTO `sys_infost` VALUES (13, 13, 1, 2, '1812630914', '刘继兴 ', 0, '1', '320586199901011124', '17788888888', '873731696@qq.com', 'http://123.206.53.234/yctc/1812630914.jpg', '870cbc966c0877f480f3770dad10ef87', '2019-01-25 13:38:49.000000', '2020-04-18 13:49:36.054383');
INSERT INTO `sys_infost` VALUES (14, 14, 1, 2, '1812630915', '江晓原', 0, '0', '320586199901011125', '17788888888', '1812630915@qq.com', 'http://123.206.53.234/yctc/1812630915.jpg', '95efa42b3d786ff6c19893d19af60cbb', '2019-01-25 13:38:49.000000', '2020-04-18 13:49:36.196831');
INSERT INTO `sys_infost` VALUES (15, 15, 1, 2, '1812630916', '路佳瑄', 0, '0', '320586199901011126', '17788888888', '1812630916@qq.com', 'http://123.206.53.234/yctc/1812630916.jpg', '9b1e71e3e91ec50c3a1479d88856c24e', '2019-01-25 13:38:49.000000', '2020-04-18 13:49:36.339240');
INSERT INTO `sys_infost` VALUES (16, 16, 1, 2, '1812630917', '高星', 0, '0', '320586199901011127', '17788888888', '1812630917@qq.com', 'http://123.206.53.234/yctc/1812630917.jpg', '7d2fcf0d7d983da1d1dda586352d3132', '2019-01-25 13:38:49.000000', '2020-04-18 13:49:36.481685');
INSERT INTO `sys_infost` VALUES (17, 17, 1, 2, '1812630918', '巩高峰', 0, '1', '320586199901011128', '17788888888', '1812630918@qq.com', 'http://123.206.53.234/yctc/1812630918.jpg', 'ba04ee5201d4d8d834c5f713432006c5', '2019-01-25 13:38:50.000000', '2020-04-18 14:16:22.194193');
INSERT INTO `sys_infost` VALUES (18, 18, 1, 2, '1812630919', '胡续冬', 0, '0', '320586199901011129', '17788888888', '1812630919@qq.com', 'http://123.206.53.234/yctc/1812630919.jpg', '05d5899a345ab1b323da70e36cfb9297', '2019-01-25 13:38:50.000000', '2020-04-18 13:49:36.769479');
INSERT INTO `sys_infost` VALUES (19, 19, 1, 2, '1812630920', '李碧华', 0, '0', '320586199901011130', '17788888888', '1812630920@qq.com', 'http://123.206.53.234/yctc/1812630920.jpg', 'a245bc2ac26ed94fa85cc4185748be20', '2019-01-25 13:38:50.000000', '2020-04-18 13:49:36.911933');
INSERT INTO `sys_infost` VALUES (20, 20, 1, 2, '1812630921', '冯志丹', 0, '0', '320586199901011131', '17788888888', '1812630921@qq.com', 'http://123.206.53.234/yctc/1812630921.jpg', 'f4b657a27b12a6ef6ffe323d708af84d', '2019-01-25 13:38:50.000000', '2020-04-18 13:49:37.055580');
INSERT INTO `sys_infost` VALUES (21, 21, 1, 3, '1812630922', '傅光明', 0, '0', '320586199901011132', '17788888888', '1812630922@qq.com', 'http://123.206.53.234/yctc/1812630922.jpg', '202d5526387715feb729d7e1155ca72f', '2019-01-25 13:38:50.000000', '2020-04-18 13:49:37.199165');
INSERT INTO `sys_infost` VALUES (22, 22, 1, 3, '1812630923', '李银河', 0, '1', '320586199901011133', '17788888888', '1812630923@qq.com', 'http://123.206.53.234/yctc/1812630923.jpg', '1ed8835863ffbdedf3b7ddc9336fee63', '2019-01-25 13:38:50.000000', '2020-04-18 14:16:17.095657');
INSERT INTO `sys_infost` VALUES (23, 23, 1, 3, '1812630924', '陈众议', 0, '0', '320586199901011134', '17788888888', '1812630924@qq.com', 'http://123.206.53.234/yctc/1812630924.jpg', 'd63843d9d0ecc28e480c710846993c8e', '2019-01-25 13:38:50.000000', '2020-04-18 13:49:37.487920');
INSERT INTO `sys_infost` VALUES (24, 24, 1, 3, '1812630925', '刘墉', 0, '0', '320586199901011135', '17788888888', '1812630925@qq.com', 'http://123.206.53.234/yctc/1812630925.jpg', 'b11a8406ad32630ff48080c99ecf4cfb', '2019-01-25 13:38:50.000000', '2020-04-18 13:49:37.630006');
INSERT INTO `sys_infost` VALUES (25, 25, 1, 3, '1812630928', '韩雨山', 0, '0', '320586199901011136', '17788888888', '1812630928@qq.com', 'http://123.206.53.234/yctc/1812630928.jpg', '017c8dfa56b645f3b8209250bc151bff', '2019-01-25 13:38:51.000000', '2020-04-18 13:49:37.773817');
INSERT INTO `sys_infost` VALUES (26, 26, 1, 3, '1812630930', '韩松落', 0, '0', '320586199901011137', '17788888888', '1812630930@qq.com', 'http://123.206.53.234/yctc/1812630930.jpg', 'fa3780e224f4712d0ae1a7939bb5b4f3', '2019-01-25 13:38:51.000000', '2020-04-18 13:49:37.917189');
INSERT INTO `sys_infost` VALUES (27, 27, 1, 3, '1812630933', '恭小兵', 0, '0', '320586199901011138', '17788888888', '1812630933@qq.com', 'http://123.206.53.234/yctc/1812630933.jpg', 'f6dbaa1cdb3eca9fde3b9efced58a8e3', '2019-01-25 13:38:51.000000', '2020-04-18 13:49:38.061660');
INSERT INTO `sys_infost` VALUES (28, 28, 1, 3, '1812630934', '关凌', 0, '0', '320586199901011139', '17788888888', '1812630934@qq.com', 'http://123.206.53.234/yctc/1812630934.jpg', 'fb083493e4ab96f725feb434c89f11f0', '2019-01-25 13:38:51.000000', '2020-04-18 13:49:38.214887');
INSERT INTO `sys_infost` VALUES (29, 29, 1, 3, '1812630935', '高远', 0, '0', '320586199901011140', '17788888888', '1812630935@qq.com', 'http://123.206.53.234/yctc/1812630935.jpg', 'c14cfbbe34c456de49a3a350273fa802', '2019-01-25 13:38:51.000000', '2020-04-18 13:49:38.357311');
INSERT INTO `sys_infost` VALUES (31, 31, 1, 0, '10001', '张大锤', 1, '0', '320586199901011141', '17788888888', '10000@qq.com', 'https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1554820249936&amp;di=8871a4e90aed756b0179b2b241a5c2bc&amp;imgtype=0&amp;src=http%3A%2F%2Fimg.cwq.com%2F201612%2F1482144508944947.jpeg', 'sa65d6as53ds2a32', '2019-02-02 00:00:00.000000', '2020-04-18 14:26:44.641934');
INSERT INTO `sys_infost` VALUES (32, 32, 1, 0, '10003', '王小明', 1, '0', '320586199901011142', '17788888888', '10001@qq.com', 'https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1554820249936&amp;di=8871a4e90aed756b0179b2b241a5c2bc&amp;imgtype=0&amp;src=http%3A%2F%2Fimg.cwq.com%2F201612%2F1482144508944947.jpeg', 'sa65d6as53ds2a32', '2019-10-29 22:13:10.000000', '2020-04-18 14:26:44.967041');
INSERT INTO `sys_infost` VALUES (33, 33, 1, 0, '10002', '王小芳', 1, '1', '320586199901011143', '17788888888', '10002@qq.com', 'https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1554820249936&amp;di=8871a4e90aed756b0179b2b241a5c2bc&amp;imgtype=0&amp;src=http%3A%2F%2Fimg.cwq.com%2F201612%2F1482144508944947.jpeg', 'sa65d6as53ds2a32', '2019-02-02 00:00:00.000000', '2020-04-18 14:26:45.343748');
INSERT INTO `sys_infost` VALUES (34, 34, 1, 0, '10004', '冯小红', 1, '1', '320586199901011144', '17788888888', '10004@qq.com', 'https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1554820249936&amp;di=8871a4e90aed756b0179b2b241a5c2bc&amp;imgtype=0&amp;src=http%3A%2F%2Fimg.cwq.com%2F201612%2F1482144508944947.jpeg', 'sa65d6as53ds2a32', '2019-02-02 00:00:00.000000', '2020-04-18 14:26:45.756128');
INSERT INTO `sys_infost` VALUES (35, 35, 1, 0, '10005', '梁用心', 1, '1', '320586199901011145', '17788888888', '10005@qq.com', 'https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1554820249936&amp;di=8871a4e90aed756b0179b2b241a5c2bc&amp;imgtype=0&amp;src=http%3A%2F%2Fimg.cwq.com%2F201612%2F1482144508944947.jpeg', 'sa65d6as53ds2a32', '2019-02-02 00:00:00.000000', '2020-04-18 14:26:46.207156');
INSERT INTO `sys_infost` VALUES (36, 36, 1, 0, '10006', '汪展均', 1, '0', '32058619990101114101', '17788888888', '100060@qq.com', 'https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1554820249936&amp;di=8871a4e90aed756b0179b2b241a5c2bc&amp;imgtype=0&amp;src=http%3A%2F%2Fimg.cwq.com%2F201612%2F1482144508944947.jpeg', 'sa65d6as53ds2a32', '2020-04-18 14:01:13.075000', '2020-04-18 14:26:46.415380');
INSERT INTO `sys_infost` VALUES (37, 37, 1, 0, '10007', '温柏斐', 1, '0', '32058619990101114111', '17788888889', '100061@qq.com', 'https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1554820249936&amp;di=8871a4e90aed756b0179b2b241a5c2bc&amp;imgtype=0&amp;src=http%3A%2F%2Fimg.cwq.com%2F201612%2F1482144508944947.jpeg', 'sa65d6as53ds2a32', '2020-04-18 14:01:13.075000', '2020-04-18 14:26:47.459219');
INSERT INTO `sys_infost` VALUES (38, 38, 1, 0, '10008', '顾靖喜', 1, '1', '32058619990101114121', '17788888890', '100062@qq.com', 'https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1554820249936&amp;di=8871a4e90aed756b0179b2b241a5c2bc&amp;imgtype=0&amp;src=http%3A%2F%2Fimg.cwq.com%2F201612%2F1482144508944947.jpeg', 'sa65d6as53ds2a32', '2020-04-18 14:01:13.075000', '2020-04-18 14:26:48.171352');
INSERT INTO `sys_infost` VALUES (39, 39, 1, 0, '10009', '汪聪涛', 1, '1', '32058619990101114131', '17788888891', '100063@qq.com', 'https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1554820249936&amp;di=8871a4e90aed756b0179b2b241a5c2bc&amp;imgtype=0&amp;src=http%3A%2F%2Fimg.cwq.com%2F201612%2F1482144508944947.jpeg', 'sa65d6as53ds2a32', '2020-04-18 14:01:13.075000', '2020-04-18 14:26:48.491530');
INSERT INTO `sys_infost` VALUES (40, 40, 1, 0, '10010', '梅远威', 1, '0', '32058619990101114141', '17788888892', '100064@qq.com', 'https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1554820249936&amp;di=8871a4e90aed756b0179b2b241a5c2bc&amp;imgtype=0&amp;src=http%3A%2F%2Fimg.cwq.com%2F201612%2F1482144508944947.jpeg', 'sa65d6as53ds2a32', '2020-04-18 14:01:13.075000', '2020-04-18 14:26:49.404442');
INSERT INTO `sys_infost` VALUES (41, 41, 1, 0, '10011', '苏航书', 1, '0', '32058619990101114151', '17788888893', '100065@qq.com', 'https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1554820249936&amp;di=8871a4e90aed756b0179b2b241a5c2bc&amp;imgtype=0&amp;src=http%3A%2F%2Fimg.cwq.com%2F201612%2F1482144508944947.jpeg', 'sa65d6as53ds2a32', '2020-04-18 14:01:13.075000', '2020-04-18 14:26:49.952649');
INSERT INTO `sys_infost` VALUES (42, 42, 1, 0, '10012', '温伟瀚', 1, '1', '32058619990101114161', '17788888894', '100066@qq.com', 'https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1554820249936&amp;di=8871a4e90aed756b0179b2b241a5c2bc&amp;imgtype=0&amp;src=http%3A%2F%2Fimg.cwq.com%2F201612%2F1482144508944947.jpeg', 'sa65d6as53ds2a32', '2020-04-18 14:01:13.075000', '2020-04-18 14:26:50.210384');
INSERT INTO `sys_infost` VALUES (43, 43, 1, 0, '10013', '温俊岳', 1, '1', '32058619990101114171', '17788888895', '100067@qq.com', 'https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1554820249936&amp;di=8871a4e90aed756b0179b2b241a5c2bc&amp;imgtype=0&amp;src=http%3A%2F%2Fimg.cwq.com%2F201612%2F1482144508944947.jpeg', 'sa65d6as53ds2a32', '2020-04-18 14:01:13.075000', '2020-04-18 14:26:50.517648');
INSERT INTO `sys_infost` VALUES (44, 44, 1, 0, '10014', '耿威阳', 1, '0', '32058619990101114181', '17788888896', '100068@qq.com', 'https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1554820249936&amp;di=8871a4e90aed756b0179b2b241a5c2bc&amp;imgtype=0&amp;src=http%3A%2F%2Fimg.cwq.com%2F201612%2F1482144508944947.jpeg', 'sa65d6as53ds2a32', '2020-04-18 14:01:13.075000', '2020-04-18 14:26:51.214549');
INSERT INTO `sys_infost` VALUES (45, 45, 1, 0, '10015', '梅勇钧', 1, '1', '32058619990101114191', '17788888897', '100069@qq.com', 'https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1554820249936&amp;di=8871a4e90aed756b0179b2b241a5c2bc&amp;imgtype=0&amp;src=http%3A%2F%2Fimg.cwq.com%2F201612%2F1482144508944947.jpeg', 'sa65d6as53ds2a32', '2020-04-18 14:01:13.075000', '2020-04-18 14:26:51.396900');
INSERT INTO `sys_infost` VALUES (46, 46, 1, 0, '10016', '秦琛培', 1, '1', '320586199901011141101', '17788888898', '1000610@qq.com', 'https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1554820249936&amp;di=8871a4e90aed756b0179b2b241a5c2bc&amp;imgtype=0&amp;src=http%3A%2F%2Fimg.cwq.com%2F201612%2F1482144508944947.jpeg', 'sa65d6as53ds2a32', '2020-04-18 14:01:13.075000', '2020-04-18 14:26:52.669687');
INSERT INTO `sys_infost` VALUES (47, 47, 1, 0, '10017', '陶毅凌', 1, '1', '320586199901011141111', '17788888899', '1000611@qq.com', 'https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1554820249936&amp;di=8871a4e90aed756b0179b2b241a5c2bc&amp;imgtype=0&amp;src=http%3A%2F%2Fimg.cwq.com%2F201612%2F1482144508944947.jpeg', 'sa65d6as53ds2a32', '2020-04-18 14:01:13.075000', '2020-04-18 14:26:52.939736');
INSERT INTO `sys_infost` VALUES (48, 48, 1, 0, '10018', '梅欢洋', 1, '1', '320586199901011141121', '17788888900', '1000612@qq.com', 'https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1554820249936&amp;di=8871a4e90aed756b0179b2b241a5c2bc&amp;imgtype=0&amp;src=http%3A%2F%2Fimg.cwq.com%2F201612%2F1482144508944947.jpeg', 'sa65d6as53ds2a32', '2020-04-18 14:01:13.075000', '2020-04-18 14:26:53.491876');
INSERT INTO `sys_infost` VALUES (49, 49, 1, 0, '10019', '秦凯聪', 1, '1', '320586199901011141131', '17788888901', '1000613@qq.com', 'https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1554820249936&amp;di=8871a4e90aed756b0179b2b241a5c2bc&amp;imgtype=0&amp;src=http%3A%2F%2Fimg.cwq.com%2F201612%2F1482144508944947.jpeg', 'sa65d6as53ds2a32', '2020-04-18 14:01:13.075000', '2020-04-18 14:26:53.973602');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '2', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2020-04-03 14:44:16', '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：4毫秒', '0', '', '2020-03-16 20:01:37');
INSERT INTO `sys_job_log` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：14毫秒', '0', '', '2020-03-16 20:01:42');
INSERT INTO `sys_job_log` VALUES (3, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：101998毫秒', '0', '', '2020-03-16 20:05:20');
INSERT INTO `sys_job_log` VALUES (4, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：4毫秒', '0', '', '2020-03-16 20:06:40');
INSERT INTO `sys_job_log` VALUES (5, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2020-03-16 20:06:53');
INSERT INTO `sys_job_log` VALUES (6, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2020-03-16 20:07:13');
INSERT INTO `sys_job_log` VALUES (7, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2020-03-16 20:07:22');
INSERT INTO `sys_job_log` VALUES (8, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：1毫秒', '0', '', '2020-03-16 20:07:28');
INSERT INTO `sys_job_log` VALUES (9, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：1毫秒', '0', '', '2020-03-16 20:07:31');
INSERT INTO `sys_job_log` VALUES (10, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：1毫秒', '0', '', '2020-03-16 20:07:33');
INSERT INTO `sys_job_log` VALUES (11, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：1毫秒', '0', '', '2020-03-16 20:07:38');
INSERT INTO `sys_job_log` VALUES (12, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2020-03-16 20:08:59');
INSERT INTO `sys_job_log` VALUES (13, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：6毫秒', '0', '', '2020-03-16 20:10:23');
INSERT INTO `sys_job_log` VALUES (14, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2020-03-16 20:10:26');
INSERT INTO `sys_job_log` VALUES (15, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2020-03-16 20:10:29');
INSERT INTO `sys_job_log` VALUES (16, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：8毫秒', '0', '', '2020-04-03 14:18:41');
INSERT INTO `sys_job_log` VALUES (17, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：5毫秒', '0', '', '2020-04-03 14:18:51');
INSERT INTO `sys_job_log` VALUES (18, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2020-04-03 14:19:01');
INSERT INTO `sys_job_log` VALUES (19, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2020-04-03 14:19:13');
INSERT INTO `sys_job_log` VALUES (20, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：5毫秒', '0', '', '2020-04-03 14:19:21');
INSERT INTO `sys_job_log` VALUES (21, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：12毫秒', '0', '', '2020-04-03 14:19:31');
INSERT INTO `sys_job_log` VALUES (22, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2020-04-03 14:19:41');
INSERT INTO `sys_job_log` VALUES (23, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：6毫秒', '0', '', '2020-04-03 14:44:01');
INSERT INTO `sys_job_log` VALUES (24, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：1毫秒', '0', '', '2020-04-03 14:44:11');

-- ----------------------------
-- Table structure for sys_knowledge
-- ----------------------------
DROP TABLE IF EXISTS `sys_knowledge`;
CREATE TABLE `sys_knowledge`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '知识点描述',
  `length` double(20, 1) UNSIGNED NULL DEFAULT NULL COMMENT '预计时长',
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_content`(`content`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 380 CHARACTER SET = big5 COLLATE = big5_chinese_ci COMMENT = '知识点概览' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_knowledge
-- ----------------------------
INSERT INTO `sys_knowledge` VALUES (2, '数据结构语句', 7.0, '2019-05-25 22:46:50.000000', '2019-10-30 22:32:51.000000');
INSERT INTO `sys_knowledge` VALUES (3, '循环控制', 5.0, '2019-05-25 22:46:50.000000', '2019-10-30 22:33:02.000000');
INSERT INTO `sys_knowledge` VALUES (4, '一维数组', 7.5, '2019-07-06 16:50:13.000000', '2019-10-30 22:33:10.000000');
INSERT INTO `sys_knowledge` VALUES (5, '二维数组', 5.0, '2019-10-30 13:42:43.000000', '2019-10-30 22:33:22.000000');
INSERT INTO `sys_knowledge` VALUES (6, '字符数组与字符串', 4.0, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (7, '关系运算符', 3.0, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (8, '逻辑运算符', 3.0, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (9, 'if语句', 4.0, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (10, 'for语句', 3.0, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (11, 'while语句', 3.0, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (12, 'do-while语句', 4.0, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (13, 'break语句', 2.0, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (14, 'switch....case语句', 4.0, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (331, '曲面方程与空间曲线方程的概念', 8.0, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (332, '平面的点法式方程', 8.5, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (333, '平面的一般方程', 5.5, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (334, '平面的夹角', 4.0, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (335, '空间直线的一般方程', 6.0, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (336, '空间直角坐标系', 6.5, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (342, '向量及其线性运算', 7.5, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (343, '数量积', 4.0, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (344, '向量积', 5.0, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (345, '混合积', 6.0, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (356, '知识点1', 5.0, '2019-10-31 17:03:05.000000', '2019-10-31 17:03:05.000000');
INSERT INTO `sys_knowledge` VALUES (357, '计算机网络在信息时代中的作用', 12.0, '2019-11-01 12:50:01.000000', '2019-11-01 12:50:01.000000');
INSERT INTO `sys_knowledge` VALUES (358, '网络的网络', 2.0, '2019-11-01 12:50:19.000000', '2019-11-01 12:50:19.000000');
INSERT INTO `sys_knowledge` VALUES (359, '互联网基础结构发展的三个阶段', 3.0, '2019-11-01 12:50:40.000000', '2019-11-01 12:50:40.000000');
INSERT INTO `sys_knowledge` VALUES (360, '亲子关系及其对儿童品德发展的影响', 4.0, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (361, '恒河猴实验\r\n', 5.0, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (362, '亲子关系有利于儿童品德的发展', 4.0, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (363, '家庭', 2.0, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (364, '亲子关系的相关因素对小学生品德发展的影响', 3.0, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (365, '父母教养方式对儿童问题行为的影响', 7.0, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (366, '亲子关系影响小学生品德养成的机制', 4.0, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (367, '家长在家中也可以运用替代性强化的原理', 3.0, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (368, '认同作用', 5.0, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (369, '借助亲子教育促进儿童品德发展', 3.0, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (370, '亲职教育内容主要有五个方面', 5.0, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (371, '学校亲情教育', 4.0, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (372, '适合儿童品德发展的家校合作方法', 5.0, NULL, NULL);
INSERT INTO `sys_knowledge` VALUES (373, '互联网基础结构发展的三个阶段', 5.0, '2019-11-02 14:14:53.000000', '2019-11-02 14:14:53.000000');
INSERT INTO `sys_knowledge` VALUES (374, '曲面方程与空间曲线方程的概念', 8.0, '2019-11-03 14:35:29.000000', '2019-11-03 14:35:29.000000');
INSERT INTO `sys_knowledge` VALUES (375, '曲面方程与空间曲线方程的概念', 5.0, '2019-11-03 16:48:04.000000', '2019-11-03 16:48:04.000000');
INSERT INTO `sys_knowledge` VALUES (378, '平面的点法式方程', 8.5, '2019-11-03 16:54:00.000000', '2019-11-03 16:54:00.000000');
INSERT INTO `sys_knowledge` VALUES (379, '计算机网络在信息时代中的作用', 12.0, '2019-11-03 19:09:57.000000', '2019-11-03 19:09:57.000000');

-- ----------------------------
-- Table structure for sys_lesson
-- ----------------------------
DROP TABLE IF EXISTS `sys_lesson`;
CREATE TABLE `sys_lesson`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `course_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '课程编号',
  `number` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '课时',
  `classroom_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '教室',
  `begin` datetime(6) NULL DEFAULT NULL COMMENT '上课时间',
  `end` datetime(6) NULL DEFAULT NULL COMMENT '下课时间',
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 652 CHARACTER SET = big5 COLLATE = big5_chinese_ci COMMENT = '课时信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_lesson
-- ----------------------------
INSERT INTO `sys_lesson` VALUES (582, 1, 2, 1, '2019-03-10 08:00:00.000000', '2019-03-10 09:40:00.000000', '2020-04-18 00:48:13.504000', '2020-04-18 00:48:13.504000');
INSERT INTO `sys_lesson` VALUES (583, 2, 2, 2, '2019-03-11 08:00:00.000000', '2019-03-11 09:40:00.000000', '2020-04-18 00:48:13.504000', '2020-04-18 00:48:13.504000');
INSERT INTO `sys_lesson` VALUES (584, 3, 2, 3, '2019-03-12 08:00:00.000000', '2019-03-12 09:40:00.000000', '2020-04-18 00:48:13.504000', '2020-04-18 00:48:13.504000');
INSERT INTO `sys_lesson` VALUES (585, 4, 2, 4, '2019-03-13 08:00:00.000000', '2019-03-13 09:40:00.000000', '2020-04-18 00:48:13.504000', '2020-04-18 00:48:13.504000');
INSERT INTO `sys_lesson` VALUES (586, 5, 2, 5, '2019-03-14 08:00:00.000000', '2019-03-14 09:40:00.000000', '2020-04-18 00:48:13.504000', '2020-04-18 00:48:13.504000');
INSERT INTO `sys_lesson` VALUES (587, 6, 2, 6, '2019-03-15 08:00:00.000000', '2019-03-15 09:40:00.000000', '2020-04-18 00:48:13.504000', '2020-04-18 00:48:13.504000');
INSERT INTO `sys_lesson` VALUES (588, 7, 2, 7, '2019-03-16 08:00:00.000000', '2019-03-16 09:40:00.000000', '2020-04-18 00:48:13.504000', '2020-04-18 00:48:13.504000');
INSERT INTO `sys_lesson` VALUES (589, 8, 2, 8, '2018-10-17 08:00:00.000000', '2018-10-17 09:40:00.000000', '2020-04-18 00:48:13.504000', '2020-04-18 00:48:13.504000');
INSERT INTO `sys_lesson` VALUES (590, 9, 2, 9, '2018-10-18 08:00:00.000000', '2018-10-18 09:40:00.000000', '2020-04-18 00:48:13.504000', '2020-04-18 00:48:13.504000');
INSERT INTO `sys_lesson` VALUES (591, 10, 2, 10, '2018-10-19 08:00:00.000000', '2018-10-19 09:40:00.000000', '2020-04-18 00:48:13.504000', '2020-04-18 00:48:13.504000');
INSERT INTO `sys_lesson` VALUES (592, 11, 2, 11, '2018-10-20 08:00:00.000000', '2018-10-20 09:40:00.000000', '2020-04-18 00:48:13.504000', '2020-04-18 00:48:13.504000');
INSERT INTO `sys_lesson` VALUES (593, 12, 2, 12, '2018-10-21 08:00:00.000000', '2018-10-21 09:40:00.000000', '2020-04-18 00:48:13.504000', '2020-04-18 00:48:13.504000');
INSERT INTO `sys_lesson` VALUES (594, 13, 2, 13, '2018-10-22 08:00:00.000000', '2018-10-22 09:40:00.000000', '2020-04-18 00:48:13.504000', '2020-04-18 00:48:13.504000');
INSERT INTO `sys_lesson` VALUES (595, 14, 2, 14, '2018-10-23 08:00:00.000000', '2018-10-23 09:40:00.000000', '2020-04-18 00:48:13.504000', '2020-04-18 00:48:13.504000');
INSERT INTO `sys_lesson` VALUES (596, 15, 2, 1, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', '2020-04-18 00:49:44.106000', '2020-04-18 00:49:44.106000');
INSERT INTO `sys_lesson` VALUES (597, 16, 2, 2, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', '2020-04-18 00:49:44.106000', '2020-04-18 00:49:44.106000');
INSERT INTO `sys_lesson` VALUES (598, 17, 2, 3, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', '2020-04-18 00:49:44.106000', '2020-04-18 00:49:44.106000');
INSERT INTO `sys_lesson` VALUES (599, 18, 2, 4, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', '2020-04-18 00:49:44.106000', '2020-04-18 00:49:44.106000');
INSERT INTO `sys_lesson` VALUES (600, 19, 2, 5, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', '2020-04-18 00:49:44.106000', '2020-04-18 00:49:44.106000');
INSERT INTO `sys_lesson` VALUES (601, 20, 2, 6, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', '2020-04-18 00:49:44.106000', '2020-04-18 00:49:44.106000');
INSERT INTO `sys_lesson` VALUES (602, 21, 2, 7, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', '2020-04-18 00:49:44.106000', '2020-04-18 00:49:44.106000');
INSERT INTO `sys_lesson` VALUES (603, 22, 2, 8, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', '2020-04-18 00:49:44.106000', '2020-04-18 00:49:44.106000');
INSERT INTO `sys_lesson` VALUES (604, 23, 2, 9, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', '2020-04-18 00:49:44.106000', '2020-04-18 00:49:44.106000');
INSERT INTO `sys_lesson` VALUES (605, 24, 2, 10, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', '2020-04-18 00:49:44.106000', '2020-04-18 00:49:44.106000');
INSERT INTO `sys_lesson` VALUES (606, 25, 2, 11, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', '2020-04-18 00:49:44.106000', '2020-04-18 00:49:44.106000');
INSERT INTO `sys_lesson` VALUES (607, 26, 2, 12, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', '2020-04-18 00:49:44.106000', '2020-04-18 00:49:44.106000');
INSERT INTO `sys_lesson` VALUES (608, 27, 2, 13, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', '2020-04-18 00:49:44.106000', '2020-04-18 00:49:44.106000');
INSERT INTO `sys_lesson` VALUES (609, 28, 2, 14, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', '2020-04-18 00:49:44.106000', '2020-04-18 00:49:44.106000');
INSERT INTO `sys_lesson` VALUES (610, 29, 2, 1, '2019-05-10 08:00:00.000000', '2019-05-10 09:40:00.000000', '2020-04-18 00:50:33.759000', '2020-04-18 00:50:33.759000');
INSERT INTO `sys_lesson` VALUES (611, 30, 2, 2, '2019-05-11 08:00:00.000000', '2019-05-11 09:40:00.000000', '2020-04-18 00:50:33.759000', '2020-04-18 00:50:33.759000');
INSERT INTO `sys_lesson` VALUES (612, 31, 2, 3, '2019-05-12 08:00:00.000000', '2019-05-12 09:40:00.000000', '2020-04-18 00:50:33.759000', '2020-04-18 00:50:33.759000');
INSERT INTO `sys_lesson` VALUES (613, 32, 2, 4, '2019-05-13 08:00:00.000000', '2019-05-13 09:40:00.000000', '2020-04-18 00:50:33.759000', '2020-04-18 00:50:33.759000');
INSERT INTO `sys_lesson` VALUES (614, 33, 2, 5, '2019-05-14 08:00:00.000000', '2019-05-14 09:40:00.000000', '2020-04-18 00:50:33.759000', '2020-04-18 00:50:33.759000');
INSERT INTO `sys_lesson` VALUES (615, 34, 2, 6, '2019-05-15 08:00:00.000000', '2019-05-15 09:40:00.000000', '2020-04-18 00:50:33.759000', '2020-04-18 00:50:33.759000');
INSERT INTO `sys_lesson` VALUES (616, 35, 2, 7, '2019-05-16 08:00:00.000000', '2019-05-16 09:40:00.000000', '2020-04-18 00:50:33.759000', '2020-04-18 00:50:33.759000');
INSERT INTO `sys_lesson` VALUES (617, 36, 2, 8, '2018-12-17 08:00:00.000000', '2018-12-17 09:40:00.000000', '2020-04-18 00:50:33.759000', '2020-04-18 00:50:33.759000');
INSERT INTO `sys_lesson` VALUES (618, 37, 2, 9, '2018-12-18 08:00:00.000000', '2018-12-18 09:40:00.000000', '2020-04-18 00:50:33.759000', '2020-04-18 00:50:33.759000');
INSERT INTO `sys_lesson` VALUES (619, 38, 2, 10, '2018-12-19 08:00:00.000000', '2018-12-19 09:40:00.000000', '2020-04-18 00:50:33.759000', '2020-04-18 00:50:33.759000');
INSERT INTO `sys_lesson` VALUES (620, 39, 2, 11, '2018-12-20 08:00:00.000000', '2018-12-20 09:40:00.000000', '2020-04-18 00:50:33.759000', '2020-04-18 00:50:33.759000');
INSERT INTO `sys_lesson` VALUES (621, 40, 2, 12, '2018-12-21 08:00:00.000000', '2018-12-21 09:40:00.000000', '2020-04-18 00:50:33.759000', '2020-04-18 00:50:33.759000');
INSERT INTO `sys_lesson` VALUES (622, 41, 2, 13, '2018-12-22 08:00:00.000000', '2018-12-22 09:40:00.000000', '2020-04-18 00:50:33.759000', '2020-04-18 00:50:33.759000');
INSERT INTO `sys_lesson` VALUES (623, 42, 2, 14, '2018-12-23 08:00:00.000000', '2018-12-23 09:40:00.000000', '2020-04-18 00:50:33.759000', '2020-04-18 00:50:33.759000');
INSERT INTO `sys_lesson` VALUES (624, 29, 2, NULL, '2019-05-10 08:00:00.000000', '2019-05-10 09:40:00.000000', '2020-04-18 19:49:57.719000', '2020-04-18 19:49:57.719000');
INSERT INTO `sys_lesson` VALUES (625, 30, 2, NULL, '2019-05-11 08:00:00.000000', '2019-05-11 09:40:00.000000', '2020-04-18 19:49:57.719000', '2020-04-18 19:49:57.719000');
INSERT INTO `sys_lesson` VALUES (626, 31, 2, NULL, '2019-05-12 08:00:00.000000', '2019-05-12 09:40:00.000000', '2020-04-18 19:49:57.719000', '2020-04-18 19:49:57.719000');
INSERT INTO `sys_lesson` VALUES (627, 32, 2, NULL, '2019-05-13 08:00:00.000000', '2019-05-13 09:40:00.000000', '2020-04-18 19:49:57.719000', '2020-04-18 19:49:57.719000');
INSERT INTO `sys_lesson` VALUES (628, 33, 2, NULL, '2019-05-14 08:00:00.000000', '2019-05-14 09:40:00.000000', '2020-04-18 19:49:57.719000', '2020-04-18 19:49:57.719000');
INSERT INTO `sys_lesson` VALUES (629, 34, 2, NULL, '2019-05-15 08:00:00.000000', '2019-05-15 09:40:00.000000', '2020-04-18 19:49:57.719000', '2020-04-18 19:49:57.719000');
INSERT INTO `sys_lesson` VALUES (630, 35, 2, NULL, '2019-05-16 08:00:00.000000', '2019-05-16 09:40:00.000000', '2020-04-18 19:49:57.719000', '2020-04-18 19:49:57.719000');
INSERT INTO `sys_lesson` VALUES (631, 36, 2, NULL, '2018-12-17 08:00:00.000000', '2018-12-17 09:40:00.000000', '2020-04-18 19:49:57.719000', '2020-04-18 19:49:57.719000');
INSERT INTO `sys_lesson` VALUES (632, 37, 2, NULL, '2018-12-18 08:00:00.000000', '2018-12-18 09:40:00.000000', '2020-04-18 19:49:57.719000', '2020-04-18 19:49:57.719000');
INSERT INTO `sys_lesson` VALUES (633, 38, 2, NULL, '2018-12-19 08:00:00.000000', '2018-12-19 09:40:00.000000', '2020-04-18 19:49:57.719000', '2020-04-18 19:49:57.719000');
INSERT INTO `sys_lesson` VALUES (634, 39, 2, NULL, '2018-12-20 08:00:00.000000', '2018-12-20 09:40:00.000000', '2020-04-18 19:49:57.719000', '2020-04-18 19:49:57.719000');
INSERT INTO `sys_lesson` VALUES (635, 40, 2, NULL, '2018-12-21 08:00:00.000000', '2018-12-21 09:40:00.000000', '2020-04-18 19:49:57.719000', '2020-04-18 19:49:57.719000');
INSERT INTO `sys_lesson` VALUES (636, 41, 2, NULL, '2018-12-22 08:00:00.000000', '2018-12-22 09:40:00.000000', '2020-04-18 19:49:57.719000', '2020-04-18 19:49:57.719000');
INSERT INTO `sys_lesson` VALUES (637, 42, 2, NULL, '2018-12-23 08:00:00.000000', '2018-12-23 09:40:00.000000', '2020-04-18 19:49:57.719000', '2020-04-18 19:49:57.719000');
INSERT INTO `sys_lesson` VALUES (638, 29, 2, NULL, '2019-05-10 08:00:00.000000', '2019-05-10 09:40:00.000000', '2020-04-18 19:52:32.505000', '2020-04-18 19:52:32.505000');
INSERT INTO `sys_lesson` VALUES (639, 30, 2, NULL, '2019-05-11 08:00:00.000000', '2019-05-11 09:40:00.000000', '2020-04-18 19:52:32.505000', '2020-04-18 19:52:32.505000');
INSERT INTO `sys_lesson` VALUES (640, 31, 2, NULL, '2019-05-12 08:00:00.000000', '2019-05-12 09:40:00.000000', '2020-04-18 19:52:32.505000', '2020-04-18 19:52:32.505000');
INSERT INTO `sys_lesson` VALUES (641, 32, 2, NULL, '2019-05-13 08:00:00.000000', '2019-05-13 09:40:00.000000', '2020-04-18 19:52:32.505000', '2020-04-18 19:52:32.505000');
INSERT INTO `sys_lesson` VALUES (642, 33, 2, NULL, '2019-05-14 08:00:00.000000', '2019-05-14 09:40:00.000000', '2020-04-18 19:52:32.505000', '2020-04-18 19:52:32.505000');
INSERT INTO `sys_lesson` VALUES (643, 34, 2, NULL, '2019-05-15 08:00:00.000000', '2019-05-15 09:40:00.000000', '2020-04-18 19:52:32.505000', '2020-04-18 19:52:32.505000');
INSERT INTO `sys_lesson` VALUES (644, 35, 2, NULL, '2019-05-16 08:00:00.000000', '2019-05-16 09:40:00.000000', '2020-04-18 19:52:32.505000', '2020-04-18 19:52:32.505000');
INSERT INTO `sys_lesson` VALUES (645, 36, 2, NULL, '2018-12-17 08:00:00.000000', '2018-12-17 09:40:00.000000', '2020-04-18 19:52:32.505000', '2020-04-18 19:52:32.505000');
INSERT INTO `sys_lesson` VALUES (646, 37, 2, NULL, '2018-12-18 08:00:00.000000', '2018-12-18 09:40:00.000000', '2020-04-18 19:52:32.505000', '2020-04-18 19:52:32.505000');
INSERT INTO `sys_lesson` VALUES (647, 38, 2, NULL, '2018-12-19 08:00:00.000000', '2018-12-19 09:40:00.000000', '2020-04-18 19:52:32.505000', '2020-04-18 19:52:32.505000');
INSERT INTO `sys_lesson` VALUES (648, 39, 2, NULL, '2018-12-20 08:00:00.000000', '2018-12-20 09:40:00.000000', '2020-04-18 19:52:32.505000', '2020-04-18 19:52:32.505000');
INSERT INTO `sys_lesson` VALUES (649, 40, 2, NULL, '2018-12-21 08:00:00.000000', '2018-12-21 09:40:00.000000', '2020-04-18 19:52:32.505000', '2020-04-18 19:52:32.505000');
INSERT INTO `sys_lesson` VALUES (650, 41, 2, NULL, '2018-12-22 08:00:00.000000', '2018-12-22 09:40:00.000000', '2020-04-18 19:52:32.505000', '2020-04-18 19:52:32.505000');
INSERT INTO `sys_lesson` VALUES (651, 42, 2, NULL, '2018-12-23 08:00:00.000000', '2018-12-23 09:40:00.000000', '2020-04-18 19:52:32.505000', '2020-04-18 19:52:32.505000');

-- ----------------------------
-- Table structure for sys_lesson_know
-- ----------------------------
DROP TABLE IF EXISTS `sys_lesson_know`;
CREATE TABLE `sys_lesson_know`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lesson_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '课程编号',
  `knowledge_id` bigint(20) NULL DEFAULT NULL COMMENT '知识点编号',
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = big5 COLLATE = big5_chinese_ci COMMENT = '课时知识点信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_lesson_know
-- ----------------------------
INSERT INTO `sys_lesson_know` VALUES (2, 582, 360, '2019-05-25 15:44:00.000000', '2020-04-18 18:23:09.494630');
INSERT INTO `sys_lesson_know` VALUES (3, 33, 361, '2019-05-25 15:44:00.000000', '2019-05-25 15:46:16.000000');
INSERT INTO `sys_lesson_know` VALUES (4, 33, 362, '2019-05-25 15:44:00.000000', '2019-05-25 15:46:16.000000');
INSERT INTO `sys_lesson_know` VALUES (5, 33, 363, '2019-07-06 16:50:14.000000', '2019-07-06 16:50:14.000000');
INSERT INTO `sys_lesson_know` VALUES (6, 33, 364, '2019-10-30 13:42:43.000000', '2019-10-30 13:42:43.000000');
INSERT INTO `sys_lesson_know` VALUES (7, 33, 365, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (8, 33, 366, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (9, 33, 367, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (10, 33, 368, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (11, 33, 369, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (12, 33, 370, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (13, 33, 371, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (14, 33, 372, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (24, 34, 336, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (25, 1, 3, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (26, 1, 4, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (27, 1, 5, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (28, 1, 6, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (29, 34, 342, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (30, 34, 343, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (31, 34, 344, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (32, 34, 345, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (33, 34, 346, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (34, 34, 331, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (35, 34, 332, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (36, 34, 333, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (37, 34, 334, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (38, 34, 335, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (76, 1, 2, '2019-10-31 17:03:05.000000', '2019-10-31 17:03:05.000000');
INSERT INTO `sys_lesson_know` VALUES (77, 34, 357, '2019-11-01 12:50:01.000000', '2019-11-01 12:50:01.000000');
INSERT INTO `sys_lesson_know` VALUES (78, 34, 358, '2019-11-01 12:50:19.000000', '2019-11-01 12:50:19.000000');
INSERT INTO `sys_lesson_know` VALUES (79, 34, 359, '2019-11-01 12:50:40.000000', '2019-11-01 12:50:40.000000');
INSERT INTO `sys_lesson_know` VALUES (80, 1, 7, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (81, 1, 8, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (82, 1, 9, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (83, 1, 10, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (84, 1, 11, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (85, 1, 12, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (86, 1, 13, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (87, 1, 14, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (88, NULL, NULL, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (89, 253, 373, '2019-11-02 14:14:53.000000', '2019-11-02 14:14:53.000000');
INSERT INTO `sys_lesson_know` VALUES (90, 257, 331, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (91, 257, 332, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (92, 257, 333, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (93, 257, 334, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (94, 257, 335, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (95, 257, 336, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (96, 257, 342, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (97, 257, 343, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (98, NULL, NULL, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (99, 261, 373, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (100, 261, 374, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (102, 261, 375, '2019-11-03 16:48:04.000000', '2019-11-03 16:48:04.000000');
INSERT INTO `sys_lesson_know` VALUES (105, 261, 378, '2019-11-03 16:54:00.000000', '2019-11-03 16:54:00.000000');
INSERT INTO `sys_lesson_know` VALUES (106, 253, 379, '2019-11-03 19:09:57.000000', '2019-11-03 19:09:57.000000');
INSERT INTO `sys_lesson_know` VALUES (112, 253, 357, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (113, 253, 358, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (114, 253, 359, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (115, NULL, NULL, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (116, NULL, NULL, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (117, NULL, NULL, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (118, NULL, NULL, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (119, NULL, NULL, NULL, NULL);
INSERT INTO `sys_lesson_know` VALUES (120, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_lesson_tea
-- ----------------------------
DROP TABLE IF EXISTS `sys_lesson_tea`;
CREATE TABLE `sys_lesson_tea`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '老师编号',
  `lesson_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '授课课时编号',
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 154 CHARACTER SET = big5 COLLATE = big5_chinese_ci COMMENT = '老师授课信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_lesson_tea
-- ----------------------------
INSERT INTO `sys_lesson_tea` VALUES (111, 31, 582, '2020-04-18 14:53:34.355000', '2020-04-18 14:53:34.355000');
INSERT INTO `sys_lesson_tea` VALUES (112, 31, 596, '2020-04-18 14:53:34.355000', '2020-04-18 14:53:34.355000');
INSERT INTO `sys_lesson_tea` VALUES (113, 31, 610, '2020-04-18 14:53:34.355000', '2020-04-18 14:53:34.355000');
INSERT INTO `sys_lesson_tea` VALUES (114, 32, 583, '2020-04-18 15:08:49.569000', '2020-04-18 15:08:49.569000');
INSERT INTO `sys_lesson_tea` VALUES (115, 32, 597, '2020-04-18 15:08:49.569000', '2020-04-18 15:08:49.569000');
INSERT INTO `sys_lesson_tea` VALUES (116, 32, 611, '2020-04-18 15:08:49.569000', '2020-04-18 15:08:49.569000');
INSERT INTO `sys_lesson_tea` VALUES (117, 33, 584, '2020-04-18 15:10:42.999000', '2020-04-18 15:10:42.999000');
INSERT INTO `sys_lesson_tea` VALUES (118, 33, 598, '2020-04-18 15:10:42.999000', '2020-04-18 15:10:42.999000');
INSERT INTO `sys_lesson_tea` VALUES (119, 33, 612, '2020-04-18 15:10:42.999000', '2020-04-18 15:10:42.999000');
INSERT INTO `sys_lesson_tea` VALUES (120, 34, 585, '2020-04-18 15:11:29.971000', '2020-04-18 15:11:29.971000');
INSERT INTO `sys_lesson_tea` VALUES (121, 34, 599, '2020-04-18 15:11:29.971000', '2020-04-18 15:11:29.971000');
INSERT INTO `sys_lesson_tea` VALUES (122, 34, 613, '2020-04-18 15:11:29.971000', '2020-04-18 15:11:29.971000');
INSERT INTO `sys_lesson_tea` VALUES (123, 35, 586, '2020-04-18 15:12:04.992000', '2020-04-18 15:12:04.992000');
INSERT INTO `sys_lesson_tea` VALUES (124, 35, 600, '2020-04-18 15:12:04.992000', '2020-04-18 15:12:04.992000');
INSERT INTO `sys_lesson_tea` VALUES (125, 35, 614, '2020-04-18 15:12:04.992000', '2020-04-18 15:12:04.992000');
INSERT INTO `sys_lesson_tea` VALUES (126, 36, 587, '2020-04-18 15:12:49.196000', '2020-04-18 15:12:49.196000');
INSERT INTO `sys_lesson_tea` VALUES (127, 36, 601, '2020-04-18 15:12:49.196000', '2020-04-18 15:12:49.196000');
INSERT INTO `sys_lesson_tea` VALUES (128, 36, 615, '2020-04-18 15:12:49.196000', '2020-04-18 15:12:49.196000');
INSERT INTO `sys_lesson_tea` VALUES (129, 37, 588, '2020-04-18 15:13:21.792000', '2020-04-18 15:13:21.792000');
INSERT INTO `sys_lesson_tea` VALUES (130, 37, 602, '2020-04-18 15:13:21.792000', '2020-04-18 15:13:21.792000');
INSERT INTO `sys_lesson_tea` VALUES (131, 37, 616, '2020-04-18 15:13:21.792000', '2020-04-18 15:13:21.792000');
INSERT INTO `sys_lesson_tea` VALUES (132, 38, 589, '2020-04-18 15:13:52.411000', '2020-04-18 15:13:52.411000');
INSERT INTO `sys_lesson_tea` VALUES (133, 38, 603, '2020-04-18 15:13:52.411000', '2020-04-18 15:13:52.411000');
INSERT INTO `sys_lesson_tea` VALUES (134, 38, 617, '2020-04-18 15:13:52.411000', '2020-04-18 15:13:52.411000');
INSERT INTO `sys_lesson_tea` VALUES (135, 39, 590, '2020-04-18 15:14:26.078000', '2020-04-18 15:14:26.078000');
INSERT INTO `sys_lesson_tea` VALUES (136, 39, 604, '2020-04-18 15:14:26.078000', '2020-04-18 15:14:26.078000');
INSERT INTO `sys_lesson_tea` VALUES (137, 39, 618, '2020-04-18 15:14:26.078000', '2020-04-18 15:14:26.078000');
INSERT INTO `sys_lesson_tea` VALUES (138, 40, 591, '2020-04-18 15:14:56.927000', '2020-04-18 15:14:56.927000');
INSERT INTO `sys_lesson_tea` VALUES (139, 40, 605, '2020-04-18 15:14:56.927000', '2020-04-18 15:14:56.927000');
INSERT INTO `sys_lesson_tea` VALUES (140, 40, 619, '2020-04-18 15:14:56.927000', '2020-04-18 15:14:56.927000');
INSERT INTO `sys_lesson_tea` VALUES (141, 41, 592, '2020-04-18 15:15:40.836000', '2020-04-18 15:15:40.836000');
INSERT INTO `sys_lesson_tea` VALUES (142, 41, 606, '2020-04-18 15:15:40.836000', '2020-04-18 15:15:40.836000');
INSERT INTO `sys_lesson_tea` VALUES (143, 41, 620, '2020-04-18 15:15:40.836000', '2020-04-18 15:15:40.836000');
INSERT INTO `sys_lesson_tea` VALUES (144, 42, 593, '2020-04-18 15:16:21.106000', '2020-04-18 15:16:21.106000');
INSERT INTO `sys_lesson_tea` VALUES (145, 42, 607, '2020-04-18 15:16:21.106000', '2020-04-18 15:16:21.106000');
INSERT INTO `sys_lesson_tea` VALUES (146, 42, 621, '2020-04-18 15:16:21.106000', '2020-04-18 15:16:21.106000');
INSERT INTO `sys_lesson_tea` VALUES (147, 43, 594, '2020-04-18 15:16:58.757000', '2020-04-18 15:16:58.757000');
INSERT INTO `sys_lesson_tea` VALUES (148, 43, 608, '2020-04-18 15:16:58.757000', '2020-04-18 15:16:58.757000');
INSERT INTO `sys_lesson_tea` VALUES (149, 43, 622, '2020-04-18 15:16:58.757000', '2020-04-18 15:16:58.757000');
INSERT INTO `sys_lesson_tea` VALUES (150, 44, 595, '2020-04-18 15:17:43.351000', '2020-04-18 15:17:43.351000');
INSERT INTO `sys_lesson_tea` VALUES (151, 44, 609, '2020-04-18 15:17:43.351000', '2020-04-18 15:17:43.351000');
INSERT INTO `sys_lesson_tea` VALUES (152, 44, 623, '2020-04-18 15:17:43.351000', '2020-04-18 15:17:43.351000');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 309 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-16 16:28:52');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-16 16:42:42');
INSERT INTO `sys_logininfor` VALUES (102, 'luna', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-03-16 16:42:50');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-03-16 16:42:56');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2020-03-16 16:43:01');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-03-16 16:43:05');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误2次', '2020-03-16 16:43:09');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-03-16 16:43:18');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误3次', '2020-03-16 16:43:21');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-16 16:44:16');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-16 16:44:54');
INSERT INTO `sys_logininfor` VALUES (111, 'ry', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-16 16:45:06');
INSERT INTO `sys_logininfor` VALUES (112, 'ry', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-16 16:45:23');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-16 16:45:30');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-16 16:52:29');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-16 16:57:25');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-17 22:31:13');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-17 22:32:07');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-17 22:32:10');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-03-17 22:33:24');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-17 22:33:28');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-17 22:33:47');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-03-17 22:33:57');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-17 22:34:04');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-17 22:34:33');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-03-17 22:34:38');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-03-17 22:34:43');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-17 22:34:46');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-17 22:34:56');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-17 22:35:00');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-17 23:12:12');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-17 23:12:57');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-17 23:13:10');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-17 23:13:41');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-17 23:13:48');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-17 23:14:54');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-17 23:15:39');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-17 23:17:09');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-03-17 23:17:16');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-17 23:17:20');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-17 23:18:07');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-17 23:50:49');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-19 22:45:00');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-03-19 22:46:15');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-19 22:47:50');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-19 22:54:09');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-19 22:54:36');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-20 18:30:14');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-20 18:30:38');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-20 19:00:29');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-20 19:01:35');
INSERT INTO `sys_logininfor` VALUES (151, 'ry', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-20 19:01:58');
INSERT INTO `sys_logininfor` VALUES (152, 'ry', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-20 19:26:14');
INSERT INTO `sys_logininfor` VALUES (153, 'luna', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-03-20 19:26:21');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-20 19:26:27');
INSERT INTO `sys_logininfor` VALUES (155, 'luna', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-03-20 20:34:24');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-20 20:36:11');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-20 20:37:04');
INSERT INTO `sys_logininfor` VALUES (158, 'ry', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-20 20:37:09');
INSERT INTO `sys_logininfor` VALUES (159, 'ry', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-20 20:37:24');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-20 20:37:27');
INSERT INTO `sys_logininfor` VALUES (161, 'ry', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-20 20:40:21');
INSERT INTO `sys_logininfor` VALUES (162, 'ry', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-20 20:41:22');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-20 20:41:25');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-20 21:01:35');
INSERT INTO `sys_logininfor` VALUES (165, 'ry', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-20 21:01:38');
INSERT INTO `sys_logininfor` VALUES (166, 'ry', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-20 21:03:14');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-20 21:03:19');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-20 21:04:38');
INSERT INTO `sys_logininfor` VALUES (169, 'ry', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-20 21:04:41');
INSERT INTO `sys_logininfor` VALUES (170, 'ry', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-20 21:12:27');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-20 21:12:30');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-20 21:13:04');
INSERT INTO `sys_logininfor` VALUES (173, 'ry', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-20 21:13:06');
INSERT INTO `sys_logininfor` VALUES (174, 'ry', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-20 21:13:46');
INSERT INTO `sys_logininfor` VALUES (175, 'ry', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-20 21:18:03');
INSERT INTO `sys_logininfor` VALUES (176, 'ry', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-20 21:19:53');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-20 23:18:20');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-20 23:21:42');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-21 21:24:26');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-22 10:18:21');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-22 10:54:14');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '192.168.1.103', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-03-22 12:35:11');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '192.168.1.103', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-03-22 13:08:48');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-24 21:20:11');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-24 21:23:42');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-24 22:47:25');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-24 23:01:26');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-25 00:11:49');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-25 00:41:54');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-25 13:24:29');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-25 14:11:45');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-25 15:03:31');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-25 18:00:51');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-25 18:13:15');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-25 19:27:43');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-25 22:10:43');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-25 22:36:49');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2020-03-26 00:39:18');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-26 00:39:22');
INSERT INTO `sys_logininfor` VALUES (200, '15696756588', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '对不起，您的账号已被删除', '2020-03-26 11:32:43');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2020-03-26 11:32:46');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-26 11:32:50');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2020-03-26 11:58:21');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-26 11:58:26');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-26 12:10:34');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-26 13:04:14');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-26 14:29:19');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-26 21:35:32');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-26 21:43:44');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-26 21:48:17');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-26 21:51:41');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-26 21:57:07');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-27 12:27:49');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-27 14:45:05');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-03-27 15:12:34');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-27 15:12:39');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-03-27 15:28:10');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-27 15:28:13');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-27 15:59:05');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-27 16:11:09');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-03-27 16:25:50');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-03-27 16:25:53');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-03-27 16:25:58');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-27 16:26:02');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-27 21:34:15');
INSERT INTO `sys_logininfor` VALUES (226, '张三', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '注册成功', '2020-03-27 21:52:25');
INSERT INTO `sys_logininfor` VALUES (227, '李四', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '注册成功', '2020-03-27 21:52:48');
INSERT INTO `sys_logininfor` VALUES (228, 'luna', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-03-27 22:23:02');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-27 22:23:10');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-28 00:14:39');
INSERT INTO `sys_logininfor` VALUES (231, '小明', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '注册成功', '2020-03-28 00:21:59');
INSERT INTO `sys_logininfor` VALUES (232, '小明', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-28 00:22:09');
INSERT INTO `sys_logininfor` VALUES (233, '小明', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-28 00:22:33');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-28 10:03:47');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-28 10:07:10');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-28 10:07:14');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-28 10:37:28');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-28 10:45:04');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-28 10:45:55');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-28 10:57:34');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-28 12:58:51');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-28 12:58:53');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '192.168.1.103', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-03-28 15:29:06');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-28 15:56:52');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-29 10:44:08');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-29 10:58:21');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-29 17:06:26');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-30 01:02:05');
INSERT INTO `sys_logininfor` VALUES (249, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-03-31 13:30:37');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-03-31 13:35:36');
INSERT INTO `sys_logininfor` VALUES (251, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-02 13:02:00');
INSERT INTO `sys_logininfor` VALUES (252, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-02 16:06:19');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-03 14:15:30');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-04 10:28:34');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-04 11:57:09');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2020-04-04 12:00:49');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', 'Password Error2', '2020-04-04 12:00:58');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', 'Password Error3', '2020-04-04 12:01:05');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', 'login successfully', '2020-04-04 12:01:14');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-04 12:04:33');
INSERT INTO `sys_logininfor` VALUES (261, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-04-04 12:05:09');
INSERT INTO `sys_logininfor` VALUES (262, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', 'login successfully', '2020-04-04 12:05:21');
INSERT INTO `sys_logininfor` VALUES (263, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-04-04 12:07:52');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-04 12:07:55');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-04-04 12:08:01');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-05 23:35:20');
INSERT INTO `sys_logininfor` VALUES (267, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-04-05 23:48:03');
INSERT INTO `sys_logininfor` VALUES (268, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-05 23:48:06');
INSERT INTO `sys_logininfor` VALUES (269, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-04-05 23:52:16');
INSERT INTO `sys_logininfor` VALUES (270, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-05 23:52:18');
INSERT INTO `sys_logininfor` VALUES (271, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-04-05 23:53:17');
INSERT INTO `sys_logininfor` VALUES (272, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-05 23:53:20');
INSERT INTO `sys_logininfor` VALUES (273, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-04-06 00:11:24');
INSERT INTO `sys_logininfor` VALUES (274, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-06 00:11:27');
INSERT INTO `sys_logininfor` VALUES (275, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-04-06 00:23:43');
INSERT INTO `sys_logininfor` VALUES (276, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-06 00:23:48');
INSERT INTO `sys_logininfor` VALUES (277, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-13 21:39:20');
INSERT INTO `sys_logininfor` VALUES (278, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-15 21:54:29');
INSERT INTO `sys_logininfor` VALUES (279, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-15 22:09:17');
INSERT INTO `sys_logininfor` VALUES (280, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-16 00:03:41');
INSERT INTO `sys_logininfor` VALUES (281, '10001', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-04-16 20:57:32');
INSERT INTO `sys_logininfor` VALUES (282, '10003', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-04-16 20:57:42');
INSERT INTO `sys_logininfor` VALUES (283, '10003', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-04-16 20:57:43');
INSERT INTO `sys_logininfor` VALUES (284, '10003', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-04-16 21:01:44');
INSERT INTO `sys_logininfor` VALUES (285, '10003', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-04-16 21:01:52');
INSERT INTO `sys_logininfor` VALUES (286, '10003', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-04-16 21:01:54');
INSERT INTO `sys_logininfor` VALUES (287, '10003', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-04-16 21:01:55');
INSERT INTO `sys_logininfor` VALUES (288, '10003', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-04-16 21:01:56');
INSERT INTO `sys_logininfor` VALUES (289, '10003', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-04-16 21:12:10');
INSERT INTO `sys_logininfor` VALUES (290, '10003', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-04-16 21:12:13');
INSERT INTO `sys_logininfor` VALUES (291, '00001', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-04-16 21:20:42');
INSERT INTO `sys_logininfor` VALUES (292, '10003', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-04-16 21:21:54');
INSERT INTO `sys_logininfor` VALUES (293, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-16 21:23:46');
INSERT INTO `sys_logininfor` VALUES (294, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-18 16:59:39');
INSERT INTO `sys_logininfor` VALUES (295, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-18 18:41:16');
INSERT INTO `sys_logininfor` VALUES (296, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-18 19:46:08');
INSERT INTO `sys_logininfor` VALUES (297, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-18 19:51:09');
INSERT INTO `sys_logininfor` VALUES (298, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2020-04-18 19:54:01');
INSERT INTO `sys_logininfor` VALUES (299, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-18 19:54:04');
INSERT INTO `sys_logininfor` VALUES (300, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-18 20:00:28');
INSERT INTO `sys_logininfor` VALUES (301, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-18 20:03:02');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '192.168.1.100', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2020-04-18 20:05:16');
INSERT INTO `sys_logininfor` VALUES (303, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-18 20:13:06');
INSERT INTO `sys_logininfor` VALUES (304, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-18 20:17:12');
INSERT INTO `sys_logininfor` VALUES (305, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-04-18 20:18:31');
INSERT INTO `sys_logininfor` VALUES (306, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-18 20:18:36');
INSERT INTO `sys_logininfor` VALUES (307, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-04-18 20:38:02');
INSERT INTO `sys_logininfor` VALUES (308, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-04-18 20:38:05');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2119 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', '', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', '', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门及专业管理', 2021, 4, '/system/dept', 'menuItem', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-15 22:24:15', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 2021, 5, '/system/post', 'menuItem', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-15 22:25:14', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 3, '/monitor/server', '', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '表单构建', 3, 1, '/tool/build', '', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (114, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (115, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', 'monitor:logininfor:unlock', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 114, 1, '#', '', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 114, 2, '#', '', 'F', '0', 'tool:gen:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 114, 3, '#', '', 'F', '0', 'tool:gen:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 114, 4, '#', '', 'F', '0', 'tool:gen:preview', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 114, 5, '#', '', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2000, '文件信息', 3, 1, '/system/info', '', 'C', '0', 'system:info:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '文件信息菜单');
INSERT INTO `sys_menu` VALUES (2001, '文件信息查询', 2000, 1, '#', '', 'F', '0', 'system:info:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2002, '文件信息新增', 2000, 2, '#', '', 'F', '0', 'system:info:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2003, '文件信息修改', 2000, 3, '#', '', 'F', '0', 'system:info:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2004, '文件信息删除', 2000, 4, '#', '', 'F', '0', 'system:info:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2005, '文件信息导出', 2000, 5, '#', '', 'F', '0', 'system:info:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2006, '菜品信息', 2012, 1, '/system/cuisine', 'menuItem', 'C', '0', 'system:cuisine:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-03-28 21:09:35', '菜品信息菜单');
INSERT INTO `sys_menu` VALUES (2007, '菜品信息查询', 2006, 1, '#', '', 'F', '0', 'system:cuisine:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2008, '菜品信息新增', 2006, 2, '#', '', 'F', '0', 'system:cuisine:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2009, '菜品信息修改', 2006, 3, '#', '', 'F', '0', 'system:cuisine:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2010, '菜品信息删除', 2006, 4, '#', '', 'F', '0', 'system:cuisine:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2011, '菜品信息导出', 2006, 5, '#', '', 'F', '0', 'system:cuisine:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2012, '测试页面', 0, 5, '#', 'menuItem', 'M', '0', '', 'fa fa-bars', 'admin', '2020-03-28 21:08:28', 'admin', '2020-03-28 21:09:01', '');
INSERT INTO `sys_menu` VALUES (2013, 'Thymeleaf测试', 2012, 1, '/demo', 'menuItem', 'C', '0', '', 'fa fa-book', 'admin', '2020-03-28 21:10:53', 'admin', '2020-03-29 11:23:35', '');
INSERT INTO `sys_menu` VALUES (2014, 'crud用户新增', 2013, 1, '#', 'menuItem', 'F', '0', NULL, '#', 'admin', '2020-03-29 11:57:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '学院管理', 2021, 1, '/system/academy', 'menuItem', 'C', '0', 'system:academy:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-16 00:05:45', '学院菜单');
INSERT INTO `sys_menu` VALUES (2016, '学院查询', 2015, 1, '#', '', 'F', '0', 'system:academy:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2017, '学院新增', 2015, 2, '#', '', 'F', '0', 'system:academy:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2018, '学院修改', 2015, 3, '#', '', 'F', '0', 'system:academy:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2019, '学院删除', 2015, 4, '#', '', 'F', '0', 'system:academy:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2020, '学院导出', 2015, 5, '#', '', 'F', '0', 'system:academy:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2021, '教务管理', 0, 3, '#', 'menuItem', 'M', '0', NULL, 'fa fa-address-book-o', 'admin', '2020-04-15 22:23:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '教室管理', 2021, 1, '/system/classroom', 'menuItem', 'C', '0', 'system:classroom:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-16 00:05:35', '教室菜单');
INSERT INTO `sys_menu` VALUES (2023, '教室查询', 2022, 1, '#', '', 'F', '0', 'system:classroom:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2024, '教室新增', 2022, 2, '#', '', 'F', '0', 'system:classroom:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2025, '教室修改', 2022, 3, '#', '', 'F', '0', 'system:classroom:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2026, '教室删除', 2022, 4, '#', '', 'F', '0', 'system:classroom:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2027, '教室导出', 2022, 5, '#', '', 'F', '0', 'system:classroom:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2034, '班级信息', 2021, 1, '/system/classes', 'menuItem', 'C', '0', 'system:classes:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-16 19:33:10', '班级信息菜单');
INSERT INTO `sys_menu` VALUES (2035, '班级信息查询', 2034, 1, '#', '', 'F', '0', 'system:classes:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2036, '班级信息新增', 2034, 2, '#', '', 'F', '0', 'system:classes:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2037, '班级信息修改', 2034, 3, '#', '', 'F', '0', 'system:classes:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2038, '班级信息删除', 2034, 4, '#', '', 'F', '0', 'system:classes:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2039, '班级信息导出', 2034, 5, '#', '', 'F', '0', 'system:classes:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2040, '课程信息', 2021, 1, '/system/course', 'menuItem', 'C', '0', 'system:course:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-16 21:47:18', '课程信息菜单');
INSERT INTO `sys_menu` VALUES (2041, '课程信息查询', 2040, 1, '#', '', 'F', '0', 'system:course:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2042, '课程信息新增', 2040, 2, '#', '', 'F', '0', 'system:course:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2043, '课程信息修改', 2040, 3, '#', '', 'F', '0', 'system:course:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2044, '课程信息删除', 2040, 4, '#', '', 'F', '0', 'system:course:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2045, '课程信息导出', 2040, 5, '#', '', 'F', '0', 'system:course:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2046, '设备信息', 2021, 1, '/system/equipment', 'menuItem', 'C', '0', 'system:equipment:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-16 22:12:54', '设备信息菜单');
INSERT INTO `sys_menu` VALUES (2047, '设备信息查询', 2046, 1, '#', '', 'F', '0', 'system:equipment:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2048, '设备信息新增', 2046, 2, '#', '', 'F', '0', 'system:equipment:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2049, '设备信息修改', 2046, 3, '#', '', 'F', '0', 'system:equipment:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2050, '设备信息删除', 2046, 4, '#', '', 'F', '0', 'system:equipment:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2051, '设备信息导出', 2046, 5, '#', '', 'F', '0', 'system:equipment:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2052, '楼层信息', 2021, 1, '/system/floor', 'menuItem', 'C', '0', 'system:floor:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-16 22:12:39', '楼层信息菜单');
INSERT INTO `sys_menu` VALUES (2053, '楼层信息查询', 2052, 1, '#', '', 'F', '0', 'system:floor:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2054, '楼层信息新增', 2052, 2, '#', '', 'F', '0', 'system:floor:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2055, '楼层信息修改', 2052, 3, '#', '', 'F', '0', 'system:floor:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2056, '楼层信息删除', 2052, 4, '#', '', 'F', '0', 'system:floor:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2057, '楼层信息导出', 2052, 5, '#', '', 'F', '0', 'system:floor:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2058, '课时信息', 2021, 1, '/system/lesson', 'menuItem', 'C', '0', 'system:lesson:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-16 22:13:33', '课时信息菜单');
INSERT INTO `sys_menu` VALUES (2059, '课时信息查询', 2058, 1, '#', '', 'F', '0', 'system:lesson:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2060, '课时信息新增', 2058, 2, '#', '', 'F', '0', 'system:lesson:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2061, '课时信息修改', 2058, 3, '#', '', 'F', '0', 'system:lesson:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2062, '课时信息删除', 2058, 4, '#', '', 'F', '0', 'system:lesson:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2063, '课时信息导出', 2058, 5, '#', '', 'F', '0', 'system:lesson:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2064, '知识点概览', 2088, 1, '/system/knowledge', 'menuItem', 'C', '0', 'system:knowledge:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-17 10:24:49', '知识点概览菜单');
INSERT INTO `sys_menu` VALUES (2065, '知识点概览查询', 2064, 1, '#', '', 'F', '0', 'system:knowledge:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2066, '知识点概览新增', 2064, 2, '#', '', 'F', '0', 'system:knowledge:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2067, '知识点概览修改', 2064, 3, '#', '', 'F', '0', 'system:knowledge:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2068, '知识点概览删除', 2064, 4, '#', '', 'F', '0', 'system:knowledge:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2069, '知识点概览导出', 2064, 5, '#', '', 'F', '0', 'system:knowledge:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2070, '学生考勤点名汇总', 2088, 1, '/system/attendance', 'menuItem', 'C', '0', 'system:attendance:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-18 01:33:35', '学生考勤点名汇总菜单');
INSERT INTO `sys_menu` VALUES (2071, '学生考勤点名汇总查询', 2070, 1, '#', '', 'F', '0', 'system:attendance:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2072, '学生考勤点名汇总新增', 2070, 2, '#', '', 'F', '0', 'system:attendance:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2073, '学生考勤点名汇总修改', 2070, 3, '#', '', 'F', '0', 'system:attendance:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2074, '学生考勤点名汇总删除', 2070, 4, '#', '', 'F', '0', 'system:attendance:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2075, '学生考勤点名汇总导出', 2070, 5, '#', '', 'F', '0', 'system:attendance:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2076, '学生上课评分汇总', 2088, 1, '/system/score', 'menuItem', 'C', '0', 'system:score:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-18 01:33:47', '学生上课评分汇总菜单');
INSERT INTO `sys_menu` VALUES (2077, '学生上课评分汇总查询', 2076, 1, '#', '', 'F', '0', 'system:score:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2078, '学生上课评分汇总新增', 2076, 2, '#', '', 'F', '0', 'system:score:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2079, '学生上课评分汇总修改', 2076, 3, '#', '', 'F', '0', 'system:score:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2080, '学生上课评分汇总删除', 2076, 4, '#', '', 'F', '0', 'system:score:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2081, '学生上课评分汇总导出', 2076, 5, '#', '', 'F', '0', 'system:score:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2082, '教室占用情况', 2021, 1, '/system/state', 'menuItem', 'C', '0', 'system:state:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-16 22:43:45', '教室占用情况菜单');
INSERT INTO `sys_menu` VALUES (2083, '教室占用情况查询', 2082, 1, '#', '', 'F', '0', 'system:state:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2084, '教室占用情况新增', 2082, 2, '#', '', 'F', '0', 'system:state:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2085, '教室占用情况修改', 2082, 3, '#', '', 'F', '0', 'system:state:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2086, '教室占用情况删除', 2082, 4, '#', '', 'F', '0', 'system:state:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2087, '教室占用情况导出', 2082, 5, '#', '', 'F', '0', 'system:state:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2088, '教学系统', 0, 5, '#', 'menuItem', 'M', '0', '', 'fa fa-feed', 'admin', '2020-04-17 10:24:09', 'admin', '2020-04-17 10:24:25', '');
INSERT INTO `sys_menu` VALUES (2089, '学生/老师档案', 2021, 1, '/system/infost', 'menuItem', 'C', '0', 'system:infost:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-17 18:37:46', '学生/老师档案菜单');
INSERT INTO `sys_menu` VALUES (2090, '学生/老师档案查询', 2089, 1, '#', '', 'F', '0', 'system:infost:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2091, '学生/老师档案新增', 2089, 2, '#', '', 'F', '0', 'system:infost:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2092, '学生/老师档案修改', 2089, 3, '#', '', 'F', '0', 'system:infost:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2093, '学生/老师档案删除', 2089, 4, '#', '', 'F', '0', 'system:infost:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2094, '学生/老师档案导出', 2089, 5, '#', '', 'F', '0', 'system:infost:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2095, '学生上课状态信息汇总', 2088, 1, '/system/courseState', 'menuItem', 'C', '0', 'system:courseState:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-17 18:37:59', '学生上课状态信息汇总菜单');
INSERT INTO `sys_menu` VALUES (2096, '学生上课状态信息汇总查询', 2095, 1, '#', '', 'F', '0', 'system:courseState:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2097, '学生上课状态信息汇总新增', 2095, 2, '#', '', 'F', '0', 'system:courseState:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2098, '学生上课状态信息汇总修改', 2095, 3, '#', '', 'F', '0', 'system:courseState:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2099, '学生上课状态信息汇总删除', 2095, 4, '#', '', 'F', '0', 'system:courseState:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2100, '学生上课状态信息汇总导出', 2095, 5, '#', '', 'F', '0', 'system:courseState:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2101, '学生课程信息', 2021, 1, '/system/stu', 'menuItem', 'C', '0', 'system:stu:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-18 16:44:16', '学生课程信息菜单');
INSERT INTO `sys_menu` VALUES (2102, '学生课程信息查询', 2101, 1, '#', '', 'F', '0', 'system:stu:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2103, '学生课程信息新增', 2101, 2, '#', '', 'F', '0', 'system:stu:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2104, '学生课程信息修改', 2101, 3, '#', '', 'F', '0', 'system:stu:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2105, '学生课程信息删除', 2101, 4, '#', '', 'F', '0', 'system:stu:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2106, '学生课程信息导出', 2101, 5, '#', '', 'F', '0', 'system:stu:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2107, '老师授课信息', 2021, 1, '/system/tea', 'menuItem', 'C', '0', 'system:tea:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-18 16:44:30', '老师授课信息菜单');
INSERT INTO `sys_menu` VALUES (2108, '老师授课信息查询', 2107, 1, '#', '', 'F', '0', 'system:tea:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2109, '老师授课信息新增', 2107, 2, '#', '', 'F', '0', 'system:tea:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2110, '老师授课信息修改', 2107, 3, '#', '', 'F', '0', 'system:tea:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2111, '老师授课信息删除', 2107, 4, '#', '', 'F', '0', 'system:tea:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2112, '老师授课信息导出', 2107, 5, '#', '', 'F', '0', 'system:tea:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2113, '课时知识点信息', 2021, 1, '/system/know', 'menuItem', 'C', '0', 'system:know:view', '/', 'admin', '2018-03-01 00:00:00', 'admin', '2020-04-18 18:09:57', '课时知识点信息菜单');
INSERT INTO `sys_menu` VALUES (2114, '课时知识点信息查询', 2113, 1, '#', '', 'F', '0', 'system:know:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2115, '课时知识点信息新增', 2113, 2, '#', '', 'F', '0', 'system:know:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2116, '课时知识点信息修改', 2113, 3, '#', '', 'F', '0', 'system:know:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2117, '课时知识点信息删除', 2113, 4, '#', '', 'F', '0', 'system:know:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2118, '课时知识点信息导出', 2113, 5, '#', '', 'F', '0', 'system:know:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-03 14:16:24', '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-03 14:16:37', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 525 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{ }', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 16:29:59');
INSERT INTO `sys_oper_log` VALUES (101, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\r\n  \"id\" : [ \"\" ],\r\n  \"userName\" : [ \"Luna\" ],\r\n  \"phonenumber\" : [ \"15696756582\" ],\r\n  \"email\" : [ \"15696756582@163.com\" ],\r\n  \"sex\" : [ \"0\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 16:30:18');
INSERT INTO `sys_oper_log` VALUES (102, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"1\" ],\r\n  \"configName\" : [ \"主框架页-默认皮肤样式名称1\" ],\r\n  \"configKey\" : [ \"sys.index.skinName\" ],\r\n  \"configValue\" : [ \"skin-blue\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\" ]\r\n}', 'null', 1, 'EL1007E: Property or field \'configId\' cannot be found on null', '2020-03-16 19:10:19');
INSERT INTO `sys_oper_log` VALUES (103, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"1\" ],\r\n  \"configName\" : [ \"主框架页-默认皮肤样式名称1\" ],\r\n  \"configKey\" : [ \"sys.index.skinName\" ],\r\n  \"configValue\" : [ \"skin-blue\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\" ]\r\n}', 'null', 1, 'com.ruoyi.system.domain.SysConfig cannot be cast to java.lang.Number', '2020-03-16 19:14:19');
INSERT INTO `sys_oper_log` VALUES (104, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"1\" ],\r\n  \"configName\" : [ \"主框架页-默认皮肤样式名称1\" ],\r\n  \"configKey\" : [ \"sys.index.skinName\" ],\r\n  \"configValue\" : [ \"skin-blue\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\" ]\r\n}', 'null', 1, 'com.ruoyi.system.domain.SysConfig cannot be cast to java.lang.Number', '2020-03-16 19:15:44');
INSERT INTO `sys_oper_log` VALUES (105, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"1\" ],\r\n  \"configName\" : [ \"主框架页-默认皮肤样式名称1\" ],\r\n  \"configKey\" : [ \"sys.index.skinName\" ],\r\n  \"configValue\" : [ \"skin-blue\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:17:04');
INSERT INTO `sys_oper_log` VALUES (106, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/add', '127.0.0.1', '内网IP', '{\r\n  \"configName\" : [ \"1\" ],\r\n  \"configKey\" : [ \"1\" ],\r\n  \"configValue\" : [ \"1\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"1\" ]\r\n}', 'null', 1, 'Null key returned for cache operation (maybe you are using named params on classes without debug info?) Builder[public int com.ruoyi.system.service.impl.SysConfigServiceImpl.insertConfig(com.ruoyi.system.domain.SysConfig)] caches=[sysConfig] | key=\'#config.configId\' | keyGenerator=\'\' | cacheManager=\'\' | cacheResolver=\'\' | condition=\'\' | unless=\'\' | sync=\'false\'', '2020-03-16 19:22:46');
INSERT INTO `sys_oper_log` VALUES (107, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"1\" ],\r\n  \"configName\" : [ \"主框架页-默认皮肤样式名称\" ],\r\n  \"configKey\" : [ \"sys.index.skinName\" ],\r\n  \"configValue\" : [ \"skin-blue\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:23:04');
INSERT INTO `sys_oper_log` VALUES (108, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/add', '127.0.0.1', '内网IP', '{\r\n  \"configName\" : [ \"11\" ],\r\n  \"configKey\" : [ \"11\" ],\r\n  \"configValue\" : [ \"11\" ],\r\n  \"configType\" : [ \"N\" ],\r\n  \"remark\" : [ \"11\" ]\r\n}', 'null', 1, 'Null key returned for cache operation (maybe you are using named params on classes without debug info?) Builder[public int com.ruoyi.system.service.impl.SysConfigServiceImpl.insertConfig(com.ruoyi.system.domain.SysConfig)] caches=[sysConfig] | key=\'#config.configId\' | keyGenerator=\'\' | cacheManager=\'\' | cacheResolver=\'\' | condition=\'\' | unless=\'\' | sync=\'false\'', '2020-03-16 19:23:38');
INSERT INTO `sys_oper_log` VALUES (109, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/add', '127.0.0.1', '内网IP', '{\r\n  \"configName\" : [ \"11\" ],\r\n  \"configKey\" : [ \"sys.index.skinName2\" ],\r\n  \"configValue\" : [ \"111\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', 'null', 1, 'Null key returned for cache operation (maybe you are using named params on classes without debug info?) Builder[public int com.ruoyi.system.service.impl.SysConfigServiceImpl.insertConfig(com.ruoyi.system.domain.SysConfig)] caches=[sysConfig] | key=\'#config.configId\' | keyGenerator=\'\' | cacheManager=\'\' | cacheResolver=\'\' | condition=\'\' | unless=\'\' | sync=\'false\'', '2020-03-16 19:25:38');
INSERT INTO `sys_oper_log` VALUES (110, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/add', '127.0.0.1', '内网IP', '{\r\n  \"configName\" : [ \"11\" ],\r\n  \"configKey\" : [ \"11\" ],\r\n  \"configValue\" : [ \"11\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:27:13');
INSERT INTO `sys_oper_log` VALUES (111, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"100\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:28:31');
INSERT INTO `sys_oper_log` VALUES (112, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/add', '127.0.0.1', '内网IP', '{\r\n  \"configName\" : [ \"1\" ],\r\n  \"configKey\" : [ \"1\" ],\r\n  \"configValue\" : [ \"1\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:28:40');
INSERT INTO `sys_oper_log` VALUES (113, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"101\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:29:27');
INSERT INTO `sys_oper_log` VALUES (114, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/add', '127.0.0.1', '内网IP', '{\r\n  \"configName\" : [ \"1\" ],\r\n  \"configKey\" : [ \"1\" ],\r\n  \"configValue\" : [ \"1\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:31:39');
INSERT INTO `sys_oper_log` VALUES (115, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"102\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:32:02');
INSERT INTO `sys_oper_log` VALUES (116, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/add', '127.0.0.1', '内网IP', '{\r\n  \"configName\" : [ \"1\" ],\r\n  \"configKey\" : [ \"1\" ],\r\n  \"configValue\" : [ \"1\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:33:40');
INSERT INTO `sys_oper_log` VALUES (117, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"103\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:33:46');
INSERT INTO `sys_oper_log` VALUES (118, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/add', '127.0.0.1', '内网IP', '{\r\n  \"configName\" : [ \"1\" ],\r\n  \"configKey\" : [ \"1\" ],\r\n  \"configValue\" : [ \"1\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:35:27');
INSERT INTO `sys_oper_log` VALUES (119, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"104\" ],\r\n  \"configName\" : [ \"1\" ],\r\n  \"configKey\" : [ \"1\" ],\r\n  \"configValue\" : [ \"1\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:35:34');
INSERT INTO `sys_oper_log` VALUES (120, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"104\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:35:39');
INSERT INTO `sys_oper_log` VALUES (121, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/add', '127.0.0.1', '内网IP', '{\r\n  \"configName\" : [ \"1\" ],\r\n  \"configKey\" : [ \"1\" ],\r\n  \"configValue\" : [ \"1\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:36:27');
INSERT INTO `sys_oper_log` VALUES (122, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"105\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:36:34');
INSERT INTO `sys_oper_log` VALUES (123, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/add', '127.0.0.1', '内网IP', '{\r\n  \"configName\" : [ \"1\" ],\r\n  \"configKey\" : [ \"1\" ],\r\n  \"configValue\" : [ \"1\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:36:51');
INSERT INTO `sys_oper_log` VALUES (124, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"106\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:37:08');
INSERT INTO `sys_oper_log` VALUES (125, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/add', '127.0.0.1', '内网IP', '{\r\n  \"configName\" : [ \"1\" ],\r\n  \"configKey\" : [ \"1\" ],\r\n  \"configValue\" : [ \"1\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:38:08');
INSERT INTO `sys_oper_log` VALUES (126, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"107\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:38:35');
INSERT INTO `sys_oper_log` VALUES (127, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/add', '127.0.0.1', '内网IP', '{\r\n  \"configName\" : [ \"1\" ],\r\n  \"configKey\" : [ \"1\" ],\r\n  \"configValue\" : [ \"1\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:39:18');
INSERT INTO `sys_oper_log` VALUES (128, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"108\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:39:23');
INSERT INTO `sys_oper_log` VALUES (129, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/add', '127.0.0.1', '内网IP', '{\r\n  \"configName\" : [ \"1\" ],\r\n  \"configKey\" : [ \"1\" ],\r\n  \"configValue\" : [ \"1\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:40:26');
INSERT INTO `sys_oper_log` VALUES (130, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"109\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:40:34');
INSERT INTO `sys_oper_log` VALUES (131, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/add', '127.0.0.1', '内网IP', '{\r\n  \"configName\" : [ \"测试\" ],\r\n  \"configKey\" : [ \"sys.user.initPassword1\" ],\r\n  \"configValue\" : [ \"123456\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:42:28');
INSERT INTO `sys_oper_log` VALUES (132, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"110\" ],\r\n  \"configName\" : [ \"测试\" ],\r\n  \"configKey\" : [ \"sys.user.initPassword1\" ],\r\n  \"configValue\" : [ \"123456\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"初始化密码 123456\" ]\r\n}', 'null', 1, 'com.ruoyi.system.domain.SysConfig cannot be cast to java.lang.Number', '2020-03-16 19:42:39');
INSERT INTO `sys_oper_log` VALUES (133, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"110\" ],\r\n  \"configName\" : [ \"测试\" ],\r\n  \"configKey\" : [ \"sys.user.initPassword1\" ],\r\n  \"configValue\" : [ \"123456\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"初始化密码 123456\" ]\r\n}', 'null', 1, 'com.ruoyi.system.domain.SysConfig cannot be cast to java.lang.Number', '2020-03-16 19:42:45');
INSERT INTO `sys_oper_log` VALUES (134, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"110\" ],\r\n  \"configName\" : [ \"测试\" ],\r\n  \"configKey\" : [ \"sys.user.initPassword1\" ],\r\n  \"configValue\" : [ \"123456\" ],\r\n  \"configType\" : [ \"N\" ],\r\n  \"remark\" : [ \"初始化密码 123456hh\" ]\r\n}', 'null', 1, 'com.ruoyi.system.domain.SysConfig cannot be cast to java.lang.Number', '2020-03-16 19:43:30');
INSERT INTO `sys_oper_log` VALUES (135, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"110\" ],\r\n  \"configName\" : [ \"测试\" ],\r\n  \"configKey\" : [ \"sys.user.initPassword12\" ],\r\n  \"configValue\" : [ \"123456\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', 'null', 1, 'com.ruoyi.system.domain.SysConfig cannot be cast to java.lang.Number', '2020-03-16 19:43:51');
INSERT INTO `sys_oper_log` VALUES (136, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"110\" ],\r\n  \"configName\" : [ \"测试\" ],\r\n  \"configKey\" : [ \"sys.user.initPasswordd\" ],\r\n  \"configValue\" : [ \"123456\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"1\" ]\r\n}', 'null', 1, 'com.ruoyi.system.domain.SysConfig cannot be cast to java.lang.Number', '2020-03-16 19:44:40');
INSERT INTO `sys_oper_log` VALUES (137, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"110\" ],\r\n  \"configName\" : [ \"测试\" ],\r\n  \"configKey\" : [ \"sys.user.initPassword\" ],\r\n  \"configValue\" : [ \"123456\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"修改参数\'测试\'失败，参数键名已存在\",\r\n  \"code\" : 500\r\n}', 0, NULL, '2020-03-16 19:44:49');
INSERT INTO `sys_oper_log` VALUES (138, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"110\" ],\r\n  \"configName\" : [ \"测试\" ],\r\n  \"configKey\" : [ \"sys.user.init\" ],\r\n  \"configValue\" : [ \"123456\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"1\" ]\r\n}', 'null', 1, 'com.ruoyi.system.domain.SysConfig cannot be cast to java.lang.Number', '2020-03-16 19:45:03');
INSERT INTO `sys_oper_log` VALUES (139, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"1\" ],\r\n  \"configName\" : [ \"主框架页-默认皮肤样式名称1\" ],\r\n  \"configKey\" : [ \"sys.index.skinName\" ],\r\n  \"configValue\" : [ \"skin-blue\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\" ]\r\n}', 'null', 1, 'com.ruoyi.system.domain.SysConfig cannot be cast to java.lang.Number', '2020-03-16 19:45:27');
INSERT INTO `sys_oper_log` VALUES (140, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"110\" ],\r\n  \"configName\" : [ \"测试1\" ],\r\n  \"configKey\" : [ \"sys.user.initPassword1\" ],\r\n  \"configValue\" : [ \"123456\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:46:20');
INSERT INTO `sys_oper_log` VALUES (141, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"110\" ],\r\n  \"configName\" : [ \"测试\" ],\r\n  \"configKey\" : [ \"sys.user.initPassword1\" ],\r\n  \"configValue\" : [ \"123456\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"初始化密码 123456\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:46:48');
INSERT INTO `sys_oper_log` VALUES (142, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"110\" ],\r\n  \"configName\" : [ \"用户管理-账号初始密码\" ],\r\n  \"configKey\" : [ \"sys.user.initPassword1\" ],\r\n  \"configValue\" : [ \"123456\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:46:53');
INSERT INTO `sys_oper_log` VALUES (143, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"110\" ],\r\n  \"configName\" : [ \"用户管理-账号初始密码\" ],\r\n  \"configKey\" : [ \"sys.user.initPassword1\" ],\r\n  \"configValue\" : [ \"123456\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:47:08');
INSERT INTO `sys_oper_log` VALUES (144, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"110\" ],\r\n  \"configName\" : [ \"测试1\" ],\r\n  \"configKey\" : [ \"sys.user.initPassword1\" ],\r\n  \"configValue\" : [ \"123456\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:47:24');
INSERT INTO `sys_oper_log` VALUES (145, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"110\" ],\r\n  \"configName\" : [ \"用户管理-账号初始密码\" ],\r\n  \"configKey\" : [ \"sys.user.initPassword1\" ],\r\n  \"configValue\" : [ \"123456\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:47:33');
INSERT INTO `sys_oper_log` VALUES (146, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"110\" ],\r\n  \"configName\" : [ \"测试111\" ],\r\n  \"configKey\" : [ \"sys.user.initPassword1\" ],\r\n  \"configValue\" : [ \"123456\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:47:51');
INSERT INTO `sys_oper_log` VALUES (147, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"1\" ],\r\n  \"configName\" : [ \"主框架页-默认皮肤样式名称1\" ],\r\n  \"configKey\" : [ \"sys.index.skinName\" ],\r\n  \"configValue\" : [ \"skin-blue\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:47:55');
INSERT INTO `sys_oper_log` VALUES (148, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"110\" ],\r\n  \"configName\" : [ \"测试2\" ],\r\n  \"configKey\" : [ \"sys.user.initPassword1\" ],\r\n  \"configValue\" : [ \"123456\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:48:04');
INSERT INTO `sys_oper_log` VALUES (149, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"110\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:49:04');
INSERT INTO `sys_oper_log` VALUES (150, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"1\" ],\r\n  \"configName\" : [ \"主框架页-默认皮肤样式名称\" ],\r\n  \"configKey\" : [ \"sys.index.skinName\" ],\r\n  \"configValue\" : [ \"skin-blue\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:49:12');
INSERT INTO `sys_oper_log` VALUES (151, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/add', '127.0.0.1', '内网IP', '{\r\n  \"configName\" : [ \"1\" ],\r\n  \"configKey\" : [ \"1\" ],\r\n  \"configValue\" : [ \"1\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:49:23');
INSERT INTO `sys_oper_log` VALUES (152, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"1\" ],\r\n  \"configName\" : [ \"主框架页-默认皮肤样式名称\" ],\r\n  \"configKey\" : [ \"sys.index.skinName\" ],\r\n  \"configValue\" : [ \"skin-blue\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:49:29');
INSERT INTO `sys_oper_log` VALUES (153, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"111\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:49:36');
INSERT INTO `sys_oper_log` VALUES (154, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"1\" ],\r\n  \"configName\" : [ \"主框架页-默认皮肤样式名称\" ],\r\n  \"configKey\" : [ \"sys.index.skinName\" ],\r\n  \"configValue\" : [ \"skin-blue\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:50:14');
INSERT INTO `sys_oper_log` VALUES (155, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/edit', '127.0.0.1', '内网IP', '{\r\n  \"configId\" : [ \"1\" ],\r\n  \"configName\" : [ \"主框架页-默认皮肤样式名称\" ],\r\n  \"configKey\" : [ \"sys.index.skinName\" ],\r\n  \"configValue\" : [ \"skin-blue\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:51:46');
INSERT INTO `sys_oper_log` VALUES (156, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/add', '127.0.0.1', '内网IP', '{\r\n  \"configName\" : [ \"1\" ],\r\n  \"configKey\" : [ \"1\" ],\r\n  \"configValue\" : [ \"1\" ],\r\n  \"configType\" : [ \"Y\" ],\r\n  \"remark\" : [ \"1\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:51:54');
INSERT INTO `sys_oper_log` VALUES (157, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"112\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:52:05');
INSERT INTO `sys_oper_log` VALUES (158, '参数管理', 3, 'com.ruoyi.web.controller.system.SysConfigController.remove()', 'POST', 1, 'admin', '研发部门', '/admin/system/config/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 19:52:12');
INSERT INTO `sys_oper_log` VALUES (159, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', '研发部门', '/admin/monitor/job/run', '127.0.0.1', '内网IP', '{\r\n  \"jobId\" : [ \"1\" ],\r\n  \"jobGroup\" : [ \"DEFAULT\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 20:01:35');
INSERT INTO `sys_oper_log` VALUES (160, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', '研发部门', '/admin/monitor/job/run', '127.0.0.1', '内网IP', '{\r\n  \"jobId\" : [ \"2\" ],\r\n  \"jobGroup\" : [ \"DEFAULT\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 20:01:40');
INSERT INTO `sys_oper_log` VALUES (161, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', '研发部门', '/admin/monitor/job/run', '127.0.0.1', '内网IP', '{\r\n  \"jobId\" : [ \"1\" ],\r\n  \"jobGroup\" : [ \"DEFAULT\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 20:03:35');
INSERT INTO `sys_oper_log` VALUES (162, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', '研发部门', '/admin/monitor/job/run', '127.0.0.1', '内网IP', '{\r\n  \"jobId\" : [ \"2\" ],\r\n  \"jobGroup\" : [ \"DEFAULT\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 20:06:39');
INSERT INTO `sys_oper_log` VALUES (163, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', '研发部门', '/admin/monitor/job/run', '127.0.0.1', '内网IP', '{\r\n  \"jobId\" : [ \"2\" ],\r\n  \"jobGroup\" : [ \"DEFAULT\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 20:06:51');
INSERT INTO `sys_oper_log` VALUES (164, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', '研发部门', '/admin/monitor/job/run', '127.0.0.1', '内网IP', '{\r\n  \"jobId\" : [ \"2\" ],\r\n  \"jobGroup\" : [ \"DEFAULT\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 20:06:55');
INSERT INTO `sys_oper_log` VALUES (165, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', '研发部门', '/admin/monitor/job/run', '127.0.0.1', '内网IP', '{\r\n  \"jobId\" : [ \"2\" ],\r\n  \"jobGroup\" : [ \"DEFAULT\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 20:07:11');
INSERT INTO `sys_oper_log` VALUES (166, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', '研发部门', '/admin/monitor/job/run', '127.0.0.1', '内网IP', '{\r\n  \"jobId\" : [ \"1\" ],\r\n  \"jobGroup\" : [ \"DEFAULT\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 20:07:20');
INSERT INTO `sys_oper_log` VALUES (167, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', '研发部门', '/admin/monitor/job/run', '127.0.0.1', '内网IP', '{\r\n  \"jobId\" : [ \"2\" ],\r\n  \"jobGroup\" : [ \"DEFAULT\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 20:07:27');
INSERT INTO `sys_oper_log` VALUES (168, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', '研发部门', '/admin/monitor/job/run', '127.0.0.1', '内网IP', '{\r\n  \"jobId\" : [ \"2\" ],\r\n  \"jobGroup\" : [ \"DEFAULT\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 20:07:32');
INSERT INTO `sys_oper_log` VALUES (169, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', '研发部门', '/admin/monitor/job/run', '127.0.0.1', '内网IP', '{\r\n  \"jobId\" : [ \"2\" ],\r\n  \"jobGroup\" : [ \"DEFAULT\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 20:07:36');
INSERT INTO `sys_oper_log` VALUES (170, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', '研发部门', '/admin/monitor/job/run', '127.0.0.1', '内网IP', '{\r\n  \"jobId\" : [ \"2\" ],\r\n  \"jobGroup\" : [ \"DEFAULT\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 20:08:57');
INSERT INTO `sys_oper_log` VALUES (171, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', '研发部门', '/admin/monitor/job/run', '127.0.0.1', '内网IP', '{\r\n  \"jobId\" : [ \"2\" ],\r\n  \"jobGroup\" : [ \"DEFAULT\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 20:10:21');
INSERT INTO `sys_oper_log` VALUES (172, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', '研发部门', '/admin/monitor/job/run', '127.0.0.1', '内网IP', '{\r\n  \"jobId\" : [ \"2\" ],\r\n  \"jobGroup\" : [ \"DEFAULT\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 20:10:24');
INSERT INTO `sys_oper_log` VALUES (173, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'POST', 1, 'admin', '研发部门', '/admin/monitor/job/run', '127.0.0.1', '内网IP', '{\r\n  \"jobId\" : [ \"2\" ],\r\n  \"jobGroup\" : [ \"DEFAULT\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-16 20:10:27');
INSERT INTO `sys_oper_log` VALUES (174, '用户管理', 1, 'com.ruoyi.project.system.user.controller.UserController.addSave()', 'POST', 1, 'ry', '测试部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"105\"],\"userName\":[\"luna\"],\"deptName\":[\"测试部门\"],\"phonenumber\":[\"15696756588\"],\"email\":[\"ltribe.account@foxmail.com\"],\"loginName\":[\"15696756588\"],\"password\":[\"admin\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-20 19:03:17');
INSERT INTO `sys_oper_log` VALUES (175, '重置密码', 2, 'com.ruoyi.project.system.user.controller.UserController.resetPwd()', 'GET', 1, 'ry', '测试部门', '/system/user/resetPwd/100', '127.0.0.1', '内网IP', '{}', '\"system/user/resetPwd\"', 0, NULL, '2020-03-20 19:03:47');
INSERT INTO `sys_oper_log` VALUES (176, '用户管理', 3, 'com.ruoyi.project.system.user.controller.UserController.remove()', 'POST', 1, 'ry', '测试部门', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"100\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-20 19:03:56');
INSERT INTO `sys_oper_log` VALUES (177, '用户管理', 1, 'com.ruoyi.project.system.user.controller.UserController.addSave()', 'POST', 1, 'ry', '测试部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"105\"],\"userName\":[\"luna\"],\"deptName\":[\"测试部门\"],\"phonenumber\":[\"15696756587\"],\"email\":[\"15696756582@163.com\"],\"loginName\":[\"luna\"],\"password\":[\"admin\"],\"sex\":[\"0\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"2\"]}', '{\"msg\":\"新增用户\'luna\'失败，邮箱账号已存在\",\"code\":500}', 0, NULL, '2020-03-20 19:24:48');
INSERT INTO `sys_oper_log` VALUES (178, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'ry', '测试部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,112,111,3,113,114,1057,1058,1059,1060,1061,115\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-20 19:25:38');
INSERT INTO `sys_oper_log` VALUES (179, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'ry', '测试部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,112,111,3,113,114,1057,1058,1059,1060,1061,115\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-20 19:25:40');
INSERT INTO `sys_oper_log` VALUES (180, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,3,113,114,1057,1058,1059,1060,1061,115\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-20 19:26:52');
INSERT INTO `sys_oper_log` VALUES (181, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,3,113,114,1057,1058,1059,1060,1061,115\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-20 19:26:53');
INSERT INTO `sys_oper_log` VALUES (182, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,3,113,114,1057,1058,1059,1060,1061,115\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-20 20:36:50');
INSERT INTO `sys_oper_log` VALUES (183, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,3,113,114,1057,1058,1059,1060,1061,115\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-20 20:37:41');
INSERT INTO `sys_oper_log` VALUES (184, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'ry', '测试部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,112,111,3,113,114,1057,1058,1059,1060,1061,115\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-20 20:40:45');
INSERT INTO `sys_oper_log` VALUES (185, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,3,113,114,1057,1058,1059,1060,1061,115\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-20 20:58:45');
INSERT INTO `sys_oper_log` VALUES (186, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,3,113,114,1057,1058,1059,1060,1061,115\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-20 20:58:45');
INSERT INTO `sys_oper_log` VALUES (187, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,3,113,114,1057,1058,1059,1060,1061,115\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-20 20:59:15');
INSERT INTO `sys_oper_log` VALUES (188, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'ry', '测试部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,3,113,114,1057,1058,1059,1060,1061,115\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-20 21:11:42');
INSERT INTO `sys_oper_log` VALUES (189, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,3,113,114,1057,1058,1059,1060,1061,115\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-20 21:12:49');
INSERT INTO `sys_oper_log` VALUES (190, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"管理员\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-20 21:13:02');
INSERT INTO `sys_oper_log` VALUES (191, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"tb_student\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-25 18:13:29');
INSERT INTO `sys_oper_log` VALUES (192, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/tb_student', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-03-25 18:15:17');
INSERT INTO `sys_oper_log` VALUES (193, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/tb_student', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-03-25 18:15:19');
INSERT INTO `sys_oper_log` VALUES (194, '代码生成', 3, 'com.ruoyi.project.tool.gen.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-25 18:17:56');
INSERT INTO `sys_oper_log` VALUES (195, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"tb_student\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-25 18:18:21');
INSERT INTO `sys_oper_log` VALUES (196, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/tb_student', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-03-25 18:18:31');
INSERT INTO `sys_oper_log` VALUES (197, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/tb_student', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-03-25 18:18:33');
INSERT INTO `sys_oper_log` VALUES (198, '代码生成', 3, 'com.ruoyi.project.tool.gen.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-25 19:27:56');
INSERT INTO `sys_oper_log` VALUES (199, '代码生成', 6, 'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"tb_student\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-25 19:28:02');
INSERT INTO `sys_oper_log` VALUES (200, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/tb_student', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-03-25 19:28:18');
INSERT INTO `sys_oper_log` VALUES (201, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/tb_student', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-03-25 19:28:21');
INSERT INTO `sys_oper_log` VALUES (202, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"3\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-25 23:07:58');
INSERT INTO `sys_oper_log` VALUES (203, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\r\n  \"tables\" : [ \"tb_student\" ]\r\n}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-03-25 23:08:03');
INSERT INTO `sys_oper_log` VALUES (204, '字典类型', 1, 'com.ruoyi.project.system.dict.controller.DictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"是否开通注册\"],\"dictType\":[\"sys.account.registerUser\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-27 21:37:52');
INSERT INTO `sys_oper_log` VALUES (205, '字典类型', 3, 'com.ruoyi.project.system.dict.controller.DictTypeController.remove()', 'POST', 1, 'admin', '研发部门', '/system/dict/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"100\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-27 21:40:06');
INSERT INTO `sys_oper_log` VALUES (206, '参数管理', 1, 'com.ruoyi.project.system.config.controller.ConfigController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/config/add', '127.0.0.1', '内网IP', '{\"configName\":[\"开通注册功能\"],\"configKey\":[\"sys.account.registerUser\"],\"configValue\":[\"true\"],\"configType\":[\"Y\"],\"remark\":[\"开通注册功能\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-27 21:40:51');
INSERT INTO `sys_oper_log` VALUES (207, '个人信息', 2, 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"java.io.FileNotFoundException: C:\\\\Users\\\\improve\\\\AppData\\\\Local\\\\Temp\\\\tomcat.8358989086917829605.8081\\\\work\\\\Tomcat\\\\localhost\\\\ROOT\\\\null\\\\avatar\\\\2020\\\\03\\\\28\\\\dbf6c4724ec968d1dbcc32474e2ef502.png (系统找不到指定的路径。)\",\"code\":500}', 0, NULL, '2020-03-28 10:05:39');
INSERT INTO `sys_oper_log` VALUES (208, '个人信息', 2, 'com.ruoyi.project.system.user.controller.ProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"java.io.FileNotFoundException: C:\\\\Users\\\\improve\\\\AppData\\\\Local\\\\Temp\\\\tomcat.5732162238024691554.8081\\\\work\\\\Tomcat\\\\localhost\\\\ROOT\\\\null\\\\avatar\\\\2020\\\\03\\\\28\\\\c4a607d394d36d7555bbd6d6e93bafd9.png (系统找不到指定的路径。)\",\"code\":500}', 0, NULL, '2020-03-28 10:07:24');
INSERT INTO `sys_oper_log` VALUES (209, '个人信息', 2, 'com.luna.project.system.user.controller.ProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-28 10:45:21');
INSERT INTO `sys_oper_log` VALUES (210, '用户管理', 5, 'com.luna.project.system.user.controller.UserController.export()', 'POST', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', '{\"msg\":\"d1893dea-a733-47c6-8a2e-bf7c5a9c31ad_用户数据.xlsx\",\"code\":0}', 0, NULL, '2020-03-28 12:59:01');
INSERT INTO `sys_oper_log` VALUES (211, '用户管理', 5, 'com.luna.project.system.user.controller.UserController.export()', 'POST', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', '{\"msg\":\"4dbd02bf-7fac-4692-8204-2fffd7889b75_用户数据.xlsx\",\"code\":0}', 0, NULL, '2020-03-28 13:12:41');
INSERT INTO `sys_oper_log` VALUES (212, '用户管理', 5, 'com.luna.project.system.user.controller.UserController.export()', 'POST', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"小明\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', '{\"msg\":\"ea448b1e-976b-4f55-8a79-b59e7ebda8d1_用户数据.xlsx\",\"code\":0}', 0, NULL, '2020-03-28 13:13:45');
INSERT INTO `sys_oper_log` VALUES (213, '用户管理', 5, 'com.luna.project.system.user.controller.UserController.export()', 'POST', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"小明\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', '{\"msg\":\"6017dc46-3e2b-4d4c-b5d6-3e490df3f69d_用户数据.xlsx\",\"code\":0}', 0, NULL, '2020-03-28 13:14:49');
INSERT INTO `sys_oper_log` VALUES (214, '用户管理', 5, 'com.luna.project.system.user.controller.UserController.export()', 'POST', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"小明\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', '{\"msg\":\"305fb08d-effe-408d-8550-6bc1d5f9dec2_用户数据.xlsx\",\"code\":0}', 0, NULL, '2020-03-28 13:15:14');
INSERT INTO `sys_oper_log` VALUES (215, '用户管理', 5, 'com.luna.project.system.user.controller.UserController.export()', 'POST', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"小明\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', '{\"msg\":\"bffd6a76-548e-4cf9-9f30-c166fbd08f92_用户数据.xlsx\",\"code\":0}', 0, NULL, '2020-03-28 13:18:56');
INSERT INTO `sys_oper_log` VALUES (216, '用户管理', 5, 'com.luna.project.system.user.controller.UserController.export()', 'POST', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"小明\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', '{\"msg\":\"9939de78-d29c-4b19-b0ab-f932ec3277fb_用户数据.xlsx\",\"code\":0}', 0, NULL, '2020-03-28 13:21:26');
INSERT INTO `sys_oper_log` VALUES (217, '用户管理', 5, 'com.luna.project.system.user.controller.UserController.export()', 'POST', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"小明\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', '{\"msg\":\"f88101e1-830c-4304-880e-7958754ede71_用户数据.xlsx\",\"code\":0}', 0, NULL, '2020-03-28 13:22:09');
INSERT INTO `sys_oper_log` VALUES (218, '用户管理', 5, 'com.luna.project.system.user.controller.UserController.export()', 'POST', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', '{\"msg\":\"b258c3dc-723b-4799-a198-ba17b19fa870_用户数据.xlsx\",\"code\":0}', 0, NULL, '2020-03-28 13:23:37');
INSERT INTO `sys_oper_log` VALUES (219, '用户管理', 5, 'com.luna.project.system.user.controller.UserController.export()', 'POST', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', '{\"msg\":\"e6a5173a-892f-4d72-81f9-93b910ebb000_用户数据.xlsx\",\"code\":0}', 0, NULL, '2020-03-28 13:27:55');
INSERT INTO `sys_oper_log` VALUES (220, '用户管理', 5, 'com.luna.project.system.user.controller.UserController.export()', 'POST', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', '{\"msg\":\"c26815c2-b554-4af1-adf1-972a6a877e92_用户数据.xlsx\",\"code\":0}', 0, NULL, '2020-03-28 13:29:59');
INSERT INTO `sys_oper_log` VALUES (221, '用户管理', 5, 'com.luna.project.system.user.controller.UserController.export()', 'POST', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', '{\"msg\":\"6440e7bd-37b2-4520-ae1f-63b85df34388_用户数据.xlsx\",\"code\":0}', 0, NULL, '2020-03-28 13:31:42');
INSERT INTO `sys_oper_log` VALUES (222, '用户管理', 5, 'com.luna.project.system.user.controller.UserController.export()', 'POST', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', '{\"msg\":\"4aacc9c3-90db-4197-af01-835b091edb6b_用户数据.xlsx\",\"code\":0}', 0, NULL, '2020-03-28 13:32:30');
INSERT INTO `sys_oper_log` VALUES (223, '用户管理', 5, 'com.luna.project.system.user.controller.UserController.export()', 'POST', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', '{\"msg\":\"ea1e0af1-9e27-4a36-9b12-9a4a680cf189_用户数据.xlsx\",\"code\":0}', 0, NULL, '2020-03-28 13:35:06');
INSERT INTO `sys_oper_log` VALUES (224, '用户管理', 5, 'com.luna.project.system.user.controller.UserController.export()', 'POST', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', '{\"msg\":\"f3e4bafa-e9b7-40e5-9264-06da2089bf00_用户数据.xlsx\",\"code\":0}', 0, NULL, '2020-03-28 13:35:18');
INSERT INTO `sys_oper_log` VALUES (225, '用户管理', 5, 'com.luna.project.system.user.controller.UserController.export()', 'POST', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', '{\"msg\":\"5f7e5f65-f223-4769-a066-faae883f7f8e_用户数据.xlsx\",\"code\":0}', 0, NULL, '2020-03-28 13:48:21');
INSERT INTO `sys_oper_log` VALUES (226, '用户管理', 5, 'com.luna.project.system.user.controller.UserController.export()', 'POST', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', '{\"msg\":\"029f17ef-d452-44bc-979f-e7f4428a5325_用户数据.xlsx\",\"code\":0}', 0, NULL, '2020-03-28 13:50:47');
INSERT INTO `sys_oper_log` VALUES (227, '代码生成', 6, 'com.luna.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '192.168.1.103', '内网IP', '{\"tables\":[\"sys_file_info\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-28 15:29:23');
INSERT INTO `sys_oper_log` VALUES (228, '代码生成', 8, 'com.luna.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/sys_file_info', '192.168.1.103', '内网IP', '{}', 'null', 0, NULL, '2020-03-28 15:29:29');
INSERT INTO `sys_oper_log` VALUES (229, '代码生成', 8, 'com.luna.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/sys_file_info', '192.168.1.103', '内网IP', '{}', 'null', 0, NULL, '2020-03-28 15:29:33');
INSERT INTO `sys_oper_log` VALUES (230, '文件信息', 1, 'com.luna.project.system.info.controller.FileInfoController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/info/add', '192.168.1.103', '内网IP', '{\"fileName\":[\"1\"],\"filePath\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-28 15:34:16');
INSERT INTO `sys_oper_log` VALUES (231, '文件信息', 2, 'com.luna.project.system.info.controller.FileInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/info/edit', '192.168.1.103', '内网IP', '{\"fileId\":[\"1\"],\"fileName\":[\"2\"],\"filePath\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-28 15:34:22');
INSERT INTO `sys_oper_log` VALUES (232, '文件信息', 1, 'com.luna.project.system.info.controller.FileInfoController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/info/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"11\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-28 16:08:26');
INSERT INTO `sys_oper_log` VALUES (233, '文件信息', 3, 'com.luna.project.system.info.controller.FileInfoController.remove()', 'POST', 1, 'admin', '研发部门', '/system/info/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-28 16:09:58');
INSERT INTO `sys_oper_log` VALUES (234, '文件信息', 2, 'com.luna.project.system.info.controller.FileInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/info/edit', '127.0.0.1', '内网IP', '{\"fileId\":[\"2\"],\"fileName\":[\"girl\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-28 16:10:30');
INSERT INTO `sys_oper_log` VALUES (235, '代码生成', 6, 'com.luna.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_cuisine\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-28 20:59:16');
INSERT INTO `sys_oper_log` VALUES (236, '代码生成', 8, 'com.luna.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/sys_cuisine', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-03-28 20:59:57');
INSERT INTO `sys_oper_log` VALUES (237, '代码生成', 8, 'com.luna.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/sys_cuisine', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-03-28 20:59:59');
INSERT INTO `sys_oper_log` VALUES (238, '菜单管理', 1, 'com.luna.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"测试页面\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-28 21:08:29');
INSERT INTO `sys_oper_log` VALUES (239, '菜单管理', 2, 'com.luna.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2012\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"测试页面\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-28 21:09:01');
INSERT INTO `sys_oper_log` VALUES (240, '菜单管理', 2, 'com.luna.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2006\"],\"parentId\":[\"2012\"],\"menuType\":[\"C\"],\"menuName\":[\"菜品信息\"],\"url\":[\"/system/cuisine\"],\"target\":[\"menuItem\"],\"perms\":[\"system:cuisine:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-28 21:09:35');
INSERT INTO `sys_oper_log` VALUES (241, '菜单管理', 1, 'com.luna.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2012\"],\"menuType\":[\"F\"],\"menuName\":[\"Thymeleaf测试\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-28 21:10:53');
INSERT INTO `sys_oper_log` VALUES (242, '菜单管理', 2, 'com.luna.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2013\"],\"parentId\":[\"2012\"],\"menuType\":[\"C\"],\"menuName\":[\"Thymeleaf测试\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-book\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-28 21:11:24');
INSERT INTO `sys_oper_log` VALUES (243, '菜单管理', 2, 'com.luna.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2013\"],\"parentId\":[\"2012\"],\"menuType\":[\"C\"],\"menuName\":[\"Thymeleaf测试\"],\"url\":[\"demo\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-book\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-28 21:12:58');
INSERT INTO `sys_oper_log` VALUES (244, '菜单管理', 2, 'com.luna.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2013\"],\"parentId\":[\"2012\"],\"menuType\":[\"C\"],\"menuName\":[\"Thymeleaf测试\"],\"url\":[\"/demo\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-book\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-28 21:14:21');
INSERT INTO `sys_oper_log` VALUES (245, '菜单管理', 2, 'com.luna.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2013\"],\"parentId\":[\"2012\"],\"menuType\":[\"C\"],\"menuName\":[\"Thymeleaf测试\"],\"url\":[\"/demo\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-book\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-29 11:23:35');
INSERT INTO `sys_oper_log` VALUES (246, '菜单管理', 1, 'com.luna.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2013\"],\"menuType\":[\"F\"],\"menuName\":[\"crud用户新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-03-29 11:57:57');
INSERT INTO `sys_oper_log` VALUES (247, '部门管理', 2, 'com.luna.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"100\"],\"parentId\":[\"0\"],\"parentName\":[\"无\"],\"deptName\":[\"AlterSoftware\"],\"orderNum\":[\"0\"],\"leader\":[\"luna\"],\"phone\":[\"15888888888\"],\"email\":[\"luna@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-01 11:12:03');
INSERT INTO `sys_oper_log` VALUES (248, '部门管理', 2, 'com.luna.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"102\"],\"parentId\":[\"100\"],\"parentName\":[\"AlterSoftware\"],\"deptName\":[\"江苏分公司\"],\"orderNum\":[\"2\"],\"leader\":[\"luna\"],\"phone\":[\"15888888888\"],\"email\":[\"luna@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-01 11:12:25');
INSERT INTO `sys_oper_log` VALUES (249, '通知公告', 2, 'com.luna.project.system.notice.controller.NoticeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/notice/edit', '127.0.0.1', '内网IP', '{\"noticeId\":[\"1\"],\"noticeTitle\":[\"温馨提醒：2018-07-01 新版本发布啦\"],\"noticeType\":[\"2\"],\"noticeContent\":[\"新版本内容\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-03 14:16:24');
INSERT INTO `sys_oper_log` VALUES (250, '通知公告', 2, 'com.luna.project.system.notice.controller.NoticeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/notice/edit', '127.0.0.1', '内网IP', '{\"noticeId\":[\"2\"],\"noticeTitle\":[\"维护通知：2018-07-01 系统凌晨维护\"],\"noticeType\":[\"1\"],\"noticeContent\":[\"维护内容\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-03 14:16:37');
INSERT INTO `sys_oper_log` VALUES (251, '定时任务', 2, 'com.luna.project.monitor.job.controller.JobController.editSave()', 'POST', 1, 'admin', '研发部门', '/monitor/job/edit', '127.0.0.1', '内网IP', '{\"jobId\":[\"1\"],\"jobName\":[\"系统默认（无参）\"],\"jobGroup\":[\"DEFAULT\"],\"invokeTarget\":[\"ryTask.ryNoParams\"],\"cronExpression\":[\"0/10 * * * * ?\"],\"misfirePolicy\":[\"2\"],\"concurrent\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-03 14:18:37');
INSERT INTO `sys_oper_log` VALUES (252, '定时任务', 2, 'com.luna.project.monitor.job.controller.JobController.editSave()', 'POST', 1, 'admin', '研发部门', '/monitor/job/edit', '127.0.0.1', '内网IP', '{\"jobId\":[\"1\"],\"jobName\":[\"系统默认（无参）\"],\"jobGroup\":[\"DEFAULT\"],\"invokeTarget\":[\"ryTask.ryNoParams\"],\"cronExpression\":[\"0/10 * * * * ?\"],\"misfirePolicy\":[\"3\"],\"concurrent\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-03 14:19:11');
INSERT INTO `sys_oper_log` VALUES (253, '定时任务', 2, 'com.luna.project.monitor.job.controller.JobController.editSave()', 'POST', 1, 'admin', '研发部门', '/monitor/job/edit', '127.0.0.1', '内网IP', '{\"jobId\":[\"1\"],\"jobName\":[\"系统默认（无参）\"],\"jobGroup\":[\"DEFAULT\"],\"invokeTarget\":[\"ryTask.ryNoParams\"],\"cronExpression\":[\"0/10 * * * * ?\"],\"misfirePolicy\":[\"2\"],\"concurrent\":[\"1\"],\"status\":[\"1\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-03 14:19:44');
INSERT INTO `sys_oper_log` VALUES (254, '定时任务', 2, 'com.luna.project.monitor.job.controller.JobController.editSave()', 'POST', 1, 'admin', '研发部门', '/monitor/job/edit', '127.0.0.1', '内网IP', '{\"jobId\":[\"1\"],\"jobName\":[\"系统默认（无参）\"],\"jobGroup\":[\"DEFAULT\"],\"invokeTarget\":[\"ryTask.ryNoParams\"],\"cronExpression\":[\"0/10 * * * * ?\"],\"misfirePolicy\":[\"2\"],\"concurrent\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-03 14:43:56');
INSERT INTO `sys_oper_log` VALUES (255, '定时任务', 2, 'com.luna.project.monitor.job.controller.JobController.editSave()', 'POST', 1, 'admin', '研发部门', '/monitor/job/edit', '127.0.0.1', '内网IP', '{\"jobId\":[\"1\"],\"jobName\":[\"系统默认（无参）\"],\"jobGroup\":[\"DEFAULT\"],\"invokeTarget\":[\"ryTask.ryNoParams\"],\"cronExpression\":[\"0/10 * * * * ?\"],\"misfirePolicy\":[\"2\"],\"concurrent\":[\"1\"],\"status\":[\"1\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-03 14:44:20');
INSERT INTO `sys_oper_log` VALUES (256, '测试', 10, 'com.luna.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"107\"],\"userName\":[\"root\"],\"deptName\":[\"运维部门\"],\"phonenumber\":[\"15696756581\"],\"email\":[\"15696756581@163.com\"],\"loginName\":[\"15696756581\"],\"password\":[\"admin123\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-05 23:36:10');
INSERT INTO `sys_oper_log` VALUES (257, '用户管理', 1, 'com.luna.project.system.user.controller.UserController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"107\"],\"userName\":[\"小华\"],\"deptName\":[\"运维部门\"],\"phonenumber\":[\"15696756583\"],\"email\":[\"15696756583@163.com\"],\"loginName\":[\"小华\"],\"password\":[\"admin123\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-05 23:40:17');
INSERT INTO `sys_oper_log` VALUES (258, '个人信息', 2, 'com.yctc.project.system.user.controller.ProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 21:55:13');
INSERT INTO `sys_oper_log` VALUES (259, '代码生成', 6, 'com.yctc.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_academy\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 22:01:44');
INSERT INTO `sys_oper_log` VALUES (260, '代码生成', 8, 'com.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/sys_academy', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-15 22:02:09');
INSERT INTO `sys_oper_log` VALUES (261, '代码生成', 8, 'com.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/sys_academy', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-15 22:02:09');
INSERT INTO `sys_oper_log` VALUES (262, '学院', 1, 'com.yctc.project.system.academy.controller.AcademyController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/academy/add', '127.0.0.1', '内网IP', '{\"academy\":[\"文学院\"],\"modifyTime\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 22:10:32');
INSERT INTO `sys_oper_log` VALUES (263, '文件信息', 2, 'com.yctc.project.system.info.controller.FileInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/info/edit', '127.0.0.1', '内网IP', '{\"fileId\":[\"2\"],\"fileName\":[\"girl\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 22:11:39');
INSERT INTO `sys_oper_log` VALUES (264, '文件信息', 2, 'com.yctc.project.system.info.controller.FileInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/info/edit', '127.0.0.1', '内网IP', '{\"fileId\":[\"2\"],\"fileName\":[\"girl\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 22:11:58');
INSERT INTO `sys_oper_log` VALUES (265, '文件信息', 2, 'com.yctc.project.system.info.controller.FileInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/info/edit', '127.0.0.1', '内网IP', '{\"fileId\":[\"2\"],\"fileName\":[\"girl\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 22:12:19');
INSERT INTO `sys_oper_log` VALUES (266, '文件信息', 1, 'com.yctc.project.system.info.controller.FileInfoController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/info/add', '127.0.0.1', '内网IP', '{\"fileName\":[\"小黄人\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 22:12:50');
INSERT INTO `sys_oper_log` VALUES (267, '文件信息', 3, 'com.yctc.project.system.info.controller.FileInfoController.remove()', 'POST', 1, 'admin', '研发部门', '/system/info/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 22:12:56');
INSERT INTO `sys_oper_log` VALUES (268, '岗位管理', 2, 'com.yctc.project.system.post.controller.PostController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"1\"],\"postName\":[\"教务处\"],\"postCode\":[\"aao\"],\"postSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"Academic Affairs Office\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 22:14:23');
INSERT INTO `sys_oper_log` VALUES (269, '岗位管理', 2, 'com.yctc.project.system.post.controller.PostController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"1\"],\"postName\":[\"教务处处长\"],\"postCode\":[\"doaa\"],\"postSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"Director of Academic Affairs\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 22:15:45');
INSERT INTO `sys_oper_log` VALUES (270, '岗位管理', 2, 'com.yctc.project.system.post.controller.PostController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"2\"],\"postName\":[\"教导员\"],\"postCode\":[\"se\"],\"postSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 22:16:49');
INSERT INTO `sys_oper_log` VALUES (271, '岗位管理', 2, 'com.yctc.project.system.post.controller.PostController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"3\"],\"postName\":[\"辅导员\"],\"postCode\":[\"hr\"],\"postSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 22:16:55');
INSERT INTO `sys_oper_log` VALUES (272, '岗位管理', 2, 'com.yctc.project.system.post.controller.PostController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"4\"],\"postName\":[\"任课教师\"],\"postCode\":[\"user\"],\"postSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 22:17:07');
INSERT INTO `sys_oper_log` VALUES (273, '部门管理', 2, 'com.yctc.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"100\"],\"parentId\":[\"0\"],\"parentName\":[\"无\"],\"deptName\":[\"盐城师范学院\"],\"orderNum\":[\"0\"],\"leader\":[\"luna\"],\"phone\":[\"15888888888\"],\"email\":[\"luna@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 22:17:46');
INSERT INTO `sys_oper_log` VALUES (274, '部门管理', 2, 'com.yctc.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"parentId\":[\"100\"],\"parentName\":[\"盐城师范学院\"],\"deptName\":[\"信息工程学院\"],\"orderNum\":[\"1\"],\"leader\":[\"xx\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 22:18:08');
INSERT INTO `sys_oper_log` VALUES (275, '部门管理', 2, 'com.yctc.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"parentId\":[\"101\"],\"parentName\":[\"信息工程学院\"],\"deptName\":[\"软件工程\"],\"orderNum\":[\"1\"],\"leader\":[\"若依\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 22:18:34');
INSERT INTO `sys_oper_log` VALUES (276, '菜单管理', 2, 'com.yctc.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"103\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"部门及专业管理\"],\"url\":[\"/system/dept\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dept:view\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 22:19:21');
INSERT INTO `sys_oper_log` VALUES (277, '部门管理', 2, 'com.yctc.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"104\"],\"parentId\":[\"101\"],\"parentName\":[\"信息工程学院\"],\"deptName\":[\"物联网\"],\"orderNum\":[\"2\"],\"leader\":[\"xx\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 22:19:40');
INSERT INTO `sys_oper_log` VALUES (278, '部门管理', 2, 'com.yctc.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"105\"],\"parentId\":[\"101\"],\"parentName\":[\"信息工程学院\"],\"deptName\":[\"数字媒体\"],\"orderNum\":[\"3\"],\"leader\":[\"xx\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 22:19:55');
INSERT INTO `sys_oper_log` VALUES (279, '部门管理', 2, 'com.yctc.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"106\"],\"parentId\":[\"101\"],\"parentName\":[\"信息工程学院\"],\"deptName\":[\"大数据\"],\"orderNum\":[\"4\"],\"leader\":[\"xx\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 22:20:23');
INSERT INTO `sys_oper_log` VALUES (280, '部门管理', 2, 'com.yctc.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"107\"],\"parentId\":[\"101\"],\"parentName\":[\"信息工程学院\"],\"deptName\":[\"运维\"],\"orderNum\":[\"5\"],\"leader\":[\"xx\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 22:21:11');
INSERT INTO `sys_oper_log` VALUES (281, '部门管理', 2, 'com.yctc.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"102\"],\"parentId\":[\"100\"],\"parentName\":[\"盐城师范学院\"],\"deptName\":[\"教育科学学院\"],\"orderNum\":[\"2\"],\"leader\":[\"luna\"],\"phone\":[\"15888888888\"],\"email\":[\"luna@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 22:21:36');
INSERT INTO `sys_oper_log` VALUES (282, '部门管理', 2, 'com.yctc.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"108\"],\"parentId\":[\"102\"],\"parentName\":[\"教育科学学院\"],\"deptName\":[\"心理健康\"],\"orderNum\":[\"1\"],\"leader\":[\"xx\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 22:21:46');
INSERT INTO `sys_oper_log` VALUES (283, '部门管理', 2, 'com.yctc.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"109\"],\"parentId\":[\"102\"],\"parentName\":[\"教育科学学院\"],\"deptName\":[\"小学教育\"],\"orderNum\":[\"2\"],\"leader\":[\"xx\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 22:21:59');
INSERT INTO `sys_oper_log` VALUES (284, '菜单管理', 1, 'com.yctc.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"教务管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-address-book-o\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 22:23:31');
INSERT INTO `sys_oper_log` VALUES (285, '菜单管理', 2, 'com.yctc.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"103\"],\"parentId\":[\"2021\"],\"menuType\":[\"C\"],\"menuName\":[\"部门及专业管理\"],\"url\":[\"/system/dept\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dept:view\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 22:24:16');
INSERT INTO `sys_oper_log` VALUES (286, '菜单管理', 2, 'com.yctc.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"104\"],\"parentId\":[\"2021\"],\"menuType\":[\"C\"],\"menuName\":[\"岗位管理\"],\"url\":[\"/system/post\"],\"target\":[\"menuItem\"],\"perms\":[\"system:post:view\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 22:25:14');
INSERT INTO `sys_oper_log` VALUES (287, '菜单管理', 2, 'com.yctc.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2015\"],\"parentId\":[\"2021\"],\"menuType\":[\"C\"],\"menuName\":[\"学院\"],\"url\":[\"/system/academy\"],\"target\":[\"menuItem\"],\"perms\":[\"system:academy:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 22:25:39');
INSERT INTO `sys_oper_log` VALUES (288, '角色管理', 1, 'com.yctc.project.system.role.controller.RoleController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"教师\"],\"roleKey\":[\"teacher\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"教师角色\"],\"menuIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 22:27:45');
INSERT INTO `sys_oper_log` VALUES (289, '代码生成', 6, 'com.yctc.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_classroom\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 23:38:05');
INSERT INTO `sys_oper_log` VALUES (290, '代码生成', 8, 'com.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/sys_classroom', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-15 23:39:25');
INSERT INTO `sys_oper_log` VALUES (291, '代码生成', 8, 'com.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/sys_classroom', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-15 23:39:26');
INSERT INTO `sys_oper_log` VALUES (292, '教室', 1, 'com.yctc.project.system.classroom.controller.ClassroomController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/classroom/add', '127.0.0.1', '内网IP', '{\"buildingFloorId\":[\"304\"],\"number\":[\"主楼\"],\"equipmentId\":[\"1\"],\"modifyTime\":[\"2020-04-16\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-15 23:46:42');
INSERT INTO `sys_oper_log` VALUES (293, '菜单管理', 2, 'edu.yctc.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2022\"],\"parentId\":[\"2021\"],\"menuType\":[\"C\"],\"menuName\":[\"教室管理\"],\"url\":[\"/system/classroom\"],\"target\":[\"menuItem\"],\"perms\":[\"system:classroom:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 00:05:35');
INSERT INTO `sys_oper_log` VALUES (294, '菜单管理', 2, 'edu.yctc.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2015\"],\"parentId\":[\"2021\"],\"menuType\":[\"C\"],\"menuName\":[\"学院管理\"],\"url\":[\"/system/academy\"],\"target\":[\"menuItem\"],\"perms\":[\"system:academy:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 00:05:45');
INSERT INTO `sys_oper_log` VALUES (295, '部门管理', 2, 'edu.yctc.project.system.dept.controller.DeptController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"107\"],\"parentId\":[\"101\"],\"parentName\":[\"信息工程学院\"],\"deptName\":[\"计算机科学与技术\"],\"orderNum\":[\"5\"],\"leader\":[\"xx\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 16:56:07');
INSERT INTO `sys_oper_log` VALUES (296, '代码生成', 6, 'edu.yctc.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '软件工程', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_class\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 18:04:28');
INSERT INTO `sys_oper_log` VALUES (297, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_class', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-16 18:05:06');
INSERT INTO `sys_oper_log` VALUES (298, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_class', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-16 18:05:07');
INSERT INTO `sys_oper_log` VALUES (299, '代码生成', 3, 'edu.yctc.project.tool.gen.controller.GenController.remove()', 'POST', 1, 'admin', '软件工程', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"9\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 18:24:08');
INSERT INTO `sys_oper_log` VALUES (300, '代码生成', 6, 'edu.yctc.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '软件工程', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_class\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 18:24:20');
INSERT INTO `sys_oper_log` VALUES (301, '代码生成', 3, 'edu.yctc.project.tool.gen.controller.GenController.remove()', 'POST', 1, 'admin', '软件工程', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 18:25:20');
INSERT INTO `sys_oper_log` VALUES (302, '代码生成', 6, 'edu.yctc.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '软件工程', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_classes\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 18:25:26');
INSERT INTO `sys_oper_log` VALUES (303, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_classes', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-16 18:25:30');
INSERT INTO `sys_oper_log` VALUES (304, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_classes', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-16 18:25:30');
INSERT INTO `sys_oper_log` VALUES (305, '班级信息', 2, 'edu.yctc.project.system.classes.controller.ClassesController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/classes/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"academyId\":[\"2\"],\"deptId\":[\"105\"],\"number\":[\"数媒187\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 19:26:19');
INSERT INTO `sys_oper_log` VALUES (306, '班级信息', 2, 'edu.yctc.project.system.classes.controller.ClassesController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/classes/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"academyId\":[\"2\"],\"deptId\":[\"105\"],\"number\":[\"信18(7)数媒D\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 19:26:38');
INSERT INTO `sys_oper_log` VALUES (307, '班级信息', 2, 'edu.yctc.project.system.classes.controller.ClassesController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/classes/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"academyId\":[\"2\"],\"deptId\":[\"103\"],\"number\":[\"信18(11)数媒D\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 19:26:50');
INSERT INTO `sys_oper_log` VALUES (308, '班级信息', 2, 'edu.yctc.project.system.classes.controller.ClassesController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/classes/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"academyId\":[\"2\"],\"deptId\":[\"105\"],\"number\":[\"信18(2)物联网\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 19:27:35');
INSERT INTO `sys_oper_log` VALUES (309, '班级信息', 2, 'edu.yctc.project.system.classes.controller.ClassesController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/classes/edit', '127.0.0.1', '内网IP', '{\"id\":[\"103\"],\"academyId\":[\"1\"],\"deptId\":[\"108\"],\"number\":[\"教科18(3)心里健康\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 19:30:16');
INSERT INTO `sys_oper_log` VALUES (310, '班级信息', 2, 'edu.yctc.project.system.classes.controller.ClassesController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/classes/edit', '127.0.0.1', '内网IP', '{\"id\":[\"102\"],\"academyId\":[\"1\"],\"deptId\":[\"107\"],\"number\":[\"信18(1)计算机科学与技术\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 19:30:41');
INSERT INTO `sys_oper_log` VALUES (311, '班级信息', 2, 'edu.yctc.project.system.classes.controller.ClassesController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/classes/edit', '127.0.0.1', '内网IP', '{\"id\":[\"101\"],\"academyId\":[\"1\"],\"deptId\":[\"106\"],\"number\":[\"信19(11)大数据\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 19:31:08');
INSERT INTO `sys_oper_log` VALUES (312, '班级信息', 2, 'edu.yctc.project.system.classes.controller.ClassesController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/classes/edit', '127.0.0.1', '内网IP', '{\"id\":[\"100\"],\"academyId\":[\"1\"],\"deptId\":[\"103\"],\"number\":[\"信18(6)软件工程\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 19:31:31');
INSERT INTO `sys_oper_log` VALUES (313, '班级信息', 2, 'edu.yctc.project.system.classes.controller.ClassesController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/classes/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"academyId\":[\"2\"],\"deptId\":[\"103\"],\"number\":[\"信18(9)数媒D\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 19:32:50');
INSERT INTO `sys_oper_log` VALUES (314, '菜单管理', 2, 'edu.yctc.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2034\"],\"parentId\":[\"2021\"],\"menuType\":[\"C\"],\"menuName\":[\"班级信息\"],\"url\":[\"/system/classes\"],\"target\":[\"menuItem\"],\"perms\":[\"system:classes:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 19:33:11');
INSERT INTO `sys_oper_log` VALUES (315, '菜单管理', 3, 'edu.yctc.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '软件工程', '/system/menu/remove/2028', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":301}', 0, NULL, '2020-04-16 19:33:19');
INSERT INTO `sys_oper_log` VALUES (316, '菜单管理', 3, 'edu.yctc.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '软件工程', '/system/menu/remove/2029', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 19:34:04');
INSERT INTO `sys_oper_log` VALUES (317, '菜单管理', 3, 'edu.yctc.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '软件工程', '/system/menu/remove/2030', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 19:34:11');
INSERT INTO `sys_oper_log` VALUES (318, '菜单管理', 3, 'edu.yctc.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '软件工程', '/system/menu/remove/2031', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 19:34:16');
INSERT INTO `sys_oper_log` VALUES (319, '菜单管理', 3, 'edu.yctc.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '软件工程', '/system/menu/remove/2032', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 19:34:21');
INSERT INTO `sys_oper_log` VALUES (320, '菜单管理', 3, 'edu.yctc.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '软件工程', '/system/menu/remove/2033', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 19:34:27');
INSERT INTO `sys_oper_log` VALUES (321, '菜单管理', 3, 'edu.yctc.project.system.menu.controller.MenuController.remove()', 'GET', 1, 'admin', '软件工程', '/system/menu/remove/2028', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 19:34:33');
INSERT INTO `sys_oper_log` VALUES (322, '代码生成', 6, 'edu.yctc.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '软件工程', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_course\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 20:56:00');
INSERT INTO `sys_oper_log` VALUES (323, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_course', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-16 20:56:03');
INSERT INTO `sys_oper_log` VALUES (324, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_course', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-16 20:56:03');
INSERT INTO `sys_oper_log` VALUES (325, '课程信息', 2, 'edu.yctc.project.system.course.controller.CourseController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/course/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"number\":[\"20086401\"],\"name\":[\"C语言\"],\"lessonSum\":[\"64\"],\"year\":[\"2017-2018学年\"],\"term\":[\"0\"],\"deptId\":[\"103\"],\"classesId\":[\"信18(7)\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 21:44:26');
INSERT INTO `sys_oper_log` VALUES (326, '课程信息', 2, 'edu.yctc.project.system.course.controller.CourseController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/course/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"number\":[\"20086401\"],\"name\":[\"C语言\"],\"lessonSum\":[\"64\"],\"year\":[\"2017-2018学年\"],\"term\":[\"0\"],\"deptId\":[\"103\"],\"classesId\":[\"信18(7) 信18(7)\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 21:44:32');
INSERT INTO `sys_oper_log` VALUES (327, '课程信息', 2, 'edu.yctc.project.system.course.controller.CourseController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/course/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"number\":[\"20086401\"],\"name\":[\"C语言\"],\"lessonSum\":[\"64\"],\"year\":[\"2017-2018学年\"],\"term\":[\"0\"],\"deptId\":[\"103\"],\"classesId\":[\"信18(7) 信18(7) 信18(7) 信18(7) 信18(7) 信18(7) 信18(7)\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 21:44:53');
INSERT INTO `sys_oper_log` VALUES (328, '课程信息', 2, 'edu.yctc.project.system.course.controller.CourseController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/course/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"number\":[\"20086401\"],\"name\":[\"C语言\"],\"lessonSum\":[\"64\"],\"year\":[\"2017-2018学年\"],\"term\":[\"0\"],\"deptId\":[\"103\"],\"classesId\":[\"信18(7) \"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 21:45:12');
INSERT INTO `sys_oper_log` VALUES (329, '课程信息', 2, 'edu.yctc.project.system.course.controller.CourseController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/course/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"number\":[\"20086402\"],\"name\":[\"人文教育\"],\"lessonSum\":[\"64\"],\"year\":[\"2018-2019学年\"],\"term\":[\"0\"],\"deptId\":[\"103\"],\"classesId\":[\"信18(7)\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 21:45:17');
INSERT INTO `sys_oper_log` VALUES (330, '课程信息', 2, 'edu.yctc.project.system.course.controller.CourseController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/course/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"],\"number\":[\"20086781\"],\"name\":[\"数据结构\"],\"lessonSum\":[\"64\"],\"year\":[\"2018-2019学年\"],\"term\":[\"1\"],\"deptId\":[\"103\"],\"classesId\":[\"信18(7)\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 21:45:20');
INSERT INTO `sys_oper_log` VALUES (331, '课程信息', 2, 'edu.yctc.project.system.course.controller.CourseController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/course/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"number\":[\"20086404\"],\"name\":[\"高等数学B1\"],\"lessonSum\":[\"64\"],\"year\":[\"2019-2020学年\"],\"term\":[\"1\"],\"deptId\":[\"103\"],\"classesId\":[\"信18(7)\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 21:45:26');
INSERT INTO `sys_oper_log` VALUES (332, '课程信息', 2, 'edu.yctc.project.system.course.controller.CourseController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/course/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"number\":[\"20086405\"],\"name\":[\"算法设计\"],\"lessonSum\":[\"64\"],\"year\":[\"2017-2018学年\"],\"term\":[\"1\"],\"deptId\":[\"103\"],\"classesId\":[\"信18(7)\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 21:45:30');
INSERT INTO `sys_oper_log` VALUES (333, '课程信息', 2, 'edu.yctc.project.system.course.controller.CourseController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/course/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"number\":[\"20086406\"],\"name\":[\"JAVA高级程序设计\"],\"lessonSum\":[\"64\"],\"year\":[\"2018-2019学年\"],\"term\":[\"0\"],\"deptId\":[\"103\"],\"classesId\":[\"信18(7)\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 21:45:34');
INSERT INTO `sys_oper_log` VALUES (334, '课程信息', 2, 'edu.yctc.project.system.course.controller.CourseController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/course/edit', '127.0.0.1', '内网IP', '{\"id\":[\"7\"],\"number\":[\"20086411\"],\"name\":[\"计算机网络\"],\"lessonSum\":[\"64\"],\"year\":[\"2019-2020学年\"],\"term\":[\"1\"],\"deptId\":[\"104\"],\"classesId\":[\"信18(7)\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 21:45:37');
INSERT INTO `sys_oper_log` VALUES (335, '课程信息', 2, 'edu.yctc.project.system.course.controller.CourseController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/course/edit', '127.0.0.1', '内网IP', '{\"id\":[\"8\"],\"number\":[\"20086407\"],\"name\":[\"操作系统\"],\"lessonSum\":[\"64\"],\"year\":[\"2017-2018学年\"],\"term\":[\"0\"],\"deptId\":[\"104\"],\"classesId\":[\"信18(7)\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 21:45:40');
INSERT INTO `sys_oper_log` VALUES (336, '课程信息', 2, 'edu.yctc.project.system.course.controller.CourseController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/course/edit', '127.0.0.1', '内网IP', '{\"id\":[\"9\"],\"number\":[\"20086408\"],\"name\":[\"离散数学\"],\"lessonSum\":[\"64\"],\"year\":[\"2018-2019学年\"],\"term\":[\"1\"],\"deptId\":[\"104\"],\"classesId\":[\"信18(7)\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 21:45:45');
INSERT INTO `sys_oper_log` VALUES (337, '课程信息', 2, 'edu.yctc.project.system.course.controller.CourseController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/course/edit', '127.0.0.1', '内网IP', '{\"id\":[\"10\"],\"number\":[\"20086409\"],\"name\":[\"马克思主义思想\"],\"lessonSum\":[\"64\"],\"year\":[\"2019-2020学年\"],\"term\":[\"1\"],\"deptId\":[\"104\"],\"classesId\":[\"信18(7)\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 21:45:48');
INSERT INTO `sys_oper_log` VALUES (338, '课程信息', 2, 'edu.yctc.project.system.course.controller.CourseController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/course/edit', '127.0.0.1', '内网IP', '{\"id\":[\"11\"],\"number\":[\"20086410\"],\"name\":[\"大学英语\"],\"lessonSum\":[\"64\"],\"year\":[\"2018-2019学年\"],\"term\":[\"1\"],\"deptId\":[\"104\"],\"classesId\":[\"信18(7)\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 21:45:55');
INSERT INTO `sys_oper_log` VALUES (339, '课程信息', 2, 'edu.yctc.project.system.course.controller.CourseController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/course/edit', '127.0.0.1', '内网IP', '{\"id\":[\"12\"],\"number\":[\"20086510\"],\"name\":[\"计算机导论\"],\"lessonSum\":[\"64\"],\"year\":[\"2018-2019学年\"],\"term\":[\"1\"],\"deptId\":[\"104\"],\"classesId\":[\"信18(7)\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 21:46:02');
INSERT INTO `sys_oper_log` VALUES (340, '菜单管理', 2, 'edu.yctc.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2040\"],\"parentId\":[\"2021\"],\"menuType\":[\"C\"],\"menuName\":[\"课程信息\"],\"url\":[\"/system/course\"],\"target\":[\"menuItem\"],\"perms\":[\"system:course:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 21:47:19');
INSERT INTO `sys_oper_log` VALUES (341, '代码生成', 6, 'edu.yctc.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '软件工程', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_equipment\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 21:50:20');
INSERT INTO `sys_oper_log` VALUES (342, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_equipment', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-16 21:50:23');
INSERT INTO `sys_oper_log` VALUES (343, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_equipment', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-16 21:50:24');
INSERT INTO `sys_oper_log` VALUES (344, '设备信息', 2, 'edu.yctc.project.system.equipment.controller.EquipmentController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/equipment/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"number\":[\"112\"],\"name\":[\"海康威视1-2\"],\"video\":[\"http://123.206.53.234/yctc/test1.mp4\"],\"modifyTime\":[\"2019-03-09 01:22:33\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 21:56:17');
INSERT INTO `sys_oper_log` VALUES (345, '代码生成', 6, 'edu.yctc.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '软件工程', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_building_floor\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 22:01:23');
INSERT INTO `sys_oper_log` VALUES (346, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_building_floor', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-16 22:01:25');
INSERT INTO `sys_oper_log` VALUES (347, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_building_floor', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-16 22:01:25');
INSERT INTO `sys_oper_log` VALUES (348, '代码生成', 6, 'edu.yctc.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '软件工程', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_lesson\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 22:05:25');
INSERT INTO `sys_oper_log` VALUES (349, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_lesson', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-16 22:05:28');
INSERT INTO `sys_oper_log` VALUES (350, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_lesson', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-16 22:05:28');
INSERT INTO `sys_oper_log` VALUES (351, '菜单管理', 2, 'edu.yctc.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2052\"],\"parentId\":[\"2021\"],\"menuType\":[\"C\"],\"menuName\":[\"楼层信息\"],\"url\":[\"/system/floor\"],\"target\":[\"menuItem\"],\"perms\":[\"system:floor:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 22:12:39');
INSERT INTO `sys_oper_log` VALUES (352, '菜单管理', 2, 'edu.yctc.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2046\"],\"parentId\":[\"2021\"],\"menuType\":[\"C\"],\"menuName\":[\"设备信息\"],\"url\":[\"/system/equipment\"],\"target\":[\"menuItem\"],\"perms\":[\"system:equipment:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 22:12:55');
INSERT INTO `sys_oper_log` VALUES (353, '菜单管理', 2, 'edu.yctc.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2058\"],\"parentId\":[\"2021\"],\"menuType\":[\"C\"],\"menuName\":[\"课时信息\"],\"url\":[\"/system/lesson\"],\"target\":[\"menuItem\"],\"perms\":[\"system:lesson:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 22:13:33');
INSERT INTO `sys_oper_log` VALUES (354, '代码生成', 6, 'edu.yctc.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '软件工程', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_knowledge\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 22:27:56');
INSERT INTO `sys_oper_log` VALUES (355, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_knowledge', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-16 22:27:59');
INSERT INTO `sys_oper_log` VALUES (356, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_knowledge', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-16 22:28:00');
INSERT INTO `sys_oper_log` VALUES (357, '代码生成', 6, 'edu.yctc.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '软件工程', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_attendance\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 22:29:42');
INSERT INTO `sys_oper_log` VALUES (358, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_attendance', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-16 22:29:46');
INSERT INTO `sys_oper_log` VALUES (359, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_attendance', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-16 22:29:46');
INSERT INTO `sys_oper_log` VALUES (360, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_attendance', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-16 22:30:00');
INSERT INTO `sys_oper_log` VALUES (361, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_attendance', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-16 22:30:01');
INSERT INTO `sys_oper_log` VALUES (362, '代码生成', 6, 'edu.yctc.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '软件工程', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_class_score\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 22:31:51');
INSERT INTO `sys_oper_log` VALUES (363, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_class_score', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-16 22:31:53');
INSERT INTO `sys_oper_log` VALUES (364, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_class_score', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-16 22:31:53');
INSERT INTO `sys_oper_log` VALUES (365, '代码生成', 6, 'edu.yctc.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '软件工程', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_classroom_state\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 22:33:28');
INSERT INTO `sys_oper_log` VALUES (366, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_classroom_state', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-16 22:33:32');
INSERT INTO `sys_oper_log` VALUES (367, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_classroom_state', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-16 22:33:32');
INSERT INTO `sys_oper_log` VALUES (368, '菜单管理', 2, 'edu.yctc.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2064\"],\"parentId\":[\"2021\"],\"menuType\":[\"C\"],\"menuName\":[\"知识点概览\"],\"url\":[\"/system/knowledge\"],\"target\":[\"menuItem\"],\"perms\":[\"system:knowledge:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 22:43:00');
INSERT INTO `sys_oper_log` VALUES (369, '菜单管理', 2, 'edu.yctc.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2070\"],\"parentId\":[\"2021\"],\"menuType\":[\"C\"],\"menuName\":[\"学生考勤点名汇总\"],\"url\":[\"/system/attendance\"],\"target\":[\"menuItem\"],\"perms\":[\"system:attendance:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 22:43:13');
INSERT INTO `sys_oper_log` VALUES (370, '菜单管理', 2, 'edu.yctc.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2076\"],\"parentId\":[\"2021\"],\"menuType\":[\"C\"],\"menuName\":[\"学生上课评分汇总\"],\"url\":[\"/system/score\"],\"target\":[\"menuItem\"],\"perms\":[\"system:score:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 22:43:27');
INSERT INTO `sys_oper_log` VALUES (371, '菜单管理', 2, 'edu.yctc.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2082\"],\"parentId\":[\"2021\"],\"menuType\":[\"C\"],\"menuName\":[\"教室占用情况\"],\"url\":[\"/system/state\"],\"target\":[\"menuItem\"],\"perms\":[\"system:state:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-16 22:43:46');
INSERT INTO `sys_oper_log` VALUES (372, '教室', 2, 'edu.yctc.project.system.classroom.controller.ClassroomController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/classroom/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"buildingFloorId\":[\"2\"],\"number\":[\"A111\"],\"equipmentId\":[\"2\"],\"modifyTime\":[\"2019-07-09\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'c.id\' in \'where clause\'\r\n### The error may involve edu.yctc.project.system.classroom.mapper.ClassroomMapper.updateClassroom-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_classroom          SET building_floor_id = ?,             number = ?,             equipment_id = ?,                          modify_time = ?          where c.id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'c.id\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'c.id\' in \'where clause\'', '2020-04-17 09:59:11');
INSERT INTO `sys_oper_log` VALUES (373, '教室', 2, 'edu.yctc.project.system.classroom.controller.ClassroomController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/classroom/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"buildingFloorId\":[\"2\"],\"number\":[\"A111\"],\"equipmentId\":[\"2\"],\"modifyTime\":[\"2019-07-09\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 09:59:54');
INSERT INTO `sys_oper_log` VALUES (374, '教室', 2, 'edu.yctc.project.system.classroom.controller.ClassroomController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/classroom/edit', '127.0.0.1', '内网IP', '{\"id\":[\"11\"],\"buildingFloorId\":[\"304\"],\"number\":[\"主楼\"],\"equipmentId\":[\"2\"],\"modifyTime\":[\"2020-04-16\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'uk_equipment_id\'\r\n### The error may involve edu.yctc.project.system.classroom.mapper.ClassroomMapper.updateClassroom-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_classroom          SET building_floor_id = ?,             number = ?,             equipment_id = ?,                          modify_time = ?          where id = ?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'uk_equipment_id\'\n; Duplicate entry \'2\' for key \'uk_equipment_id\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'uk_equipment_id\'', '2020-04-17 10:07:17');
INSERT INTO `sys_oper_log` VALUES (375, '教室', 2, 'edu.yctc.project.system.classroom.controller.ClassroomController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/classroom/edit', '127.0.0.1', '内网IP', '{\"id\":[\"11\"],\"buildingFloorId\":[\"1\"],\"number\":[\"主楼\"],\"equipmentId\":[\"1\"],\"modifyTime\":[\"2020-04-16\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 10:08:39');
INSERT INTO `sys_oper_log` VALUES (376, '教室', 1, 'edu.yctc.project.system.classroom.controller.ClassroomController.addSave()', 'POST', 1, 'admin', '软件工程', '/system/classroom/add', '127.0.0.1', '内网IP', '{\"buildingFloorId\":[\"4\"],\"number\":[\"1楼\"],\"equipmentId\":[\"1\"],\"modifyTime\":[\"2020-04-15\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'uk_equipment_id\'\r\n### The error may involve edu.yctc.project.system.classroom.mapper.ClassroomMapper.insertClassroom-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_classroom          ( building_floor_id,             number,             equipment_id,             create_time,             modify_time )           values ( ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'uk_equipment_id\'\n; Duplicate entry \'1\' for key \'uk_equipment_id\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'uk_equipment_id\'', '2020-04-17 10:09:20');
INSERT INTO `sys_oper_log` VALUES (377, '教室', 1, 'edu.yctc.project.system.classroom.controller.ClassroomController.addSave()', 'POST', 1, 'admin', '软件工程', '/system/classroom/add', '127.0.0.1', '内网IP', '{\"buildingFloorId\":[\"4\"],\"number\":[\"1楼\"],\"equipmentId\":[\"1\"],\"modifyTime\":[\"2020-04-15\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'uk_equipment_id\'\r\n### The error may involve edu.yctc.project.system.classroom.mapper.ClassroomMapper.insertClassroom-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_classroom          ( building_floor_id,             number,             equipment_id,             create_time,             modify_time )           values ( ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'uk_equipment_id\'\n; Duplicate entry \'1\' for key \'uk_equipment_id\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'uk_equipment_id\'', '2020-04-17 10:10:37');
INSERT INTO `sys_oper_log` VALUES (378, '教室', 1, 'edu.yctc.project.system.classroom.controller.ClassroomController.addSave()', 'POST', 1, 'admin', '软件工程', '/system/classroom/add', '127.0.0.1', '内网IP', '{\"buildingFloorId\":[\"4\"],\"number\":[\"四楼\"],\"equipmentId\":[\"1\"],\"modifyTime\":[\"\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'uk_equipment_id\'\r\n### The error may involve edu.yctc.project.system.classroom.mapper.ClassroomMapper.insertClassroom-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_classroom          ( building_floor_id,             number,             equipment_id,             create_time )           values ( ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'uk_equipment_id\'\n; Duplicate entry \'1\' for key \'uk_equipment_id\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'uk_equipment_id\'', '2020-04-17 10:10:50');
INSERT INTO `sys_oper_log` VALUES (379, '教室', 1, 'edu.yctc.project.system.classroom.controller.ClassroomController.addSave()', 'POST', 1, 'admin', '软件工程', '/system/classroom/add', '127.0.0.1', '内网IP', '{\"buildingFloorId\":[\"4\"],\"number\":[\"四楼\"],\"equipmentId\":[\"1\"],\"modifyTime\":[\"\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'uk_equipment_id\'\r\n### The error may involve edu.yctc.project.system.classroom.mapper.ClassroomMapper.insertClassroom-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_classroom          ( building_floor_id,             number,             equipment_id,             create_time )           values ( ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'uk_equipment_id\'\n; Duplicate entry \'1\' for key \'uk_equipment_id\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'uk_equipment_id\'', '2020-04-17 10:11:41');
INSERT INTO `sys_oper_log` VALUES (380, '教室', 1, 'edu.yctc.project.system.classroom.controller.ClassroomController.addSave()', 'POST', 1, 'admin', '软件工程', '/system/classroom/add', '127.0.0.1', '内网IP', '{\"buildingFloorId\":[\"4\"],\"number\":[\"四楼\"],\"equipmentId\":[\"1\"],\"modifyTime\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 10:11:51');
INSERT INTO `sys_oper_log` VALUES (381, '教室', 2, 'edu.yctc.project.system.classroom.controller.ClassroomController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/classroom/edit', '127.0.0.1', '内网IP', '{\"id\":[\"16\"],\"buildingFloorId\":[\"4\"],\"number\":[\"111\"],\"equipmentId\":[\"1\"],\"modifyTime\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 10:13:21');
INSERT INTO `sys_oper_log` VALUES (382, '教室', 2, 'edu.yctc.project.system.classroom.controller.ClassroomController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/classroom/edit', '127.0.0.1', '内网IP', '{\"id\":[\"16\"],\"buildingFloorId\":[\"4\"],\"number\":[\"111\"],\"equipmentId\":[\"1\"],\"modifyTime\":[\"2019-10-31: 11-11-22\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 10:13:39');
INSERT INTO `sys_oper_log` VALUES (383, '教室', 2, 'edu.yctc.project.system.classroom.controller.ClassroomController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/classroom/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"buildingFloorId\":[\"2\"],\"number\":[\"A111\"],\"equipmentId\":[\"2\"],\"modifyTime\":[\"2019-07-09 12:11:33\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 10:13:52');
INSERT INTO `sys_oper_log` VALUES (384, '教室', 3, 'edu.yctc.project.system.classroom.controller.ClassroomController.remove()', 'POST', 1, 'admin', '软件工程', '/system/classroom/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"16\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'c.id\' in \'where clause\'\r\n### The error may involve edu.yctc.project.system.classroom.mapper.ClassroomMapper.deleteClassroomByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from sys_classroom where c.id in          (               ?          )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'c.id\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'c.id\' in \'where clause\'', '2020-04-17 10:15:11');
INSERT INTO `sys_oper_log` VALUES (385, '教室', 3, 'edu.yctc.project.system.classroom.controller.ClassroomController.remove()', 'POST', 1, 'admin', '软件工程', '/system/classroom/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"16\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 10:16:00');
INSERT INTO `sys_oper_log` VALUES (386, '教室', 1, 'edu.yctc.project.system.classroom.controller.ClassroomController.addSave()', 'POST', 1, 'admin', '软件工程', '/system/classroom/add', '127.0.0.1', '内网IP', '{\"buildingFloorId\":[\"1\"],\"number\":[\"401\"],\"equipmentId\":[\"1\"],\"modifyTime\":[\"2020-04-17\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 10:16:31');
INSERT INTO `sys_oper_log` VALUES (387, '教室', 2, 'edu.yctc.project.system.classroom.controller.ClassroomController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/classroom/edit', '127.0.0.1', '内网IP', '{\"id\":[\"11\"],\"buildingFloorId\":[\"1\"],\"number\":[\"401\"],\"equipmentId\":[\"1\"],\"modifyTime\":[\"2020-04-16\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 10:16:46');
INSERT INTO `sys_oper_log` VALUES (388, '教室', 2, 'edu.yctc.project.system.classroom.controller.ClassroomController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/classroom/edit', '127.0.0.1', '内网IP', '{\"id\":[\"11\"],\"buildingFloorId\":[\"1\"],\"number\":[\"402\"],\"equipmentId\":[\"1\"],\"modifyTime\":[\"2020-04-16\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 10:16:55');
INSERT INTO `sys_oper_log` VALUES (389, '教室', 5, 'edu.yctc.project.system.classroom.controller.ClassroomController.export()', 'POST', 1, 'admin', '软件工程', '/system/classroom/export', '127.0.0.1', '内网IP', '{\"buildingFloorId\":[\"\"],\"number\":[\"401\"],\"equipmentId\":[\"\"],\"params[beginModifyTime]\":[\"\"],\"params[endModifyTime]\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"908222fd-22e5-4615-9389-9c08ce573da5_classroom.xlsx\",\"code\":0}', 0, NULL, '2020-04-17 10:19:10');
INSERT INTO `sys_oper_log` VALUES (390, '角色管理', 1, 'edu.yctc.project.system.role.controller.RoleController.addSave()', 'POST', 1, 'admin', '软件工程', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"学生\"],\"roleKey\":[\"student\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"学生角色\"],\"menuIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 10:20:49');
INSERT INTO `sys_oper_log` VALUES (391, '用户管理', 4, 'edu.yctc.project.system.user.controller.UserController.insertAuthRole()', 'POST', 1, 'admin', '软件工程', '/system/user/authRole/insertAuthRole', '127.0.0.1', '内网IP', '{\"userId\":[\"105\"],\"roleIds\":[\"101\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 10:21:24');
INSERT INTO `sys_oper_log` VALUES (392, '菜单管理', 1, 'edu.yctc.project.system.menu.controller.MenuController.addSave()', 'POST', 1, 'admin', '软件工程', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"教学系统\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-feed\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 10:24:09');
INSERT INTO `sys_oper_log` VALUES (393, '菜单管理', 2, 'edu.yctc.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2088\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"教学系统\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-feed\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 10:24:25');
INSERT INTO `sys_oper_log` VALUES (394, '菜单管理', 2, 'edu.yctc.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2064\"],\"parentId\":[\"2088\"],\"menuType\":[\"C\"],\"menuName\":[\"知识点概览\"],\"url\":[\"/system/knowledge\"],\"target\":[\"menuItem\"],\"perms\":[\"system:knowledge:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 10:24:49');
INSERT INTO `sys_oper_log` VALUES (395, '教室', 2, 'edu.yctc.project.system.classroom.controller.ClassroomController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/classroom/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"buildingFloorId\":[\"2\"],\"number\":[\"A211\"],\"equipmentId\":[\"2\"],\"modifyTime\":[\"2019-07-09\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:07:46');
INSERT INTO `sys_oper_log` VALUES (396, '课时信息', 2, 'edu.yctc.project.system.lesson.controller.LessonController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/lesson/edit', '127.0.0.1', '内网IP', '{\"id\":[\"7\"],\"courseId\":[\"9\"],\"number\":[\"2\"],\"classroomId\":[\"2\"],\"begin\":[\"2019-04-10\"],\"end\":[\"2019-04-10\"],\"modifyTime\":[\"2019-04-10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:08:14');
INSERT INTO `sys_oper_log` VALUES (397, '课时信息', 1, 'edu.yctc.project.system.lesson.controller.LessonController.addSave()', 'POST', 1, 'admin', '软件工程', '/system/lesson/add', '127.0.0.1', '内网IP', '{\"courseId\":[\"93001\"],\"number\":[\"2\"],\"classroomId\":[\"3\"],\"begin\":[\"\"],\"end\":[\"\"],\"modifyTime\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:08:34');
INSERT INTO `sys_oper_log` VALUES (398, '课时信息', 2, 'edu.yctc.project.system.lesson.controller.LessonController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/lesson/edit', '127.0.0.1', '内网IP', '{\"id\":[\"263\"],\"courseId\":[\"93001\"],\"number\":[\"2\"],\"classroomId\":[\"1\"],\"begin\":[\"\"],\"end\":[\"\"],\"modifyTime\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:09:12');
INSERT INTO `sys_oper_log` VALUES (399, '课时信息', 2, 'edu.yctc.project.system.lesson.controller.LessonController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/lesson/edit', '127.0.0.1', '内网IP', '{\"id\":[\"22\"],\"courseId\":[\"20086510\"],\"number\":[\"2\"],\"classroomId\":[\"1\"],\"begin\":[\"2019-08-08\"],\"end\":[\"2019-08-08\"],\"modifyTime\":[\"2019-08-06\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:17:07');
INSERT INTO `sys_oper_log` VALUES (400, '课时信息', 2, 'edu.yctc.project.system.lesson.controller.LessonController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/lesson/edit', '127.0.0.1', '内网IP', '{\"id\":[\"22\"],\"courseId\":[\"20086510\"],\"number\":[\"2\"],\"classroomId\":[\"1\"],\"begin\":[\"2019-08-08\"],\"end\":[\"2019-08-08\"],\"modifyTime\":[\"2019-08-06\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:17:13');
INSERT INTO `sys_oper_log` VALUES (401, '课时信息', 2, 'edu.yctc.project.system.lesson.controller.LessonController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/lesson/edit', '127.0.0.1', '内网IP', '{\"id\":[\"22\"],\"courseId\":[\"1\"],\"number\":[\"2\"],\"classroomId\":[\"1\"],\"begin\":[\"2019-08-08\"],\"end\":[\"2019-08-08\"],\"modifyTime\":[\"2019-08-06\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1-2\' for key \'uk_lesson\'\r\n### The error may involve edu.yctc.project.system.lesson.mapper.LessonMapper.updateLesson-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_lesson          SET course_id = ?,             number = ?,             classroom_id = ?,             begin = ?,             end = ?,                          modify_time = ?          where id = ?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1-2\' for key \'uk_lesson\'\n; Duplicate entry \'1-2\' for key \'uk_lesson\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1-2\' for key \'uk_lesson\'', '2020-04-17 11:18:36');
INSERT INTO `sys_oper_log` VALUES (402, '课时信息', 2, 'edu.yctc.project.system.lesson.controller.LessonController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/lesson/edit', '127.0.0.1', '内网IP', '{\"id\":[\"22\"],\"courseId\":[\"12\"],\"number\":[\"2\"],\"classroomId\":[\"1\"],\"begin\":[\"2019-08-08\"],\"end\":[\"2019-08-08\"],\"modifyTime\":[\"2019-08-06\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'l.number\' in \'field list\'\r\n### The error may involve edu.yctc.project.system.lesson.mapper.LessonMapper.updateLesson-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_lesson          SET course_id = ?,             l.number = ?,             classroom_id = ?,             begin = ?,             end = ?,                          modify_time = ?          where id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'l.number\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'l.number\' in \'field list\'', '2020-04-17 11:19:52');
INSERT INTO `sys_oper_log` VALUES (403, '课时信息', 2, 'edu.yctc.project.system.lesson.controller.LessonController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/lesson/edit', '127.0.0.1', '内网IP', '{\"id\":[\"22\"],\"courseId\":[\"12\"],\"number\":[\"2\"],\"classroomId\":[\"1\"],\"begin\":[\"2019-08-08\"],\"end\":[\"2019-08-08\"],\"modifyTime\":[\"2019-08-06\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'12-2\' for key \'uk_lesson\'\r\n### The error may involve edu.yctc.project.system.lesson.mapper.LessonMapper.updateLesson-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_lesson          SET course_id = ?,             number = ?,             classroom_id = ?,             begin = ?,             end = ?,                          modify_time = ?          where id = ?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'12-2\' for key \'uk_lesson\'\n; Duplicate entry \'12-2\' for key \'uk_lesson\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'12-2\' for key \'uk_lesson\'', '2020-04-17 11:20:10');
INSERT INTO `sys_oper_log` VALUES (404, '课时信息', 2, 'edu.yctc.project.system.lesson.controller.LessonController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/lesson/edit', '127.0.0.1', '内网IP', '{\"id\":[\"22\"],\"courseId\":[\"12\"],\"number\":[\"2\"],\"classroomId\":[\"1\"],\"begin\":[\"2019-08-08\"],\"end\":[\"2019-08-08\"],\"modifyTime\":[\"2019-08-06\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:21:02');
INSERT INTO `sys_oper_log` VALUES (405, '课时信息', 2, 'edu.yctc.project.system.lesson.controller.LessonController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/lesson/edit', '127.0.0.1', '内网IP', '{\"id\":[\"263\"],\"courseId\":[\"10\"],\"number\":[\"2\"],\"classroomId\":[\"1\"],\"begin\":[\"\"],\"end\":[\"\"],\"modifyTime\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:21:18');
INSERT INTO `sys_oper_log` VALUES (406, '课时信息', 2, 'edu.yctc.project.system.lesson.controller.LessonController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/lesson/edit', '127.0.0.1', '内网IP', '{\"id\":[\"25\"],\"courseId\":[\"11\"],\"number\":[\"2\"],\"classroomId\":[\"1\"],\"begin\":[\"2019-05-18\"],\"end\":[\"2019-05-18\"],\"modifyTime\":[\"2019-10-17\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:21:25');
INSERT INTO `sys_oper_log` VALUES (407, '课时信息', 2, 'edu.yctc.project.system.lesson.controller.LessonController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/lesson/edit', '127.0.0.1', '内网IP', '{\"id\":[\"263\"],\"courseId\":[\"10\"],\"number\":[\"2\"],\"classroomId\":[\"1\"],\"begin\":[\"2020-04-07\"],\"end\":[\"2020-04-08\"],\"modifyTime\":[\"2020-04-16\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:21:35');
INSERT INTO `sys_oper_log` VALUES (408, '课时信息', 2, 'edu.yctc.project.system.lesson.controller.LessonController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/lesson/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"],\"courseId\":[\"5\"],\"number\":[\"2\"],\"classroomId\":[\"1\"],\"begin\":[\"2019-04-09\"],\"end\":[\"2019-04-09\"],\"modifyTime\":[\"2019-04-10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:21:56');
INSERT INTO `sys_oper_log` VALUES (409, '课时信息', 2, 'edu.yctc.project.system.lesson.controller.LessonController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/lesson/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"courseId\":[\"6\"],\"number\":[\"2\"],\"classroomId\":[\"2\"],\"begin\":[\"2019-04-11\"],\"end\":[\"2019-04-11\"],\"modifyTime\":[\"2019-04-10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:22:00');
INSERT INTO `sys_oper_log` VALUES (410, '课时信息', 2, 'edu.yctc.project.system.lesson.controller.LessonController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/lesson/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"courseId\":[\"6\"],\"number\":[\"2\"],\"classroomId\":[\"3\"],\"begin\":[\"2019-04-11\"],\"end\":[\"2019-04-11\"],\"modifyTime\":[\"2019-04-10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:22:04');
INSERT INTO `sys_oper_log` VALUES (411, '课时信息', 2, 'edu.yctc.project.system.lesson.controller.LessonController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/lesson/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"courseId\":[\"8\"],\"number\":[\"2\"],\"classroomId\":[\"4\"],\"begin\":[\"2019-04-12\"],\"end\":[\"2019-04-12\"],\"modifyTime\":[\"2019-04-10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:22:07');
INSERT INTO `sys_oper_log` VALUES (412, '课时信息', 2, 'edu.yctc.project.system.lesson.controller.LessonController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/lesson/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"courseId\":[\"6\"],\"number\":[\"2\"],\"classroomId\":[\"5\"],\"begin\":[\"2019-04-11\"],\"end\":[\"2019-04-11\"],\"modifyTime\":[\"2019-04-10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:22:12');
INSERT INTO `sys_oper_log` VALUES (413, '课时信息', 2, 'edu.yctc.project.system.lesson.controller.LessonController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/lesson/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"courseId\":[\"6\"],\"number\":[\"2\"],\"classroomId\":[\"4\"],\"begin\":[\"2019-04-11\"],\"end\":[\"2019-04-11\"],\"modifyTime\":[\"2019-04-10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:22:18');
INSERT INTO `sys_oper_log` VALUES (414, '课时信息', 2, 'edu.yctc.project.system.lesson.controller.LessonController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/lesson/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"courseId\":[\"6\"],\"number\":[\"2\"],\"classroomId\":[\"1\"],\"begin\":[\"2019-04-11\"],\"end\":[\"2019-04-11\"],\"modifyTime\":[\"2019-04-10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:22:22');
INSERT INTO `sys_oper_log` VALUES (415, '课时信息', 2, 'edu.yctc.project.system.lesson.controller.LessonController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/lesson/edit', '127.0.0.1', '内网IP', '{\"id\":[\"7\"],\"courseId\":[\"9\"],\"number\":[\"2\"],\"classroomId\":[\"2\"],\"begin\":[\"2019-04-10\"],\"end\":[\"2019-04-10\"],\"modifyTime\":[\"2019-04-10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:22:27');
INSERT INTO `sys_oper_log` VALUES (416, '课时信息', 2, 'edu.yctc.project.system.lesson.controller.LessonController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/lesson/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"courseId\":[\"8\"],\"number\":[\"2\"],\"classroomId\":[\"1\"],\"begin\":[\"2019-04-12\"],\"end\":[\"2019-04-12\"],\"modifyTime\":[\"2019-04-10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:22:30');
INSERT INTO `sys_oper_log` VALUES (417, '课时信息', 2, 'edu.yctc.project.system.lesson.controller.LessonController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/lesson/edit', '127.0.0.1', '内网IP', '{\"id\":[\"8\"],\"courseId\":[\"10\"],\"number\":[\"2\"],\"classroomId\":[\"1\"],\"begin\":[\"2019-04-13\"],\"end\":[\"2019-04-13\"],\"modifyTime\":[\"2019-04-10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:22:36');
INSERT INTO `sys_oper_log` VALUES (418, '课时信息', 2, 'edu.yctc.project.system.lesson.controller.LessonController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/lesson/edit', '127.0.0.1', '内网IP', '{\"id\":[\"7\"],\"courseId\":[\"9\"],\"number\":[\"2\"],\"classroomId\":[\"1\"],\"begin\":[\"2019-04-10\"],\"end\":[\"2019-04-10\"],\"modifyTime\":[\"2019-04-10\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:22:40');
INSERT INTO `sys_oper_log` VALUES (419, '课时信息', 3, 'edu.yctc.project.system.lesson.controller.LessonController.remove()', 'POST', 1, 'admin', '软件工程', '/system/lesson/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"17\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:23:26');
INSERT INTO `sys_oper_log` VALUES (420, '教室占用情况', 2, 'edu.yctc.project.system.state.controller.ClassroomStateController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/state/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"classroomId\":[\"1\"],\"lessonId\":[\"1\"],\"state\":[\"1\",\"0\"],\"modifyTime\":[\"2019-03-28\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:32:10');
INSERT INTO `sys_oper_log` VALUES (421, '教室占用情况', 2, 'edu.yctc.project.system.state.controller.ClassroomStateController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/state/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"classroomId\":[\"1\"],\"lessonId\":[\"1\"],\"state\":[\"1\",\"0\"],\"modifyTime\":[\"2019-03-28\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:32:48');
INSERT INTO `sys_oper_log` VALUES (422, '教室占用情况', 2, 'edu.yctc.project.system.state.controller.ClassroomStateController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/state/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"classroomId\":[\"1\"],\"lessonId\":[\"1\"],\"state\":[\"2\",\"0\"],\"modifyTime\":[\"2019-03-28\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:32:58');
INSERT INTO `sys_oper_log` VALUES (423, '教室占用情况', 2, 'edu.yctc.project.system.state.controller.ClassroomStateController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/state/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"classroomId\":[\"1\"],\"lessonId\":[\"1\"],\"state\":[\"0\",\"0\"],\"modifyTime\":[\"2019-03-28\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:33:04');
INSERT INTO `sys_oper_log` VALUES (424, '教室占用情况', 2, 'edu.yctc.project.system.state.controller.ClassroomStateController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/state/edit', '127.0.0.1', '内网IP', '{\"id\":[\"3\"],\"classroomId\":[\"2\"],\"lessonId\":[\"3\"],\"state\":[\"0\"],\"modifyTime\":[\"2019-03-28\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:33:25');
INSERT INTO `sys_oper_log` VALUES (425, '教室占用情况', 2, 'edu.yctc.project.system.state.controller.ClassroomStateController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/state/edit', '127.0.0.1', '内网IP', '{\"id\":[\"4\"],\"classroomId\":[\"3\"],\"lessonId\":[\"4\"],\"state\":[\"0\"],\"modifyTime\":[\"2019-03-30\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:35:16');
INSERT INTO `sys_oper_log` VALUES (426, '教室占用情况', 2, 'edu.yctc.project.system.state.controller.ClassroomStateController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/state/edit', '127.0.0.1', '内网IP', '{\"id\":[\"5\"],\"classroomId\":[\"4\"],\"lessonId\":[\"5\"],\"state\":[\"0\"],\"modifyTime\":[\"2019-03-30\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:35:20');
INSERT INTO `sys_oper_log` VALUES (427, '教室占用情况', 2, 'edu.yctc.project.system.state.controller.ClassroomStateController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/state/edit', '127.0.0.1', '内网IP', '{\"id\":[\"6\"],\"classroomId\":[\"5\"],\"lessonId\":[\"6\"],\"state\":[\"0\"],\"modifyTime\":[\"2019-03-30\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:35:23');
INSERT INTO `sys_oper_log` VALUES (428, '教室占用情况', 2, 'edu.yctc.project.system.state.controller.ClassroomStateController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/state/edit', '127.0.0.1', '内网IP', '{\"id\":[\"7\"],\"classroomId\":[\"6\"],\"lessonId\":[\"7\"],\"state\":[\"0\"],\"modifyTime\":[\"2019-03-30\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:35:27');
INSERT INTO `sys_oper_log` VALUES (429, '教室占用情况', 2, 'edu.yctc.project.system.state.controller.ClassroomStateController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/state/edit', '127.0.0.1', '内网IP', '{\"id\":[\"8\"],\"classroomId\":[\"7\"],\"lessonId\":[\"8\"],\"state\":[\"0\"],\"modifyTime\":[\"2019-03-30\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:35:31');
INSERT INTO `sys_oper_log` VALUES (430, '教室占用情况', 3, 'edu.yctc.project.system.state.controller.ClassroomStateController.remove()', 'POST', 1, 'admin', '软件工程', '/system/state/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"69\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 11:35:37');
INSERT INTO `sys_oper_log` VALUES (431, '学生上课评分汇总', 2, 'edu.yctc.project.system.score.controller.ClassScoreController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/score/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"userId\":[\"11\"],\"lessonId\":[\"1\"],\"score\":[\"78.0\"],\"modifyTime\":[\"\"]}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11-1\' for key \'uk_class_score\'\r\n### The error may involve edu.yctc.project.system.score.mapper.ClassScoreMapper.updateClassScore-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_class_score          SET user_id = ?,             lesson_id = ?,             score = ?          where id = ?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11-1\' for key \'uk_class_score\'\n; Duplicate entry \'11-1\' for key \'uk_class_score\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'11-1\' for key \'uk_class_score\'', '2020-04-17 12:34:20');
INSERT INTO `sys_oper_log` VALUES (432, '学生上课评分汇总', 2, 'edu.yctc.project.system.score.controller.ClassScoreController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/score/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"userId\":[\"11\"],\"lessonId\":[\"1\"],\"score\":[\"78.0\"],\"modifyTime\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 12:34:59');
INSERT INTO `sys_oper_log` VALUES (433, '学生上课评分汇总', 2, 'edu.yctc.project.system.score.controller.ClassScoreController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/score/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"userId\":[\"11\"],\"lessonId\":[\"3\"],\"score\":[\"78.0\"],\"modifyTime\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 12:35:18');
INSERT INTO `sys_oper_log` VALUES (434, '学生上课评分汇总', 2, 'edu.yctc.project.system.score.controller.ClassScoreController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/score/edit', '127.0.0.1', '内网IP', '{\"id\":[\"65\"],\"userId\":[\"1\"],\"lessonId\":[\"7\"],\"score\":[\"78.0\"],\"modifyTime\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 12:41:31');
INSERT INTO `sys_oper_log` VALUES (435, '学生上课评分汇总', 2, 'edu.yctc.project.system.score.controller.ClassScoreController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/score/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"userId\":[\"11\"],\"lessonId\":[\"3\"],\"score\":[\"78.0\"],\"modifyTime\":[\"2020-04-07\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 12:43:53');
INSERT INTO `sys_oper_log` VALUES (436, '学生上课评分汇总', 3, 'edu.yctc.project.system.score.controller.ClassScoreController.remove()', 'POST', 1, 'admin', '软件工程', '/system/score/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"68\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 12:44:24');
INSERT INTO `sys_oper_log` VALUES (437, '学生上课评分汇总', 2, 'edu.yctc.project.system.score.controller.ClassScoreController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/score/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"userId\":[\"105\"],\"lessonId\":[\"3\"],\"score\":[\"78.0\"],\"modifyTime\":[\"2020-04-07\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 12:51:51');
INSERT INTO `sys_oper_log` VALUES (438, '学生考勤点名汇总', 2, 'edu.yctc.project.system.attendance.controller.AttendanceController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/attendance/edit', '127.0.0.1', '内网IP', '{\"id\":[\"69\"],\"userId\":[\"6\"],\"lessonId\":[\"2\"],\"attendState\":[\"1\"],\"modifyTime\":[\"2019-04-08\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 13:14:17');
INSERT INTO `sys_oper_log` VALUES (439, '学生考勤点名汇总', 2, 'edu.yctc.project.system.attendance.controller.AttendanceController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/attendance/edit', '127.0.0.1', '内网IP', '{\"id\":[\"69\"],\"userId\":[\"6\"],\"lessonId\":[\"2\"],\"attendState\":[\"0\"],\"modifyTime\":[\"2019-04-08\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 13:17:09');
INSERT INTO `sys_oper_log` VALUES (440, '学生考勤点名汇总', 2, 'edu.yctc.project.system.attendance.controller.AttendanceController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/attendance/edit', '127.0.0.1', '内网IP', '{\"id\":[\"126\"],\"userId\":[\"5\"],\"lessonId\":[\"4\"],\"attendState\":[\"0\"],\"modifyTime\":[\"2019-05-11\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 13:22:45');
INSERT INTO `sys_oper_log` VALUES (441, '学生考勤点名汇总', 2, 'edu.yctc.project.system.attendance.controller.AttendanceController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/attendance/edit', '127.0.0.1', '内网IP', '{\"id\":[\"69\"],\"userId\":[\"105\"],\"lessonId\":[\"2\"],\"attendState\":[\"0\"],\"modifyTime\":[\"2019-04-08\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 13:22:58');
INSERT INTO `sys_oper_log` VALUES (442, '学生考勤点名汇总', 2, 'edu.yctc.project.system.attendance.controller.AttendanceController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/attendance/edit', '127.0.0.1', '内网IP', '{\"id\":[\"126\"],\"userId\":[\"105\"],\"lessonId\":[\"4\"],\"attendState\":[\"0\"],\"modifyTime\":[\"2019-05-11\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 13:23:16');
INSERT INTO `sys_oper_log` VALUES (443, '学生考勤点名汇总', 3, 'edu.yctc.project.system.attendance.controller.AttendanceController.remove()', 'POST', 1, 'admin', '软件工程', '/system/attendance/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"127\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 13:23:22');
INSERT INTO `sys_oper_log` VALUES (444, '学生考勤点名汇总', 2, 'edu.yctc.project.system.attendance.controller.AttendanceController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/attendance/edit', '127.0.0.1', '内网IP', '{\"id\":[\"129\"],\"userId\":[\"105\"],\"lessonId\":[\"6\"],\"attendState\":[\"0\"],\"modifyTime\":[\"2019-05-11\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 13:23:30');
INSERT INTO `sys_oper_log` VALUES (445, '学生考勤点名汇总', 3, 'edu.yctc.project.system.attendance.controller.AttendanceController.remove()', 'POST', 1, 'admin', '软件工程', '/system/attendance/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"128\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 13:23:38');
INSERT INTO `sys_oper_log` VALUES (446, '代码生成', 6, 'edu.yctc.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '软件工程', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys-info\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 13:35:45');
INSERT INTO `sys_oper_log` VALUES (447, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys-info', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-17 13:35:50');
INSERT INTO `sys_oper_log` VALUES (448, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys-info', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-17 13:35:51');
INSERT INTO `sys_oper_log` VALUES (449, '代码生成', 6, 'edu.yctc.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '软件工程', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys-infost\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 13:37:25');
INSERT INTO `sys_oper_log` VALUES (450, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys-infost', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-17 13:37:28');
INSERT INTO `sys_oper_log` VALUES (451, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys-infost', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-17 13:37:28');
INSERT INTO `sys_oper_log` VALUES (452, '代码生成', 3, 'edu.yctc.project.tool.gen.controller.GenController.remove()', 'POST', 1, 'admin', '软件工程', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"21\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 13:58:20');
INSERT INTO `sys_oper_log` VALUES (453, '代码生成', 6, 'edu.yctc.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '软件工程', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_infost\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 13:59:50');
INSERT INTO `sys_oper_log` VALUES (454, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_infost', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-17 14:00:08');
INSERT INTO `sys_oper_log` VALUES (455, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_infost', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-17 14:00:08');
INSERT INTO `sys_oper_log` VALUES (456, '字典类型', 1, 'edu.yctc.project.system.dict.controller.DictTypeController.addSave()', 'POST', 1, 'admin', '软件工程', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"学生/老师\"],\"dictType\":[\"sys_st_type\"],\"status\":[\"0\"],\"remark\":[\"学生/老师类别\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 14:15:18');
INSERT INTO `sys_oper_log` VALUES (457, '字典类型', 1, 'edu.yctc.project.system.dict.controller.DictTypeController.addSave()', 'POST', 1, 'admin', '软件工程', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"学生/老师\"],\"dictType\":[\"sys_st_type\"],\"status\":[\"0\"],\"remark\":[\"学生/老师类别\"]}', '{\"msg\":\"新增字典\'学生/老师\'失败，字典类型已存在\",\"code\":500}', 0, NULL, '2020-04-17 14:15:27');
INSERT INTO `sys_oper_log` VALUES (458, '字典数据', 1, 'edu.yctc.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '软件工程', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"学生\"],\"dictValue\":[\"0\"],\"dictType\":[\"sys_st_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"学生类别\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 14:17:02');
INSERT INTO `sys_oper_log` VALUES (459, '字典数据', 1, 'edu.yctc.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '软件工程', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"老师\"],\"dictValue\":[\"1\"],\"dictType\":[\"sys_st_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"info\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"老师类别\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 14:17:25');
INSERT INTO `sys_oper_log` VALUES (460, '字典数据', 2, 'edu.yctc.project.system.dict.controller.DictDataController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"100\"],\"dictLabel\":[\"学生\"],\"dictValue\":[\"0\"],\"dictType\":[\"sys_st_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"学生类别\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 14:17:42');
INSERT INTO `sys_oper_log` VALUES (461, '学生/老师档案', 2, 'edu.yctc.project.system.infost.controller.InfostController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/infost/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"userId\":[\"\"],\"academyId\":[\"2\"],\"classId\":[\"1\"],\"number\":[\"1812630715\"],\"name\":[\"程新月\"],\"sex\":[\"0\",\"0\"],\"idCardNumber\":[\"320586199901011112\"],\"phone\":[\"17715939829\"],\"mail\":[\"1527215026@qq.com\"],\"picture\":[\"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1554820249936&di=8871a4e90aed756b0179b2b241a5c2bc&imgtype=0&src=http%3A%2F%2Fimg.cwq.com%2F201612%2F1482144508944947.jpeg\"],\"faceToken\":[\"sa65d6as53ds2a32\"],\"modifyTime\":[\"2019-05-18\"]}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'sex\' at row 1\r\n### The error may involve edu.yctc.project.system.infost.mapper.InfostMapper.updateInfost-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_infost          SET academy_id = ?,             class_id = ?,             number = ?,             name = ?,                          sex = ?,             id_card_number = ?,             phone = ?,             mail = ?,             picture = ?,             face_token = ?,                          modify_time = ?          where id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'sex\' at row 1\n; Data truncation: Data too long for column \'sex\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'sex\' at row 1', '2020-04-17 14:30:56');
INSERT INTO `sys_oper_log` VALUES (462, '学生/老师档案', 2, 'edu.yctc.project.system.infost.controller.InfostController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/infost/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"userId\":[\"\"],\"academyId\":[\"2\"],\"classId\":[\"1\"],\"number\":[\"1812630715\"],\"name\":[\"程新月\"],\"sex\":[\"0\",\"0\"],\"idCardNumber\":[\"320586199901011112\"],\"phone\":[\"17715939829\"],\"mail\":[\"1527215026@qq.com\"],\"picture\":[\"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1554820249936&di=8871a4e90aed756b0179b2b241a5c2bc&imgtype=0&src=http%3A%2F%2Fimg.cwq.com%2F201612%2F1482144508944947.jpeg\"],\"faceToken\":[\"sa65d6as53ds2a32\"],\"modifyTime\":[\"2019-05-18\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 14:31:56');
INSERT INTO `sys_oper_log` VALUES (463, '学生/老师档案', 2, 'edu.yctc.project.system.infost.controller.InfostController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/infost/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"userId\":[\"\"],\"academyId\":[\"2\"],\"classId\":[\"1\"],\"number\":[\"1812630715\"],\"name\":[\"程新月\"],\"sex\":[\"0\",\"1\"],\"idCardNumber\":[\"320586199901011112\"],\"phone\":[\"17715939829\"],\"mail\":[\"1527215026@qq.com\"],\"picture\":[\"https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1554820249936&amp;di=8871a4e90aed756b0179b2b241a5c2bc&amp;imgtype=0&amp;src=http%3A%2F%2Fimg.cwq.com%2F201612%2F1482144508944947.jpeg\"],\"faceToken\":[\"sa65d6as53ds2a32\"],\"modifyTime\":[\"2019-05-18\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 14:32:54');
INSERT INTO `sys_oper_log` VALUES (464, '学生/老师档案', 2, 'edu.yctc.project.system.infost.controller.InfostController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/infost/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"userId\":[\"\"],\"academyId\":[\"2\"],\"classId\":[\"1\"],\"number\":[\"1812630715\"],\"name\":[\"程新月\"],\"sex\":[\"0\",\"0\"],\"idCardNumber\":[\"320586199901011112\"],\"phone\":[\"17715939829\"],\"mail\":[\"1527215026@qq.com\"],\"picture\":[\"https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1554820249936&amp;di=8871a4e90aed756b0179b2b241a5c2bc&amp;imgtype=0&amp;src=http%3A%2F%2Fimg.cwq.com%2F201612%2F1482144508944947.jpeg\"],\"faceToken\":[\"sa65d6as53ds2a32\"],\"modifyTime\":[\"2019-05-18\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 14:35:31');
INSERT INTO `sys_oper_log` VALUES (465, '学生/老师档案', 2, 'edu.yctc.project.system.infost.controller.InfostController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/infost/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"userId\":[\"\"],\"academyId\":[\"2\"],\"classId\":[\"1\"],\"number\":[\"1812630715\"],\"name\":[\"程新月\"],\"sex\":[\"0\",\"0\"],\"idCardNumber\":[\"320586199901011112\"],\"phone\":[\"17715939829\"],\"mail\":[\"1527215026@qq.com\"],\"picture\":[\"https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1554820249936&amp;di=8871a4e90aed756b0179b2b241a5c2bc&amp;imgtype=0&amp;src=http%3A%2F%2Fimg.cwq.com%2F201612%2F1482144508944947.jpeg\"],\"faceToken\":[\"sa65d6as53ds2a32\"],\"modifyTime\":[\"2019-05-18\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 14:37:16');
INSERT INTO `sys_oper_log` VALUES (466, '学生/老师档案', 2, 'edu.yctc.project.system.infost.controller.InfostController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/infost/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"userId\":[\"\"],\"academyId\":[\"2\"],\"classId\":[\"1\"],\"number\":[\"1812630715\"],\"name\":[\"程新月\"],\"sex\":[\"0\",\"0\"],\"idCardNumber\":[\"320586199901011112\"],\"phone\":[\"17715939829\"],\"mail\":[\"1527215026@qq.com\"],\"picture\":[\"https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1554820249936&amp;di=8871a4e90aed756b0179b2b241a5c2bc&amp;imgtype=0&amp;src=http%3A%2F%2Fimg.cwq.com%2F201612%2F1482144508944947.jpeg\"],\"faceToken\":[\"sa65d6as53ds2a32\"],\"modifyTime\":[\"2019-05-18\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 14:40:02');
INSERT INTO `sys_oper_log` VALUES (467, '学生/老师档案', 2, 'edu.yctc.project.system.infost.controller.InfostController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/infost/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"userId\":[\"\"],\"academyId\":[\"2\"],\"classId\":[\"1\"],\"number\":[\"1812630715\"],\"name\":[\"程新月\"],\"sex\":[\"0\",\"1\"],\"idCardNumber\":[\"320586199901011112\"],\"phone\":[\"17715939829\"],\"mail\":[\"1527215026@qq.com\"],\"picture\":[\"https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1554820249936&amp;di=8871a4e90aed756b0179b2b241a5c2bc&amp;imgtype=0&amp;src=http%3A%2F%2Fimg.cwq.com%2F201612%2F1482144508944947.jpeg\"],\"faceToken\":[\"sa65d6as53ds2a32\"],\"modifyTime\":[\"2019-05-18\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 14:40:10');
INSERT INTO `sys_oper_log` VALUES (468, '学生/老师档案', 2, 'edu.yctc.project.system.infost.controller.InfostController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/infost/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"userId\":[\"\"],\"academyId\":[\"2\"],\"classId\":[\"1\"],\"number\":[\"1812630715\"],\"name\":[\"程新月\"],\"type\":[\"0\"],\"sex\":[\"0\"],\"idCardNumber\":[\"320586199901011112\"],\"phone\":[\"17715939829\"],\"mail\":[\"1527215026@qq.com\"],\"picture\":[\"https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1554820249936&amp;di=8871a4e90aed756b0179b2b241a5c2bc&amp;imgtype=0&amp;src=http%3A%2F%2Fimg.cwq.com%2F201612%2F1482144508944947.jpeg\"],\"faceToken\":[\"sa65d6as53ds2a32\"],\"modifyTime\":[\"2019-05-18\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 14:41:00');
INSERT INTO `sys_oper_log` VALUES (469, '学生/老师档案', 3, 'edu.yctc.project.system.infost.controller.InfostController.remove()', 'POST', 1, 'admin', '软件工程', '/system/infost/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"134\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 14:48:39');
INSERT INTO `sys_oper_log` VALUES (470, '代码生成', 6, 'edu.yctc.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '软件工程', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_student_state\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 15:29:45');
INSERT INTO `sys_oper_log` VALUES (471, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_student_state', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-17 15:29:48');
INSERT INTO `sys_oper_log` VALUES (472, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_student_state', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-17 15:29:49');
INSERT INTO `sys_oper_log` VALUES (473, '代码生成', 6, 'edu.yctc.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '软件工程', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_student_courseState\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 15:33:17');
INSERT INTO `sys_oper_log` VALUES (474, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_student_courseState', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-17 15:33:19');
INSERT INTO `sys_oper_log` VALUES (475, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_student_courseState', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-17 15:33:20');
INSERT INTO `sys_oper_log` VALUES (476, '字典类型', 1, 'edu.yctc.project.system.dict.controller.DictTypeController.addSave()', 'POST', 1, 'admin', '软件工程', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"学生状态\"],\"dictType\":[\"sys_stu_state\"],\"status\":[\"0\"],\"remark\":[\"学生状态等级\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 15:39:46');
INSERT INTO `sys_oper_log` VALUES (477, '字典数据', 1, 'edu.yctc.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '软件工程', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"认真听课\"],\"dictValue\":[\"10\"],\"dictType\":[\"sys_stu_state\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"学生状态-认真听课\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 15:51:58');
INSERT INTO `sys_oper_log` VALUES (478, '字典数据', 1, 'edu.yctc.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '软件工程', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"玩手机\"],\"dictValue\":[\"6\"],\"dictType\":[\"sys_stu_state\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"学生状态-玩手机\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 15:52:37');
INSERT INTO `sys_oper_log` VALUES (479, '字典数据', 1, 'edu.yctc.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '软件工程', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"发呆\"],\"dictValue\":[\"8\"],\"dictType\":[\"sys_stu_state\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"info\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"学生状态-发呆\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 15:53:05');
INSERT INTO `sys_oper_log` VALUES (480, '字典数据', 1, 'edu.yctc.project.system.dict.controller.DictDataController.addSave()', 'POST', 1, 'admin', '软件工程', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"睡觉\"],\"dictValue\":[\"7\"],\"dictType\":[\"sys_stu_state\"],\"cssClass\":[\"\"],\"dictSort\":[\"4\"],\"listClass\":[\"danger\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"学生状态-睡觉\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 15:53:30');
INSERT INTO `sys_oper_log` VALUES (481, '字典数据', 2, 'edu.yctc.project.system.dict.controller.DictDataController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"105\"],\"dictLabel\":[\"睡觉\"],\"dictValue\":[\"4\"],\"dictType\":[\"sys_stu_state\"],\"cssClass\":[\"\"],\"dictSort\":[\"4\"],\"listClass\":[\"danger\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"学生状态-睡觉\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 15:54:56');
INSERT INTO `sys_oper_log` VALUES (482, '字典数据', 2, 'edu.yctc.project.system.dict.controller.DictDataController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"104\"],\"dictLabel\":[\"发呆\"],\"dictValue\":[\"3\"],\"dictType\":[\"sys_stu_state\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"info\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"学生状态-发呆\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 15:55:00');
INSERT INTO `sys_oper_log` VALUES (483, '字典数据', 2, 'edu.yctc.project.system.dict.controller.DictDataController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"103\"],\"dictLabel\":[\"玩手机\"],\"dictValue\":[\"2\"],\"dictType\":[\"sys_stu_state\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"学生状态-玩手机\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 15:55:05');
INSERT INTO `sys_oper_log` VALUES (484, '字典数据', 2, 'edu.yctc.project.system.dict.controller.DictDataController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/dict/data/edit', '127.0.0.1', '内网IP', '{\"dictCode\":[\"102\"],\"dictLabel\":[\"认真听课\"],\"dictValue\":[\"1\"],\"dictType\":[\"sys_stu_state\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"学生状态-认真听课\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 15:55:08');
INSERT INTO `sys_oper_log` VALUES (485, '参数管理', 9, 'edu.yctc.project.system.config.controller.ConfigController.clearCache()', 'GET', 1, 'admin', '软件工程', '/system/config/clearCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 15:58:47');
INSERT INTO `sys_oper_log` VALUES (486, '学生上课状态信息汇总', 3, 'edu.yctc.project.system.courseState.controller.StudentCoursestateController.remove()', 'POST', 1, 'admin', '软件工程', '/system/courseState/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"40\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 16:07:24');
INSERT INTO `sys_oper_log` VALUES (487, '用户管理', 6, 'edu.yctc.project.system.user.controller.UserController.importData()', 'POST', 1, 'admin', '软件工程', '/system/user/importData', '127.0.0.1', '内网IP', '{}', 'null', 1, '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 王小明 已存在', '2020-04-17 16:50:43');
INSERT INTO `sys_oper_log` VALUES (488, '用户管理', 2, 'edu.yctc.project.system.user.controller.UserController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"6\"],\"deptId\":[\"105\"],\"userName\":[\"何亚娟\"],\"dept.deptName\":[\"数字媒体\"],\"phonenumber\":[\"13789677573\"],\"email\":[\"10007@qq.com\"],\"loginName\":[\"何亚娟\"],\"sex\":[\"1\"],\"role\":[\"101\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"101\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 16:52:11');
INSERT INTO `sys_oper_log` VALUES (489, '菜单管理', 2, 'edu.yctc.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2089\"],\"parentId\":[\"2021\"],\"menuType\":[\"C\"],\"menuName\":[\"学生/老师档案\"],\"url\":[\"/system/infost\"],\"target\":[\"menuItem\"],\"perms\":[\"system:infost:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 18:37:46');
INSERT INTO `sys_oper_log` VALUES (490, '菜单管理', 2, 'edu.yctc.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2095\"],\"parentId\":[\"2088\"],\"menuType\":[\"C\"],\"menuName\":[\"学生上课状态信息汇总\"],\"url\":[\"/system/courseState\"],\"target\":[\"menuItem\"],\"perms\":[\"system:courseState:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-17 18:37:59');
INSERT INTO `sys_oper_log` VALUES (491, '菜单管理', 2, 'edu.yctc.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2070\"],\"parentId\":[\"2088\"],\"menuType\":[\"C\"],\"menuName\":[\"学生考勤点名汇总\"],\"url\":[\"/system/attendance\"],\"target\":[\"menuItem\"],\"perms\":[\"system:attendance:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-18 01:33:35');
INSERT INTO `sys_oper_log` VALUES (492, '菜单管理', 2, 'edu.yctc.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2076\"],\"parentId\":[\"2088\"],\"menuType\":[\"C\"],\"menuName\":[\"学生上课评分汇总\"],\"url\":[\"/system/score\"],\"target\":[\"menuItem\"],\"perms\":[\"system:score:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-18 01:33:47');
INSERT INTO `sys_oper_log` VALUES (493, '学生上课状态信息汇总', 2, 'edu.yctc.project.system.courseState.controller.StudentCoursestateController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/courseState/edit', '127.0.0.1', '内网IP', '{\"id\":[\"547\"],\"userId\":[\"1\"],\"lessonId\":[\"583\"],\"state\":[\"4\",\"1\"],\"scanStartTime\":[\"2019-03-11\"],\"scanEndTime\":[\"2019-03-11\"],\"faceToken\":[\"f4b657a27b12a6ef6ffe323d708af84d\"],\"modifyTime\":[\"2020-04-18\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-18 01:54:59');
INSERT INTO `sys_oper_log` VALUES (494, '学生上课状态信息汇总', 2, 'edu.yctc.project.system.courseState.controller.StudentCoursestateController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/courseState/edit', '127.0.0.1', '内网IP', '{\"id\":[\"547\"],\"userId\":[\"1\"],\"lessonId\":[\"583\"],\"state\":[\"1\"],\"scanStartTime\":[\"2019-03-11\"],\"scanEndTime\":[\"2019-03-11\"],\"faceToken\":[\"f4b657a27b12a6ef6ffe323d708af84d\"],\"modifyTime\":[\"2020-04-18\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-18 01:55:26');
INSERT INTO `sys_oper_log` VALUES (495, '学生/老师档案', 1, 'edu.yctc.project.system.infost.controller.InfostController.addSave()', 'POST', 1, 'admin', '软件工程', '/system/infost/add', '127.0.0.1', '内网IP', '{\"userId\":[\"99999\"],\"academyId\":[\"1\"],\"classId\":[\"1\"],\"number\":[\"1812630716\"],\"name\":[\"王小二\"],\"type\":[\"0\"],\"sex\":[\"0\"],\"idCardNumber\":[\"320586199901011112\"],\"phone\":[\"15696756582\"],\"mail\":[\"12312312@qq.com\"],\"picture\":[\"https://images.app.goo.gl/ds7Yh3c2VGeDQB277\"],\"faceToken\":[\"\"],\"modifyTime\":[\"2019-07-17\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-18 02:05:54');
INSERT INTO `sys_oper_log` VALUES (496, '学生/老师档案', 3, 'edu.yctc.project.system.infost.controller.InfostController.remove()', 'POST', 1, 'admin', '软件工程', '/system/infost/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"135\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-18 02:06:25');
INSERT INTO `sys_oper_log` VALUES (497, '学生/老师档案', 2, 'edu.yctc.project.system.infost.controller.InfostController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/infost/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"userId\":[\"1\"],\"academyId\":[\"1\"],\"classId\":[\"1\"],\"number\":[\"1812630715\"],\"name\":[\"王小明\"],\"type\":[\"0\"],\"sex\":[\"0\"],\"idCardNumber\":[\"320586199901011112\"],\"phone\":[\"17715939829\"],\"mail\":[\"1527215026@qq.com\"],\"picture\":[\"https://timgsa.baidu.com/timg?image&amp;quality=80&amp;size=b9999_10000&amp;sec=1554820249936&amp;di=8871a4e90aed756b0179b2b241a5c2bc&amp;imgtype=0&amp;src=http%3A%2F%2Fimg.cwq.com%2F201612%2F1482144508944947.jpeg\"],\"faceToken\":[\"sa65d6as53ds2a32\"],\"modifyTime\":[\"2019-05-17\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-18 12:21:06');
INSERT INTO `sys_oper_log` VALUES (498, '学生上课评分汇总', 1, 'edu.yctc.project.system.score.controller.ClassScoreController.addSave()', 'POST', 1, 'admin', '软件工程', '/system/score/add', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"lessonId\":[\"1\"],\"score\":[\"1\"],\"modifyTime\":[\"2020-04-15\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-18 12:37:38');
INSERT INTO `sys_oper_log` VALUES (499, '学生上课评分汇总', 2, 'edu.yctc.project.system.score.controller.ClassScoreController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/score/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2082\"],\"userId\":[\"1\"],\"lessonId\":[\"595\"],\"score\":[\"1.0\"],\"modifyTime\":[\"2020-04-15\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-18 12:38:20');
INSERT INTO `sys_oper_log` VALUES (500, '学生上课评分汇总', 3, 'edu.yctc.project.system.score.controller.ClassScoreController.remove()', 'POST', 1, 'admin', '软件工程', '/system/score/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2082\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-18 12:38:26');
INSERT INTO `sys_oper_log` VALUES (501, '代码生成', 6, 'edu.yctc.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '软件工程', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_student_course\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-18 13:20:13');
INSERT INTO `sys_oper_log` VALUES (502, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_student_course', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-18 13:20:16');
INSERT INTO `sys_oper_log` VALUES (503, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_student_course', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-18 13:20:18');
INSERT INTO `sys_oper_log` VALUES (504, '代码生成', 6, 'edu.yctc.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '软件工程', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_course_stu\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-18 13:22:57');
INSERT INTO `sys_oper_log` VALUES (505, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_course_stu', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-18 13:23:19');
INSERT INTO `sys_oper_log` VALUES (506, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_course_stu', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-18 13:23:19');
INSERT INTO `sys_oper_log` VALUES (507, '代码生成', 6, 'edu.yctc.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '软件工程', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_lesson_tea\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-18 13:26:06');
INSERT INTO `sys_oper_log` VALUES (508, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_lesson_tea', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-18 13:26:13');
INSERT INTO `sys_oper_log` VALUES (509, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_lesson_tea', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-18 13:26:13');
INSERT INTO `sys_oper_log` VALUES (510, '老师授课信息', 1, 'edu.yctc.project.system.tea.controller.LessonTeaController.addSave()', 'POST', 1, 'admin', '软件工程', '/system/tea/add', '127.0.0.1', '内网IP', '{\"userId\":[\"99\"],\"lessonId\":[\"600\"],\"modifyTime\":[\"2020-04-23\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-18 16:37:42');
INSERT INTO `sys_oper_log` VALUES (511, '老师授课信息', 3, 'edu.yctc.project.system.tea.controller.LessonTeaController.remove()', 'POST', 1, 'admin', '软件工程', '/system/tea/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"153\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-18 16:37:54');
INSERT INTO `sys_oper_log` VALUES (512, '菜单管理', 2, 'edu.yctc.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2101\"],\"parentId\":[\"2021\"],\"menuType\":[\"C\"],\"menuName\":[\"学生课程信息\"],\"url\":[\"/system/stu\"],\"target\":[\"menuItem\"],\"perms\":[\"system:stu:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-18 16:44:16');
INSERT INTO `sys_oper_log` VALUES (513, '菜单管理', 2, 'edu.yctc.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2107\"],\"parentId\":[\"2021\"],\"menuType\":[\"C\"],\"menuName\":[\"老师授课信息\"],\"url\":[\"/system/tea\"],\"target\":[\"menuItem\"],\"perms\":[\"system:tea:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-18 16:44:30');
INSERT INTO `sys_oper_log` VALUES (514, '代码生成', 6, 'edu.yctc.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '软件工程', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_knowledge_lesson\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-18 17:48:30');
INSERT INTO `sys_oper_log` VALUES (515, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_knowledge_lesson', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-18 17:48:41');
INSERT INTO `sys_oper_log` VALUES (516, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_knowledge_lesson', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-18 17:48:42');
INSERT INTO `sys_oper_log` VALUES (517, '代码生成', 6, 'edu.yctc.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '软件工程', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_lesson_knowledge\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-18 17:50:17');
INSERT INTO `sys_oper_log` VALUES (518, '代码生成', 6, 'edu.yctc.project.tool.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '软件工程', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_lesson_know\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-18 17:50:52');
INSERT INTO `sys_oper_log` VALUES (519, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_lesson_know', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-18 17:50:59');
INSERT INTO `sys_oper_log` VALUES (520, '代码生成', 8, 'edu.yctc.project.tool.gen.controller.GenController.genCode()', 'GET', 1, 'admin', '软件工程', '/tool/gen/genCode/sys_lesson_know', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-04-18 17:50:59');
INSERT INTO `sys_oper_log` VALUES (521, '课时知识点信息', 5, 'edu.yctc.project.system.know.controller.LessonKnowController.export()', 'POST', 1, 'admin', '软件工程', '/system/know/export', '127.0.0.1', '内网IP', '{\"lessonId\":[\"\"],\"knowledgeId\":[\"\"],\"params[beginModifyTime]\":[\"\"],\"params[endModifyTime]\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"7b28b5a7-f8cf-48d4-bd03-6779c1644919_know.xlsx\",\"code\":0}', 0, NULL, '2020-04-18 18:04:17');
INSERT INTO `sys_oper_log` VALUES (522, '菜单管理', 2, 'edu.yctc.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2113\"],\"parentId\":[\"2021\"],\"menuType\":[\"C\"],\"menuName\":[\"课时知识点信息\"],\"url\":[\"/system/know\"],\"target\":[\"menuItem\"],\"perms\":[\"system:know:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-address-card-o\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-18 18:08:01');
INSERT INTO `sys_oper_log` VALUES (523, '菜单管理', 2, 'edu.yctc.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2113\"],\"parentId\":[\"2021\"],\"menuType\":[\"M\"],\"menuName\":[\"课时知识点信息\"],\"url\":[\"/system/know\"],\"target\":[\"menuItem\"],\"perms\":[\"system:know:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-address-card-o\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-18 18:08:57');
INSERT INTO `sys_oper_log` VALUES (524, '菜单管理', 2, 'edu.yctc.project.system.menu.controller.MenuController.editSave()', 'POST', 1, 'admin', '软件工程', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2113\"],\"parentId\":[\"2021\"],\"menuType\":[\"C\"],\"menuName\":[\"课时知识点信息\"],\"url\":[\"/system/know\"],\"target\":[\"menuItem\"],\"perms\":[\"system:know:view\"],\"orderNum\":[\"1\"],\"icon\":[\"/\"],\"visible\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2020-04-18 18:09:57');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'doaa', '教务处处长', 1, '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-15 22:15:45', 'Director of Academic Affairs');
INSERT INTO `sys_post` VALUES (2, 'se', '教导员', 2, '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-15 22:16:49', '');
INSERT INTO `sys_post` VALUES (3, 'hr', '辅导员', 3, '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-15 22:16:55', '');
INSERT INTO `sys_post` VALUES (4, 'user', '任课教师', 4, '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-04-15 22:17:07', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-20 21:13:01', '管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-03-20 21:12:48', '普通角色');
INSERT INTO `sys_role` VALUES (100, '教师', 'teacher', 2, '1', '0', '0', 'admin', '2020-04-15 22:27:45', '', NULL, '教师角色');
INSERT INTO `sys_role` VALUES (101, '学生', 'student', 4, '1', '0', '0', 'admin', '2020-04-17 10:20:48', '', NULL, '学生角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 100);
INSERT INTO `sys_role_menu` VALUES (1, 101);
INSERT INTO `sys_role_menu` VALUES (1, 102);
INSERT INTO `sys_role_menu` VALUES (1, 103);
INSERT INTO `sys_role_menu` VALUES (1, 104);
INSERT INTO `sys_role_menu` VALUES (1, 105);
INSERT INTO `sys_role_menu` VALUES (1, 106);
INSERT INTO `sys_role_menu` VALUES (1, 107);
INSERT INTO `sys_role_menu` VALUES (1, 108);
INSERT INTO `sys_role_menu` VALUES (1, 500);
INSERT INTO `sys_role_menu` VALUES (1, 501);
INSERT INTO `sys_role_menu` VALUES (1, 1000);
INSERT INTO `sys_role_menu` VALUES (1, 1001);
INSERT INTO `sys_role_menu` VALUES (1, 1002);
INSERT INTO `sys_role_menu` VALUES (1, 1003);
INSERT INTO `sys_role_menu` VALUES (1, 1004);
INSERT INTO `sys_role_menu` VALUES (1, 1005);
INSERT INTO `sys_role_menu` VALUES (1, 1006);
INSERT INTO `sys_role_menu` VALUES (1, 1007);
INSERT INTO `sys_role_menu` VALUES (1, 1009);
INSERT INTO `sys_role_menu` VALUES (1, 1010);
INSERT INTO `sys_role_menu` VALUES (1, 1011);
INSERT INTO `sys_role_menu` VALUES (1, 1012);
INSERT INTO `sys_role_menu` VALUES (1, 1013);
INSERT INTO `sys_role_menu` VALUES (1, 1014);
INSERT INTO `sys_role_menu` VALUES (1, 1015);
INSERT INTO `sys_role_menu` VALUES (1, 1016);
INSERT INTO `sys_role_menu` VALUES (1, 1017);
INSERT INTO `sys_role_menu` VALUES (1, 1018);
INSERT INTO `sys_role_menu` VALUES (1, 1019);
INSERT INTO `sys_role_menu` VALUES (1, 1020);
INSERT INTO `sys_role_menu` VALUES (1, 1021);
INSERT INTO `sys_role_menu` VALUES (1, 1022);
INSERT INTO `sys_role_menu` VALUES (1, 1023);
INSERT INTO `sys_role_menu` VALUES (1, 1024);
INSERT INTO `sys_role_menu` VALUES (1, 1025);
INSERT INTO `sys_role_menu` VALUES (1, 1026);
INSERT INTO `sys_role_menu` VALUES (1, 1027);
INSERT INTO `sys_role_menu` VALUES (1, 1028);
INSERT INTO `sys_role_menu` VALUES (1, 1029);
INSERT INTO `sys_role_menu` VALUES (1, 1030);
INSERT INTO `sys_role_menu` VALUES (1, 1031);
INSERT INTO `sys_role_menu` VALUES (1, 1032);
INSERT INTO `sys_role_menu` VALUES (1, 1033);
INSERT INTO `sys_role_menu` VALUES (1, 1034);
INSERT INTO `sys_role_menu` VALUES (1, 1035);
INSERT INTO `sys_role_menu` VALUES (1, 1036);
INSERT INTO `sys_role_menu` VALUES (1, 1037);
INSERT INTO `sys_role_menu` VALUES (1, 1038);
INSERT INTO `sys_role_menu` VALUES (1, 1039);
INSERT INTO `sys_role_menu` VALUES (1, 1040);
INSERT INTO `sys_role_menu` VALUES (1, 1041);
INSERT INTO `sys_role_menu` VALUES (1, 1042);
INSERT INTO `sys_role_menu` VALUES (1, 1043);
INSERT INTO `sys_role_menu` VALUES (1, 1044);
INSERT INTO `sys_role_menu` VALUES (1, 1045);
INSERT INTO `sys_role_menu` VALUES (1, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 1061);

-- ----------------------------
-- Table structure for sys_student_courseState
-- ----------------------------
DROP TABLE IF EXISTS `sys_student_courseState`;
CREATE TABLE `sys_student_courseState`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `lesson_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '课时id',
  `state` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '学生上课状态',
  `scan_start_time` datetime(6) NULL DEFAULT NULL COMMENT '扫描开始时间',
  `scan_end_time` datetime(6) NULL DEFAULT NULL COMMENT '扫描结束时间',
  `face_token` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人脸标识',
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1106 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生上课状态信息汇总' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_student_courseState
-- ----------------------------
INSERT INTO `sys_student_courseState` VALUES (546, 1, 582, 1, '2019-03-10 08:00:00.000000', '2019-03-10 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:05.979222');
INSERT INTO `sys_student_courseState` VALUES (547, 1, 583, 1, '2019-03-11 00:00:00.000000', '2019-03-11 00:00:00.000000', 'f4b657a27b12a6ef6ffe323d708af84d', '2020-04-18 01:18:12.958000', '2020-04-18 00:00:00.000000');
INSERT INTO `sys_student_courseState` VALUES (548, 1, 584, 2, '2019-03-12 08:00:00.000000', '2019-03-12 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:06.258544');
INSERT INTO `sys_student_courseState` VALUES (549, 1, 585, 1, '2019-03-13 08:00:00.000000', '2019-03-13 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (550, 1, 586, 4, '2019-03-14 08:00:00.000000', '2019-03-14 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:06.543531');
INSERT INTO `sys_student_courseState` VALUES (551, 1, 587, 1, '2019-03-15 08:00:00.000000', '2019-03-15 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (552, 1, 588, 1, '2019-03-16 08:00:00.000000', '2019-03-16 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:06.827641');
INSERT INTO `sys_student_courseState` VALUES (553, 1, 589, 1, '2018-10-17 08:00:00.000000', '2018-10-17 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:06.968208');
INSERT INTO `sys_student_courseState` VALUES (554, 1, 590, 3, '2018-10-18 08:00:00.000000', '2018-10-18 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:07.112742');
INSERT INTO `sys_student_courseState` VALUES (555, 1, 591, 1, '2018-10-19 08:00:00.000000', '2018-10-19 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:07.254293');
INSERT INTO `sys_student_courseState` VALUES (556, 1, 592, 1, '2018-10-20 08:00:00.000000', '2018-10-20 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (557, 1, 593, 2, '2018-10-21 08:00:00.000000', '2018-10-21 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:07.541367');
INSERT INTO `sys_student_courseState` VALUES (558, 1, 594, 4, '2018-10-22 08:00:00.000000', '2018-10-22 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:07.685358');
INSERT INTO `sys_student_courseState` VALUES (559, 1, 595, 1, '2018-10-23 08:00:00.000000', '2018-10-23 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (560, 2, 582, 1, '2019-03-10 08:00:00.000000', '2019-03-10 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:18:12.958000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (561, 2, 583, 1, '2019-03-11 08:00:00.000000', '2019-03-11 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (562, 2, 584, 1, '2019-03-12 08:00:00.000000', '2019-03-12 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:18:12.958000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (563, 2, 585, 2, '2019-03-13 08:00:00.000000', '2019-03-13 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:08.399073');
INSERT INTO `sys_student_courseState` VALUES (564, 2, 586, 3, '2019-03-14 08:00:00.000000', '2019-03-14 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:08.539664');
INSERT INTO `sys_student_courseState` VALUES (565, 2, 587, 1, '2019-03-15 08:00:00.000000', '2019-03-15 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (566, 2, 588, 1, '2019-03-16 08:00:00.000000', '2019-03-16 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:18:12.958000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (567, 2, 589, 2, '2018-10-17 08:00:00.000000', '2018-10-17 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:08.956465');
INSERT INTO `sys_student_courseState` VALUES (568, 2, 590, 3, '2018-10-18 08:00:00.000000', '2018-10-18 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:09.096151');
INSERT INTO `sys_student_courseState` VALUES (569, 2, 591, 3, '2018-10-19 08:00:00.000000', '2018-10-19 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:09.241614');
INSERT INTO `sys_student_courseState` VALUES (570, 2, 592, 1, '2018-10-20 08:00:00.000000', '2018-10-20 09:40:00.000000', '57d70109c37a4d000fa97fec5ab6ce7d', '2020-04-18 01:18:12.958000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (571, 2, 593, 1, '2018-10-21 08:00:00.000000', '2018-10-21 09:40:00.000000', '64ba393ee94b1c7779ef8be56dedf2ca', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:09.521831');
INSERT INTO `sys_student_courseState` VALUES (572, 2, 594, 2, '2018-10-22 08:00:00.000000', '2018-10-22 09:40:00.000000', '3a0bddf4fb415256344df4e2a4203cbe', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:09.675175');
INSERT INTO `sys_student_courseState` VALUES (573, 2, 595, 1, '2018-10-23 08:00:00.000000', '2018-10-23 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:18:12.958000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (574, 3, 582, 1, '2019-03-10 08:00:00.000000', '2019-03-10 09:40:00.000000', 'f6dbaa1cdb3eca9fde3b9efced58a8e3', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:09.957362');
INSERT INTO `sys_student_courseState` VALUES (575, 3, 583, 4, '2019-03-11 08:00:00.000000', '2019-03-11 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:10.093951');
INSERT INTO `sys_student_courseState` VALUES (576, 3, 584, 1, '2019-03-12 08:00:00.000000', '2019-03-12 09:40:00.000000', 'b11a8406ad32630ff48080c99ecf4cfb', '2020-04-18 01:18:12.958000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (577, 3, 585, 1, '2019-03-13 08:00:00.000000', '2019-03-13 09:40:00.000000', '7d2fcf0d7d983da1d1dda586352d3132', '2020-04-18 01:18:12.958000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (578, 3, 586, 1, '2019-03-14 08:00:00.000000', '2019-03-14 09:40:00.000000', 'd63843d9d0ecc28e480c710846993c8e', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:10.516663');
INSERT INTO `sys_student_courseState` VALUES (579, 3, 587, 2, '2019-03-15 08:00:00.000000', '2019-03-15 09:40:00.000000', '1ed8835863ffbdedf3b7ddc9336fee63', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:10.660215');
INSERT INTO `sys_student_courseState` VALUES (580, 3, 588, 4, '2019-03-16 08:00:00.000000', '2019-03-16 09:40:00.000000', '57d70109c37a4d000fa97fec5ab6ce7d', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:10.800809');
INSERT INTO `sys_student_courseState` VALUES (581, 3, 589, 2, '2018-10-17 08:00:00.000000', '2018-10-17 09:40:00.000000', '64ba393ee94b1c7779ef8be56dedf2ca', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:10.942361');
INSERT INTO `sys_student_courseState` VALUES (582, 3, 590, 4, '2018-10-18 08:00:00.000000', '2018-10-18 09:40:00.000000', '3a0bddf4fb415256344df4e2a4203cbe', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:11.084931');
INSERT INTO `sys_student_courseState` VALUES (583, 3, 591, 1, '2018-10-19 08:00:00.000000', '2018-10-19 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:18:12.958000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (584, 3, 592, 4, '2018-10-20 08:00:00.000000', '2018-10-20 09:40:00.000000', 'f6dbaa1cdb3eca9fde3b9efced58a8e3', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:11.365166');
INSERT INTO `sys_student_courseState` VALUES (585, 3, 593, 1, '2018-10-21 08:00:00.000000', '2018-10-21 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (586, 3, 594, 3, '2018-10-22 08:00:00.000000', '2018-10-22 09:40:00.000000', 'b11a8406ad32630ff48080c99ecf4cfb', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:11.647238');
INSERT INTO `sys_student_courseState` VALUES (587, 3, 595, 2, '2018-10-23 08:00:00.000000', '2018-10-23 09:40:00.000000', '7d2fcf0d7d983da1d1dda586352d3132', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:11.784917');
INSERT INTO `sys_student_courseState` VALUES (588, 4, 582, 1, '2019-03-10 08:00:00.000000', '2019-03-10 09:40:00.000000', 'd63843d9d0ecc28e480c710846993c8e', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:11.925495');
INSERT INTO `sys_student_courseState` VALUES (589, 4, 583, 3, '2019-03-11 08:00:00.000000', '2019-03-11 09:40:00.000000', '1ed8835863ffbdedf3b7ddc9336fee63', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:12.064122');
INSERT INTO `sys_student_courseState` VALUES (590, 4, 584, 4, '2019-03-12 08:00:00.000000', '2019-03-12 09:40:00.000000', '57d70109c37a4d000fa97fec5ab6ce7d', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:12.203709');
INSERT INTO `sys_student_courseState` VALUES (591, 4, 585, 1, '2019-03-13 08:00:00.000000', '2019-03-13 09:40:00.000000', '64ba393ee94b1c7779ef8be56dedf2ca', '2020-04-18 01:18:12.958000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (592, 4, 586, 1, '2019-03-14 08:00:00.000000', '2019-03-14 09:40:00.000000', '3a0bddf4fb415256344df4e2a4203cbe', '2020-04-18 01:18:12.958000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (593, 4, 587, 3, '2019-03-15 08:00:00.000000', '2019-03-15 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:12.625893');
INSERT INTO `sys_student_courseState` VALUES (594, 4, 588, 1, '2019-03-16 08:00:00.000000', '2019-03-16 09:40:00.000000', 'f6dbaa1cdb3eca9fde3b9efced58a8e3', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:12.765473');
INSERT INTO `sys_student_courseState` VALUES (595, 4, 589, 4, '2018-10-17 08:00:00.000000', '2018-10-17 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:12.903147');
INSERT INTO `sys_student_courseState` VALUES (596, 4, 590, 4, '2018-10-18 08:00:00.000000', '2018-10-18 09:40:00.000000', 'b11a8406ad32630ff48080c99ecf4cfb', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:13.042736');
INSERT INTO `sys_student_courseState` VALUES (597, 4, 591, 4, '2018-10-19 08:00:00.000000', '2018-10-19 09:40:00.000000', '7d2fcf0d7d983da1d1dda586352d3132', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:13.181359');
INSERT INTO `sys_student_courseState` VALUES (598, 4, 592, 1, '2018-10-20 08:00:00.000000', '2018-10-20 09:40:00.000000', 'd63843d9d0ecc28e480c710846993c8e', '2020-04-18 01:18:12.958000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (599, 4, 593, 1, '2018-10-21 08:00:00.000000', '2018-10-21 09:40:00.000000', '1ed8835863ffbdedf3b7ddc9336fee63', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:13.464484');
INSERT INTO `sys_student_courseState` VALUES (600, 4, 594, 2, '2018-10-22 08:00:00.000000', '2018-10-22 09:40:00.000000', '57d70109c37a4d000fa97fec5ab6ce7d', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:13.606022');
INSERT INTO `sys_student_courseState` VALUES (601, 4, 595, 2, '2018-10-23 08:00:00.000000', '2018-10-23 09:40:00.000000', '64ba393ee94b1c7779ef8be56dedf2ca', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:13.745678');
INSERT INTO `sys_student_courseState` VALUES (602, 5, 582, 4, '2019-03-10 08:00:00.000000', '2019-03-10 09:40:00.000000', '3a0bddf4fb415256344df4e2a4203cbe', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:13.886277');
INSERT INTO `sys_student_courseState` VALUES (603, 5, 583, 4, '2019-03-11 08:00:00.000000', '2019-03-11 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:14.026813');
INSERT INTO `sys_student_courseState` VALUES (604, 5, 584, 4, '2019-03-12 08:00:00.000000', '2019-03-12 09:40:00.000000', 'f6dbaa1cdb3eca9fde3b9efced58a8e3', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:14.166416');
INSERT INTO `sys_student_courseState` VALUES (605, 5, 585, 1, '2019-03-13 08:00:00.000000', '2019-03-13 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:14.304068');
INSERT INTO `sys_student_courseState` VALUES (606, 5, 586, 1, '2019-03-14 08:00:00.000000', '2019-03-14 09:40:00.000000', 'b11a8406ad32630ff48080c99ecf4cfb', '2020-04-18 01:18:12.958000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (607, 5, 587, 3, '2019-03-15 08:00:00.000000', '2019-03-15 09:40:00.000000', '7d2fcf0d7d983da1d1dda586352d3132', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:14.583287');
INSERT INTO `sys_student_courseState` VALUES (608, 5, 588, 3, '2019-03-16 08:00:00.000000', '2019-03-16 09:40:00.000000', 'd63843d9d0ecc28e480c710846993c8e', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:14.721875');
INSERT INTO `sys_student_courseState` VALUES (609, 5, 589, 3, '2018-10-17 08:00:00.000000', '2018-10-17 09:40:00.000000', '1ed8835863ffbdedf3b7ddc9336fee63', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:14.861450');
INSERT INTO `sys_student_courseState` VALUES (610, 5, 590, 3, '2018-10-18 08:00:00.000000', '2018-10-18 09:40:00.000000', '57d70109c37a4d000fa97fec5ab6ce7d', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:15.000085');
INSERT INTO `sys_student_courseState` VALUES (611, 5, 591, 4, '2018-10-19 08:00:00.000000', '2018-10-19 09:40:00.000000', '64ba393ee94b1c7779ef8be56dedf2ca', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:15.141640');
INSERT INTO `sys_student_courseState` VALUES (612, 5, 592, 1, '2018-10-20 08:00:00.000000', '2018-10-20 09:40:00.000000', '3a0bddf4fb415256344df4e2a4203cbe', '2020-04-18 01:18:12.958000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (613, 5, 593, 4, '2018-10-21 08:00:00.000000', '2018-10-21 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:15.425777');
INSERT INTO `sys_student_courseState` VALUES (614, 5, 594, 1, '2018-10-22 08:00:00.000000', '2018-10-22 09:40:00.000000', 'f6dbaa1cdb3eca9fde3b9efced58a8e3', '2020-04-18 01:18:12.958000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (615, 5, 595, 1, '2018-10-23 08:00:00.000000', '2018-10-23 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:15.707913');
INSERT INTO `sys_student_courseState` VALUES (616, 6, 582, 3, '2019-03-10 08:00:00.000000', '2019-03-10 09:40:00.000000', 'b11a8406ad32630ff48080c99ecf4cfb', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:15.848543');
INSERT INTO `sys_student_courseState` VALUES (617, 6, 583, 2, '2019-03-11 08:00:00.000000', '2019-03-11 09:40:00.000000', '7d2fcf0d7d983da1d1dda586352d3132', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:15.990079');
INSERT INTO `sys_student_courseState` VALUES (618, 6, 584, 4, '2019-03-12 08:00:00.000000', '2019-03-12 09:40:00.000000', 'd63843d9d0ecc28e480c710846993c8e', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:16.132692');
INSERT INTO `sys_student_courseState` VALUES (619, 6, 585, 1, '2019-03-13 08:00:00.000000', '2019-03-13 09:40:00.000000', '1ed8835863ffbdedf3b7ddc9336fee63', '2020-04-18 01:18:12.958000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (620, 6, 586, 1, '2019-03-14 08:00:00.000000', '2019-03-14 09:40:00.000000', '57d70109c37a4d000fa97fec5ab6ce7d', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:16.415736');
INSERT INTO `sys_student_courseState` VALUES (621, 6, 587, 1, '2019-03-15 08:00:00.000000', '2019-03-15 09:40:00.000000', '64ba393ee94b1c7779ef8be56dedf2ca', '2020-04-18 01:18:12.958000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (622, 6, 588, 3, '2019-03-16 08:00:00.000000', '2019-03-16 09:40:00.000000', '3a0bddf4fb415256344df4e2a4203cbe', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:16.694993');
INSERT INTO `sys_student_courseState` VALUES (623, 6, 589, 1, '2018-10-17 08:00:00.000000', '2018-10-17 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:18:12.958000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (624, 6, 590, 3, '2018-10-18 08:00:00.000000', '2018-10-18 09:40:00.000000', 'f6dbaa1cdb3eca9fde3b9efced58a8e3', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:16.972217');
INSERT INTO `sys_student_courseState` VALUES (625, 6, 591, 1, '2018-10-19 08:00:00.000000', '2018-10-19 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:17.110857');
INSERT INTO `sys_student_courseState` VALUES (626, 6, 592, 3, '2018-10-20 08:00:00.000000', '2018-10-20 09:40:00.000000', 'b11a8406ad32630ff48080c99ecf4cfb', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:17.253405');
INSERT INTO `sys_student_courseState` VALUES (627, 6, 593, 4, '2018-10-21 08:00:00.000000', '2018-10-21 09:40:00.000000', '7d2fcf0d7d983da1d1dda586352d3132', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:17.394981');
INSERT INTO `sys_student_courseState` VALUES (628, 6, 594, 4, '2018-10-22 08:00:00.000000', '2018-10-22 09:40:00.000000', 'd63843d9d0ecc28e480c710846993c8e', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:17.533572');
INSERT INTO `sys_student_courseState` VALUES (629, 6, 595, 2, '2018-10-23 08:00:00.000000', '2018-10-23 09:40:00.000000', '1ed8835863ffbdedf3b7ddc9336fee63', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:17.673613');
INSERT INTO `sys_student_courseState` VALUES (630, 7, 582, 1, '2019-03-10 08:00:00.000000', '2019-03-10 09:40:00.000000', '57d70109c37a4d000fa97fec5ab6ce7d', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:17.815169');
INSERT INTO `sys_student_courseState` VALUES (631, 7, 583, 2, '2019-03-11 08:00:00.000000', '2019-03-11 09:40:00.000000', '64ba393ee94b1c7779ef8be56dedf2ca', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:17.955006');
INSERT INTO `sys_student_courseState` VALUES (632, 7, 584, 2, '2019-03-12 08:00:00.000000', '2019-03-12 09:40:00.000000', '3a0bddf4fb415256344df4e2a4203cbe', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:18.095326');
INSERT INTO `sys_student_courseState` VALUES (633, 7, 585, 1, '2019-03-13 08:00:00.000000', '2019-03-13 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:18:12.958000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (634, 7, 586, 4, '2019-03-14 08:00:00.000000', '2019-03-14 09:40:00.000000', 'f6dbaa1cdb3eca9fde3b9efced58a8e3', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:18.375541');
INSERT INTO `sys_student_courseState` VALUES (635, 7, 587, 1, '2019-03-15 08:00:00.000000', '2019-03-15 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:18.515142');
INSERT INTO `sys_student_courseState` VALUES (636, 7, 588, 2, '2019-03-16 08:00:00.000000', '2019-03-16 09:40:00.000000', 'b11a8406ad32630ff48080c99ecf4cfb', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:18.657684');
INSERT INTO `sys_student_courseState` VALUES (637, 7, 589, 1, '2018-10-17 08:00:00.000000', '2018-10-17 09:40:00.000000', '7d2fcf0d7d983da1d1dda586352d3132', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:18.796481');
INSERT INTO `sys_student_courseState` VALUES (638, 7, 590, 3, '2018-10-18 08:00:00.000000', '2018-10-18 09:40:00.000000', 'd63843d9d0ecc28e480c710846993c8e', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:18.936865');
INSERT INTO `sys_student_courseState` VALUES (639, 7, 591, 1, '2018-10-19 08:00:00.000000', '2018-10-19 09:40:00.000000', '1ed8835863ffbdedf3b7ddc9336fee63', '2020-04-18 01:18:12.958000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (640, 7, 592, 1, '2018-10-20 08:00:00.000000', '2018-10-20 09:40:00.000000', '57d70109c37a4d000fa97fec5ab6ce7d', '2020-04-18 01:18:12.958000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (641, 7, 593, 4, '2018-10-21 08:00:00.000000', '2018-10-21 09:40:00.000000', '64ba393ee94b1c7779ef8be56dedf2ca', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:19.356662');
INSERT INTO `sys_student_courseState` VALUES (642, 7, 594, 1, '2018-10-22 08:00:00.000000', '2018-10-22 09:40:00.000000', '3a0bddf4fb415256344df4e2a4203cbe', '2020-04-18 01:18:12.958000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (643, 7, 595, 2, '2018-10-23 08:00:00.000000', '2018-10-23 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:19.636881');
INSERT INTO `sys_student_courseState` VALUES (644, 8, 582, 4, '2019-03-10 08:00:00.000000', '2019-03-10 09:40:00.000000', 'f6dbaa1cdb3eca9fde3b9efced58a8e3', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:19.776458');
INSERT INTO `sys_student_courseState` VALUES (645, 8, 583, 1, '2019-03-11 08:00:00.000000', '2019-03-11 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:19.915077');
INSERT INTO `sys_student_courseState` VALUES (646, 8, 584, 1, '2019-03-12 08:00:00.000000', '2019-03-12 09:40:00.000000', 'b11a8406ad32630ff48080c99ecf4cfb', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:20.055684');
INSERT INTO `sys_student_courseState` VALUES (647, 8, 585, 3, '2019-03-13 08:00:00.000000', '2019-03-13 09:40:00.000000', '7d2fcf0d7d983da1d1dda586352d3132', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:20.197220');
INSERT INTO `sys_student_courseState` VALUES (648, 8, 586, 1, '2019-03-14 08:00:00.000000', '2019-03-14 09:40:00.000000', 'd63843d9d0ecc28e480c710846993c8e', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:20.363410');
INSERT INTO `sys_student_courseState` VALUES (649, 8, 587, 4, '2019-03-15 08:00:00.000000', '2019-03-15 09:40:00.000000', '1ed8835863ffbdedf3b7ddc9336fee63', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:20.506895');
INSERT INTO `sys_student_courseState` VALUES (650, 8, 588, 2, '2019-03-16 08:00:00.000000', '2019-03-16 09:40:00.000000', '57d70109c37a4d000fa97fec5ab6ce7d', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:20.645562');
INSERT INTO `sys_student_courseState` VALUES (651, 8, 589, 4, '2018-10-17 08:00:00.000000', '2018-10-17 09:40:00.000000', '64ba393ee94b1c7779ef8be56dedf2ca', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:20.785157');
INSERT INTO `sys_student_courseState` VALUES (652, 8, 590, 3, '2018-10-18 08:00:00.000000', '2018-10-18 09:40:00.000000', '3a0bddf4fb415256344df4e2a4203cbe', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:20.923742');
INSERT INTO `sys_student_courseState` VALUES (653, 8, 591, 1, '2018-10-19 08:00:00.000000', '2018-10-19 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:21.061374');
INSERT INTO `sys_student_courseState` VALUES (654, 8, 592, 3, '2018-10-20 08:00:00.000000', '2018-10-20 09:40:00.000000', 'f6dbaa1cdb3eca9fde3b9efced58a8e3', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:21.200075');
INSERT INTO `sys_student_courseState` VALUES (655, 8, 593, 1, '2018-10-21 08:00:00.000000', '2018-10-21 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:23:35.846544');
INSERT INTO `sys_student_courseState` VALUES (656, 8, 594, 1, '2018-10-22 08:00:00.000000', '2018-10-22 09:40:00.000000', 'b11a8406ad32630ff48080c99ecf4cfb', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:21.485103');
INSERT INTO `sys_student_courseState` VALUES (657, 8, 595, 4, '2018-10-23 08:00:00.000000', '2018-10-23 09:40:00.000000', '7d2fcf0d7d983da1d1dda586352d3132', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:21.632577');
INSERT INTO `sys_student_courseState` VALUES (658, 9, 582, 2, '2019-03-10 08:00:00.000000', '2019-03-10 09:40:00.000000', 'd63843d9d0ecc28e480c710846993c8e', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:21.772335');
INSERT INTO `sys_student_courseState` VALUES (659, 9, 583, 2, '2019-03-11 08:00:00.000000', '2019-03-11 09:40:00.000000', '1ed8835863ffbdedf3b7ddc9336fee63', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:21.912781');
INSERT INTO `sys_student_courseState` VALUES (660, 9, 584, 1, '2019-03-12 08:00:00.000000', '2019-03-12 09:40:00.000000', '57d70109c37a4d000fa97fec5ab6ce7d', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:22.055295');
INSERT INTO `sys_student_courseState` VALUES (661, 9, 585, 1, '2019-03-13 08:00:00.000000', '2019-03-13 09:40:00.000000', '64ba393ee94b1c7779ef8be56dedf2ca', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:22.197870');
INSERT INTO `sys_student_courseState` VALUES (662, 9, 586, 4, '2019-03-14 08:00:00.000000', '2019-03-14 09:40:00.000000', '3a0bddf4fb415256344df4e2a4203cbe', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:22.336530');
INSERT INTO `sys_student_courseState` VALUES (663, 9, 587, 2, '2019-03-15 08:00:00.000000', '2019-03-15 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:22.476100');
INSERT INTO `sys_student_courseState` VALUES (664, 9, 588, 3, '2019-03-16 08:00:00.000000', '2019-03-16 09:40:00.000000', 'f6dbaa1cdb3eca9fde3b9efced58a8e3', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:22.616104');
INSERT INTO `sys_student_courseState` VALUES (665, 9, 589, 3, '2018-10-17 08:00:00.000000', '2018-10-17 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:22.757860');
INSERT INTO `sys_student_courseState` VALUES (666, 9, 590, 2, '2018-10-18 08:00:00.000000', '2018-10-18 09:40:00.000000', 'b11a8406ad32630ff48080c99ecf4cfb', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:22.897316');
INSERT INTO `sys_student_courseState` VALUES (667, 9, 591, 1, '2018-10-19 08:00:00.000000', '2018-10-19 09:40:00.000000', '7d2fcf0d7d983da1d1dda586352d3132', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:23.035947');
INSERT INTO `sys_student_courseState` VALUES (668, 9, 592, 4, '2018-10-20 08:00:00.000000', '2018-10-20 09:40:00.000000', 'd63843d9d0ecc28e480c710846993c8e', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:23.177480');
INSERT INTO `sys_student_courseState` VALUES (669, 9, 593, 3, '2018-10-21 08:00:00.000000', '2018-10-21 09:40:00.000000', '1ed8835863ffbdedf3b7ddc9336fee63', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:23.320023');
INSERT INTO `sys_student_courseState` VALUES (670, 9, 594, 2, '2018-10-22 08:00:00.000000', '2018-10-22 09:40:00.000000', '57d70109c37a4d000fa97fec5ab6ce7d', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:23.459610');
INSERT INTO `sys_student_courseState` VALUES (671, 9, 595, 4, '2018-10-23 08:00:00.000000', '2018-10-23 09:40:00.000000', '64ba393ee94b1c7779ef8be56dedf2ca', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:23.599221');
INSERT INTO `sys_student_courseState` VALUES (672, 10, 582, 1, '2019-03-10 08:00:00.000000', '2019-03-10 09:40:00.000000', '3a0bddf4fb415256344df4e2a4203cbe', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:23.740846');
INSERT INTO `sys_student_courseState` VALUES (673, 10, 583, 2, '2019-03-11 08:00:00.000000', '2019-03-11 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:23.888269');
INSERT INTO `sys_student_courseState` VALUES (674, 10, 584, 2, '2019-03-12 08:00:00.000000', '2019-03-12 09:40:00.000000', 'f6dbaa1cdb3eca9fde3b9efced58a8e3', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:24.028851');
INSERT INTO `sys_student_courseState` VALUES (675, 10, 585, 4, '2019-03-13 08:00:00.000000', '2019-03-13 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:24.170424');
INSERT INTO `sys_student_courseState` VALUES (676, 10, 586, 4, '2019-03-14 08:00:00.000000', '2019-03-14 09:40:00.000000', 'b11a8406ad32630ff48080c99ecf4cfb', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:24.312972');
INSERT INTO `sys_student_courseState` VALUES (677, 10, 587, 3, '2019-03-15 08:00:00.000000', '2019-03-15 09:40:00.000000', '7d2fcf0d7d983da1d1dda586352d3132', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:24.452562');
INSERT INTO `sys_student_courseState` VALUES (678, 10, 588, 4, '2019-03-16 08:00:00.000000', '2019-03-16 09:40:00.000000', 'd63843d9d0ecc28e480c710846993c8e', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:24.591190');
INSERT INTO `sys_student_courseState` VALUES (679, 10, 589, 4, '2018-10-17 08:00:00.000000', '2018-10-17 09:40:00.000000', '1ed8835863ffbdedf3b7ddc9336fee63', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:24.728800');
INSERT INTO `sys_student_courseState` VALUES (680, 10, 590, 2, '2018-10-18 08:00:00.000000', '2018-10-18 09:40:00.000000', '57d70109c37a4d000fa97fec5ab6ce7d', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:24.872431');
INSERT INTO `sys_student_courseState` VALUES (681, 10, 591, 1, '2018-10-19 08:00:00.000000', '2018-10-19 09:40:00.000000', '64ba393ee94b1c7779ef8be56dedf2ca', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:25.010961');
INSERT INTO `sys_student_courseState` VALUES (682, 10, 592, 3, '2018-10-20 08:00:00.000000', '2018-10-20 09:40:00.000000', '3a0bddf4fb415256344df4e2a4203cbe', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:25.150558');
INSERT INTO `sys_student_courseState` VALUES (683, 10, 593, 1, '2018-10-21 08:00:00.000000', '2018-10-21 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:25.289199');
INSERT INTO `sys_student_courseState` VALUES (684, 10, 594, 4, '2018-10-22 08:00:00.000000', '2018-10-22 09:40:00.000000', 'f6dbaa1cdb3eca9fde3b9efced58a8e3', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:25.427819');
INSERT INTO `sys_student_courseState` VALUES (685, 10, 595, 1, '2018-10-23 08:00:00.000000', '2018-10-23 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:18:12.958000', '2020-04-18 01:22:25.566446');
INSERT INTO `sys_student_courseState` VALUES (686, 11, 596, 1, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', 'b11a8406ad32630ff48080c99ecf4cfb', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (687, 11, 597, 1, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', '7d2fcf0d7d983da1d1dda586352d3132', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:25.843646');
INSERT INTO `sys_student_courseState` VALUES (688, 11, 598, 1, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', 'd63843d9d0ecc28e480c710846993c8e', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:25.986200');
INSERT INTO `sys_student_courseState` VALUES (689, 11, 599, 1, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', '1ed8835863ffbdedf3b7ddc9336fee63', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (690, 11, 600, 3, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', '57d70109c37a4d000fa97fec5ab6ce7d', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:26.263439');
INSERT INTO `sys_student_courseState` VALUES (691, 11, 601, 1, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', '64ba393ee94b1c7779ef8be56dedf2ca', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (692, 11, 602, 1, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', '3a0bddf4fb415256344df4e2a4203cbe', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (693, 11, 603, 4, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:26.686269');
INSERT INTO `sys_student_courseState` VALUES (694, 11, 604, 1, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', 'f6dbaa1cdb3eca9fde3b9efced58a8e3', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (695, 11, 605, 4, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:26.969323');
INSERT INTO `sys_student_courseState` VALUES (696, 11, 606, 3, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', 'b11a8406ad32630ff48080c99ecf4cfb', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:27.108039');
INSERT INTO `sys_student_courseState` VALUES (697, 11, 607, 4, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', '7d2fcf0d7d983da1d1dda586352d3132', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:27.246556');
INSERT INTO `sys_student_courseState` VALUES (698, 11, 608, 3, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', 'd63843d9d0ecc28e480c710846993c8e', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:27.385190');
INSERT INTO `sys_student_courseState` VALUES (699, 11, 609, 4, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', '1ed8835863ffbdedf3b7ddc9336fee63', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:27.525790');
INSERT INTO `sys_student_courseState` VALUES (700, 12, 596, 4, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', '57d70109c37a4d000fa97fec5ab6ce7d', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:27.669787');
INSERT INTO `sys_student_courseState` VALUES (701, 12, 597, 1, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', '64ba393ee94b1c7779ef8be56dedf2ca', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (702, 12, 598, 2, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', '3a0bddf4fb415256344df4e2a4203cbe', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:27.952884');
INSERT INTO `sys_student_courseState` VALUES (703, 12, 599, 1, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (704, 12, 600, 3, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', 'f6dbaa1cdb3eca9fde3b9efced58a8e3', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:28.232074');
INSERT INTO `sys_student_courseState` VALUES (705, 12, 601, 1, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (706, 12, 602, 4, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', 'b11a8406ad32630ff48080c99ecf4cfb', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:28.516153');
INSERT INTO `sys_student_courseState` VALUES (707, 12, 603, 1, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', '7d2fcf0d7d983da1d1dda586352d3132', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (708, 12, 604, 1, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', 'd63843d9d0ecc28e480c710846993c8e', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:28.800297');
INSERT INTO `sys_student_courseState` VALUES (709, 12, 605, 1, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', '1ed8835863ffbdedf3b7ddc9336fee63', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (710, 12, 606, 3, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', '57d70109c37a4d000fa97fec5ab6ce7d', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:29.079530');
INSERT INTO `sys_student_courseState` VALUES (711, 12, 607, 1, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', '64ba393ee94b1c7779ef8be56dedf2ca', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:29.219089');
INSERT INTO `sys_student_courseState` VALUES (712, 12, 608, 4, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', '3a0bddf4fb415256344df4e2a4203cbe', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:29.360706');
INSERT INTO `sys_student_courseState` VALUES (713, 12, 609, 1, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:29.503264');
INSERT INTO `sys_student_courseState` VALUES (714, 13, 596, 1, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', 'f6dbaa1cdb3eca9fde3b9efced58a8e3', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (715, 13, 597, 1, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (716, 13, 598, 3, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', 'b11a8406ad32630ff48080c99ecf4cfb', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:29.939740');
INSERT INTO `sys_student_courseState` VALUES (717, 13, 599, 2, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', '7d2fcf0d7d983da1d1dda586352d3132', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:30.087221');
INSERT INTO `sys_student_courseState` VALUES (718, 13, 600, 1, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', 'd63843d9d0ecc28e480c710846993c8e', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (719, 13, 601, 1, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', '1ed8835863ffbdedf3b7ddc9336fee63', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (720, 13, 602, 3, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', '57d70109c37a4d000fa97fec5ab6ce7d', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:30.514908');
INSERT INTO `sys_student_courseState` VALUES (721, 13, 603, 3, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', '64ba393ee94b1c7779ef8be56dedf2ca', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:30.655422');
INSERT INTO `sys_student_courseState` VALUES (722, 13, 604, 4, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', '3a0bddf4fb415256344df4e2a4203cbe', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:30.795038');
INSERT INTO `sys_student_courseState` VALUES (723, 13, 605, 3, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:30.933663');
INSERT INTO `sys_student_courseState` VALUES (724, 13, 606, 4, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', 'f6dbaa1cdb3eca9fde3b9efced58a8e3', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:31.082106');
INSERT INTO `sys_student_courseState` VALUES (725, 13, 607, 3, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:31.220699');
INSERT INTO `sys_student_courseState` VALUES (726, 13, 608, 2, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', 'b11a8406ad32630ff48080c99ecf4cfb', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:31.367216');
INSERT INTO `sys_student_courseState` VALUES (727, 13, 609, 2, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', '7d2fcf0d7d983da1d1dda586352d3132', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:31.507774');
INSERT INTO `sys_student_courseState` VALUES (728, 14, 596, 1, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', 'd63843d9d0ecc28e480c710846993c8e', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (729, 14, 597, 1, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', '1ed8835863ffbdedf3b7ddc9336fee63', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (730, 14, 598, 3, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', '57d70109c37a4d000fa97fec5ab6ce7d', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:31.938341');
INSERT INTO `sys_student_courseState` VALUES (731, 14, 599, 1, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', '64ba393ee94b1c7779ef8be56dedf2ca', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:32.078992');
INSERT INTO `sys_student_courseState` VALUES (732, 14, 600, 3, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', '3a0bddf4fb415256344df4e2a4203cbe', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:32.219550');
INSERT INTO `sys_student_courseState` VALUES (733, 14, 601, 1, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (734, 14, 602, 1, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', 'f6dbaa1cdb3eca9fde3b9efced58a8e3', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:32.497762');
INSERT INTO `sys_student_courseState` VALUES (735, 14, 603, 4, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:32.638771');
INSERT INTO `sys_student_courseState` VALUES (736, 14, 604, 3, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', 'b11a8406ad32630ff48080c99ecf4cfb', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:32.780343');
INSERT INTO `sys_student_courseState` VALUES (737, 14, 605, 1, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', '7d2fcf0d7d983da1d1dda586352d3132', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:32.920927');
INSERT INTO `sys_student_courseState` VALUES (738, 14, 606, 1, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', 'd63843d9d0ecc28e480c710846993c8e', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (739, 14, 607, 3, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', '1ed8835863ffbdedf3b7ddc9336fee63', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:33.203117');
INSERT INTO `sys_student_courseState` VALUES (740, 14, 608, 4, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', '57d70109c37a4d000fa97fec5ab6ce7d', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:33.345692');
INSERT INTO `sys_student_courseState` VALUES (741, 14, 609, 1, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', '64ba393ee94b1c7779ef8be56dedf2ca', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (742, 15, 596, 1, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', '3a0bddf4fb415256344df4e2a4203cbe', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:33.635794');
INSERT INTO `sys_student_courseState` VALUES (743, 15, 597, 2, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:33.775268');
INSERT INTO `sys_student_courseState` VALUES (744, 15, 598, 1, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', 'f6dbaa1cdb3eca9fde3b9efced58a8e3', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:33.916819');
INSERT INTO `sys_student_courseState` VALUES (745, 15, 599, 2, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:34.056442');
INSERT INTO `sys_student_courseState` VALUES (746, 15, 600, 3, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', 'b11a8406ad32630ff48080c99ecf4cfb', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:34.197189');
INSERT INTO `sys_student_courseState` VALUES (747, 15, 601, 1, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', '7d2fcf0d7d983da1d1dda586352d3132', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (748, 15, 602, 3, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', 'd63843d9d0ecc28e480c710846993c8e', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:34.477199');
INSERT INTO `sys_student_courseState` VALUES (749, 15, 603, 4, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', '1ed8835863ffbdedf3b7ddc9336fee63', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:34.618773');
INSERT INTO `sys_student_courseState` VALUES (750, 15, 604, 2, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', '57d70109c37a4d000fa97fec5ab6ce7d', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:34.756418');
INSERT INTO `sys_student_courseState` VALUES (751, 15, 605, 1, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', '64ba393ee94b1c7779ef8be56dedf2ca', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:34.898957');
INSERT INTO `sys_student_courseState` VALUES (752, 15, 606, 3, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', '3a0bddf4fb415256344df4e2a4203cbe', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:35.044462');
INSERT INTO `sys_student_courseState` VALUES (753, 15, 607, 1, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (754, 15, 608, 1, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', 'f6dbaa1cdb3eca9fde3b9efced58a8e3', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (755, 15, 609, 1, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:35.467180');
INSERT INTO `sys_student_courseState` VALUES (756, 16, 596, 2, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', 'b11a8406ad32630ff48080c99ecf4cfb', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:35.605807');
INSERT INTO `sys_student_courseState` VALUES (757, 16, 597, 4, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', '7d2fcf0d7d983da1d1dda586352d3132', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:35.744443');
INSERT INTO `sys_student_courseState` VALUES (758, 16, 598, 1, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', 'd63843d9d0ecc28e480c710846993c8e', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (759, 16, 599, 3, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', '1ed8835863ffbdedf3b7ddc9336fee63', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:36.020728');
INSERT INTO `sys_student_courseState` VALUES (760, 16, 600, 4, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', '57d70109c37a4d000fa97fec5ab6ce7d', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:36.160289');
INSERT INTO `sys_student_courseState` VALUES (761, 16, 601, 2, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', '64ba393ee94b1c7779ef8be56dedf2ca', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:36.299882');
INSERT INTO `sys_student_courseState` VALUES (762, 16, 602, 3, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', '3a0bddf4fb415256344df4e2a4203cbe', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:36.442419');
INSERT INTO `sys_student_courseState` VALUES (763, 16, 603, 2, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:36.591880');
INSERT INTO `sys_student_courseState` VALUES (764, 16, 604, 1, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', 'f6dbaa1cdb3eca9fde3b9efced58a8e3', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (765, 16, 605, 1, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:36.876956');
INSERT INTO `sys_student_courseState` VALUES (766, 16, 606, 3, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', 'b11a8406ad32630ff48080c99ecf4cfb', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:37.018535');
INSERT INTO `sys_student_courseState` VALUES (767, 16, 607, 3, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', '7d2fcf0d7d983da1d1dda586352d3132', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:37.161093');
INSERT INTO `sys_student_courseState` VALUES (768, 16, 608, 4, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', 'd63843d9d0ecc28e480c710846993c8e', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:37.307576');
INSERT INTO `sys_student_courseState` VALUES (769, 16, 609, 3, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', '1ed8835863ffbdedf3b7ddc9336fee63', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:37.456036');
INSERT INTO `sys_student_courseState` VALUES (770, 17, 596, 3, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', '57d70109c37a4d000fa97fec5ab6ce7d', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:37.607815');
INSERT INTO `sys_student_courseState` VALUES (771, 17, 597, 1, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', '64ba393ee94b1c7779ef8be56dedf2ca', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (772, 17, 598, 1, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', '3a0bddf4fb415256344df4e2a4203cbe', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (773, 17, 599, 4, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:38.035486');
INSERT INTO `sys_student_courseState` VALUES (774, 17, 600, 1, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', 'f6dbaa1cdb3eca9fde3b9efced58a8e3', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:38.203615');
INSERT INTO `sys_student_courseState` VALUES (775, 17, 601, 1, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (776, 17, 602, 2, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', 'b11a8406ad32630ff48080c99ecf4cfb', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:38.497544');
INSERT INTO `sys_student_courseState` VALUES (777, 17, 603, 1, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', '7d2fcf0d7d983da1d1dda586352d3132', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (778, 17, 604, 4, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', 'd63843d9d0ecc28e480c710846993c8e', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:38.814092');
INSERT INTO `sys_student_courseState` VALUES (779, 17, 605, 3, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', '1ed8835863ffbdedf3b7ddc9336fee63', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:38.954690');
INSERT INTO `sys_student_courseState` VALUES (780, 17, 606, 3, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', '57d70109c37a4d000fa97fec5ab6ce7d', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:39.106101');
INSERT INTO `sys_student_courseState` VALUES (781, 17, 607, 1, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', '64ba393ee94b1c7779ef8be56dedf2ca', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (782, 17, 608, 3, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', '3a0bddf4fb415256344df4e2a4203cbe', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:39.407905');
INSERT INTO `sys_student_courseState` VALUES (783, 17, 609, 4, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:39.577994');
INSERT INTO `sys_student_courseState` VALUES (784, 18, 596, 1, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', 'f6dbaa1cdb3eca9fde3b9efced58a8e3', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (785, 18, 597, 3, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:39.889644');
INSERT INTO `sys_student_courseState` VALUES (786, 18, 598, 1, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', 'b11a8406ad32630ff48080c99ecf4cfb', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:40.035171');
INSERT INTO `sys_student_courseState` VALUES (787, 18, 599, 1, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', '7d2fcf0d7d983da1d1dda586352d3132', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:40.183624');
INSERT INTO `sys_student_courseState` VALUES (788, 18, 600, 4, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', 'd63843d9d0ecc28e480c710846993c8e', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:40.328108');
INSERT INTO `sys_student_courseState` VALUES (789, 18, 601, 1, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', '1ed8835863ffbdedf3b7ddc9336fee63', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:40.474633');
INSERT INTO `sys_student_courseState` VALUES (790, 18, 602, 2, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', '57d70109c37a4d000fa97fec5ab6ce7d', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:40.616135');
INSERT INTO `sys_student_courseState` VALUES (791, 18, 603, 1, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', '64ba393ee94b1c7779ef8be56dedf2ca', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:40.776377');
INSERT INTO `sys_student_courseState` VALUES (792, 18, 604, 4, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', '3a0bddf4fb415256344df4e2a4203cbe', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:40.936657');
INSERT INTO `sys_student_courseState` VALUES (793, 18, 605, 1, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (794, 18, 606, 2, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', 'f6dbaa1cdb3eca9fde3b9efced58a8e3', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:41.221054');
INSERT INTO `sys_student_courseState` VALUES (795, 18, 607, 3, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:41.382149');
INSERT INTO `sys_student_courseState` VALUES (796, 18, 608, 3, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', 'b11a8406ad32630ff48080c99ecf4cfb', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:41.550101');
INSERT INTO `sys_student_courseState` VALUES (797, 18, 609, 2, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', '7d2fcf0d7d983da1d1dda586352d3132', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:41.715270');
INSERT INTO `sys_student_courseState` VALUES (798, 19, 596, 3, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', 'd63843d9d0ecc28e480c710846993c8e', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:41.862781');
INSERT INTO `sys_student_courseState` VALUES (799, 19, 597, 1, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', '1ed8835863ffbdedf3b7ddc9336fee63', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (800, 19, 598, 1, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', '57d70109c37a4d000fa97fec5ab6ce7d', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:42.149952');
INSERT INTO `sys_student_courseState` VALUES (801, 19, 599, 1, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', '64ba393ee94b1c7779ef8be56dedf2ca', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (802, 19, 600, 4, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', '3a0bddf4fb415256344df4e2a4203cbe', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:42.442888');
INSERT INTO `sys_student_courseState` VALUES (803, 19, 601, 3, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:42.594585');
INSERT INTO `sys_student_courseState` VALUES (804, 19, 602, 2, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', 'f6dbaa1cdb3eca9fde3b9efced58a8e3', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:42.753853');
INSERT INTO `sys_student_courseState` VALUES (805, 19, 603, 2, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:42.902181');
INSERT INTO `sys_student_courseState` VALUES (806, 19, 604, 4, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', 'b11a8406ad32630ff48080c99ecf4cfb', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:43.040960');
INSERT INTO `sys_student_courseState` VALUES (807, 19, 605, 2, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', '7d2fcf0d7d983da1d1dda586352d3132', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:43.179721');
INSERT INTO `sys_student_courseState` VALUES (808, 19, 606, 1, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', 'd63843d9d0ecc28e480c710846993c8e', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:43.318548');
INSERT INTO `sys_student_courseState` VALUES (809, 19, 607, 3, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', '1ed8835863ffbdedf3b7ddc9336fee63', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:43.457765');
INSERT INTO `sys_student_courseState` VALUES (810, 19, 608, 4, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', '57d70109c37a4d000fa97fec5ab6ce7d', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:43.598389');
INSERT INTO `sys_student_courseState` VALUES (811, 19, 609, 2, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', '64ba393ee94b1c7779ef8be56dedf2ca', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:43.739061');
INSERT INTO `sys_student_courseState` VALUES (812, 20, 596, 1, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', '3a0bddf4fb415256344df4e2a4203cbe', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (813, 20, 597, 2, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:44.028957');
INSERT INTO `sys_student_courseState` VALUES (814, 20, 598, 1, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', 'f6dbaa1cdb3eca9fde3b9efced58a8e3', '2020-04-18 01:20:43.158000', '2020-04-18 01:30:38.214119');
INSERT INTO `sys_student_courseState` VALUES (815, 20, 599, 1, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:44.316083');
INSERT INTO `sys_student_courseState` VALUES (816, 20, 600, 1, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', 'b11a8406ad32630ff48080c99ecf4cfb', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:44.454677');
INSERT INTO `sys_student_courseState` VALUES (817, 20, 601, 2, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', '7d2fcf0d7d983da1d1dda586352d3132', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:44.595273');
INSERT INTO `sys_student_courseState` VALUES (818, 20, 602, 2, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', 'd63843d9d0ecc28e480c710846993c8e', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:44.736787');
INSERT INTO `sys_student_courseState` VALUES (819, 20, 603, 4, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', '1ed8835863ffbdedf3b7ddc9336fee63', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:44.878391');
INSERT INTO `sys_student_courseState` VALUES (820, 20, 604, 1, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', '57d70109c37a4d000fa97fec5ab6ce7d', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:45.019924');
INSERT INTO `sys_student_courseState` VALUES (821, 20, 605, 2, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', '64ba393ee94b1c7779ef8be56dedf2ca', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:45.163584');
INSERT INTO `sys_student_courseState` VALUES (822, 20, 606, 1, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', '3a0bddf4fb415256344df4e2a4203cbe', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:45.303090');
INSERT INTO `sys_student_courseState` VALUES (823, 20, 607, 1, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', 'b99004ab1f39797cee47b46830540d03', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:45.445734');
INSERT INTO `sys_student_courseState` VALUES (824, 20, 608, 4, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', 'f6dbaa1cdb3eca9fde3b9efced58a8e3', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:45.589159');
INSERT INTO `sys_student_courseState` VALUES (825, 20, 609, 4, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', '271218d7cd58589a1510efe7eb1e4554', '2020-04-18 01:20:43.158000', '2020-04-18 01:22:45.730733');
INSERT INTO `sys_student_courseState` VALUES (826, 11, 596, 1, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (827, 11, 597, 5, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (828, 11, 598, 2, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (829, 11, 599, 5, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (830, 11, 600, 4, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (831, 11, 601, 5, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (832, 11, 602, 2, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (833, 11, 603, 1, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (834, 11, 604, 2, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (835, 11, 605, 2, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (836, 11, 606, 2, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (837, 11, 607, 4, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (838, 11, 608, 5, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (839, 11, 609, 2, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (840, 12, 596, 3, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (841, 12, 597, 5, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (842, 12, 598, 3, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (843, 12, 599, 1, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (844, 12, 600, 4, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (845, 12, 601, 4, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (846, 12, 602, 3, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (847, 12, 603, 2, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (848, 12, 604, 5, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (849, 12, 605, 2, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (850, 12, 606, 2, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (851, 12, 607, 4, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (852, 12, 608, 3, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (853, 12, 609, 4, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (854, 13, 596, 3, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (855, 13, 597, 1, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (856, 13, 598, 3, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (857, 13, 599, 5, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (858, 13, 600, 2, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (859, 13, 601, 3, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (860, 13, 602, 1, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (861, 13, 603, 5, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (862, 13, 604, 4, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (863, 13, 605, 3, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (864, 13, 606, 5, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (865, 13, 607, 5, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (866, 13, 608, 3, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (867, 13, 609, 3, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (868, 14, 596, 4, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (869, 14, 597, 3, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (870, 14, 598, 4, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (871, 14, 599, 1, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (872, 14, 600, 1, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (873, 14, 601, 2, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (874, 14, 602, 4, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (875, 14, 603, 1, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (876, 14, 604, 5, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (877, 14, 605, 2, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (878, 14, 606, 2, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (879, 14, 607, 3, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (880, 14, 608, 2, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (881, 14, 609, 3, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (882, 15, 596, 1, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (883, 15, 597, 5, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (884, 15, 598, 1, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (885, 15, 599, 4, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (886, 15, 600, 5, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (887, 15, 601, 5, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (888, 15, 602, 3, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (889, 15, 603, 1, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (890, 15, 604, 3, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (891, 15, 605, 1, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (892, 15, 606, 3, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (893, 15, 607, 1, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (894, 15, 608, 2, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (895, 15, 609, 5, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (896, 16, 596, 4, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (897, 16, 597, 2, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (898, 16, 598, 3, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (899, 16, 599, 3, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (900, 16, 600, 2, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (901, 16, 601, 4, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (902, 16, 602, 2, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (903, 16, 603, 4, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (904, 16, 604, 3, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (905, 16, 605, 5, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (906, 16, 606, 4, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (907, 16, 607, 5, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (908, 16, 608, 5, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (909, 16, 609, 2, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (910, 17, 596, 2, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (911, 17, 597, 2, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (912, 17, 598, 3, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (913, 17, 599, 5, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (914, 17, 600, 5, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (915, 17, 601, 5, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (916, 17, 602, 4, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (917, 17, 603, 2, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (918, 17, 604, 4, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (919, 17, 605, 3, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (920, 17, 606, 2, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (921, 17, 607, 4, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (922, 17, 608, 4, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (923, 17, 609, 1, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (924, 18, 596, 2, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (925, 18, 597, 2, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (926, 18, 598, 2, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (927, 18, 599, 3, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (928, 18, 600, 2, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (929, 18, 601, 3, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (930, 18, 602, 2, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (931, 18, 603, 2, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (932, 18, 604, 3, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (933, 18, 605, 4, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (934, 18, 606, 1, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (935, 18, 607, 2, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (936, 18, 608, 2, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (937, 18, 609, 1, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (938, 19, 596, 2, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (939, 19, 597, 2, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (940, 19, 598, 1, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (941, 19, 599, 2, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (942, 19, 600, 2, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (943, 19, 601, 4, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (944, 19, 602, 5, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (945, 19, 603, 5, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (946, 19, 604, 1, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (947, 19, 605, 4, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (948, 19, 606, 3, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (949, 19, 607, 4, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (950, 19, 608, 2, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (951, 19, 609, 5, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (952, 20, 596, 3, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (953, 20, 597, 2, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (954, 20, 598, 1, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (955, 20, 599, 5, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (956, 20, 600, 3, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (957, 20, 601, 1, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (958, 20, 602, 4, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (959, 20, 603, 4, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (960, 20, 604, 2, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (961, 20, 605, 3, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (962, 20, 606, 5, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (963, 20, 607, 4, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (964, 20, 608, 3, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (965, 20, 609, 5, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', NULL, '2020-04-18 19:49:59.244000', '2020-04-18 19:49:59.244000');
INSERT INTO `sys_student_courseState` VALUES (966, 11, 596, 3, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (967, 11, 597, 4, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (968, 11, 598, 4, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (969, 11, 599, 2, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (970, 11, 600, 2, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (971, 11, 601, 5, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (972, 11, 602, 3, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (973, 11, 603, 4, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (974, 11, 604, 2, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (975, 11, 605, 3, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (976, 11, 606, 3, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (977, 11, 607, 1, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (978, 11, 608, 3, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (979, 11, 609, 1, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (980, 12, 596, 5, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (981, 12, 597, 5, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (982, 12, 598, 3, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (983, 12, 599, 3, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (984, 12, 600, 5, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (985, 12, 601, 4, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (986, 12, 602, 3, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (987, 12, 603, 5, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (988, 12, 604, 1, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (989, 12, 605, 5, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (990, 12, 606, 4, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (991, 12, 607, 1, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (992, 12, 608, 5, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (993, 12, 609, 2, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (994, 13, 596, 4, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (995, 13, 597, 5, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (996, 13, 598, 5, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (997, 13, 599, 2, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (998, 13, 600, 2, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (999, 13, 601, 2, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1000, 13, 602, 1, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1001, 13, 603, 4, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1002, 13, 604, 2, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1003, 13, 605, 4, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1004, 13, 606, 5, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1005, 13, 607, 2, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1006, 13, 608, 5, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1007, 13, 609, 5, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1008, 14, 596, 2, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1009, 14, 597, 2, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1010, 14, 598, 3, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1011, 14, 599, 3, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1012, 14, 600, 2, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1013, 14, 601, 2, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1014, 14, 602, 5, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1015, 14, 603, 2, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1016, 14, 604, 3, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1017, 14, 605, 5, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1018, 14, 606, 5, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1019, 14, 607, 4, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1020, 14, 608, 4, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1021, 14, 609, 1, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1022, 15, 596, 4, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1023, 15, 597, 5, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1024, 15, 598, 2, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1025, 15, 599, 1, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1026, 15, 600, 5, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1027, 15, 601, 2, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1028, 15, 602, 2, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1029, 15, 603, 5, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1030, 15, 604, 3, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1031, 15, 605, 1, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1032, 15, 606, 2, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1033, 15, 607, 2, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1034, 15, 608, 2, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1035, 15, 609, 5, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1036, 16, 596, 2, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1037, 16, 597, 1, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1038, 16, 598, 4, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1039, 16, 599, 2, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1040, 16, 600, 4, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1041, 16, 601, 1, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1042, 16, 602, 2, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1043, 16, 603, 5, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1044, 16, 604, 2, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1045, 16, 605, 2, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1046, 16, 606, 4, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1047, 16, 607, 1, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1048, 16, 608, 2, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1049, 16, 609, 2, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1050, 17, 596, 2, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1051, 17, 597, 2, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1052, 17, 598, 4, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1053, 17, 599, 4, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1054, 17, 600, 3, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1055, 17, 601, 1, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1056, 17, 602, 1, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1057, 17, 603, 2, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1058, 17, 604, 2, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1059, 17, 605, 2, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1060, 17, 606, 4, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1061, 17, 607, 4, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1062, 17, 608, 5, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1063, 17, 609, 3, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1064, 18, 596, 3, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1065, 18, 597, 5, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1066, 18, 598, 5, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1067, 18, 599, 3, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1068, 18, 600, 5, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1069, 18, 601, 1, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1070, 18, 602, 2, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1071, 18, 603, 4, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1072, 18, 604, 5, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1073, 18, 605, 3, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1074, 18, 606, 2, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1075, 18, 607, 1, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1076, 18, 608, 5, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1077, 18, 609, 2, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1078, 19, 596, 4, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1079, 19, 597, 2, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1080, 19, 598, 2, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1081, 19, 599, 3, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1082, 19, 600, 2, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1083, 19, 601, 2, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1084, 19, 602, 4, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1085, 19, 603, 1, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1086, 19, 604, 5, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1087, 19, 605, 5, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1088, 19, 606, 2, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1089, 19, 607, 3, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1090, 19, 608, 2, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1091, 19, 609, 3, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1092, 20, 596, 3, '2019-04-10 08:00:00.000000', '2019-04-10 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1093, 20, 597, 1, '2019-04-11 08:00:00.000000', '2019-04-11 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1094, 20, 598, 3, '2019-04-12 08:00:00.000000', '2019-04-12 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1095, 20, 599, 3, '2019-04-13 08:00:00.000000', '2019-04-13 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1096, 20, 600, 4, '2019-04-14 08:00:00.000000', '2019-04-14 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1097, 20, 601, 4, '2019-04-15 08:00:00.000000', '2019-04-15 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1098, 20, 602, 4, '2019-04-16 08:00:00.000000', '2019-04-16 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1099, 20, 603, 4, '2018-11-17 08:00:00.000000', '2018-11-17 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1100, 20, 604, 1, '2018-11-18 08:00:00.000000', '2018-11-18 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1101, 20, 605, 3, '2018-11-19 08:00:00.000000', '2018-11-19 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1102, 20, 606, 4, '2018-11-20 08:00:00.000000', '2018-11-20 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1103, 20, 607, 3, '2018-11-21 08:00:00.000000', '2018-11-21 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1104, 20, 608, 3, '2018-11-22 08:00:00.000000', '2018-11-22 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');
INSERT INTO `sys_student_courseState` VALUES (1105, 20, 609, 1, '2018-11-23 08:00:00.000000', '2018-11-23 09:40:00.000000', NULL, '2020-04-18 19:52:34.089000', '2020-04-18 19:52:34.089000');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, '程新月', '程新月', '00', '10002@qq.com', '13789677568', '0', '', 'ea7467c1ebbe63d79f816c66b6301b82', 'c08b63', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:36', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (2, 103, '陈丹青', '陈丹青', '00', '10003@qq.com', '13789677569', '0', '', '7f1b350612bbf622f6b5ce5f111e8e23', '6a4ee4', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:36', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (3, 103, '蔡天新', '蔡天新', '00', '10004@qq.com', '13789677570', '0', '', 'd93e65379917b5a39862c1ba3fefe04f', '51d3b4', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:36', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (4, 103, '郭震海', '郭震海', '00', '10005@qq.com', '13789677571', '0', '', 'a9008741c5bb8084e484fbe7d4c225ef', 'eca098', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:37', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (5, 103, '程鹤麟', '程鹤麟', '00', '10006@qq.com', '13789677572', '0', '', '8d9ff9abab66bd9186454f7653df281b', '37b36d', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:37', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (6, 103, '何亚娟', '何亚娟', '00', '10007@qq.com', '13789677573', '1', '', 'b47f25773966454f31c3684a4999fcc7', 'b88872', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:37', 'admin', '2020-04-17 16:52:10', '');
INSERT INTO `sys_user` VALUES (7, 103, '杜平让', '杜平让', '00', '10008@qq.com', '13789677574', '1', '', 'f30a283f1991c159e14109d4cd60a777', '3d5aca', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:37', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (8, 103, '崔卫平', '崔卫平', '00', '10009@qq.com', '13789677575', '1', '', 'e4482693a8b255468e178be0378277e0', '1cc5fa', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:37', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (9, 103, '程一身', '程一身', '00', '10010@qq.com', '13789677576', '1', '', '88aa2e623d33de420206d83736a71935', 'fd87b6', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:38', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (10, 103, '高建华', '高建华', '00', '10011@qq.com', '13789677577', '1', '', '0bfe54ca7ec6041c9b0ed47a52ca660c', 'faca3d', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:38', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (11, 103, '金文明', '金文明', '00', '10012@qq.com', '13789677578', '1', '', '059861bc68eb471bb620c261550af324', '252233', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:38', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (12, 103, '葛剑', '葛剑', '00', '10013@qq.com', '13789677579', '1', '', '0f48c28db06daaf5efaa119c2be15a23', '0ea785', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:38', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (13, 103, '刘继兴 ', '刘继兴 ', '00', '10014@qq.com', '13789677580', '1', '', 'afeda346a5947f801804cbbe5a25f477', 'fb0655', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:38', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (14, 103, '江晓原', '江晓原', '00', '10015@qq.com', '13789677581', '0', '', '97c2bdf162122e6fb0d4744291865651', 'e9db55', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:39', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (15, 103, '路佳瑄', '路佳瑄', '00', '10016@qq.com', '13789677582', '0', '', 'e5f6ae2586948e794807be4326edc4f4', '24a121', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:39', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (16, 103, '高星', '高星', '00', '10017@qq.com', '13789677583', '0', '', 'f06d9453c89afc2d94405bf2b63eba2f', '35bb10', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:39', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (17, 103, '巩高峰', '巩高峰', '00', '10018@qq.com', '13789677584', '0', '', 'aa4adac9cea9d068104b98b9a0ee7e40', 'c34f1f', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:39', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (18, 103, '胡续冬', '胡续冬', '00', '10019@qq.com', '13789677585', '0', '', '2ffeefe8e7defdc7c072368e3b113215', '82e180', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:39', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (19, 103, '李碧华', '李碧华', '00', '10020@qq.com', '13789677586', '0', '', '9506146a62842f6febef3e698fc97410', '03cd18', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:40', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (20, 103, '冯志丹', '冯志丹', '00', '10021@qq.com', '13789677587', '0', '', '6ec592800c072cb17145c6e94be42f17', '68f915', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:40', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (21, 103, '傅光明', '傅光明', '00', '10022@qq.com', '13789677588', '0', '', '98da6c53d8824d177f2588e02be4e98e', 'b2a050', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:40', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (22, 103, '李银河', '李银河', '00', '10023@qq.com', '13789677589', '0', '', '4c94e1fcc71f16cd5723b4472db0514c', '9be7a5', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:40', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (23, 103, '陈众议', '陈众议', '00', '10024@qq.com', '13789677590', '0', '', 'e426807367636c5b3cbbb9ef418733c3', '52a2cc', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:40', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (24, 103, '刘墉', '刘墉', '00', '10025@qq.com', '13789677591', '0', '', 'e352543232e9480a346f3e19809ce8d7', 'ac1c21', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:41', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (25, 103, '韩雨山', '韩雨山', '00', '10026@qq.com', '13789677592', '0', '', '158e854c2f76543b14700dad0519ed6a', 'f1a12e', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:41', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (26, 103, '韩松落', '韩松落', '00', '10027@qq.com', '13789677593', '0', '', '94ffec6be489849cb363286bb4eb5790', 'f47a6c', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:41', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (27, 103, '恭小兵', '恭小兵', '00', '10028@qq.com', '13789677594', '0', '', '290265aeda6cfa3b577c0322e5331599', '8cec01', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:41', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (28, 103, '关凌', '关凌', '00', '10029@qq.com', '13789677595', '0', '', 'ea7b92642d43213ccc1b2de4214f99de', '941481', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:42', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (29, 103, '高远', '高远', '00', '10030@qq.com', '13789677596', '0', '', 'bb37c7fa4af87bc2af89fe77353032e3', 'f1819d', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:42', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (31, 103, '管理员', '管理员', '00', '10031@qq.com', '13789677597', '0', '', 'df79dfcc845791fdcbed56f27ce50a5f', 'f42e06', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:42', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (32, 103, '王小明', '王小明', '00', '10032@qq.com', '13789677598', '0', '', '6b8414800f256258d635bd91d4c78e36', '14adff', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:42', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (34, 103, '冯小红', '冯小红', '00', '10034@qq.com', '13789677600', '1', '', '14ed916d83c7452d4713b5eb1384f0a4', '05281d', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:42', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (35, 103, '梁用心', '梁用心', '00', '10035@qq.com', '13789677601', '1', '', 'fe5e92aad6d43e830e72e136b2186c0a', '4e8c53', '0', '0', '', NULL, 'admin', '2020-04-17 16:50:43', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (100, 103, '15696756588', 'luna', '00', 'ltribe.account@foxmail.com', '15696756588', '0', '', '48492b91b5eaaefed906d6bb018e4848', 'd5c4e6', '0', '2', '', NULL, 'ry', '2020-03-20 19:03:16', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (101, 103, 'xxx', '张三', '01', '', '', '0', '', 'f2ddea6238b0bcfb6454a7a3acbb25e7', 'e00caa', '0', '0', '', NULL, '', '2020-03-27 21:52:25', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (102, 103, 'xxx', '李四', '01', '', '', '0', '', '3fc42933be1c217fd8524c1a7d143499', '6c4266', '0', '0', '', NULL, '', '2020-03-27 21:52:48', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (103, 103, '小明', '小明', '01', '', '', '0', '', 'b31c9875e09436dc65d4e83c08550f84', '8169be', '0', '0', '127.0.0.1', '2020-03-27 11:22:09', '', '2020-03-28 00:21:58', '', '2020-03-28 00:22:09', NULL);
INSERT INTO `sys_user` VALUES (104, 103, '15696756581', 'root', '00', '15696756581@163.com', '15696756581', '0', '', 'f9d6d479ff358d4b427c8fed140df6cc', '84c424', '0', '0', '', NULL, 'admin', '2020-04-05 23:36:09', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (105, 103, '小华', '小华', '00', '15696756583@163.com', '15696756583', '0', '', 'f20c6ac9587d7bf263486ffd75ffe986', '40966d', '0', '0', '', NULL, 'admin', '2020-04-05 23:40:17', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (1101, 103, 'admin', 'Luna', '00', '15696756582@163.com', '15696756582', '0', '/profile/avatar/2020/04/15/3f0b5be25ef05cc39093f10cdd6980b8.png', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2020-04-18 20:38:06', 'admin', '2018-03-16 11:33:00', 'ry', '2020-04-18 20:38:05', '管理员');
INSERT INTO `sys_user` VALUES (1102, 103, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2020-03-20 08:19:55', 'admin', '2018-03-16 11:33:00', 'ry', '2020-03-20 21:19:52', '测试员');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('300895c6-d8de-457b-9365-a231cff46d90', 'admin', '软件工程', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', 'on_line', '2020-04-18 20:27:43', '2020-04-18 20:27:43', 1800000);
INSERT INTO `sys_user_online` VALUES ('9ed4995d-3e29-4693-a101-af67dcf3cb03', 'admin', '软件工程', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', 'on_line', '2020-04-18 20:18:29', '2020-04-18 20:18:34', 1800000);
INSERT INTO `sys_user_online` VALUES ('c0ded318-f88a-47f1-b6b7-1344a992d614', 'admin', '软件工程', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', 'on_line', '2020-04-18 20:12:53', '2020-04-18 20:13:04', 1800000);
INSERT INTO `sys_user_online` VALUES ('da89b1cb-0c37-442d-9be0-28cbe1bef8b6', 'admin', '软件工程', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', 'on_line', '2020-04-18 20:07:20', '2020-04-18 20:16:50', 1800000);
INSERT INTO `sys_user_online` VALUES ('ef4bf63a-8671-4587-917a-81f07e5bd0b4', 'admin', '软件工程', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', 'on_line', '2020-04-18 20:38:03', '2020-04-18 20:38:06', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (100, 1);
INSERT INTO `sys_user_post` VALUES (104, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (6, 101);
INSERT INTO `sys_user_role` VALUES (100, 2);
INSERT INTO `sys_user_role` VALUES (104, 2);
INSERT INTO `sys_user_role` VALUES (105, 101);

-- ----------------------------
-- Table structure for tb_knowledge_picture
-- ----------------------------
DROP TABLE IF EXISTS `tb_knowledge_picture`;
CREATE TABLE `tb_knowledge_picture`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '识别到的照片',
  `knowledgeid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 749 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_knowledge_picture
-- ----------------------------
INSERT INTO `tb_knowledge_picture` VALUES (1, 'src\\img\\001.jpg', 331);
INSERT INTO `tb_knowledge_picture` VALUES (2, 'D:\\ffmpeg\\img', 331);
INSERT INTO `tb_knowledge_picture` VALUES (3, 'D:\\ffmpeg\\img', 331);
INSERT INTO `tb_knowledge_picture` VALUES (4, 'D:\\ffmpeg\\img', 331);
INSERT INTO `tb_knowledge_picture` VALUES (5, 'D:\\ffmpeg\\img', 331);
INSERT INTO `tb_knowledge_picture` VALUES (6, 'D:\\ffmpeg\\img', 2);
INSERT INTO `tb_knowledge_picture` VALUES (7, 'D:\\ffmpeg\\img', 2);
INSERT INTO `tb_knowledge_picture` VALUES (8, 'D:\\ffmpeg\\img', 2);
INSERT INTO `tb_knowledge_picture` VALUES (9, 'D:\\ffmpeg\\img', 2);
INSERT INTO `tb_knowledge_picture` VALUES (10, 'D:\\ffmpeg\\img', 2);
INSERT INTO `tb_knowledge_picture` VALUES (11, 'D:\\ffmpeg\\img', 331);
INSERT INTO `tb_knowledge_picture` VALUES (12, 'D:\\ffmpeg\\img', 331);
INSERT INTO `tb_knowledge_picture` VALUES (13, 'D:\\ffmpeg\\img', 331);
INSERT INTO `tb_knowledge_picture` VALUES (14, 'D:\\ffmpeg\\img', 331);
INSERT INTO `tb_knowledge_picture` VALUES (15, 'D:\\ffmpeg\\img', 331);
INSERT INTO `tb_knowledge_picture` VALUES (332, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (333, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (334, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (335, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (336, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (337, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (338, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (339, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (340, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (341, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (342, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (343, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (344, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (345, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (346, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (347, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (348, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (349, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (350, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (351, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (352, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (353, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (354, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (355, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (356, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (357, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (358, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (359, 'D:\\ffmpeg\\img', 342);
INSERT INTO `tb_knowledge_picture` VALUES (360, 'D:\\ffmpeg\\img', 342);
INSERT INTO `tb_knowledge_picture` VALUES (361, 'D:\\ffmpeg\\img', 342);
INSERT INTO `tb_knowledge_picture` VALUES (362, 'D:\\ffmpeg\\img', 342);
INSERT INTO `tb_knowledge_picture` VALUES (363, 'D:\\ffmpeg\\img', 342);
INSERT INTO `tb_knowledge_picture` VALUES (364, 'D:\\ffmpeg\\img', 343);
INSERT INTO `tb_knowledge_picture` VALUES (365, 'D:\\ffmpeg\\img', 343);
INSERT INTO `tb_knowledge_picture` VALUES (366, 'D:\\ffmpeg\\img', 343);
INSERT INTO `tb_knowledge_picture` VALUES (367, 'D:\\ffmpeg\\img', 343);
INSERT INTO `tb_knowledge_picture` VALUES (368, 'D:\\ffmpeg\\img', 343);
INSERT INTO `tb_knowledge_picture` VALUES (369, 'D:\\ffmpeg\\img', 344);
INSERT INTO `tb_knowledge_picture` VALUES (370, 'D:\\ffmpeg\\img', 344);
INSERT INTO `tb_knowledge_picture` VALUES (371, 'D:\\ffmpeg\\img', 344);
INSERT INTO `tb_knowledge_picture` VALUES (372, 'D:\\ffmpeg\\img', 344);
INSERT INTO `tb_knowledge_picture` VALUES (373, 'D:\\ffmpeg\\img', 344);
INSERT INTO `tb_knowledge_picture` VALUES (374, 'D:\\ffmpeg\\img', 345);
INSERT INTO `tb_knowledge_picture` VALUES (375, 'D:\\ffmpeg\\img', 345);
INSERT INTO `tb_knowledge_picture` VALUES (376, 'D:\\ffmpeg\\img', 345);
INSERT INTO `tb_knowledge_picture` VALUES (377, 'D:\\ffmpeg\\img', 345);
INSERT INTO `tb_knowledge_picture` VALUES (378, 'D:\\ffmpeg\\img', 345);
INSERT INTO `tb_knowledge_picture` VALUES (379, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (380, 'src\\img\\001.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (381, 'src\\img\\001.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (382, 'src\\img\\001.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (383, 'src\\img\\001.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (384, 'src\\img\\001.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (385, 'src\\img\\001.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (386, 'src\\img\\001.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (387, 'src\\img\\001.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (388, 'src\\img\\001.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (389, 'src\\img\\001.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (390, 'src\\img\\001.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (391, 'src\\img\\001.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (392, 'src\\img\\001.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (393, 'src\\img\\001.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (394, 'src\\img\\001.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (395, 'src\\img\\001.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (396, 'src\\img\\001.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (397, 'src\\img\\001.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (398, 'src\\img\\001.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (399, 'src\\img\\001.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (400, 'src\\img\\001.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (401, 'src\\img\\001.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (402, 'src\\img\\001.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (403, 'src\\img\\001.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (404, 'src\\img\\001.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (405, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (406, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (407, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (408, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (409, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (410, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (411, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (412, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (413, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (414, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (415, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (416, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (417, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (418, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (419, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (420, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (421, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (422, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (423, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (424, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (425, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (426, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (427, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (428, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (429, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (430, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (431, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (432, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (433, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (434, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (435, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (436, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (437, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (438, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (439, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (440, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (441, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (442, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (443, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (444, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (445, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (446, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (447, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (448, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (449, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (450, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (451, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (452, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (453, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (454, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (455, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (456, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (457, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (458, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (459, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (460, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (461, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (462, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (463, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (464, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (465, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (466, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (467, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (468, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (469, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (470, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (471, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (472, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (473, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (474, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (475, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (476, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (477, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (478, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (479, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (480, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (481, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (482, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (483, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (484, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (485, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (486, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (487, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (488, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (489, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (490, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (491, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (492, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (493, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (494, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (495, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (496, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (497, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (498, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (499, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (500, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (501, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (502, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (503, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (504, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (505, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (506, '', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (507, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (508, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (509, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (510, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (511, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (512, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (513, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (514, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (515, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (516, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (517, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (518, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (519, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (520, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (521, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (522, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (523, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (524, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (525, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (526, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (527, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (528, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (529, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (530, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (531, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (532, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (533, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (534, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (535, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (536, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (537, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (538, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (539, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (540, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (541, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (542, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (543, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (544, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (545, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (546, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (547, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (548, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (549, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (550, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (551, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (552, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (553, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (554, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (555, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (556, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (557, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (558, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (559, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (560, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (561, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (562, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (563, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (564, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (565, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (566, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (567, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (568, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (569, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (570, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (571, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (572, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (573, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (574, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (575, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (576, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (577, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (578, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (579, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (580, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (581, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (582, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (583, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (584, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (585, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (586, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (587, 'src/img/001.jpg', 360);
INSERT INTO `tb_knowledge_picture` VALUES (588, 'src/img/002.jpg', 360);
INSERT INTO `tb_knowledge_picture` VALUES (589, 'src/img/003.jpg', 360);
INSERT INTO `tb_knowledge_picture` VALUES (590, 'src/img/004.jpg', 360);
INSERT INTO `tb_knowledge_picture` VALUES (591, 'src/img/005.jpg', 360);
INSERT INTO `tb_knowledge_picture` VALUES (592, 'src/img/006.jpg', 360);
INSERT INTO `tb_knowledge_picture` VALUES (593, 'src/img/007.jpg', 360);
INSERT INTO `tb_knowledge_picture` VALUES (594, 'src/img/008.jpg', 360);
INSERT INTO `tb_knowledge_picture` VALUES (595, 'src/img/009.jpg', 360);
INSERT INTO `tb_knowledge_picture` VALUES (596, 'src/img/010.jpg', 360);
INSERT INTO `tb_knowledge_picture` VALUES (597, 'src/img/011.jpg', 360);
INSERT INTO `tb_knowledge_picture` VALUES (598, 'src/img/012.jpg', 361);
INSERT INTO `tb_knowledge_picture` VALUES (599, 'src/img/013.jpg', 361);
INSERT INTO `tb_knowledge_picture` VALUES (600, 'src/img/014.jpg', 362);
INSERT INTO `tb_knowledge_picture` VALUES (601, 'src/img/015.jpg', 362);
INSERT INTO `tb_knowledge_picture` VALUES (602, 'src/img/016.jpg', 362);
INSERT INTO `tb_knowledge_picture` VALUES (603, 'src/img/017.jpg', 364);
INSERT INTO `tb_knowledge_picture` VALUES (604, 'src/img/018.jpg', 363);
INSERT INTO `tb_knowledge_picture` VALUES (605, 'src/img/019.jpg', 363);
INSERT INTO `tb_knowledge_picture` VALUES (606, 'src/img/020.jpg', 363);
INSERT INTO `tb_knowledge_picture` VALUES (607, 'src/img/021.jpg', 363);
INSERT INTO `tb_knowledge_picture` VALUES (608, 'src/img/022.jpg', 365);
INSERT INTO `tb_knowledge_picture` VALUES (609, 'src/img/023.jpg', 366);
INSERT INTO `tb_knowledge_picture` VALUES (610, 'src/img/024.jpg', 366);
INSERT INTO `tb_knowledge_picture` VALUES (611, 'src/img/025.jpg', 366);
INSERT INTO `tb_knowledge_picture` VALUES (612, 'src/img/026.jpg', 366);
INSERT INTO `tb_knowledge_picture` VALUES (613, 'src/img/027.jpg', 366);
INSERT INTO `tb_knowledge_picture` VALUES (614, 'src/img/028.jpg', 366);
INSERT INTO `tb_knowledge_picture` VALUES (615, 'src/img/029.jpg', 366);
INSERT INTO `tb_knowledge_picture` VALUES (616, 'src/img/030.jpg', 366);
INSERT INTO `tb_knowledge_picture` VALUES (617, 'src/img/031.jpg', 367);
INSERT INTO `tb_knowledge_picture` VALUES (618, 'src/img/032.jpg', 367);
INSERT INTO `tb_knowledge_picture` VALUES (619, 'src/img/033.jpg', 368);
INSERT INTO `tb_knowledge_picture` VALUES (620, 'src/img/034.jpg', 368);
INSERT INTO `tb_knowledge_picture` VALUES (621, 'src/img/035.jpg', 368);
INSERT INTO `tb_knowledge_picture` VALUES (622, 'src/img/036.jpg', 368);
INSERT INTO `tb_knowledge_picture` VALUES (623, 'src/img/037.jpg', 369);
INSERT INTO `tb_knowledge_picture` VALUES (624, 'src/img/038.jpg', 369);
INSERT INTO `tb_knowledge_picture` VALUES (625, 'src/img/039.jpg', 369);
INSERT INTO `tb_knowledge_picture` VALUES (626, 'src/img/040.jpg', 370);
INSERT INTO `tb_knowledge_picture` VALUES (627, 'src/img/041.jpg', 370);
INSERT INTO `tb_knowledge_picture` VALUES (628, 'src/img/042.jpg', 370);
INSERT INTO `tb_knowledge_picture` VALUES (629, 'src/img/043.jpg', 370);
INSERT INTO `tb_knowledge_picture` VALUES (630, 'src/img/044.jpg', 371);
INSERT INTO `tb_knowledge_picture` VALUES (631, 'src/img/045.jpg', 372);
INSERT INTO `tb_knowledge_picture` VALUES (632, 'src/img/046.jpg', 372);
INSERT INTO `tb_knowledge_picture` VALUES (633, 'src/img/047.jpg', 372);
INSERT INTO `tb_knowledge_picture` VALUES (634, 'src/img/048.jpg', 372);
INSERT INTO `tb_knowledge_picture` VALUES (635, 'src/img/049.jpg', 372);
INSERT INTO `tb_knowledge_picture` VALUES (636, 'src/img/050.jpg', 371);
INSERT INTO `tb_knowledge_picture` VALUES (637, 'src/img/051.jpg', 371);
INSERT INTO `tb_knowledge_picture` VALUES (638, 'src/img/052.jpg', 371);
INSERT INTO `tb_knowledge_picture` VALUES (639, 'src/img/053.jpg', 371);
INSERT INTO `tb_knowledge_picture` VALUES (640, 'src/img/054.jpg', 371);
INSERT INTO `tb_knowledge_picture` VALUES (641, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (642, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (643, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (644, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (645, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (646, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (647, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (648, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (649, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (650, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (651, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (652, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (653, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (654, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (655, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (656, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (657, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (658, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (659, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (660, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (661, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (662, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (663, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (664, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (665, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (666, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (667, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (668, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (669, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (670, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (671, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (672, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (673, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (674, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (675, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (676, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (677, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (678, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (679, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (680, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (681, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (682, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (683, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (684, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (685, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (686, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (687, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (688, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (689, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (690, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (691, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (692, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (693, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (694, NULL, NULL);
INSERT INTO `tb_knowledge_picture` VALUES (695, 'src/img/001.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (696, 'src/img/002.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (697, 'src/img/003.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (698, 'src/img/004.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (699, 'src/img/005.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (700, 'src/img/006.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (701, 'src/img/007.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (702, 'src/img/008.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (703, 'src/img/009.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (704, 'src/img/010.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (705, 'src/img/011.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (706, 'src/img/012.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (707, 'src/img/013.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (708, 'src/img/014.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (709, 'src/img/015.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (710, 'src/img/016.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (711, 'src/img/017.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (712, 'src/img/018.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (713, 'src/img/019.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (714, 'src/img/020.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (715, 'src/img/021.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (716, 'src/img/022.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (717, 'src/img/023.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (718, 'src/img/024.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (719, 'src/img/025.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (720, 'src/img/026.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (721, 'src/img/027.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (722, 'src/img/028.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (723, 'src/img/029.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (724, 'src/img/030.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (725, 'src/img/031.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (726, 'src/img/032.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (727, 'src/img/033.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (728, 'src/img/034.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (729, 'src/img/035.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (730, 'src/img/036.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (731, 'src/img/037.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (732, 'src/img/038.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (733, 'src/img/039.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (734, 'src/img/040.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (735, 'src/img/041.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (736, 'src/img/042.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (737, 'src/img/043.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (738, 'src/img/044.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (739, 'src/img/045.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (740, 'src/img/046.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (741, 'src/img/047.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (742, 'src/img/048.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (743, 'src/img/049.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (744, 'src/img/050.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (745, 'src/img/051.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (746, 'src/img/052.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (747, 'src/img/053.jpg', NULL);
INSERT INTO `tb_knowledge_picture` VALUES (748, 'src/img/054.jpg', NULL);

-- ----------------------------
-- Table structure for tb_knowledge_student_state
-- ----------------------------
DROP TABLE IF EXISTS `tb_knowledge_student_state`;
CREATE TABLE `tb_knowledge_student_state`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `lesson_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '课程id',
  `state` int(1) UNSIGNED NULL DEFAULT NULL COMMENT '状态',
  `scan_start_time` datetime(6) NULL DEFAULT NULL COMMENT '开始扫描时间',
  `scan_end_time` datetime(6) NULL DEFAULT NULL COMMENT '结束扫描时间',
  `knowledge_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '知识点id',
  `create_time` datetime(6) NULL DEFAULT NULL,
  `modify_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_lesson_id`(`lesson_id`) USING BTREE,
  INDEX `idx_user_id_lesson_id`(`user_id`, `lesson_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 471 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_knowledge_student_state
-- ----------------------------
INSERT INTO `tb_knowledge_student_state` VALUES (2, 2, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 360, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (3, 1, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 360, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (4, 3, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 360, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (5, 4, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 360, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (6, 5, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 360, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (7, 6, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 331, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (8, 7, 34, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 331, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (9, 8, 34, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 331, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (10, 9, 34, 3, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 331, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (11, 10, 34, 1, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000', 332, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (12, 11, 34, 1, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000', 332, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (13, 12, 34, 2, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 332, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (14, 13, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 332, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (15, 14, 34, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 332, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (16, 15, 34, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 332, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (17, 2, 241, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 358, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (18, 3, 241, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 358, '2019-07-08 15:44:40.000000', '2019-07-08 15:44:40.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (19, 4, 241, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 358, '2019-10-30 13:42:43.000000', '2019-10-30 13:42:43.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (20, 1, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 2, '2019-10-31 17:03:05.000000', '2019-10-31 17:03:05.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (21, 1, 241, 2, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 357, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (22, 2, 241, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 357, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (23, 3, 241, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 357, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (24, 4, 241, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 357, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (25, 5, 241, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 357, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (26, 2, 1, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 2, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (27, 3, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 2, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (28, 4, 1, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 2, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (29, 5, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 2, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (30, 5, 241, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 358, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (31, 1, 241, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 358, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (32, 2, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 361, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (33, 1, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 361, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (34, 3, 33, 3, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 361, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (35, 4, 33, 4, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 361, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (36, 5, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 361, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (37, 2, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 362, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (38, 1, 33, 2, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 362, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (39, 3, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 362, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (40, 4, 33, 3, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 362, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (41, 5, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 362, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (42, 2, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 363, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (43, 1, 33, 3, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 363, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (44, 3, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 363, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (45, 4, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 363, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (46, 5, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 363, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (47, 2, 33, 3, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 364, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (48, 1, 33, 2, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 364, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (49, 3, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 364, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (50, 4, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 364, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (51, 5, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 364, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (52, 2, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 365, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (53, 1, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 365, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (54, 3, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 365, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (55, 4, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 365, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (56, 5, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 365, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (57, 6, 34, 3, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 342, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (58, 7, 34, 2, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 342, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (59, 8, 34, 4, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 342, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (60, 9, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 342, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (61, 10, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 342, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (62, 6, 34, 3, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 343, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (63, 7, 34, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 343, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (64, 8, 34, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 343, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (65, 9, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 343, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (66, 10, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 343, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (67, 6, 34, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 344, NULL, NULL);
INSERT INTO `tb_knowledge_student_state` VALUES (68, 7, 34, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 344, NULL, NULL);
INSERT INTO `tb_knowledge_student_state` VALUES (69, 8, 34, 3, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 344, NULL, NULL);
INSERT INTO `tb_knowledge_student_state` VALUES (70, 9, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 344, NULL, NULL);
INSERT INTO `tb_knowledge_student_state` VALUES (71, 10, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 344, NULL, NULL);
INSERT INTO `tb_knowledge_student_state` VALUES (72, 6, 34, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 345, NULL, NULL);
INSERT INTO `tb_knowledge_student_state` VALUES (73, 7, 34, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 345, NULL, NULL);
INSERT INTO `tb_knowledge_student_state` VALUES (74, 8, 34, 3, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 345, NULL, NULL);
INSERT INTO `tb_knowledge_student_state` VALUES (75, 9, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 345, NULL, NULL);
INSERT INTO `tb_knowledge_student_state` VALUES (76, 10, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 345, NULL, NULL);
INSERT INTO `tb_knowledge_student_state` VALUES (77, 2, 1, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 3, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (78, 3, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 3, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (79, 4, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 3, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (80, 5, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 3, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (81, 1, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 3, '2019-10-31 17:03:05.000000', '2019-10-31 17:03:05.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (82, 2, 1, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 4, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (83, 3, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 4, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (84, 4, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 4, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (85, 5, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 4, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (86, 1, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 4, '2019-10-31 17:03:05.000000', '2019-10-31 17:03:05.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (87, 2, 1, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 5, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (88, 3, 1, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 5, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (89, 4, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 5, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (90, 5, 1, 3, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 5, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (91, 1, 1, 4, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 5, '2019-10-31 17:03:05.000000', '2019-10-31 17:03:05.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (92, 2, 1, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 6, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (93, 3, 1, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 6, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (94, 4, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 6, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (95, 5, 1, 3, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 6, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (96, 1, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 6, '2019-10-31 17:03:05.000000', '2019-10-31 17:03:05.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (97, 2, 1, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 7, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (98, 3, 1, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 7, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (99, 4, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 7, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (100, 5, 1, 3, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 7, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (101, 1, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 7, '2019-10-31 17:03:05.000000', '2019-10-31 17:03:05.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (102, 1, 253, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 357, '2019-10-31 17:03:05.000000', '2019-10-31 17:03:05.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (103, 2, 253, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 357, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (104, 3, 253, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 357, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (105, 4, 253, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 357, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (106, 5, 253, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 357, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (108, 1, 253, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 358, '2019-10-31 17:03:05.000000', '2019-10-31 17:03:05.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (109, 2, 253, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 358, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (110, 3, 253, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 358, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (111, 4, 253, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 358, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (112, 5, 253, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 358, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (113, 1, 253, 4, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 359, '2019-10-31 17:03:05.000000', '2019-10-31 17:03:05.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (114, 2, 253, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 359, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (115, 3, 253, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 359, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (116, 4, 253, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 359, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (117, 5, 253, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 359, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (118, 11, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 360, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (119, 12, 33, 4, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 360, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (120, 13, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 360, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (121, 14, 33, 3, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 360, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (122, 15, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 360, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (123, 16, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 360, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (124, 17, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 360, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (125, 18, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 360, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (126, 19, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 360, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (127, 20, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 360, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (128, 21, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 360, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (129, 22, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 360, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (130, 23, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 360, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (131, 27, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 360, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (132, 28, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 360, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (133, 29, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 360, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (134, 11, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 361, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (135, 12, 33, 4, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 361, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (136, 13, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 361, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (137, 14, 33, 3, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 361, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (138, 15, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 361, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (139, 16, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 361, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (140, 17, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 361, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (141, 18, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 361, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (142, 19, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 361, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (143, 20, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 361, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (144, 21, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 361, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (145, 22, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 361, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (146, 23, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 361, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (147, 27, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 361, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (148, 28, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 361, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (149, 29, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 361, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (150, 11, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 362, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (151, 12, 33, 4, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 362, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (152, 13, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 362, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (153, 14, 33, 3, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 362, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (154, 15, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 362, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (155, 16, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 362, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (156, 17, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 362, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (157, 18, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 362, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (158, 19, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 362, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (159, 20, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 362, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (160, 21, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 362, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (161, 22, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 362, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (162, 23, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 362, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (163, 27, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 362, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (164, 28, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 362, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (165, 29, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 362, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (166, 11, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 363, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (167, 12, 33, 4, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 363, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (168, 13, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 363, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (169, 14, 33, 3, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 363, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (170, 15, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 363, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (171, 16, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 363, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (172, 17, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 363, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (173, 18, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 363, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (174, 19, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 363, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (175, 20, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 363, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (176, 21, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 363, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (177, 22, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 363, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (178, 23, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 363, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (179, 27, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 363, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (180, 28, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 363, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (181, 29, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 363, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (182, 11, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 364, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (183, 12, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 364, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (184, 13, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 364, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (185, 14, 33, 3, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 364, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (186, 15, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 364, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (187, 16, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 364, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (188, 17, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 364, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (189, 18, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 364, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (190, 19, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 364, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (191, 20, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 364, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (192, 21, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 364, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (193, 22, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 364, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (194, 23, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 364, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (195, 27, 33, 4, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 364, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (196, 28, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 364, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (197, 29, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 364, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (198, 11, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 365, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (199, 12, 33, 4, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 365, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (200, 13, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 365, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (201, 14, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 365, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (202, 15, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 365, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (203, 16, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 365, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (204, 17, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 365, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (205, 18, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 365, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (206, 19, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 365, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (207, 20, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 365, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (208, 21, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 365, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (209, 22, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 365, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (210, 23, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 365, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (211, 27, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 365, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (212, 28, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 365, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (213, 29, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 365, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (214, 11, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 2, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (215, 12, 1, 4, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 2, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (216, 13, 1, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 2, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (217, 14, 1, 3, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 2, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (218, 15, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (219, 16, 1, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 2, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (220, 17, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 2, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (221, 18, 1, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 2, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (222, 19, 1, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 2, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (223, 20, 1, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (224, 21, 1, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 2, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (225, 22, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 2, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (226, 23, 1, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 2, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (227, 27, 1, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 2, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (228, 28, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (229, 29, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (230, 1, 1, 2, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 3, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (231, 3, 1, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 3, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (232, 4, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 3, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (233, 5, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 3, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (234, 2, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 3, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (235, 11, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 3, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (236, 12, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 3, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (237, 13, 1, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 3, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (238, 14, 1, 3, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 3, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (239, 15, 1, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 3, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (240, 16, 1, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 3, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (241, 17, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 3, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (242, 18, 1, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 3, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (243, 19, 1, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 3, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (244, 20, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 3, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (245, 21, 1, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 3, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (246, 22, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 3, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (247, 23, 1, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 3, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (248, 27, 1, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 3, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (249, 28, 1, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 3, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (250, 29, 1, 3, '2019-07-08 15:44:38.000000', '2019-11-10 14:06:00.000000', 3, '2019-07-08 15:03:19.000000', '2019-11-10 14:06:07.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (251, 11, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 366, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (252, 12, 33, 4, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 366, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (253, 13, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 366, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (254, 14, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 366, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (255, 15, 33, 3, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 366, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (256, 16, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 366, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (257, 17, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 366, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (258, 18, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 366, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (259, 19, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 366, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (260, 20, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 366, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (261, 21, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 366, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (262, 22, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 366, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (263, 23, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 366, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (264, 27, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 366, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (265, 28, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 366, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (266, 29, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 366, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (267, 2, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 366, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (268, 1, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 366, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (269, 3, 33, 2, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 366, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (270, 4, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 366, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (271, 5, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 366, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (272, 11, 33, 3, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 367, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (273, 12, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 367, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (274, 13, 33, 2, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 367, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (275, 14, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 367, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (276, 15, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 367, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (277, 16, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 367, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (278, 17, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 367, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (279, 18, 33, 2, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 367, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (280, 19, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 367, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (281, 20, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 367, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (282, 21, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 367, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (283, 22, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 367, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (284, 23, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 367, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (285, 27, 33, 4, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 367, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (286, 28, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 367, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (287, 29, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 367, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (288, 2, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 367, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (289, 1, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 367, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (290, 3, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 367, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (291, 4, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 367, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (292, 5, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 367, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (293, 11, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 368, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (294, 12, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 368, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (295, 13, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 368, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (296, 14, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 368, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (297, 15, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 368, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (298, 16, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 368, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (299, 17, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 368, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (300, 18, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 368, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (301, 19, 33, 2, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 368, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (302, 20, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 368, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (303, 21, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 368, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (304, 22, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 368, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (305, 23, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 368, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (306, 27, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 368, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (307, 28, 33, 3, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 368, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (308, 29, 33, 4, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 368, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (309, 2, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 368, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (310, 1, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 368, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (311, 3, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 368, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (312, 4, 33, 3, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 368, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (313, 5, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 368, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (314, 11, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 369, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (315, 12, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 369, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (316, 13, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 369, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (317, 14, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 369, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (318, 15, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 369, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (319, 16, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 369, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (320, 17, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 369, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (321, 18, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 369, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (322, 19, 33, 2, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 369, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (323, 20, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 369, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (324, 21, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 369, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (325, 22, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 369, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (326, 23, 33, 3, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 369, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (327, 27, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 369, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (328, 28, 33, 3, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 369, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (329, 29, 33, 4, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 369, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (330, 2, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 369, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (331, 1, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 369, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (332, 3, 33, 3, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 369, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (333, 4, 33, 3, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 369, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (334, 5, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 369, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (335, 11, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 370, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (336, 12, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 370, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (337, 13, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 370, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (338, 14, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 370, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (339, 15, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 370, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (340, 16, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 370, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (341, 17, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 370, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (342, 18, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 370, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (343, 19, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 370, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (344, 20, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 370, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (345, 21, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 370, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (346, 22, 33, 3, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 370, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (347, 23, 33, 2, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 370, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (348, 27, 33, 4, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 370, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (349, 28, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 370, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (350, 29, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 370, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (351, 2, 33, 3, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 370, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (352, 1, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 370, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (353, 3, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 370, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (354, 4, 33, 3, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 370, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (355, 5, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 370, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (356, 11, 33, 4, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 371, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (357, 12, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 371, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (358, 13, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 371, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (359, 14, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 371, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (360, 15, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 371, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (361, 16, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 371, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (362, 17, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 371, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (363, 18, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 371, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (364, 19, 33, 4, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 371, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (365, 20, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 371, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (366, 21, 33, 3, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 371, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (367, 22, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 371, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (368, 23, 33, 2, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 371, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (369, 27, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 371, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (370, 28, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 371, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (371, 29, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 371, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (372, 2, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 371, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (373, 1, 33, 2, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 371, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (374, 3, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 371, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (375, 4, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 371, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (376, 5, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 371, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (377, 11, 33, 4, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 372, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (378, 12, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 372, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (379, 13, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 372, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (380, 14, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 372, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (381, 15, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 372, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (382, 16, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 372, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (383, 17, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 372, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (384, 18, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 372, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (385, 19, 33, 4, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 372, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (386, 20, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 372, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (387, 21, 33, 3, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 372, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (388, 22, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 372, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (389, 23, 33, 2, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 372, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (390, 27, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 372, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (391, 28, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 372, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (392, 29, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 372, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (393, 2, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 372, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (394, 1, 33, 2, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 372, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (395, 3, 33, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 372, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (396, 4, 33, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 372, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (397, 5, 33, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 372, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (398, 11, 34, 4, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 373, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (399, 12, 34, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 373, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (400, 13, 34, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 373, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (401, 14, 34, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 373, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (402, 15, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 373, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (403, 16, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 373, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (404, 17, 34, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 373, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (405, 18, 34, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 373, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (406, 19, 34, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 373, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (407, 20, 34, 3, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 373, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (408, 21, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 373, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (409, 22, 34, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 373, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (410, 23, 34, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 373, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (411, 27, 34, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 373, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (412, 28, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 373, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (413, 29, 34, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 373, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (414, 2, 34, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 373, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (415, 1, 34, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 373, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (416, 3, 34, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 373, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (417, 4, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 373, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (418, 5, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 373, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (419, 11, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 374, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (420, 12, 34, 4, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 374, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (421, 13, 34, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 374, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (422, 14, 34, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 374, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (423, 15, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 374, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (424, 16, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 374, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (425, 17, 34, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 374, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (426, 18, 34, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 374, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (427, 19, 34, 4, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 374, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (428, 20, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 374, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (429, 21, 34, 3, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 374, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (430, 22, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 374, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (431, 23, 34, 2, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 374, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (432, 27, 34, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 374, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (433, 28, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 374, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (434, 29, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 374, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (435, 2, 34, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 374, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (436, 1, 34, 2, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 374, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (437, 3, 34, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 374, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (438, 4, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 374, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (439, 5, 34, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 374, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (440, 11, 34, 4, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 375, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (441, 12, 34, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 375, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (442, 13, 34, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 375, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (443, 14, 34, 2, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 375, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (444, 15, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 375, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (445, 16, 34, 4, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 375, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (446, 17, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 375, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (447, 18, 34, 3, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 375, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (448, 19, 34, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 375, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (449, 20, 34, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 375, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (450, 21, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 375, '2019-07-06 13:08:38.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (451, 22, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 375, '2019-07-06 16:02:50.000000', '2019-07-08 15:03:19.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (452, 23, 34, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 375, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (453, 27, 34, 2, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 375, '2019-07-08 15:03:19.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (454, 28, 34, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 375, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (455, 29, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 375, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (456, 2, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 375, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:39.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (457, 1, 34, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 375, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (458, 3, 34, 1, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000', 375, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (459, 4, 34, 2, '2019-07-08 15:03:20.000000', '2019-07-08 15:03:20.000000', 375, '2019-07-08 15:44:38.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (460, 5, 34, 1, '2019-07-08 15:03:20.000000', '2019-07-08 15:44:38.000000', 375, '2019-07-08 15:44:39.000000', '2019-07-08 15:44:38.000000');
INSERT INTO `tb_knowledge_student_state` VALUES (461, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_knowledge_student_state` VALUES (462, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_knowledge_student_state` VALUES (463, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_knowledge_student_state` VALUES (464, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_knowledge_student_state` VALUES (465, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_knowledge_student_state` VALUES (466, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_knowledge_student_state` VALUES (467, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_knowledge_student_state` VALUES (468, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_knowledge_student_state` VALUES (469, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_knowledge_student_state` VALUES (470, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_news
-- ----------------------------
DROP TABLE IF EXISTS `tb_news`;
CREATE TABLE `tb_news`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `create_time` datetime(6) NULL DEFAULT NULL,
  `modify_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_title`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_news
-- ----------------------------
INSERT INTO `tb_news` VALUES (52, '通知1', '通知正文', '2019-10-30 13:42:43.000000', '2019-10-30 13:42:43.000000');
INSERT INTO `tb_news` VALUES (53, '上课通知!', '李丽老师有新授课计划,请注意查看课表.该通知由系统自动推送.', '2019-10-31 15:58:40.000000', '2019-10-31 15:58:40.000000');
INSERT INTO `tb_news` VALUES (54, '通知1', '通知正文', '2019-10-31 17:03:05.000000', '2019-10-31 17:03:05.000000');
INSERT INTO `tb_news` VALUES (55, '上课通知!', '李丽老师有新授课计划,请注意查看课表.该通知由系统自动推送.', '2019-10-31 23:31:50.000000', '2019-10-31 23:31:50.000000');
INSERT INTO `tb_news` VALUES (56, '上课通知!', '李丽老师有新授课计划,请注意查看课表.该通知由系统自动推送.', '2019-10-31 23:42:12.000000', '2019-10-31 23:42:12.000000');
INSERT INTO `tb_news` VALUES (57, '上课通知!', '李丽老师有新授课计划,请注意查看课表.该通知由系统自动推送.', '2019-11-01 12:47:18.000000', '2019-11-01 12:47:18.000000');
INSERT INTO `tb_news` VALUES (58, '上课通知!', '李丽老师有新授课计划,请注意查看课表.该通知由系统自动推送.', '2019-11-01 15:05:01.000000', '2019-11-01 15:05:01.000000');
INSERT INTO `tb_news` VALUES (59, '上课通知!', '李丽老师有新授课计划,请注意查看课表.该通知由系统自动推送.', '2019-11-01 15:44:37.000000', '2019-11-01 15:44:37.000000');
INSERT INTO `tb_news` VALUES (60, '上课通知!', '李丽老师有新授课计划,请注意查看课表.该通知由系统自动推送.', '2019-11-02 14:16:47.000000', '2019-11-02 14:16:47.000000');
INSERT INTO `tb_news` VALUES (61, '上课通知!', '李丽老师有新授课计划,请注意查看课表.该通知由系统自动推送.', '2019-11-02 14:21:32.000000', '2019-11-02 14:21:32.000000');
INSERT INTO `tb_news` VALUES (62, '申请通知!', '您有新的教室申请!请查看', NULL, NULL);
INSERT INTO `tb_news` VALUES (63, '申请反馈!', '您的申请已接受!请查收', NULL, NULL);
INSERT INTO `tb_news` VALUES (64, '上课通知!', '李丽老师有新授课计划,请注意查看课表.该通知由系统自动推送.', '2019-11-03 14:34:58.000000', '2019-11-03 14:34:58.000000');
INSERT INTO `tb_news` VALUES (65, '上课通知!', '李丽老师有新授课计划,请注意查看课表.该通知由系统自动推送.', '2019-11-10 14:33:58.000000', '2019-11-10 14:33:58.000000');

-- ----------------------------
-- Table structure for tb_user_news
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_news`;
CREATE TABLE `tb_user_news`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `news_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '消息id',
  `state` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '阅读状态',
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_id_news_id`(`user_id`, `news_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_news_id`(`news_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 146 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user_news
-- ----------------------------
INSERT INTO `tb_user_news` VALUES (96, 16, 53, 0, '2019-10-31 15:58:40.000000', '2019-10-31 15:58:40.000000');
INSERT INTO `tb_user_news` VALUES (97, 17, 53, 0, '2019-10-31 15:58:40.000000', '2019-10-31 15:58:40.000000');
INSERT INTO `tb_user_news` VALUES (98, 18, 53, 0, '2019-10-31 15:58:40.000000', '2019-10-31 15:58:40.000000');
INSERT INTO `tb_user_news` VALUES (99, 19, 53, 0, '2019-10-31 15:58:40.000000', '2019-10-31 15:58:40.000000');
INSERT INTO `tb_user_news` VALUES (100, 20, 53, 0, '2019-10-31 15:58:40.000000', '2019-10-31 15:58:40.000000');
INSERT INTO `tb_user_news` VALUES (101, 21, 53, 0, '2019-10-31 15:58:40.000000', '2019-10-31 15:58:40.000000');
INSERT INTO `tb_user_news` VALUES (102, 38, 1, 0, '2019-10-31 17:03:06.000000', '2019-10-31 17:03:06.000000');
INSERT INTO `tb_user_news` VALUES (103, 16, 55, 0, '2019-10-31 23:31:50.000000', '2019-10-31 23:31:50.000000');
INSERT INTO `tb_user_news` VALUES (104, 17, 55, 0, '2019-10-31 23:31:50.000000', '2019-10-31 23:31:50.000000');
INSERT INTO `tb_user_news` VALUES (105, 18, 55, 0, '2019-10-31 23:31:50.000000', '2019-10-31 23:31:50.000000');
INSERT INTO `tb_user_news` VALUES (106, 19, 55, 0, '2019-10-31 23:31:50.000000', '2019-10-31 23:31:50.000000');
INSERT INTO `tb_user_news` VALUES (107, 20, 55, 0, '2019-10-31 23:31:50.000000', '2019-10-31 23:31:50.000000');
INSERT INTO `tb_user_news` VALUES (108, 21, 55, 0, '2019-10-31 23:31:50.000000', '2019-10-31 23:31:50.000000');
INSERT INTO `tb_user_news` VALUES (109, 1, 56, 0, '2019-10-31 23:42:12.000000', '2019-10-31 23:42:12.000000');
INSERT INTO `tb_user_news` VALUES (110, 2, 56, 0, '2019-10-31 23:42:12.000000', '2019-10-31 23:42:12.000000');
INSERT INTO `tb_user_news` VALUES (111, 3, 56, 0, '2019-10-31 23:42:12.000000', '2019-10-31 23:42:12.000000');
INSERT INTO `tb_user_news` VALUES (112, 4, 56, 0, '2019-10-31 23:42:12.000000', '2019-10-31 23:42:12.000000');
INSERT INTO `tb_user_news` VALUES (113, 5, 56, 0, '2019-10-31 23:42:12.000000', '2019-10-31 23:42:12.000000');
INSERT INTO `tb_user_news` VALUES (114, 1, 57, 0, '2019-11-01 12:47:18.000000', '2019-11-01 12:47:18.000000');
INSERT INTO `tb_user_news` VALUES (115, 1, 58, 0, '2019-11-01 15:05:01.000000', '2019-11-01 15:05:01.000000');
INSERT INTO `tb_user_news` VALUES (116, 2, 58, 0, '2019-11-01 15:05:01.000000', '2019-11-01 15:05:01.000000');
INSERT INTO `tb_user_news` VALUES (117, 3, 58, 0, '2019-11-01 15:05:01.000000', '2019-11-01 15:05:01.000000');
INSERT INTO `tb_user_news` VALUES (118, 4, 58, 0, '2019-11-01 15:05:01.000000', '2019-11-01 15:05:01.000000');
INSERT INTO `tb_user_news` VALUES (119, 5, 58, 0, '2019-11-01 15:05:01.000000', '2019-11-01 15:05:01.000000');
INSERT INTO `tb_user_news` VALUES (120, 1, 59, 0, '2019-11-01 15:44:37.000000', '2019-11-01 15:44:37.000000');
INSERT INTO `tb_user_news` VALUES (121, 2, 59, 0, '2019-11-01 15:44:37.000000', '2019-11-01 15:44:37.000000');
INSERT INTO `tb_user_news` VALUES (122, 3, 59, 0, '2019-11-01 15:44:37.000000', '2019-11-01 15:44:37.000000');
INSERT INTO `tb_user_news` VALUES (123, 4, 59, 0, '2019-11-01 15:44:37.000000', '2019-11-01 15:44:37.000000');
INSERT INTO `tb_user_news` VALUES (124, 5, 59, 0, '2019-11-01 15:44:37.000000', '2019-11-01 15:44:37.000000');
INSERT INTO `tb_user_news` VALUES (125, 1, 60, 0, '2019-11-02 14:16:47.000000', '2019-11-02 14:16:47.000000');
INSERT INTO `tb_user_news` VALUES (126, 16, 61, 0, '2019-11-02 14:21:32.000000', '2019-11-02 14:21:32.000000');
INSERT INTO `tb_user_news` VALUES (127, 17, 61, 0, '2019-11-02 14:21:32.000000', '2019-11-02 14:21:32.000000');
INSERT INTO `tb_user_news` VALUES (128, 18, 61, 0, '2019-11-02 14:21:32.000000', '2019-11-02 14:21:32.000000');
INSERT INTO `tb_user_news` VALUES (129, 19, 61, 0, '2019-11-02 14:21:32.000000', '2019-11-02 14:21:32.000000');
INSERT INTO `tb_user_news` VALUES (130, 20, 61, 0, '2019-11-02 14:21:32.000000', '2019-11-02 14:21:32.000000');
INSERT INTO `tb_user_news` VALUES (131, 21, 61, 0, '2019-11-02 14:21:32.000000', '2019-11-02 14:21:32.000000');
INSERT INTO `tb_user_news` VALUES (132, 31, 62, 1, NULL, NULL);
INSERT INTO `tb_user_news` VALUES (133, 33, 62, 1, NULL, '2019-11-06 13:38:55.000000');
INSERT INTO `tb_user_news` VALUES (134, 16, 64, 0, '2019-11-03 14:34:58.000000', '2019-11-03 14:34:58.000000');
INSERT INTO `tb_user_news` VALUES (135, 17, 64, 0, '2019-11-03 14:34:58.000000', '2019-11-03 14:34:58.000000');
INSERT INTO `tb_user_news` VALUES (136, 18, 64, 0, '2019-11-03 14:34:58.000000', '2019-11-03 14:34:58.000000');
INSERT INTO `tb_user_news` VALUES (137, 19, 64, 0, '2019-11-03 14:34:58.000000', '2019-11-03 14:34:58.000000');
INSERT INTO `tb_user_news` VALUES (138, 20, 64, 0, '2019-11-03 14:34:58.000000', '2019-11-03 14:34:58.000000');
INSERT INTO `tb_user_news` VALUES (139, 21, 64, 0, '2019-11-03 14:34:58.000000', '2019-11-03 14:34:58.000000');
INSERT INTO `tb_user_news` VALUES (140, 16, 65, 0, '2019-11-10 14:33:58.000000', '2019-11-10 14:33:58.000000');
INSERT INTO `tb_user_news` VALUES (141, 17, 65, 0, '2019-11-10 14:33:58.000000', '2019-11-10 14:33:58.000000');
INSERT INTO `tb_user_news` VALUES (142, 18, 65, 0, '2019-11-10 14:33:58.000000', '2019-11-10 14:33:58.000000');
INSERT INTO `tb_user_news` VALUES (143, 19, 65, 0, '2019-11-10 14:33:58.000000', '2019-11-10 14:33:58.000000');
INSERT INTO `tb_user_news` VALUES (144, 20, 65, 0, '2019-11-10 14:33:58.000000', '2019-11-10 14:33:58.000000');
INSERT INTO `tb_user_news` VALUES (145, 21, 65, 0, '2019-11-10 14:33:58.000000', '2019-11-10 14:33:58.000000');

SET FOREIGN_KEY_CHECKS = 1;
