/*
 Navicat Premium Data Transfer

 Source Server         : luna-xiccc-distribute-winserver
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : f.xicc.cc:3930
 Source Schema         : wednesday-platform

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 22/02/2021 22:28:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_agent
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent`;
CREATE TABLE `tb_agent` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `key` varchar(63) NOT NULL COMMENT 'key',
  `type` varchar(15) NOT NULL COMMENT '类型',
  `hardware` mediumtext NOT NULL COMMENT 'api secretkey',
  `agent_version` varchar(15) DEFAULT NULL COMMENT '创建版本',
  `last_seen` datetime DEFAULT NULL COMMENT '最后上线时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_agent` (`key`,`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_agent
-- ----------------------------
BEGIN;
INSERT INTO `tb_agent` VALUES (1, '2020-05-03 20:56:14', '2020-06-25 11:49:56', 69, 'C02VL2B8G8WN', 'sweeney', '{\"agentKey\":\"C02VL2B8G8WN\",\"agentVersion\":\"1.4-SNAPSHOT\",\"openCLDeviceDTOList\":[{\"clDeviceGlobalMemSize\":1708759450,\"clDeviceName\":\"Intel(R) Iris(TM) Pro Graphics 5200\",\"clDeviceOpenCLCVersion\":\"OpenCL C 1.2\",\"clDeviceType\":\"CL_DEVICE_TYPE_GPU\",\"clDeviceVendor\":\"Intel(R) Corporation\",\"clDeviceVendorId\":\"0x8086\",\"clDeviceVersion\":\"OpenCL 1.2\",\"clDriverVersion\":\"20.19.15.4835\",\"clPlatformICDSuffixKHR\":\"INTEL\",\"id\":0},{\"clDeviceGlobalMemSize\":17050124288,\"clDeviceName\":\"Intel(R) Core(TM) i7-4770HQ CPU @ 2.20GHz\",\"clDeviceOpenCLCVersion\":\"OpenCL C 1.2\",\"clDeviceType\":\"CL_DEVICE_TYPE_CPU\",\"clDeviceVendor\":\"Intel(R) Corporation\",\"clDeviceVendorId\":\"0x8086\",\"clDeviceVersion\":\"OpenCL 1.2 (Build 10094)\",\"clDriverVersion\":\"5.2.0.10094\",\"clPlatformICDSuffixKHR\":\"INTEL\",\"id\":1}],\"oshiHardwareDTO\":{\"firmwareDTO\":{\"description\":\"MBP114.88Z.0172.B25.1706181512\",\"manufacturer\":\"Apple Inc.\",\"name\":\"MBP114.88Z.0172.B25.1706181512\",\"version\":\"APPLE  - 0\"},\"hostName\":\"DESKTOP-OTT6C1B\",\"macAddressSet\":[\"6c:96:cf:dd:21:95\"],\"manufacturer\":\"Apple Inc.\",\"memoryDTO\":{\"memeryTotal\":17050124288,\"swapTotal\":17224581120},\"model\":\"MacBookPro11,4\",\"processorDTO\":{\"logicalProcessorCount\":8,\"name\":\"Intel(R) Core(TM) i7-4770HQ CPU @ 2.20GHz\",\"physicalPackageCount\":1,\"physicalProcessorCount\":4,\"processorId\":\"BFEBFBFF00040661\"},\"serialNumber\":\"C02VL2B8G8WN\"}}', '1.4-SNAPSHOT', '2020-06-25 11:50:02');
INSERT INTO `tb_agent` VALUES (3, '2021-01-19 16:04:11', '2021-01-25 05:54:03', 1283, '6CR3034Y01', 'sweeney', '{\"agentKey\":\"6CR3034Y01\",\"agentVersion\":\"1.6-SNAPSHOT\",\"oshiHardwareDTO\":{\"firmwareDTO\":{\"description\":\"8.05\",\"manufacturer\":\"AMI\",\"name\":\"8.05\",\"version\":\"HPQOEM - 1072009\"},\"hostName\":\"luna-7\",\"macAddressSet\":[\"10:60:4b:77:e5:13\"],\"manufacturer\":\"Hewlett-Packard\",\"memoryDTO\":{\"memeryTotal\":8467529728,\"swapTotal\":536870912},\"model\":\"HP Pro 3330 MT \",\"processorDTO\":{\"logicalProcessorCount\":2,\"name\":\"Intel(R) Pentium(R) CPU G645 @ 2.90GHz\",\"physicalPackageCount\":1,\"physicalProcessorCount\":2,\"processorId\":\"BFEBFBFF000206A7\"},\"serialNumber\":\"6CR3034Y01\"}}', '1.6-SNAPSHOT', '2021-01-25 05:54:03');
INSERT INTO `tb_agent` VALUES (4, '2021-01-19 16:38:45', '2021-01-21 06:46:11', 186, '6CR2500YYD', 'sweeney', '{\"agentKey\":\"6CR2500YYD\",\"agentVersion\":\"1.6-SNAPSHOT\",\"oshiHardwareDTO\":{\"firmwareDTO\":{\"description\":\"8.03\",\"manufacturer\":\"AMI\",\"name\":\"8.03\",\"version\":\"HPQOEM - 1072009\"},\"hostName\":\"luna-4\",\"macAddressSet\":[\"10:60:4b:6b:af:37\"],\"manufacturer\":\"Hewlett-Packard\",\"memoryDTO\":{\"memeryTotal\":8467460096,\"swapTotal\":536870912},\"model\":\"HP Pro 3330 MT \",\"processorDTO\":{\"logicalProcessorCount\":2,\"name\":\"Intel(R) Pentium(R) CPU G645 @ 2.90GHz\",\"physicalPackageCount\":1,\"physicalProcessorCount\":2,\"processorId\":\"BFEBFBFF000206A7\"},\"serialNumber\":\"6CR2500YYD\"}}', '1.6-SNAPSHOT', '2021-01-21 06:46:11');
INSERT INTO `tb_agent` VALUES (5, '2021-01-19 18:32:59', '2021-01-25 16:23:43', 15, 'a2:08:31:fc:62:bb', 'sweeney', '{\"agentKey\":\"a2:08:31:fc:62:bb\",\"agentVersion\":\"1.7-SNAPSHOT\",\"oshiHardwareDTO\":{\"firmwareDTO\":{\"description\":\"BIOS Date: 01/21/15 14:08:43 Ver: 07.02\",\"manufacturer\":\"American Megatrends Inc.\",\"name\":\"BIOS Date: 01/21/15 14:08:43 Ver: 07.02\",\"version\":\"ALASKA - 1072009\"},\"hostName\":\"luna-windows\",\"macAddressSet\":[\"a2:08:31:fc:62:bb\",\"1c:87:2c:74:de:7f\"],\"manufacturer\":\"System manufacturer\",\"memoryDTO\":{\"memeryTotal\":8532008960,\"swapTotal\":4831838208},\"model\":\"System Product Name\",\"processorDTO\":{\"logicalProcessorCount\":4,\"name\":\"AMD Athlon(tm) X4 730 Quad Core Processor      \",\"physicalPackageCount\":1,\"physicalProcessorCount\":2,\"processorId\":\"178BFBFF00610F01\"},\"serialNumber\":\"System Serial Number\"}}', '1.7-SNAPSHOT', '2021-01-25 16:23:44');
COMMIT;

-- ----------------------------
-- Table structure for tb_hashcat_hash
-- ----------------------------
DROP TABLE IF EXISTS `tb_hashcat_hash`;
CREATE TABLE `tb_hashcat_hash` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `modified_time` datetime NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(63) NOT NULL,
  `content` mediumtext,
  `project_lines` bigint(20) NOT NULL COMMENT '计算行数',
  `result` mediumtext,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_hashcat_hash
-- ----------------------------
BEGIN;
INSERT INTO `tb_hashcat_hash` VALUES (4, '2020-05-05 22:50:06', '2020-06-24 22:28:54', 4, 'testhash2', NULL, 0, '[\"25d55ad283aa400af464c76d713c07ad:12345678\"]');
INSERT INTO `tb_hashcat_hash` VALUES (5, '2020-12-29 21:20:34', '2020-12-29 21:20:34', 0, 'testhash3', '[\"82d1e255b0473c030f69eb8b3fbc5a31\"]', 0, NULL);
INSERT INTO `tb_hashcat_hash` VALUES (6, '2021-01-19 16:11:23', '2021-01-25 15:14:31', 1, 'testhash1', NULL, 0, '[\"8743b52063cd84097a65d1633f5c74f5:hashcat\"]');
INSERT INTO `tb_hashcat_hash` VALUES (7, '2021-01-19 16:25:45', '2021-01-25 15:15:11', 1, 'testhash4', NULL, 0, '[\"e28c32958a44e096fd37447ea776615b:1772249015\"]');
COMMIT;

-- ----------------------------
-- Table structure for tb_hashcat_project
-- ----------------------------
DROP TABLE IF EXISTS `tb_hashcat_project`;
CREATE TABLE `tb_hashcat_project` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `modified_time` datetime NOT NULL,
  `version` int(11) unsigned NOT NULL,
  `mask` varchar(63) NOT NULL,
  `keyspace` bigint(20) DEFAULT NULL,
  `hash_mode` int(10) unsigned NOT NULL,
  `attack_mode` tinyint(3) unsigned NOT NULL,
  `hash_id` bigint(20) unsigned NOT NULL,
  `lines` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_keyspace` (`keyspace`) USING BTREE,
  KEY `idx_mask` (`mask`) USING BTREE,
  KEY `idx_hash_mode` (`hash_mode`) USING BTREE,
  KEY `idx_attack_mode` (`attack_mode`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_hashcat_project
-- ----------------------------
BEGIN;
INSERT INTO `tb_hashcat_project` VALUES (11, NULL, '2020-12-29 21:21:00', '2020-12-29 21:30:40', 5, '?l?l?l?l?l?l?l', 456976, 0, 3, 5, 8031810176);
INSERT INTO `tb_hashcat_project` VALUES (12, NULL, '2021-01-19 16:12:49', '2021-01-25 15:14:31', 5, '?l?l?l?l?l?l?l', 456976, 0, 3, 6, 8031810176);
INSERT INTO `tb_hashcat_project` VALUES (13, NULL, '2021-01-19 16:26:06', '2021-01-25 15:15:12', 5, '?d?d?d?d?d?d?d?d?d?d', 10000000, 0, 3, 7, 10000000000);
COMMIT;

-- ----------------------------
-- Table structure for tb_hashcat_status
-- ----------------------------
DROP TABLE IF EXISTS `tb_hashcat_status`;
CREATE TABLE `tb_hashcat_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `modified_time` datetime NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `agent_id` bigint(20) unsigned NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_agent_id` (`agent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_hashcat_status
-- ----------------------------
BEGIN;
INSERT INTO `tb_hashcat_status` VALUES (1, '2020-05-06 11:51:12', '2020-05-06 11:52:19', 1, 1, '{\"attempted\":\"218162483680\",\"speedList\":[\"116555125\"],\"status\":\"running\",\"total\":\"235294112000\"}');
COMMIT;

-- ----------------------------
-- Table structure for tb_hashcat_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_hashcat_task`;
CREATE TABLE `tb_hashcat_task` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `modified_time` datetime NOT NULL,
  `version` int(11) unsigned NOT NULL,
  `skip` bigint(20) unsigned NOT NULL,
  `limit` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19274 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_hashcat_task
-- ----------------------------
BEGIN;
INSERT INTO `tb_hashcat_task` VALUES (19271, NULL, '2020-12-29 21:25:39', '2020-12-29 21:30:08', 2, 0, 456976);
INSERT INTO `tb_hashcat_task` VALUES (19272, NULL, '2021-01-19 16:52:20', '2021-01-25 15:14:30', 450, 0, 456976);
INSERT INTO `tb_hashcat_task` VALUES (19273, NULL, '2021-01-19 16:52:21', '2021-01-25 15:15:10', 444, 0, 10000000);
COMMIT;

-- ----------------------------
-- Table structure for tb_project
-- ----------------------------
DROP TABLE IF EXISTS `tb_project`;
CREATE TABLE `tb_project` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL COMMENT '版本',
  `project_name` varchar(63) NOT NULL COMMENT '项目名',
  `project_status` varchar(31) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_name` (`project_name`) USING BTREE,
  KEY `idx_status` (`project_status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_project
-- ----------------------------
BEGIN;
INSERT INTO `tb_project` VALUES (12, '2021-01-19 16:12:49', '2021-01-25 15:14:31', 5, 'testproject1', 'finish');
INSERT INTO `tb_project` VALUES (16, '2021-02-04 15:05:59', '2021-02-04 15:05:59', 0, '32323', '123');
INSERT INTO `tb_project` VALUES (18, '2021-02-04 15:07:40', '2021-02-04 15:07:40', 0, '32324', '123');
INSERT INTO `tb_project` VALUES (19, '2021-02-04 15:08:20', '2021-02-04 15:08:20', 0, '32325', '123');
INSERT INTO `tb_project` VALUES (23, '2021-02-04 15:19:52', '2021-02-04 15:19:52', 0, 'q', '123');
INSERT INTO `tb_project` VALUES (24, '2021-02-04 15:19:52', '2021-02-04 15:19:52', 0, 'w', '123');
INSERT INTO `tb_project` VALUES (29, '2021-02-04 15:23:04', '2021-02-04 15:23:04', 0, 'e', '123');
INSERT INTO `tb_project` VALUES (30, '2021-02-04 15:23:04', '2021-02-04 15:23:04', 0, 'r', '123');
COMMIT;

-- ----------------------------
-- Table structure for tb_speed
-- ----------------------------
DROP TABLE IF EXISTS `tb_speed`;
CREATE TABLE `tb_speed` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `modified_time` datetime NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `project_id` bigint(20) NOT NULL COMMENT '项目id',
  `agent_id` bigint(20) unsigned NOT NULL COMMENT '设备id',
  `task_size` int(10) unsigned NOT NULL,
  `running_second` int(10) unsigned NOT NULL,
  `indicators` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_speed` (`agent_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_speed
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_status
-- ----------------------------
DROP TABLE IF EXISTS `tb_status`;
CREATE TABLE `tb_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `modified_time` datetime NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `agent_id` bigint(20) unsigned NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_agent_id` (`agent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_status
-- ----------------------------
BEGIN;
INSERT INTO `tb_status` VALUES (1, '2020-05-06 11:51:12', '2020-05-06 11:52:19', 1, 1, '{\"attempted\":\"218162483680\",\"speedList\":[\"116555125\"],\"status\":\"running\",\"total\":\"235294112000\"}');
COMMIT;

-- ----------------------------
-- Table structure for tb_status_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_status_log`;
CREATE TABLE `tb_status_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `agent_id` bigint(20) unsigned NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_status_log
-- ----------------------------
BEGIN;
INSERT INTO `tb_status_log` VALUES (1, '2020-05-06 11:51:12', 1, '{\"attempted\":\"209466348000\",\"speedList\":[\"109595169\"],\"status\":\"running\",\"total\":\"235294112000\"}');
INSERT INTO `tb_status_log` VALUES (2, '2020-05-06 11:52:19', 1, '{\"attempted\":\"218162483680\",\"speedList\":[\"116555125\"],\"status\":\"running\",\"total\":\"235294112000\"}');
INSERT INTO `tb_status_log` VALUES (3, '2020-05-09 00:32:02', 1, '{\"attempted\":\"269089579040\",\"speedList\":[\"113213316\"],\"status\":\"running\",\"total\":\"294117640000\"}');
INSERT INTO `tb_status_log` VALUES (4, '2020-05-09 00:33:02', 1, '{\"attempted\":\"275959390240\",\"speedList\":[\"117102347\"],\"status\":\"running\",\"total\":\"294117640000\"}');
INSERT INTO `tb_status_log` VALUES (5, '2020-05-09 00:34:22', 1, '{\"attempted\":\"285391003680\",\"speedList\":[\"117124540\"],\"status\":\"running\",\"total\":\"294117640000\"}');
INSERT INTO `tb_status_log` VALUES (6, '2020-05-09 00:37:03', 1, '{\"attempted\":\"300587681600\",\"speedList\":[\"120056767\"],\"status\":\"running\",\"total\":\"323529404000\"}');
INSERT INTO `tb_status_log` VALUES (7, '2020-05-09 00:38:03', 1, '{\"attempted\":\"307601835840\",\"speedList\":[\"114843394\"],\"status\":\"running\",\"total\":\"323529404000\"}');
INSERT INTO `tb_status_log` VALUES (8, '2020-05-09 00:39:03', 1, '{\"attempted\":\"314774095680\",\"speedList\":[\"119762932\"],\"status\":\"running\",\"total\":\"323529404000\"}');
INSERT INTO `tb_status_log` VALUES (9, '2020-05-09 00:40:03', 1, '{\"attempted\":\"321970440000\",\"speedList\":[\"119917165\"],\"status\":\"running\",\"total\":\"323529404000\"}');
INSERT INTO `tb_status_log` VALUES (10, '2020-05-09 00:49:11', 1, '{\"attempted\":\"384833469600\",\"speedList\":[\"119829075\"],\"status\":\"running\",\"total\":\"411764696000\"}');
INSERT INTO `tb_status_log` VALUES (11, '2020-05-09 00:50:11', 1, '{\"attempted\":\"391943961760\",\"speedList\":[\"119894021\"],\"status\":\"running\",\"total\":\"411764696000\"}');
INSERT INTO `tb_status_log` VALUES (12, '2020-05-09 00:51:11', 1, '{\"attempted\":\"399132277920\",\"speedList\":[\"119388356\"],\"status\":\"running\",\"total\":\"411764696000\"}');
INSERT INTO `tb_status_log` VALUES (13, '2020-05-09 00:52:11', 1, '{\"attempted\":\"406346972320\",\"speedList\":[\"120817741\"],\"status\":\"running\",\"total\":\"411764696000\"}');
COMMIT;

-- ----------------------------
-- Table structure for tb_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_task`;
CREATE TABLE `tb_task` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL COMMENT '版本',
  `project_id` bigint(20) unsigned NOT NULL COMMENT '项目id',
  `status` varchar(31) NOT NULL COMMENT 'task状态',
  `skip` bigint(20) unsigned NOT NULL,
  `limit` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_project_id` (`project_id`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_task
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_task_result
-- ----------------------------
DROP TABLE IF EXISTS `tb_task_result`;
CREATE TABLE `tb_task_result` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL COMMENT '版本',
  `task_id` bigint(20) unsigned NOT NULL COMMENT 'task_id',
  `agent_id` bigint(20) unsigned NOT NULL COMMENT 'agent_id',
  `status` varchar(31) NOT NULL COMMENT '状态',
  `result` mediumtext COMMENT '单个task结果',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_task_id` (`task_id`) USING BTREE,
  KEY `idx_agent_id` (`agent_id`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_task_result
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
