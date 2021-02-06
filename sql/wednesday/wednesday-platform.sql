/*
 Navicat Premium Data Transfer

 Source Server         : luna-local
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : wednesday-platform

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 06/02/2021 16:06:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_agent
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent`;
CREATE TABLE `tb_agent`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NOT NULL COMMENT '修改时间',
  `version` int(11) NOT NULL COMMENT '版本',
  `key` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'key',
  `type` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `hardware` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'api secretkey',
  `agent_version` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建版本',
  `last_seen` datetime(0) NULL DEFAULT NULL COMMENT '最后上线时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_agent`(`key`, `type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_agent
-- ----------------------------
INSERT INTO `tb_agent` VALUES (1, '2020-05-03 20:56:14', '2020-06-25 11:49:56', 69, 'C02VL2B8G8WN', 'sweeney', '{\"agentKey\":\"C02VL2B8G8WN\",\"agentVersion\":\"1.4-SNAPSHOT\",\"openCLDeviceDTOList\":[{\"clDeviceGlobalMemSize\":1708759450,\"clDeviceName\":\"Intel(R) Iris(TM) Pro Graphics 5200\",\"clDeviceOpenCLCVersion\":\"OpenCL C 1.2\",\"clDeviceType\":\"CL_DEVICE_TYPE_GPU\",\"clDeviceVendor\":\"Intel(R) Corporation\",\"clDeviceVendorId\":\"0x8086\",\"clDeviceVersion\":\"OpenCL 1.2\",\"clDriverVersion\":\"20.19.15.4835\",\"clPlatformICDSuffixKHR\":\"INTEL\",\"id\":0},{\"clDeviceGlobalMemSize\":17050124288,\"clDeviceName\":\"Intel(R) Core(TM) i7-4770HQ CPU @ 2.20GHz\",\"clDeviceOpenCLCVersion\":\"OpenCL C 1.2\",\"clDeviceType\":\"CL_DEVICE_TYPE_CPU\",\"clDeviceVendor\":\"Intel(R) Corporation\",\"clDeviceVendorId\":\"0x8086\",\"clDeviceVersion\":\"OpenCL 1.2 (Build 10094)\",\"clDriverVersion\":\"5.2.0.10094\",\"clPlatformICDSuffixKHR\":\"INTEL\",\"id\":1}],\"oshiHardwareDTO\":{\"firmwareDTO\":{\"description\":\"MBP114.88Z.0172.B25.1706181512\",\"manufacturer\":\"Apple Inc.\",\"name\":\"MBP114.88Z.0172.B25.1706181512\",\"version\":\"APPLE  - 0\"},\"hostName\":\"DESKTOP-OTT6C1B\",\"macAddressSet\":[\"6c:96:cf:dd:21:95\"],\"manufacturer\":\"Apple Inc.\",\"memoryDTO\":{\"memeryTotal\":17050124288,\"swapTotal\":17224581120},\"model\":\"MacBookPro11,4\",\"processorDTO\":{\"logicalProcessorCount\":8,\"name\":\"Intel(R) Core(TM) i7-4770HQ CPU @ 2.20GHz\",\"physicalPackageCount\":1,\"physicalProcessorCount\":4,\"processorId\":\"BFEBFBFF00040661\"},\"serialNumber\":\"C02VL2B8G8WN\"}}', '1.4-SNAPSHOT', '2020-06-25 11:50:02');
INSERT INTO `tb_agent` VALUES (3, '2021-01-19 16:04:11', '2021-01-25 05:54:03', 1283, '6CR3034Y01', 'sweeney', '{\"agentKey\":\"6CR3034Y01\",\"agentVersion\":\"1.6-SNAPSHOT\",\"oshiHardwareDTO\":{\"firmwareDTO\":{\"description\":\"8.05\",\"manufacturer\":\"AMI\",\"name\":\"8.05\",\"version\":\"HPQOEM - 1072009\"},\"hostName\":\"luna-7\",\"macAddressSet\":[\"10:60:4b:77:e5:13\"],\"manufacturer\":\"Hewlett-Packard\",\"memoryDTO\":{\"memeryTotal\":8467529728,\"swapTotal\":536870912},\"model\":\"HP Pro 3330 MT \",\"processorDTO\":{\"logicalProcessorCount\":2,\"name\":\"Intel(R) Pentium(R) CPU G645 @ 2.90GHz\",\"physicalPackageCount\":1,\"physicalProcessorCount\":2,\"processorId\":\"BFEBFBFF000206A7\"},\"serialNumber\":\"6CR3034Y01\"}}', '1.6-SNAPSHOT', '2021-01-25 05:54:03');
INSERT INTO `tb_agent` VALUES (4, '2021-01-19 16:38:45', '2021-01-21 06:46:11', 186, '6CR2500YYD', 'sweeney', '{\"agentKey\":\"6CR2500YYD\",\"agentVersion\":\"1.6-SNAPSHOT\",\"oshiHardwareDTO\":{\"firmwareDTO\":{\"description\":\"8.03\",\"manufacturer\":\"AMI\",\"name\":\"8.03\",\"version\":\"HPQOEM - 1072009\"},\"hostName\":\"luna-4\",\"macAddressSet\":[\"10:60:4b:6b:af:37\"],\"manufacturer\":\"Hewlett-Packard\",\"memoryDTO\":{\"memeryTotal\":8467460096,\"swapTotal\":536870912},\"model\":\"HP Pro 3330 MT \",\"processorDTO\":{\"logicalProcessorCount\":2,\"name\":\"Intel(R) Pentium(R) CPU G645 @ 2.90GHz\",\"physicalPackageCount\":1,\"physicalProcessorCount\":2,\"processorId\":\"BFEBFBFF000206A7\"},\"serialNumber\":\"6CR2500YYD\"}}', '1.6-SNAPSHOT', '2021-01-21 06:46:11');
INSERT INTO `tb_agent` VALUES (5, '2021-01-19 18:32:59', '2021-01-25 16:23:43', 15, 'a2:08:31:fc:62:bb', 'sweeney', '{\"agentKey\":\"a2:08:31:fc:62:bb\",\"agentVersion\":\"1.7-SNAPSHOT\",\"oshiHardwareDTO\":{\"firmwareDTO\":{\"description\":\"BIOS Date: 01/21/15 14:08:43 Ver: 07.02\",\"manufacturer\":\"American Megatrends Inc.\",\"name\":\"BIOS Date: 01/21/15 14:08:43 Ver: 07.02\",\"version\":\"ALASKA - 1072009\"},\"hostName\":\"luna-windows\",\"macAddressSet\":[\"a2:08:31:fc:62:bb\",\"1c:87:2c:74:de:7f\"],\"manufacturer\":\"System manufacturer\",\"memoryDTO\":{\"memeryTotal\":8532008960,\"swapTotal\":4831838208},\"model\":\"System Product Name\",\"processorDTO\":{\"logicalProcessorCount\":4,\"name\":\"AMD Athlon(tm) X4 730 Quad Core Processor      \",\"physicalPackageCount\":1,\"physicalProcessorCount\":2,\"processorId\":\"178BFBFF00610F01\"},\"serialNumber\":\"System Serial Number\"}}', '1.7-SNAPSHOT', '2021-01-25 16:23:44');

-- ----------------------------
-- Table structure for tb_project
-- ----------------------------
DROP TABLE IF EXISTS `tb_project`;
CREATE TABLE `tb_project`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NOT NULL COMMENT '修改时间',
  `version` int(11) UNSIGNED NOT NULL COMMENT '版本',
  `project_name` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目名',
  `project_status` varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `project_lines` bigint(20) NOT NULL COMMENT '计算行数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`project_name`) USING BTREE,
  INDEX `idx_status`(`project_status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_project
-- ----------------------------
INSERT INTO `tb_project` VALUES (11, '2020-12-29 21:21:00', '2020-12-29 21:30:40', 5, 'testproject2', 'finish', 8031810176);
INSERT INTO `tb_project` VALUES (12, '2021-01-19 16:12:49', '2021-01-25 15:14:31', 5, 'testproject1', 'finish', 8031810176);
INSERT INTO `tb_project` VALUES (13, '2021-01-19 16:26:06', '2021-01-25 15:15:12', 5, 'testproject4', 'finish', 10000000000);
INSERT INTO `tb_project` VALUES (14, '2021-02-03 19:39:19', '2021-02-03 19:39:19', 0, '1', '1', 123);

-- ----------------------------
-- Table structure for tb_speed
-- ----------------------------
DROP TABLE IF EXISTS `tb_speed`;
CREATE TABLE `tb_speed`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NOT NULL,
  `modified_time` datetime(0) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `project_id` bigint(20) NOT NULL COMMENT '项目id',
  `agent_id` bigint(20) UNSIGNED NOT NULL COMMENT '设备id',
  `task_size` int(10) UNSIGNED NOT NULL,
  `running_second` int(10) UNSIGNED NOT NULL,
  `indicators` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_speed`(`agent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '速度' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_speed
-- ----------------------------

-- ----------------------------
-- Table structure for tb_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_task`;
CREATE TABLE `tb_task`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NOT NULL COMMENT '修改时间',
  `version` int(11) UNSIGNED NOT NULL COMMENT '版本',
  `project_id` bigint(20) UNSIGNED NOT NULL COMMENT '项目id',
  `status` varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'task状态',
  `skip` bigint(20) UNSIGNED NOT NULL,
  `limit` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_project_id`(`project_id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19274 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '单个任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_task
-- ----------------------------

-- ----------------------------
-- Table structure for tb_task_result
-- ----------------------------
DROP TABLE IF EXISTS `tb_task_result`;
CREATE TABLE `tb_task_result`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NOT NULL COMMENT '修改时间',
  `version` int(11) UNSIGNED NOT NULL COMMENT '版本',
  `task_id` bigint(20) UNSIGNED NOT NULL COMMENT 'task_id',
  `agent_id` bigint(20) UNSIGNED NOT NULL COMMENT 'agent_id',
  `status` varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `result` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '单个task结果',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_task_id`(`task_id`) USING BTREE,
  INDEX `idx_agent_id`(`agent_id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 557 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务结果' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_task_result
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
