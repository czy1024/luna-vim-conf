/*
 Navicat Premium Data Transfer

 Source Server         : luna-mysql-collage
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : cdb-5w1wgodg.bj.tencentcdb.com:10067
 Source Schema         : wednesday

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 06/12/2020 16:06:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_agent
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent`;
CREATE TABLE `tb_agent`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NOT NULL,
  `modified_time` datetime(0) NOT NULL,
  `version` int(11) NOT NULL,
  `key` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hardware` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `agent_version` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_seen` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_agent`(`key`, `type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_agent
-- ----------------------------
INSERT INTO `tb_agent` VALUES (1, '2020-05-03 20:56:14', '2020-06-25 11:49:56', 69, 'C02VL2B8G8WN', 'sweeney', '{\"agentKey\":\"C02VL2B8G8WN\",\"agentVersion\":\"1.4-SNAPSHOT\",\"openCLDeviceDTOList\":[{\"clDeviceGlobalMemSize\":1708759450,\"clDeviceName\":\"Intel(R) Iris(TM) Pro Graphics 5200\",\"clDeviceOpenCLCVersion\":\"OpenCL C 1.2\",\"clDeviceType\":\"CL_DEVICE_TYPE_GPU\",\"clDeviceVendor\":\"Intel(R) Corporation\",\"clDeviceVendorId\":\"0x8086\",\"clDeviceVersion\":\"OpenCL 1.2\",\"clDriverVersion\":\"20.19.15.4835\",\"clPlatformICDSuffixKHR\":\"INTEL\",\"id\":0},{\"clDeviceGlobalMemSize\":17050124288,\"clDeviceName\":\"Intel(R) Core(TM) i7-4770HQ CPU @ 2.20GHz\",\"clDeviceOpenCLCVersion\":\"OpenCL C 1.2\",\"clDeviceType\":\"CL_DEVICE_TYPE_CPU\",\"clDeviceVendor\":\"Intel(R) Corporation\",\"clDeviceVendorId\":\"0x8086\",\"clDeviceVersion\":\"OpenCL 1.2 (Build 10094)\",\"clDriverVersion\":\"5.2.0.10094\",\"clPlatformICDSuffixKHR\":\"INTEL\",\"id\":1}],\"oshiHardwareDTO\":{\"firmwareDTO\":{\"description\":\"MBP114.88Z.0172.B25.1706181512\",\"manufacturer\":\"Apple Inc.\",\"name\":\"MBP114.88Z.0172.B25.1706181512\",\"version\":\"APPLE  - 0\"},\"hostName\":\"DESKTOP-OTT6C1B\",\"macAddressSet\":[\"6c:96:cf:dd:21:95\"],\"manufacturer\":\"Apple Inc.\",\"memoryDTO\":{\"memeryTotal\":17050124288,\"swapTotal\":17224581120},\"model\":\"MacBookPro11,4\",\"processorDTO\":{\"logicalProcessorCount\":8,\"name\":\"Intel(R) Core(TM) i7-4770HQ CPU @ 2.20GHz\",\"physicalPackageCount\":1,\"physicalProcessorCount\":4,\"processorId\":\"BFEBFBFF00040661\"},\"serialNumber\":\"C02VL2B8G8WN\"}}', '1.4-SNAPSHOT', '2020-06-25 11:50:02');

-- ----------------------------
-- Table structure for tb_download
-- ----------------------------
DROP TABLE IF EXISTS `tb_download`;
CREATE TABLE `tb_download`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NOT NULL,
  `modified_time` datetime(0) NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url_map` varchar(511) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `manual` varchar(127) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_property`(`name`, `url_map`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_download
-- ----------------------------
INSERT INTO `tb_download` VALUES (2, '2020-04-03 15:39:58', '2020-04-03 15:40:00', 0, 'NiceHash Miner 3.x', '{\"下载地址1\":\"https://github.com/nicehash/NiceHashMiner/releases/download/3.0.0.4/nhm_windows_3.0.0.4.zip\",\"下载地址2\":\"https://note.youdao.com/ynoteshare1/index.html?id=df49e414c72c2b7d79607b72f8c7112e\"}', 'https://note.youdao.com/ynoteshare1/index.html?id=df49e414c72c2b7d79607b72f8c7112e');

-- ----------------------------
-- Table structure for tb_hash
-- ----------------------------
DROP TABLE IF EXISTS `tb_hash`;
CREATE TABLE `tb_hash`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NOT NULL,
  `modified_time` datetime(0) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `name` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `result` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_hash
-- ----------------------------
INSERT INTO `tb_hash` VALUES (4, '2020-05-05 22:50:06', '2020-06-24 22:28:54', 4, 'testhash2', NULL, '[\"25d55ad283aa400af464c76d713c07ad:12345678\"]');

-- ----------------------------
-- Table structure for tb_hashcat_hash_mode_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_hashcat_hash_mode_config`;
CREATE TABLE `tb_hashcat_hash_mode_config`  (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'attack_mode同名',
  `create_time` datetime(0) NOT NULL,
  `modified_time` datetime(0) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `name` varchar(127) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lines_per_task` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_hashcat_hash_mode_config
-- ----------------------------
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (0, '2020-05-05 00:14:34', '2020-05-05 00:14:34', 0, 'MD5', 30000000000);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (10, '2020-05-05 00:14:35', '2020-05-05 00:14:35', 0, 'md5($pass.$salt)', 10023);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (20, '2020-05-05 00:14:35', '2020-05-05 00:14:35', 0, 'md5($salt.$pass)', 10024);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (23, '2020-05-05 00:14:36', '2020-05-05 00:14:36', 0, 'Skype', 10074);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (30, '2020-05-05 00:14:35', '2020-05-05 00:14:35', 0, 'md5(utf16le($pass).$salt)', 10025);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (40, '2020-05-05 00:14:35', '2020-05-05 00:14:35', 0, 'md5($salt.utf16le($pass))', 10026);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (50, '2020-05-05 00:14:36', '2020-05-05 00:14:36', 0, 'HMAC-MD5 (key = $pass)', 10052);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (60, '2020-05-05 00:14:36', '2020-05-05 00:14:36', 0, 'HMAC-MD5 (key = $salt)', 10053);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (100, '2020-05-05 00:14:34', '2020-05-05 00:14:34', 0, 'SHA1', 10003);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (110, '2020-05-05 00:14:35', '2020-05-05 00:14:35', 0, 'sha1($pass.$salt)', 10035);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (120, '2020-05-05 00:14:35', '2020-05-05 00:14:35', 0, 'sha1($salt.$pass)', 10036);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (130, '2020-05-05 00:14:35', '2020-05-05 00:14:35', 0, 'sha1(utf16le($pass).$salt)', 10037);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (140, '2020-05-05 00:14:35', '2020-05-05 00:14:35', 0, 'sha1($salt.utf16le($pass))', 10038);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (150, '2020-05-05 00:14:36', '2020-05-05 00:14:36', 0, 'HMAC-SHA1 (key = $pass)', 10054);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (160, '2020-05-05 00:14:36', '2020-05-05 00:14:36', 0, 'HMAC-SHA1 (key = $salt)', 10055);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (400, '2020-05-05 00:14:36', '2020-05-05 00:14:36', 0, 'phpass', 10068);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (600, '2020-05-05 00:14:34', '2020-05-05 00:14:34', 0, 'BLAKE2b-512', 10016);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (900, '2020-05-05 00:14:34', '2020-05-05 00:14:34', 0, 'MD4', 10000);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (1300, '2020-05-05 00:14:34', '2020-05-05 00:14:34', 0, 'SHA2-224', 10004);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (1400, '2020-05-05 00:14:34', '2020-05-05 00:14:34', 0, 'SHA2-256', 10005);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (1410, '2020-05-05 00:14:35', '2020-05-05 00:14:35', 0, 'sha256($pass.$salt)', 10044);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (1420, '2020-05-05 00:14:35', '2020-05-05 00:14:35', 0, 'sha256($salt.$pass)', 10045);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (1430, '2020-05-05 00:14:35', '2020-05-05 00:14:35', 0, 'sha256(utf16le($pass).$salt)', 10046);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (1440, '2020-05-05 00:14:35', '2020-05-05 00:14:35', 0, 'sha256($salt.utf16le($pass))', 10047);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (1450, '2020-05-05 00:14:36', '2020-05-05 00:14:36', 0, 'HMAC-SHA256 (key = $pass)', 10056);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (1460, '2020-05-05 00:14:36', '2020-05-05 00:14:36', 0, 'HMAC-SHA256 (key = $salt)', 10057);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (1700, '2020-05-05 00:14:34', '2020-05-05 00:14:34', 0, 'SHA2-512', 10007);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (1710, '2020-05-05 00:14:35', '2020-05-05 00:14:35', 0, 'sha512($pass.$salt)', 10048);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (1720, '2020-05-05 00:14:36', '2020-05-05 00:14:36', 0, 'sha512($salt.$pass)', 10049);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (1730, '2020-05-05 00:14:36', '2020-05-05 00:14:36', 0, 'sha512(utf16le($pass).$salt)', 10050);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (1740, '2020-05-05 00:14:36', '2020-05-05 00:14:36', 0, 'sha512($salt.utf16le($pass))', 10051);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (1750, '2020-05-05 00:14:36', '2020-05-05 00:14:36', 0, 'HMAC-SHA512 (key = $pass)', 10058);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (1760, '2020-05-05 00:14:36', '2020-05-05 00:14:36', 0, 'HMAC-SHA512 (key = $salt)', 10059);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (2500, '2020-05-05 00:14:37', '2020-05-05 00:14:37', 0, 'WPA-EAPOL-PBKDF2', 10075);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (2501, '2020-05-05 00:14:37', '2020-05-05 00:14:37', 0, 'WPA-EAPOL-PMK', 10076);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (2600, '2020-05-05 00:14:35', '2020-05-05 00:14:35', 0, 'md5(md5($pass))', 10031);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (3710, '2020-05-05 00:14:35', '2020-05-05 00:14:35', 0, 'md5($salt.md5($pass))', 10028);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (3800, '2020-05-05 00:14:35', '2020-05-05 00:14:35', 0, 'md5($salt.$pass.$salt)', 10027);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (3910, '2020-05-05 00:14:35', '2020-05-05 00:14:35', 0, 'md5(md5($pass).md5($salt))', 10032);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (4010, '2020-05-05 00:14:35', '2020-05-05 00:14:35', 0, 'md5($salt.md5($salt.$pass))', 10029);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (4110, '2020-05-05 00:14:35', '2020-05-05 00:14:35', 0, 'md5($salt.md5($pass.$salt))', 10030);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (4300, '2020-05-05 00:14:35', '2020-05-05 00:14:35', 0, 'md5(strtoupper(md5($pass)))', 10033);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (4400, '2020-05-05 00:14:35', '2020-05-05 00:14:35', 0, 'md5(sha1($pass))', 10034);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (4500, '2020-05-05 00:14:35', '2020-05-05 00:14:35', 0, 'sha1(sha1($pass))', 10039);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (4520, '2020-05-05 00:14:35', '2020-05-05 00:14:35', 0, 'sha1($salt.sha1($pass))', 10040);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (4700, '2020-05-05 00:14:35', '2020-05-05 00:14:35', 0, 'sha1(md5($pass))', 10041);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (4800, '2020-05-05 00:14:37', '2020-05-05 00:14:37', 0, 'iSCSI CHAP authentication, MD5(CHAP)', 10079);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (4900, '2020-05-05 00:14:35', '2020-05-05 00:14:35', 0, 'sha1($salt.$pass.$salt)', 10042);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (5100, '2020-05-05 00:14:34', '2020-05-05 00:14:34', 0, 'Half MD5', 10002);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (5300, '2020-05-05 00:14:37', '2020-05-05 00:14:37', 0, 'IKE-PSK MD5', 10080);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (5400, '2020-05-05 00:14:37', '2020-05-05 00:14:37', 0, 'IKE-PSK SHA1', 10081);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (5500, '2020-05-05 00:14:37', '2020-05-05 00:14:37', 0, 'NetNTLMv1', 10082);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (6000, '2020-05-05 00:14:34', '2020-05-05 00:14:34', 0, 'RIPEMD-160', 10018);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (6100, '2020-05-05 00:14:34', '2020-05-05 00:14:34', 0, 'Whirlpool', 10019);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (6900, '2020-05-05 00:14:34', '2020-05-05 00:14:34', 0, 'GOST R 34.11-94', 10020);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (8900, '2020-05-05 00:14:36', '2020-05-05 00:14:36', 0, 'scrypt', 10069);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (10100, '2020-05-05 00:14:34', '2020-05-05 00:14:34', 0, 'SipHash', 10017);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (10800, '2020-05-05 00:14:34', '2020-05-05 00:14:34', 0, 'SHA2-384', 10006);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (10900, '2020-05-05 00:14:36', '2020-05-05 00:14:36', 0, 'PBKDF2-HMAC-SHA256', 10072);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (11700, '2020-05-05 00:14:34', '2020-05-05 00:14:34', 0, 'GOST R 34.11-2012 (Streebog) 256-bit, big-endian', 10021);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (11750, '2020-05-05 00:14:36', '2020-05-05 00:14:36', 0, 'HMAC-Streebog-256 (key = $pass), big-endian', 10060);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (11760, '2020-05-05 00:14:36', '2020-05-05 00:14:36', 0, 'HMAC-Streebog-256 (key = $salt), big-endian', 10061);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (11800, '2020-05-05 00:14:34', '2020-05-05 00:14:34', 0, 'GOST R 34.11-2012 (Streebog) 512-bit, big-endian', 10022);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (11850, '2020-05-05 00:14:36', '2020-05-05 00:14:36', 0, 'HMAC-Streebog-512 (key = $pass), big-endian', 10062);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (11860, '2020-05-05 00:14:36', '2020-05-05 00:14:36', 0, 'HMAC-Streebog-512 (key = $salt), big-endian', 10063);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (11900, '2020-05-05 00:14:36', '2020-05-05 00:14:36', 0, 'PBKDF2-HMAC-MD5', 10070);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (12000, '2020-05-05 00:14:36', '2020-05-05 00:14:36', 0, 'PBKDF2-HMAC-SHA1', 10071);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (12100, '2020-05-05 00:14:36', '2020-05-05 00:14:36', 0, 'PBKDF2-HMAC-SHA512', 10073);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (14000, '2020-05-05 00:14:36', '2020-05-05 00:14:36', 0, 'DES (PT = $salt, key = $pass)', 10064);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (14100, '2020-05-05 00:14:36', '2020-05-05 00:14:36', 0, '3DES (PT = $salt, key = $pass)', 10065);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (14400, '2020-05-05 00:14:35', '2020-05-05 00:14:35', 0, 'sha1(CX)', 10043);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (14900, '2020-05-05 00:14:36', '2020-05-05 00:14:36', 0, 'Skip32 (PT = $salt, key = $pass)', 10066);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (15400, '2020-05-05 00:14:36', '2020-05-05 00:14:36', 0, 'ChaCha20', 10067);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (16800, '2020-05-05 00:14:37', '2020-05-05 00:14:37', 0, 'WPA-PMKID-PBKDF2', 10077);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (16801, '2020-05-05 00:14:37', '2020-05-05 00:14:37', 0, 'WPA-PMKID-PMK', 10078);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (17300, '2020-05-05 00:14:34', '2020-05-05 00:14:34', 0, 'SHA3-224', 10008);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (17400, '2020-05-05 00:14:34', '2020-05-05 00:14:34', 0, 'SHA3-256', 10009);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (17500, '2020-05-05 00:14:34', '2020-05-05 00:14:34', 0, 'SHA3-384', 10010);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (17600, '2020-05-05 00:14:34', '2020-05-05 00:14:34', 0, 'SHA3-512', 10011);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (17700, '2020-05-05 00:14:34', '2020-05-05 00:14:34', 0, 'Keccak-224', 10012);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (17800, '2020-05-05 00:14:34', '2020-05-05 00:14:34', 0, 'Keccak-256', 10013);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (17900, '2020-05-05 00:14:34', '2020-05-05 00:14:34', 0, 'Keccak-384', 10014);
INSERT INTO `tb_hashcat_hash_mode_config` VALUES (18000, '2020-05-05 00:14:34', '2020-05-05 00:14:34', 0, 'Keccak-512', 10015);

-- ----------------------------
-- Table structure for tb_hashcat_project
-- ----------------------------
DROP TABLE IF EXISTS `tb_hashcat_project`;
CREATE TABLE `tb_hashcat_project`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NOT NULL,
  `modified_time` datetime(0) NOT NULL,
  `version` int(11) UNSIGNED NOT NULL,
  `name` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mask` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `keyspace` bigint(20) NULL DEFAULT NULL,
  `hash_mode` int(10) UNSIGNED NOT NULL,
  `attack_mode` tinyint(3) UNSIGNED NOT NULL,
  `hash_id` bigint(20) UNSIGNED NOT NULL,
  `lines` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_keyspace`(`keyspace`) USING BTREE,
  INDEX `idx_mask`(`mask`) USING BTREE,
  INDEX `idx_hash_mode`(`hash_mode`) USING BTREE,
  INDEX `idx_attack_mode`(`attack_mode`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_hashcat_project
-- ----------------------------

-- ----------------------------
-- Table structure for tb_hashcat_speed
-- ----------------------------
DROP TABLE IF EXISTS `tb_hashcat_speed`;
CREATE TABLE `tb_hashcat_speed`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NOT NULL,
  `modified_time` datetime(0) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `agent_id` bigint(20) UNSIGNED NOT NULL,
  `hash_mode` int(10) UNSIGNED NOT NULL,
  `task_size` int(10) UNSIGNED NOT NULL,
  `running_second` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_speed`(`agent_id`, `hash_mode`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_hashcat_speed
-- ----------------------------
INSERT INTO `tb_hashcat_speed` VALUES (1, '2020-05-09 00:54:56', '2020-05-09 00:54:56', 0, 1, 3, 1, 340);
INSERT INTO `tb_hashcat_speed` VALUES (2, '2020-06-24 21:09:45', '2020-06-24 22:28:46', 1, 1, 0, 33, 2);

-- ----------------------------
-- Table structure for tb_hashcat_status
-- ----------------------------
DROP TABLE IF EXISTS `tb_hashcat_status`;
CREATE TABLE `tb_hashcat_status`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NOT NULL,
  `modified_time` datetime(0) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `agent_id` bigint(20) UNSIGNED NOT NULL,
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_agent_id`(`agent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_hashcat_status
-- ----------------------------
INSERT INTO `tb_hashcat_status` VALUES (1, '2020-05-06 11:51:12', '2020-05-06 11:52:19', 1, 1, '{\"attempted\":\"218162483680\",\"speedList\":[\"116555125\"],\"status\":\"running\",\"total\":\"235294112000\"}');

-- ----------------------------
-- Table structure for tb_hashcat_status_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_hashcat_status_log`;
CREATE TABLE `tb_hashcat_status_log`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NOT NULL,
  `agent_id` bigint(20) UNSIGNED NOT NULL,
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_hashcat_status_log
-- ----------------------------
INSERT INTO `tb_hashcat_status_log` VALUES (1, '2020-05-06 11:51:12', 1, '{\"attempted\":\"209466348000\",\"speedList\":[\"109595169\"],\"status\":\"running\",\"total\":\"235294112000\"}');
INSERT INTO `tb_hashcat_status_log` VALUES (2, '2020-05-06 11:52:19', 1, '{\"attempted\":\"218162483680\",\"speedList\":[\"116555125\"],\"status\":\"running\",\"total\":\"235294112000\"}');
INSERT INTO `tb_hashcat_status_log` VALUES (3, '2020-05-09 00:32:02', 1, '{\"attempted\":\"269089579040\",\"speedList\":[\"113213316\"],\"status\":\"running\",\"total\":\"294117640000\"}');
INSERT INTO `tb_hashcat_status_log` VALUES (4, '2020-05-09 00:33:02', 1, '{\"attempted\":\"275959390240\",\"speedList\":[\"117102347\"],\"status\":\"running\",\"total\":\"294117640000\"}');
INSERT INTO `tb_hashcat_status_log` VALUES (5, '2020-05-09 00:34:22', 1, '{\"attempted\":\"285391003680\",\"speedList\":[\"117124540\"],\"status\":\"running\",\"total\":\"294117640000\"}');
INSERT INTO `tb_hashcat_status_log` VALUES (6, '2020-05-09 00:37:03', 1, '{\"attempted\":\"300587681600\",\"speedList\":[\"120056767\"],\"status\":\"running\",\"total\":\"323529404000\"}');
INSERT INTO `tb_hashcat_status_log` VALUES (7, '2020-05-09 00:38:03', 1, '{\"attempted\":\"307601835840\",\"speedList\":[\"114843394\"],\"status\":\"running\",\"total\":\"323529404000\"}');
INSERT INTO `tb_hashcat_status_log` VALUES (8, '2020-05-09 00:39:03', 1, '{\"attempted\":\"314774095680\",\"speedList\":[\"119762932\"],\"status\":\"running\",\"total\":\"323529404000\"}');
INSERT INTO `tb_hashcat_status_log` VALUES (9, '2020-05-09 00:40:03', 1, '{\"attempted\":\"321970440000\",\"speedList\":[\"119917165\"],\"status\":\"running\",\"total\":\"323529404000\"}');
INSERT INTO `tb_hashcat_status_log` VALUES (10, '2020-05-09 00:49:11', 1, '{\"attempted\":\"384833469600\",\"speedList\":[\"119829075\"],\"status\":\"running\",\"total\":\"411764696000\"}');
INSERT INTO `tb_hashcat_status_log` VALUES (11, '2020-05-09 00:50:11', 1, '{\"attempted\":\"391943961760\",\"speedList\":[\"119894021\"],\"status\":\"running\",\"total\":\"411764696000\"}');
INSERT INTO `tb_hashcat_status_log` VALUES (12, '2020-05-09 00:51:11', 1, '{\"attempted\":\"399132277920\",\"speedList\":[\"119388356\"],\"status\":\"running\",\"total\":\"411764696000\"}');
INSERT INTO `tb_hashcat_status_log` VALUES (13, '2020-05-09 00:52:11', 1, '{\"attempted\":\"406346972320\",\"speedList\":[\"120817741\"],\"status\":\"running\",\"total\":\"411764696000\"}');

-- ----------------------------
-- Table structure for tb_hashcat_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_hashcat_task`;
CREATE TABLE `tb_hashcat_task`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NOT NULL,
  `modified_time` datetime(0) NOT NULL,
  `version` int(11) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `skip` bigint(20) UNSIGNED NOT NULL,
  `limit` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_project_id`(`project_id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19271 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_hashcat_task
-- ----------------------------

-- ----------------------------
-- Table structure for tb_hashcat_task_result
-- ----------------------------
DROP TABLE IF EXISTS `tb_hashcat_task_result`;
CREATE TABLE `tb_hashcat_task_result`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NOT NULL,
  `modified_time` datetime(0) NOT NULL,
  `version` int(11) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `agent_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `result` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_task_id`(`task_id`) USING BTREE,
  INDEX `idx_agent_id`(`agent_id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_hashcat_task_result
-- ----------------------------

-- ----------------------------
-- Table structure for tb_idle_wallet
-- ----------------------------
DROP TABLE IF EXISTS `tb_idle_wallet`;
CREATE TABLE `tb_idle_wallet`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NOT NULL,
  `type` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(511) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `extra_info` varchar(511) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_address`(`type`, `address`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_idle_wallet
-- ----------------------------

-- ----------------------------
-- Table structure for tb_property
-- ----------------------------
DROP TABLE IF EXISTS `tb_property`;
CREATE TABLE `tb_property`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NOT NULL,
  `modified_time` datetime(0) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `amount` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_property`(`user_id`, `type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_property
-- ----------------------------
INSERT INTO `tb_property` VALUES (5, '2020-03-10 17:05:02', '2020-03-10 17:05:02', 0, 10050, 'oldPlatformBTCAmount', '999');
INSERT INTO `tb_property` VALUES (6, '2020-03-17 15:17:54', '2020-03-17 15:17:54', 0, 10062, 'oldPlatformBTCAmount', '888');
INSERT INTO `tb_property` VALUES (8, '2020-03-22 16:08:33', '2020-11-10 20:45:32', 47, 10050, 'credit', '49999700108322.58020000');
INSERT INTO `tb_property` VALUES (9, '2020-04-03 15:34:25', '2020-04-03 15:34:25', 0, 10032, 'credit', '0');
INSERT INTO `tb_property` VALUES (10, '2020-04-07 11:27:45', '2020-04-07 11:27:45', 0, 10062, 'credit', '0');
INSERT INTO `tb_property` VALUES (11, '2020-05-20 01:07:33', '2020-05-20 01:07:33', 0, 10099, 'oldPlatformBTCAmount', '999');
INSERT INTO `tb_property` VALUES (12, '2020-07-04 22:33:19', '2020-07-04 22:40:42', 1, 10049, 'credit', '9677.41940000');

-- ----------------------------
-- Table structure for tb_property_exchange
-- ----------------------------
DROP TABLE IF EXISTS `tb_property_exchange`;
CREATE TABLE `tb_property_exchange`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NOT NULL,
  `modified_time` datetime(0) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `property_id` bigint(20) UNSIGNED NOT NULL,
  `amount` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`property_id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_property_exchange
-- ----------------------------
INSERT INTO `tb_property_exchange` VALUES (12, '2020-07-01 17:41:04', '2020-07-01 17:41:04', 0, 8, '5000000000', 'income', 'finish', '4E-7');
INSERT INTO `tb_property_exchange` VALUES (13, '2020-07-01 17:41:05', '2020-07-01 17:41:05', 0, 8, '5000000000', 'income', 'finish', '4E-7');
INSERT INTO `tb_property_exchange` VALUES (14, '2020-07-01 17:41:05', '2020-07-01 17:41:05', 0, 8, '5000000000', 'income', 'finish', '4E-7');
INSERT INTO `tb_property_exchange` VALUES (15, '2020-07-01 21:55:00', '2020-07-01 21:55:00', 0, 8, '5000000000', 'income', 'finish', '4E-7');
INSERT INTO `tb_property_exchange` VALUES (16, '2020-07-01 21:55:01', '2020-07-01 21:55:01', 0, 8, '5000000000', 'income', 'finish', '4E-7');
INSERT INTO `tb_property_exchange` VALUES (17, '2020-07-01 21:55:02', '2020-07-01 21:55:02', 0, 8, '5000000000', 'income', 'finish', '4E-7');
INSERT INTO `tb_property_exchange` VALUES (18, '2020-07-01 21:56:07', '2020-07-01 21:56:07', 0, 8, '5000000000', 'income', 'finish', '4E-7');
INSERT INTO `tb_property_exchange` VALUES (19, '2020-07-01 21:56:08', '2020-07-01 21:56:08', 0, 8, '5000000000', 'income', 'finish', '4E-7');
INSERT INTO `tb_property_exchange` VALUES (20, '2020-07-01 21:56:08', '2020-07-01 21:56:08', 0, 8, '5000000000', 'income', 'finish', '4E-7');
INSERT INTO `tb_property_exchange` VALUES (21, '2020-07-01 21:56:27', '2020-07-01 21:56:27', 0, 8, '5000000000', 'income', 'finish', '4E-7');
INSERT INTO `tb_property_exchange` VALUES (22, '2020-07-01 21:56:27', '2020-07-01 21:56:27', 0, 8, '5000000000', 'income', 'finish', '4E-7');
INSERT INTO `tb_property_exchange` VALUES (23, '2020-07-01 21:56:28', '2020-07-01 21:56:28', 0, 8, '5000000000', 'income', 'finish', '4E-7');
INSERT INTO `tb_property_exchange` VALUES (24, '2020-07-01 22:34:19', '2020-07-01 22:34:19', 0, 8, '5000000000', 'income', 'finish', '4E-7');
INSERT INTO `tb_property_exchange` VALUES (25, '2020-07-01 22:34:19', '2020-07-01 22:34:19', 0, 8, '5000000000', 'income', 'finish', '4E-7');
INSERT INTO `tb_property_exchange` VALUES (26, '2020-07-04 22:40:42', '2020-07-04 22:40:42', 0, 8, '5000000000', 'income', 'finish', '4E-7');
INSERT INTO `tb_property_exchange` VALUES (27, '2020-07-04 22:40:42', '2020-07-04 22:40:42', 0, 12, '5000000000', 'income', 'finish', '4E-7');
INSERT INTO `tb_property_exchange` VALUES (28, '2020-07-07 23:02:48', '2020-07-07 23:02:48', 0, 8, '5000000000', 'withdraw', 'finish', '4E-7');
INSERT INTO `tb_property_exchange` VALUES (29, '2020-07-07 23:08:57', '2020-07-07 23:08:57', 0, 8, '5000000000', 'withdraw', 'finish', '4E-7');
INSERT INTO `tb_property_exchange` VALUES (39, '2020-11-09 23:09:31', '2020-11-09 23:09:31', 0, 8, '50000000', 'withdraw', 'wait', '4E-7');
INSERT INTO `tb_property_exchange` VALUES (40, '2020-11-09 23:09:47', '2020-11-09 23:09:47', 0, 8, '50000000', 'withdraw', 'wait', '4E-7');
INSERT INTO `tb_property_exchange` VALUES (41, '2020-11-09 23:34:21', '2020-11-09 23:34:21', 0, 8, '50000000', 'withdraw', 'wait', '4E-7');
INSERT INTO `tb_property_exchange` VALUES (42, '2020-11-09 23:37:58', '2020-11-09 23:37:58', 0, 8, '50000000', 'withdraw', 'wait', '4E-7');
INSERT INTO `tb_property_exchange` VALUES (43, '2020-11-10 20:26:10', '2020-11-10 20:26:10', 0, 8, '50000000', 'withdraw', 'wait', '4E-7');
INSERT INTO `tb_property_exchange` VALUES (44, '2020-11-10 20:45:32', '2020-11-10 20:45:32', 0, 8, '50000000', 'withdraw', 'wait', '4E-7');

-- ----------------------------
-- Table structure for tb_user_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_info`;
CREATE TABLE `tb_user_info`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NOT NULL,
  `modified_time` datetime(0) NOT NULL,
  `version` int(10) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `collection_code_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE,
  UNIQUE INDEX `receive_img`(`collection_code_url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user_info
-- ----------------------------
INSERT INTO `tb_user_info` VALUES (6, '2020-06-25 19:54:06', '2020-06-27 12:00:23', 5, 10050, 'https://s1.ax1x.com/2020/06/27/NyWnrn.png');

-- ----------------------------
-- Table structure for tb_wallet
-- ----------------------------
DROP TABLE IF EXISTS `tb_wallet`;
CREATE TABLE `tb_wallet`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(511) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `extra_info` varchar(511) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_address`(`user_id`, `type`) USING BTREE,
  UNIQUE INDEX `uk_address`(`type`, `address`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_wallet
-- ----------------------------
INSERT INTO `tb_wallet` VALUES (10, '2020-02-04 16:05:37', 10050, 'NH_BTC', '39XeYtGmpjbxaXYGNmQsH1WBMhwt6xbUq6', '{\"apiKey\":\"e4ffd016-6122-4b56-b5b0-24b20e1fda5a\",\"apiSecret\":\"f2ac2d53-b0a2-42ee-8d4a-23585a299dd3940e0e2e-0440-44ab-9065-36fc752f8d67\",\"organizationId\":\"1a3f28ca-4ca9-49b2-bbad-0009022d1c31\"}');
INSERT INTO `tb_wallet` VALUES (11, '2020-02-04 16:05:37', 10049, 'NH_BTC', '39XeYtGmpjbxaXYGNmQsH1WBMhwt6xbUq7', '{\"apiKey\":\"e4ffd016-6122-4b56-b5b0-24b20e1fda5a\",\"apiSecret\":\"f2ac2d53-b0a2-42ee-8d4a-23585a299dd3940e0e2e-0440-44ab-9065-36fc752f8d67\",\"organizationId\":\"1a3f28ca-4ca9-49b2-bbad-0009022d1c31\"}');

-- ----------------------------
-- Table structure for tb_wallet_exchange
-- ----------------------------
DROP TABLE IF EXISTS `tb_wallet_exchange`;
CREATE TABLE `tb_wallet_exchange`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NOT NULL,
  `modified_time` datetime(0) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `wallet_id` bigint(20) UNSIGNED NOT NULL,
  `amount` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`wallet_id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_wallet_exchange
-- ----------------------------
INSERT INTO `tb_wallet_exchange` VALUES (12, '2020-05-24 11:48:03', '2020-06-13 13:46:19', 6, 10, '0.1', 'finish', '76967');
INSERT INTO `tb_wallet_exchange` VALUES (15, '2020-06-13 13:31:05', '2020-06-13 13:46:20', 3, 10, '0.00001', 'finish', '76967');
INSERT INTO `tb_wallet_exchange` VALUES (24, '2020-06-13 17:55:07', '2020-07-01 22:34:19', 1, 10, '0.001', 'finish', '76967');
INSERT INTO `tb_wallet_exchange` VALUES (26, '2020-06-13 17:59:14', '2020-07-01 22:34:19', 1, 10, '0.001', 'finish', '76967');
INSERT INTO `tb_wallet_exchange` VALUES (28, '2020-06-15 14:00:17', '2020-07-01 21:56:27', 4, 10, '0.001', 'finish', '76967');
INSERT INTO `tb_wallet_exchange` VALUES (31, '2020-06-18 11:34:03', '2020-07-01 21:56:28', 4, 10, '0.001', 'finish', '76967');
INSERT INTO `tb_wallet_exchange` VALUES (32, '2020-07-04 22:28:25', '2020-07-04 22:40:42', 1, 10, '0.001', 'finish', '76967');
INSERT INTO `tb_wallet_exchange` VALUES (33, '2020-07-04 22:39:12', '2020-07-04 22:40:42', 1, 11, '0.03', 'finish', '76967');
INSERT INTO `tb_wallet_exchange` VALUES (39, '2020-11-11 10:01:10', '2020-11-11 10:01:10', 0, 10, '0.001', 'wait', NULL);

SET FOREIGN_KEY_CHECKS = 1;
