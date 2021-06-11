/*
 Navicat Premium Data Transfer

 Source Server         : luna-xiccc-distribute-winserver
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : f.xicc.cc:3930
 Source Schema         : wednesday

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 11/06/2021 16:19:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_agent
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent`;
CREATE TABLE `tb_agent` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `modified_time` datetime NOT NULL,
  `version` int(11) NOT NULL,
  `key` varchar(63) NOT NULL,
  `type` varchar(15) NOT NULL,
  `hardware` mediumtext NOT NULL,
  `agent_version` varchar(15) DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
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
-- Table structure for tb_download
-- ----------------------------
DROP TABLE IF EXISTS `tb_download`;
CREATE TABLE `tb_download` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `modified_time` datetime NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(63) NOT NULL,
  `url_map` varchar(511) NOT NULL,
  `manual` varchar(127) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_property` (`name`,`url_map`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_download
-- ----------------------------
BEGIN;
INSERT INTO `tb_download` VALUES (2, '2020-04-03 15:39:58', '2020-04-03 15:40:00', 0, 'NiceHash Miner 3.x', '{\"下载地址1\":\"https://github.com/nicehash/NiceHashMiner/releases/download/3.0.0.4/nhm_windows_3.0.0.4.zip\",\"下载地址2\":\"https://note.youdao.com/ynoteshare1/index.html?id=df49e414c72c2b7d79607b72f8c7112e\"}', 'https://note.youdao.com/ynoteshare1/index.html?id=df49e414c72c2b7d79607b72f8c7112e');
COMMIT;

-- ----------------------------
-- Table structure for tb_hash
-- ----------------------------
DROP TABLE IF EXISTS `tb_hash`;
CREATE TABLE `tb_hash` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `modified_time` datetime NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(63) NOT NULL,
  `content` mediumtext,
  `result` mediumtext,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_hash
-- ----------------------------
BEGIN;
INSERT INTO `tb_hash` VALUES (4, '2020-05-05 22:50:06', '2020-06-24 22:28:54', 4, 'testhash2', NULL, '[\"25d55ad283aa400af464c76d713c07ad:12345678\"]');
INSERT INTO `tb_hash` VALUES (5, '2020-12-29 21:20:34', '2020-12-29 21:20:34', 0, 'testhash3', '[\"82d1e255b0473c030f69eb8b3fbc5a31\"]', NULL);
INSERT INTO `tb_hash` VALUES (6, '2021-01-19 16:11:23', '2021-01-25 15:14:31', 1, 'testhash1', NULL, '[\"8743b52063cd84097a65d1633f5c74f5:hashcat\"]');
INSERT INTO `tb_hash` VALUES (7, '2021-01-19 16:25:45', '2021-01-25 15:15:11', 1, 'testhash4', NULL, '[\"e28c32958a44e096fd37447ea776615b:1772249015\"]');
COMMIT;

-- ----------------------------
-- Table structure for tb_hashcat_hash_mode_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_hashcat_hash_mode_config`;
CREATE TABLE `tb_hashcat_hash_mode_config` (
  `id` int(10) unsigned NOT NULL COMMENT 'attack_mode同名',
  `create_time` datetime NOT NULL,
  `modified_time` datetime NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(127) NOT NULL,
  `lines_per_task` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_hashcat_hash_mode_config
-- ----------------------------
BEGIN;
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
COMMIT;

-- ----------------------------
-- Table structure for tb_hashcat_project
-- ----------------------------
DROP TABLE IF EXISTS `tb_hashcat_project`;
CREATE TABLE `tb_hashcat_project` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `modified_time` datetime NOT NULL,
  `version` int(11) unsigned NOT NULL,
  `name` varchar(63) NOT NULL,
  `status` varchar(31) NOT NULL,
  `mask` varchar(63) NOT NULL,
  `keyspace` bigint(20) DEFAULT NULL,
  `hash_mode` int(10) unsigned NOT NULL,
  `attack_mode` tinyint(3) unsigned NOT NULL,
  `hash_id` bigint(20) unsigned NOT NULL,
  `lines` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_name` (`name`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE,
  KEY `idx_keyspace` (`keyspace`) USING BTREE,
  KEY `idx_mask` (`mask`) USING BTREE,
  KEY `idx_hash_mode` (`hash_mode`) USING BTREE,
  KEY `idx_attack_mode` (`attack_mode`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_hashcat_project
-- ----------------------------
BEGIN;
INSERT INTO `tb_hashcat_project` VALUES (11, '2020-12-29 21:21:00', '2020-12-29 21:30:40', 5, 'testproject2', 'finish', '?l?l?l?l?l?l?l', 456976, 0, 3, 5, 8031810176);
INSERT INTO `tb_hashcat_project` VALUES (12, '2021-01-19 16:12:49', '2021-01-25 15:14:31', 5, 'testproject1', 'finish', '?l?l?l?l?l?l?l', 456976, 0, 3, 6, 8031810176);
INSERT INTO `tb_hashcat_project` VALUES (13, '2021-01-19 16:26:06', '2021-01-25 15:15:12', 5, 'testproject4', 'finish', '?d?d?d?d?d?d?d?d?d?d', 10000000, 0, 3, 7, 10000000000);
COMMIT;

-- ----------------------------
-- Table structure for tb_hashcat_speed
-- ----------------------------
DROP TABLE IF EXISTS `tb_hashcat_speed`;
CREATE TABLE `tb_hashcat_speed` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `modified_time` datetime NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `agent_id` bigint(20) unsigned NOT NULL,
  `hash_mode` int(10) unsigned NOT NULL,
  `task_size` int(10) unsigned NOT NULL,
  `running_second` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_speed` (`agent_id`,`hash_mode`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_hashcat_speed
-- ----------------------------
BEGIN;
INSERT INTO `tb_hashcat_speed` VALUES (1, '2020-05-09 00:54:56', '2020-05-09 00:54:56', 0, 1, 3, 1, 340);
INSERT INTO `tb_hashcat_speed` VALUES (2, '2020-06-24 21:09:45', '2020-06-24 22:28:46', 1, 1, 0, 33, 2);
INSERT INTO `tb_hashcat_speed` VALUES (3, '2020-12-29 21:30:08', '2020-12-29 21:30:08', 0, 3, 0, 1, 9);
INSERT INTO `tb_hashcat_speed` VALUES (4, '2021-01-25 15:14:29', '2021-01-25 15:15:09', 1, 5, 0, 1, 33);
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
-- Table structure for tb_hashcat_status_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_hashcat_status_log`;
CREATE TABLE `tb_hashcat_status_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `agent_id` bigint(20) unsigned NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_hashcat_status_log
-- ----------------------------
BEGIN;
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
COMMIT;

-- ----------------------------
-- Table structure for tb_hashcat_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_hashcat_task`;
CREATE TABLE `tb_hashcat_task` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `modified_time` datetime NOT NULL,
  `version` int(11) unsigned NOT NULL,
  `project_id` bigint(20) unsigned NOT NULL,
  `status` varchar(31) NOT NULL,
  `skip` bigint(20) unsigned NOT NULL,
  `limit` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_project_id` (`project_id`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19274 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_hashcat_task
-- ----------------------------
BEGIN;
INSERT INTO `tb_hashcat_task` VALUES (19271, '2020-12-29 21:25:39', '2020-12-29 21:30:08', 2, 11, 'finish', 0, 456976);
INSERT INTO `tb_hashcat_task` VALUES (19272, '2021-01-19 16:52:20', '2021-01-25 15:14:30', 450, 12, 'finish', 0, 456976);
INSERT INTO `tb_hashcat_task` VALUES (19273, '2021-01-19 16:52:21', '2021-01-25 15:15:10', 444, 13, 'finish', 0, 10000000);
COMMIT;

-- ----------------------------
-- Table structure for tb_hashcat_task_result
-- ----------------------------
DROP TABLE IF EXISTS `tb_hashcat_task_result`;
CREATE TABLE `tb_hashcat_task_result` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `modified_time` datetime NOT NULL,
  `version` int(11) unsigned NOT NULL,
  `task_id` bigint(20) unsigned NOT NULL,
  `agent_id` bigint(20) unsigned NOT NULL,
  `status` varchar(31) NOT NULL,
  `result` mediumtext,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_task_id` (`task_id`) USING BTREE,
  KEY `idx_agent_id` (`agent_id`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=557 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_hashcat_task_result
-- ----------------------------
BEGIN;
INSERT INTO `tb_hashcat_task_result` VALUES (109, '2020-12-29 21:29:42', '2020-12-29 21:30:08', 1, 19271, 3, 'finish', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (110, '2021-01-19 16:56:02', '2021-01-19 18:54:43', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (111, '2021-01-19 16:56:10', '2021-01-19 18:54:43', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (112, '2021-01-19 18:56:01', '2021-01-19 21:02:09', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (113, '2021-01-19 18:56:08', '2021-01-19 21:02:09', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (114, '2021-01-19 22:25:29', '2021-01-20 02:29:15', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (115, '2021-01-19 22:25:37', '2021-01-20 02:29:16', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (116, '2021-01-20 02:29:16', '2021-01-20 02:39:18', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (117, '2021-01-20 02:29:17', '2021-01-20 02:39:18', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (118, '2021-01-20 02:41:17', '2021-01-20 02:51:21', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (119, '2021-01-20 02:41:21', '2021-01-20 02:51:21', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (120, '2021-01-20 02:51:52', '2021-01-20 04:58:23', 1, 19272, 4, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (121, '2021-01-20 02:51:56', '2021-01-20 04:58:23', 1, 19273, 4, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (122, '2021-01-20 05:01:23', '2021-01-20 07:02:38', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (123, '2021-01-20 05:01:29', '2021-01-20 07:02:38', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (124, '2021-01-20 09:02:34', '2021-01-20 09:13:03', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (125, '2021-01-20 09:02:50', '2021-01-20 09:13:03', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (126, '2021-01-20 11:05:42', '2021-01-20 11:36:04', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (127, '2021-01-20 16:37:53', '2021-01-20 16:48:13', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (128, '2021-01-20 16:38:02', '2021-01-20 16:48:13', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (129, '2021-01-20 18:38:55', '2021-01-20 19:00:38', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (130, '2021-01-20 18:39:05', '2021-01-20 19:00:38', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (131, '2021-01-20 19:07:20', '2021-01-20 21:11:09', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (132, '2021-01-20 19:07:25', '2021-01-20 21:11:09', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (133, '2021-01-20 21:22:53', '2021-01-20 21:33:21', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (134, '2021-01-20 21:22:58', '2021-01-20 21:33:21', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (135, '2021-01-20 23:25:53', '2021-01-20 23:49:53', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (136, '2021-01-20 23:26:00', '2021-01-20 23:49:53', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (137, '2021-01-21 01:26:38', '2021-01-21 01:52:02', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (138, '2021-01-21 03:27:01', '2021-01-21 06:36:45', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (139, '2021-01-21 03:27:34', '2021-01-21 06:36:45', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (140, '2021-01-21 06:36:45', '2021-01-21 06:46:47', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (141, '2021-01-21 06:36:46', '2021-01-21 06:46:47', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (142, '2021-01-21 06:46:48', '2021-01-21 06:56:49', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (143, '2021-01-21 06:46:49', '2021-01-21 06:56:49', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (144, '2021-01-21 06:56:50', '2021-01-21 07:06:51', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (145, '2021-01-21 06:56:51', '2021-01-21 07:06:52', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (146, '2021-01-21 07:06:52', '2021-01-21 07:21:42', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (147, '2021-01-21 07:06:53', '2021-01-21 07:21:42', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (148, '2021-01-21 09:08:23', '2021-01-21 09:30:36', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (149, '2021-01-21 09:08:28', '2021-01-21 09:30:36', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (150, '2021-01-21 11:08:50', '2021-01-21 11:31:46', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (151, '2021-01-21 11:08:53', '2021-01-21 11:31:46', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (152, '2021-01-21 13:09:18', '2021-01-21 14:11:55', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (153, '2021-01-21 13:09:24', '2021-01-21 14:11:55', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (154, '2021-01-21 18:38:12', '2021-01-21 22:45:32', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (155, '2021-01-21 18:38:18', '2021-01-21 22:45:32', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (156, '2021-01-21 22:45:38', '2021-01-21 22:56:01', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (157, '2021-01-21 22:45:42', '2021-01-21 22:56:01', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (158, '2021-01-21 22:56:07', '2021-01-21 23:07:00', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (159, '2021-01-21 22:56:11', '2021-01-21 23:07:01', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (160, '2021-01-22 01:08:13', '2021-01-22 01:25:21', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (161, '2021-01-22 01:08:15', '2021-01-22 01:25:21', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (162, '2021-01-22 03:11:29', '2021-01-22 03:31:27', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (163, '2021-01-22 05:11:43', '2021-01-22 06:04:38', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (164, '2021-01-22 05:11:47', '2021-01-22 06:04:38', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (165, '2021-01-22 07:27:39', '2021-01-22 08:06:47', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (166, '2021-01-22 07:27:44', '2021-01-22 08:06:47', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (167, '2021-01-22 09:39:11', '2021-01-22 10:37:18', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (168, '2021-01-22 09:39:13', '2021-01-22 10:37:18', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (169, '2021-01-22 11:39:48', '2021-01-22 12:39:31', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (170, '2021-01-22 11:39:53', '2021-01-22 12:39:31', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (171, '2021-01-22 14:36:37', '2021-01-22 20:52:06', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (172, '2021-01-22 14:36:42', '2021-01-22 20:52:06', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (173, '2021-01-22 22:41:55', '2021-01-23 00:39:52', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (174, '2021-01-22 22:41:56', '2021-01-23 00:39:52', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (175, '2021-01-23 04:42:56', '2021-01-23 04:53:28', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (176, '2021-01-23 04:42:58', '2021-01-23 04:53:28', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (177, '2021-01-23 04:53:29', '2021-01-23 05:03:30', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (178, '2021-01-23 04:53:30', '2021-01-23 05:03:31', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (179, '2021-01-23 05:03:31', '2021-01-23 05:13:33', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (180, '2021-01-23 05:03:32', '2021-01-23 05:13:33', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (181, '2021-01-23 05:13:34', '2021-01-23 05:23:35', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (182, '2021-01-23 05:13:35', '2021-01-23 05:23:35', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (183, '2021-01-23 05:23:36', '2021-01-23 05:33:38', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (184, '2021-01-23 05:23:37', '2021-01-23 05:33:38', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (185, '2021-01-23 05:33:38', '2021-01-23 05:43:57', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (186, '2021-01-23 05:33:39', '2021-01-23 05:43:57', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (187, '2021-01-23 05:43:59', '2021-01-23 05:54:51', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (188, '2021-01-23 05:44:03', '2021-01-23 05:54:51', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (189, '2021-01-23 05:54:54', '2021-01-23 06:09:52', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (190, '2021-01-23 05:54:56', '2021-01-23 06:09:52', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (191, '2021-01-23 06:09:56', '2021-01-23 06:39:17', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (192, '2021-01-23 06:10:00', '2021-01-23 06:39:18', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (193, '2021-01-23 06:39:24', '2021-01-23 08:50:09', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (194, '2021-01-23 06:39:38', '2021-01-23 08:50:09', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (195, '2021-01-23 08:54:26', '2021-01-23 09:05:19', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (196, '2021-01-23 08:54:31', '2021-01-23 09:05:19', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (197, '2021-01-23 09:09:33', '2021-01-23 09:20:34', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (198, '2021-01-23 09:09:43', '2021-01-23 09:20:34', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (199, '2021-01-23 09:24:29', '2021-01-23 09:34:47', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (200, '2021-01-23 09:24:43', '2021-01-23 09:34:47', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (201, '2021-01-23 09:39:28', '2021-01-23 09:50:04', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (202, '2021-01-23 09:39:33', '2021-01-23 09:50:04', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (203, '2021-01-23 09:54:28', '2021-01-23 10:05:21', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (204, '2021-01-23 09:54:34', '2021-01-23 10:05:21', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (205, '2021-01-23 10:09:30', '2021-01-23 10:19:51', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (206, '2021-01-23 10:09:39', '2021-01-23 10:19:51', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (207, '2021-01-23 10:24:28', '2021-01-23 10:35:16', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (208, '2021-01-23 10:24:37', '2021-01-23 10:35:16', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (209, '2021-01-23 10:39:28', '2021-01-23 10:49:39', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (210, '2021-01-23 10:39:35', '2021-01-23 10:49:39', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (211, '2021-01-23 10:54:28', '2021-01-23 11:04:59', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (212, '2021-01-23 10:54:34', '2021-01-23 11:04:59', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (213, '2021-01-23 11:09:26', '2021-01-23 11:20:15', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (214, '2021-01-23 11:09:32', '2021-01-23 11:20:15', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (215, '2021-01-23 11:24:26', '2021-01-23 11:34:37', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (216, '2021-01-23 11:24:31', '2021-01-23 11:34:37', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (217, '2021-01-23 11:39:27', '2021-01-23 11:50:03', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (218, '2021-01-23 11:39:34', '2021-01-23 11:50:03', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (219, '2021-01-23 11:54:28', '2021-01-23 12:05:27', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (220, '2021-01-23 11:54:41', '2021-01-23 12:05:27', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (221, '2021-01-23 12:09:36', '2021-01-23 12:19:50', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (222, '2021-01-23 12:09:43', '2021-01-23 12:19:50', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (223, '2021-01-23 12:24:29', '2021-01-23 12:35:14', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (224, '2021-01-23 12:24:36', '2021-01-23 12:35:14', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (225, '2021-01-23 12:39:26', '2021-01-23 12:49:30', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (226, '2021-01-23 12:39:31', '2021-01-23 12:50:34', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (227, '2021-01-23 12:54:28', '2021-01-23 13:04:56', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (228, '2021-01-23 12:54:35', '2021-01-23 13:04:56', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (229, '2021-01-23 13:09:26', '2021-01-23 13:20:17', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (230, '2021-01-23 13:09:31', '2021-01-23 13:20:17', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (231, '2021-01-23 13:24:28', '2021-01-23 13:34:29', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (232, '2021-01-23 13:24:35', '2021-01-23 13:35:31', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (233, '2021-01-23 13:39:28', '2021-01-23 13:50:02', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (234, '2021-01-23 13:39:37', '2021-01-23 13:50:02', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (235, '2021-01-23 13:54:29', '2021-01-23 14:05:33', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (236, '2021-01-23 13:54:37', '2021-01-23 14:05:34', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (237, '2021-01-23 14:09:30', '2021-01-23 14:20:01', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (238, '2021-01-23 14:09:37', '2021-01-23 14:20:01', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (239, '2021-01-23 14:24:29', '2021-01-23 14:35:22', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (240, '2021-01-23 14:24:34', '2021-01-23 14:35:22', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (241, '2021-01-23 14:39:29', '2021-01-23 14:49:39', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (242, '2021-01-23 14:39:35', '2021-01-23 14:49:39', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (243, '2021-01-23 14:54:26', '2021-01-23 15:04:57', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (244, '2021-01-23 14:54:30', '2021-01-23 15:04:57', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (245, '2021-01-23 15:09:26', '2021-01-23 15:20:27', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (246, '2021-01-23 15:09:32', '2021-01-23 15:20:27', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (247, '2021-01-23 15:24:28', '2021-01-23 15:34:58', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (248, '2021-01-23 15:24:39', '2021-01-23 15:34:58', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (249, '2021-01-23 15:39:26', '2021-01-23 15:49:29', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (250, '2021-01-23 15:39:31', '2021-01-23 15:50:32', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (251, '2021-01-23 15:54:29', '2021-01-23 16:04:59', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (252, '2021-01-23 15:54:43', '2021-01-23 16:04:59', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (253, '2021-01-23 16:09:32', '2021-01-23 16:20:30', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (254, '2021-01-23 16:09:40', '2021-01-23 16:20:30', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (255, '2021-01-23 16:24:31', '2021-01-23 16:34:57', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (256, '2021-01-23 16:24:41', '2021-01-23 16:34:57', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (257, '2021-01-23 16:39:25', '2021-01-23 16:50:18', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (258, '2021-01-23 16:39:30', '2021-01-23 16:50:18', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (259, '2021-01-23 16:54:27', '2021-01-23 17:04:48', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (260, '2021-01-23 16:54:35', '2021-01-23 17:04:48', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (261, '2021-01-23 17:09:27', '2021-01-23 17:20:13', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (262, '2021-01-23 17:09:34', '2021-01-23 17:20:13', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (263, '2021-01-23 17:24:28', '2021-01-23 17:34:48', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (264, '2021-01-23 17:24:35', '2021-01-23 17:34:48', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (265, '2021-01-23 17:39:28', '2021-01-23 17:50:10', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (266, '2021-01-23 17:39:42', '2021-01-23 17:50:10', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (267, '2021-01-23 17:54:30', '2021-01-23 18:04:32', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (268, '2021-01-23 17:54:38', '2021-01-23 18:05:34', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (269, '2021-01-23 18:09:29', '2021-01-23 18:20:10', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (270, '2021-01-23 18:09:35', '2021-01-23 18:20:10', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (271, '2021-01-23 18:24:35', '2021-01-23 18:34:35', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (272, '2021-01-23 18:24:41', '2021-01-23 18:35:44', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (273, '2021-01-23 18:39:28', '2021-01-23 18:50:05', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (274, '2021-01-23 18:39:35', '2021-01-23 18:50:05', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (275, '2021-01-23 18:54:24', '2021-01-23 19:05:27', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (276, '2021-01-23 18:54:28', '2021-01-23 19:05:27', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (277, '2021-01-23 19:09:26', '2021-01-23 19:19:56', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (278, '2021-01-23 19:09:34', '2021-01-23 19:19:56', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (279, '2021-01-23 19:24:26', '2021-01-23 19:35:25', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (280, '2021-01-23 19:24:34', '2021-01-23 19:35:25', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (281, '2021-01-23 19:39:26', '2021-01-23 19:49:49', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (282, '2021-01-23 19:39:33', '2021-01-23 19:49:49', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (283, '2021-01-23 19:54:24', '2021-01-23 20:05:12', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (284, '2021-01-23 19:54:30', '2021-01-23 20:05:12', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (285, '2021-01-23 20:09:26', '2021-01-23 20:19:31', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (286, '2021-01-23 20:09:34', '2021-01-23 20:20:35', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (287, '2021-01-23 20:24:23', '2021-01-23 20:34:52', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (288, '2021-01-23 20:24:28', '2021-01-23 20:34:52', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (289, '2021-01-23 20:39:26', '2021-01-23 20:50:26', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (290, '2021-01-23 20:39:33', '2021-01-23 20:50:26', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (291, '2021-01-23 20:54:24', '2021-01-23 21:05:50', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (292, '2021-01-23 20:54:29', '2021-01-23 21:05:50', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (293, '2021-01-23 21:09:23', '2021-01-23 21:20:16', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (294, '2021-01-23 21:09:28', '2021-01-23 21:20:16', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (295, '2021-01-23 21:24:23', '2021-01-23 21:34:39', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (296, '2021-01-23 21:24:28', '2021-01-23 21:34:40', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (297, '2021-01-23 21:39:25', '2021-01-23 21:50:09', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (298, '2021-01-23 21:39:32', '2021-01-23 21:50:09', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (299, '2021-01-23 21:54:26', '2021-01-23 22:04:42', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (300, '2021-01-23 21:54:33', '2021-01-23 22:04:42', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (301, '2021-01-23 22:09:26', '2021-01-23 22:20:07', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (302, '2021-01-23 22:09:33', '2021-01-23 22:20:07', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (303, '2021-01-23 22:24:23', '2021-01-23 22:35:11', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (304, '2021-01-23 22:24:27', '2021-01-23 22:35:11', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (305, '2021-01-23 22:39:23', '2021-01-23 22:50:17', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (306, '2021-01-23 22:39:27', '2021-01-23 22:50:17', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (307, '2021-01-23 22:54:26', '2021-01-23 23:04:45', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (308, '2021-01-23 22:54:37', '2021-01-23 23:04:45', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (309, '2021-01-23 23:09:26', '2021-01-23 23:20:17', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (310, '2021-01-23 23:09:33', '2021-01-23 23:20:17', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (311, '2021-01-23 23:24:26', '2021-01-23 23:34:57', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (312, '2021-01-23 23:24:35', '2021-01-23 23:34:57', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (313, '2021-01-23 23:39:26', '2021-01-23 23:49:36', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (314, '2021-01-23 23:39:33', '2021-01-23 23:49:36', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (315, '2021-01-23 23:54:25', '2021-01-24 00:05:15', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (316, '2021-01-23 23:54:33', '2021-01-24 00:05:15', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (317, '2021-01-24 00:09:24', '2021-01-24 00:19:39', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (318, '2021-01-24 00:09:28', '2021-01-24 00:19:40', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (319, '2021-01-24 00:24:23', '2021-01-24 00:35:06', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (320, '2021-01-24 00:24:27', '2021-01-24 00:35:07', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (321, '2021-01-24 00:39:26', '2021-01-24 00:49:38', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (322, '2021-01-24 00:39:31', '2021-01-24 00:49:38', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (323, '2021-01-24 00:54:26', '2021-01-24 01:05:28', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (324, '2021-01-24 00:54:39', '2021-01-24 01:05:29', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (325, '2021-01-24 01:09:26', '2021-01-24 01:20:11', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (326, '2021-01-24 01:09:35', '2021-01-24 01:20:12', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (327, '2021-01-24 01:24:27', '2021-01-24 01:34:49', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (328, '2021-01-24 01:24:34', '2021-01-24 01:34:49', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (329, '2021-01-24 01:39:33', '2021-01-24 01:50:35', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (330, '2021-01-24 01:39:40', '2021-01-24 01:50:35', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (331, '2021-01-24 01:54:27', '2021-01-24 02:05:15', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (332, '2021-01-24 01:54:34', '2021-01-24 02:05:15', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (333, '2021-01-24 02:09:26', '2021-01-24 02:19:41', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (334, '2021-01-24 02:09:33', '2021-01-24 02:19:41', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (335, '2021-01-24 02:24:23', '2021-01-24 02:35:11', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (336, '2021-01-24 02:24:28', '2021-01-24 02:35:11', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (337, '2021-01-24 02:39:27', '2021-01-24 02:49:50', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (338, '2021-01-24 02:39:34', '2021-01-24 02:49:50', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (339, '2021-01-24 02:54:27', '2021-01-24 03:04:56', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (340, '2021-01-24 02:54:33', '2021-01-24 03:04:57', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (341, '2021-01-24 03:09:28', '2021-01-24 03:19:40', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (342, '2021-01-24 03:09:35', '2021-01-24 03:19:40', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (343, '2021-01-24 03:24:38', '2021-01-24 03:35:29', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (344, '2021-01-24 03:24:47', '2021-01-24 03:35:29', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (345, '2021-01-24 03:39:26', '2021-01-24 03:50:17', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (346, '2021-01-24 03:39:34', '2021-01-24 03:50:17', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (347, '2021-01-24 03:54:26', '2021-01-24 04:04:55', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (348, '2021-01-24 03:54:40', '2021-01-24 04:04:55', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (349, '2021-01-24 04:09:34', '2021-01-24 04:19:49', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (350, '2021-01-24 04:09:41', '2021-01-24 04:19:49', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (351, '2021-01-24 04:24:39', '2021-01-24 04:34:51', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (352, '2021-01-24 04:24:48', '2021-01-24 04:34:51', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (353, '2021-01-24 04:39:29', '2021-01-24 04:49:40', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (354, '2021-01-24 04:39:39', '2021-01-24 04:49:41', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (355, '2021-01-24 04:54:32', '2021-01-24 05:05:27', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (356, '2021-01-24 04:54:45', '2021-01-24 05:05:27', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (357, '2021-01-24 05:09:34', '2021-01-24 05:20:17', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (358, '2021-01-24 05:09:45', '2021-01-24 05:20:17', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (359, '2021-01-24 05:24:30', '2021-01-24 05:35:25', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (360, '2021-01-24 05:24:36', '2021-01-24 05:35:25', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (361, '2021-01-24 05:39:31', '2021-01-24 05:50:06', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (362, '2021-01-24 05:39:38', '2021-01-24 05:50:06', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (363, '2021-01-24 05:54:35', '2021-01-24 06:04:38', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (364, '2021-01-24 05:54:42', '2021-01-24 06:05:40', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (365, '2021-01-24 06:09:26', '2021-01-24 06:20:13', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (366, '2021-01-24 06:09:30', '2021-01-24 06:20:13', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (367, '2021-01-24 06:24:26', '2021-01-24 06:34:45', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (368, '2021-01-24 06:24:32', '2021-01-24 06:34:45', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (369, '2021-01-24 06:39:27', '2021-01-24 06:49:47', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (370, '2021-01-24 06:39:38', '2021-01-24 06:49:47', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (371, '2021-01-24 06:54:28', '2021-01-24 07:04:41', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (372, '2021-01-24 06:54:35', '2021-01-24 07:04:41', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (373, '2021-01-24 07:09:27', '2021-01-24 07:20:21', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (374, '2021-01-24 07:09:34', '2021-01-24 07:20:22', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (375, '2021-01-24 07:24:34', '2021-01-24 07:35:07', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (376, '2021-01-24 07:24:41', '2021-01-24 07:35:07', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (377, '2021-01-24 07:39:28', '2021-01-24 07:49:51', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (378, '2021-01-24 07:39:37', '2021-01-24 07:49:51', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (379, '2021-01-24 07:54:27', '2021-01-24 08:04:31', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (380, '2021-01-24 07:54:37', '2021-01-24 08:05:34', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (381, '2021-01-24 08:09:27', '2021-01-24 08:19:31', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (382, '2021-01-24 08:09:35', '2021-01-24 08:20:35', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (383, '2021-01-24 08:24:31', '2021-01-24 08:35:02', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (384, '2021-01-24 08:24:38', '2021-01-24 08:35:02', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (385, '2021-01-24 08:39:25', '2021-01-24 08:50:05', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (386, '2021-01-24 08:39:30', '2021-01-24 08:50:05', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (387, '2021-01-24 08:54:31', '2021-01-24 09:04:54', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (388, '2021-01-24 08:54:38', '2021-01-24 09:04:54', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (389, '2021-01-24 09:09:27', '2021-01-24 09:20:28', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (390, '2021-01-24 09:09:33', '2021-01-24 09:20:28', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (391, '2021-01-24 09:24:43', '2021-01-24 09:34:55', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (392, '2021-01-24 09:24:53', '2021-01-24 09:34:55', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (393, '2021-01-24 09:39:25', '2021-01-24 09:49:58', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (394, '2021-01-24 09:39:29', '2021-01-24 09:49:58', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (395, '2021-01-24 09:54:29', '2021-01-24 10:04:34', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (396, '2021-01-24 09:55:10', '2021-01-24 10:05:37', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (397, '2021-01-24 10:09:25', '2021-01-24 10:20:12', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (398, '2021-01-24 10:09:31', '2021-01-24 10:20:12', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (399, '2021-01-24 10:24:28', '2021-01-24 10:34:55', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (400, '2021-01-24 10:24:35', '2021-01-24 10:34:55', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (401, '2021-01-24 10:39:27', '2021-01-24 10:49:47', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (402, '2021-01-24 10:39:34', '2021-01-24 10:49:48', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (403, '2021-01-24 10:54:35', '2021-01-24 11:04:58', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (404, '2021-01-24 10:54:43', '2021-01-24 11:04:58', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (405, '2021-01-24 11:09:32', '2021-01-24 11:19:49', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (406, '2021-01-24 11:09:38', '2021-01-24 11:19:49', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (407, '2021-01-24 11:24:28', '2021-01-24 11:34:32', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (408, '2021-01-24 11:24:36', '2021-01-24 11:35:36', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (409, '2021-01-24 11:39:28', '2021-01-24 11:50:20', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (410, '2021-01-24 11:39:34', '2021-01-24 11:50:20', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (411, '2021-01-24 11:54:40', '2021-01-24 12:05:05', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (412, '2021-01-24 11:54:50', '2021-01-24 12:05:05', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (413, '2021-01-24 12:09:28', '2021-01-24 12:19:57', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (414, '2021-01-24 12:09:37', '2021-01-24 12:19:57', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (415, '2021-01-24 12:24:29', '2021-01-24 12:34:38', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (416, '2021-01-24 12:24:36', '2021-01-24 12:34:38', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (417, '2021-01-24 12:39:25', '2021-01-24 12:49:42', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (418, '2021-01-24 12:39:29', '2021-01-24 12:49:42', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (419, '2021-01-24 12:54:28', '2021-01-24 13:04:29', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (420, '2021-01-24 12:54:38', '2021-01-24 13:05:33', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (421, '2021-01-24 13:09:28', '2021-01-24 13:20:29', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (422, '2021-01-24 13:09:36', '2021-01-24 13:20:30', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (423, '2021-01-24 13:24:28', '2021-01-24 13:34:39', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (424, '2021-01-24 13:24:39', '2021-01-24 13:34:39', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (425, '2021-01-24 13:39:28', '2021-01-24 13:49:30', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (426, '2021-01-24 13:39:35', '2021-01-24 13:50:38', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (427, '2021-01-24 13:54:27', '2021-01-24 14:05:28', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (428, '2021-01-24 13:54:39', '2021-01-24 14:05:28', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (429, '2021-01-24 14:09:28', '2021-01-24 14:20:04', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (430, '2021-01-24 14:09:35', '2021-01-24 14:20:04', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (431, '2021-01-24 14:24:27', '2021-01-24 14:34:40', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (432, '2021-01-24 14:24:33', '2021-01-24 14:34:40', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (433, '2021-01-24 14:39:26', '2021-01-24 14:50:20', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (434, '2021-01-24 14:39:33', '2021-01-24 14:50:20', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (435, '2021-01-24 14:54:39', '2021-01-24 15:05:21', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (436, '2021-01-24 14:54:46', '2021-01-24 15:05:21', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (437, '2021-01-24 15:09:28', '2021-01-24 15:20:18', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (438, '2021-01-24 15:09:37', '2021-01-24 15:20:18', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (439, '2021-01-24 15:24:34', '2021-01-24 15:35:09', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (440, '2021-01-24 15:24:41', '2021-01-24 15:35:09', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (441, '2021-01-24 15:39:28', '2021-01-24 15:50:01', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (442, '2021-01-24 15:39:37', '2021-01-24 15:50:01', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (443, '2021-01-24 15:54:26', '2021-01-24 16:05:04', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (444, '2021-01-24 15:54:33', '2021-01-24 16:05:04', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (445, '2021-01-24 16:09:28', '2021-01-24 16:19:49', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (446, '2021-01-24 16:09:34', '2021-01-24 16:19:49', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (447, '2021-01-24 16:24:28', '2021-01-24 16:34:33', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (448, '2021-01-24 16:24:35', '2021-01-24 16:35:37', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (449, '2021-01-24 16:39:31', '2021-01-24 16:49:45', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (450, '2021-01-24 16:39:38', '2021-01-24 16:49:46', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (451, '2021-01-24 16:54:27', '2021-01-24 17:04:44', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (452, '2021-01-24 16:54:34', '2021-01-24 17:04:44', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (453, '2021-01-24 17:09:28', '2021-01-24 17:19:37', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (454, '2021-01-24 17:09:33', '2021-01-24 17:19:37', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (455, '2021-01-24 17:24:28', '2021-01-24 17:35:30', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (456, '2021-01-24 17:24:35', '2021-01-24 17:35:30', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (457, '2021-01-24 17:39:27', '2021-01-24 17:50:30', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (458, '2021-01-24 17:39:35', '2021-01-24 17:50:30', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (459, '2021-01-24 17:54:28', '2021-01-24 18:05:15', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (460, '2021-01-24 17:54:39', '2021-01-24 18:05:15', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (461, '2021-01-24 18:09:26', '2021-01-24 18:20:03', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (462, '2021-01-24 18:09:30', '2021-01-24 18:20:03', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (463, '2021-01-24 18:24:28', '2021-01-24 18:34:43', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (464, '2021-01-24 18:25:47', '2021-01-24 18:35:47', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (465, '2021-01-24 18:39:28', '2021-01-24 18:50:28', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (466, '2021-01-24 18:39:35', '2021-01-24 18:50:28', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (467, '2021-01-24 18:54:36', '2021-01-24 19:05:05', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (468, '2021-01-24 18:54:42', '2021-01-24 19:05:05', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (469, '2021-01-24 19:09:25', '2021-01-24 19:19:42', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (470, '2021-01-24 19:09:31', '2021-01-24 19:19:42', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (471, '2021-01-24 19:24:29', '2021-01-24 19:35:19', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (472, '2021-01-24 19:24:45', '2021-01-24 19:35:19', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (473, '2021-01-24 19:39:31', '2021-01-24 19:50:20', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (474, '2021-01-24 19:39:38', '2021-01-24 19:50:20', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (475, '2021-01-24 19:54:34', '2021-01-24 20:05:10', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (476, '2021-01-24 19:54:40', '2021-01-24 20:05:10', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (477, '2021-01-24 20:09:30', '2021-01-24 20:20:01', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (478, '2021-01-24 20:09:37', '2021-01-24 20:20:01', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (479, '2021-01-24 20:24:33', '2021-01-24 20:34:47', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (480, '2021-01-24 20:24:38', '2021-01-24 20:34:47', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (481, '2021-01-24 20:39:26', '2021-01-24 20:49:35', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (482, '2021-01-24 20:39:31', '2021-01-24 20:49:35', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (483, '2021-01-24 20:54:26', '2021-01-24 21:05:23', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (484, '2021-01-24 20:54:31', '2021-01-24 21:05:23', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (485, '2021-01-24 21:09:27', '2021-01-24 21:20:06', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (486, '2021-01-24 21:09:32', '2021-01-24 21:20:06', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (487, '2021-01-24 21:24:26', '2021-01-24 21:34:47', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (488, '2021-01-24 21:24:31', '2021-01-24 21:34:47', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (489, '2021-01-24 21:39:27', '2021-01-24 21:49:30', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (490, '2021-01-24 21:39:32', '2021-01-24 21:50:34', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (491, '2021-01-24 21:54:26', '2021-01-24 22:05:19', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (492, '2021-01-24 21:54:31', '2021-01-24 22:05:19', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (493, '2021-01-24 22:09:31', '2021-01-24 22:20:00', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (494, '2021-01-24 22:09:36', '2021-01-24 22:20:00', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (495, '2021-01-24 22:24:30', '2021-01-24 22:34:51', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (496, '2021-01-24 22:24:38', '2021-01-24 22:34:51', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (497, '2021-01-24 22:39:27', '2021-01-24 22:49:36', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (498, '2021-01-24 22:39:34', '2021-01-24 22:49:36', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (499, '2021-01-24 22:54:29', '2021-01-24 23:05:32', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (500, '2021-01-24 22:54:36', '2021-01-24 23:05:32', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (501, '2021-01-24 23:09:29', '2021-01-24 23:19:33', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (502, '2021-01-24 23:09:35', '2021-01-24 23:20:43', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (503, '2021-01-24 23:24:28', '2021-01-24 23:34:31', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (504, '2021-01-24 23:24:39', '2021-01-24 23:35:36', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (505, '2021-01-24 23:39:27', '2021-01-24 23:50:20', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (506, '2021-01-24 23:39:34', '2021-01-24 23:50:21', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (507, '2021-01-24 23:54:31', '2021-01-25 00:05:16', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (508, '2021-01-24 23:54:38', '2021-01-25 00:05:16', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (509, '2021-01-25 00:09:30', '2021-01-25 00:19:49', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (510, '2021-01-25 00:09:37', '2021-01-25 00:19:49', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (511, '2021-01-25 00:24:25', '2021-01-25 00:35:09', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (512, '2021-01-25 00:24:30', '2021-01-25 00:35:09', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (513, '2021-01-25 00:39:30', '2021-01-25 00:50:00', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (514, '2021-01-25 00:39:38', '2021-01-25 00:50:00', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (515, '2021-01-25 00:54:29', '2021-01-25 01:04:56', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (516, '2021-01-25 00:54:36', '2021-01-25 01:04:56', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (517, '2021-01-25 01:09:30', '2021-01-25 01:19:50', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (518, '2021-01-25 01:09:39', '2021-01-25 01:19:51', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (519, '2021-01-25 01:24:28', '2021-01-25 01:34:55', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (520, '2021-01-25 01:24:35', '2021-01-25 01:34:55', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (521, '2021-01-25 01:39:30', '2021-01-25 01:49:51', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (522, '2021-01-25 01:39:37', '2021-01-25 01:49:51', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (523, '2021-01-25 01:54:28', '2021-01-25 02:04:41', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (524, '2021-01-25 01:54:35', '2021-01-25 02:04:41', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (525, '2021-01-25 02:09:29', '2021-01-25 02:19:44', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (526, '2021-01-25 02:09:36', '2021-01-25 02:19:44', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (527, '2021-01-25 02:24:28', '2021-01-25 02:34:39', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (528, '2021-01-25 02:24:35', '2021-01-25 02:34:39', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (529, '2021-01-25 02:39:30', '2021-01-25 02:49:36', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (530, '2021-01-25 02:39:37', '2021-01-25 02:50:37', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (531, '2021-01-25 02:54:25', '2021-01-25 03:04:40', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (532, '2021-01-25 02:54:29', '2021-01-25 03:04:40', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (533, '2021-01-25 03:09:25', '2021-01-25 03:19:43', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (534, '2021-01-25 03:09:29', '2021-01-25 03:19:43', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (535, '2021-01-25 03:24:25', '2021-01-25 03:34:47', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (536, '2021-01-25 03:24:30', '2021-01-25 03:34:47', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (537, '2021-01-25 03:39:29', '2021-01-25 03:49:55', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (538, '2021-01-25 03:39:37', '2021-01-25 03:49:55', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (539, '2021-01-25 03:54:28', '2021-01-25 04:05:04', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (540, '2021-01-25 03:54:36', '2021-01-25 04:05:05', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (541, '2021-01-25 04:09:30', '2021-01-25 04:20:11', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (542, '2021-01-25 04:09:39', '2021-01-25 04:20:11', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (543, '2021-01-25 04:24:28', '2021-01-25 04:34:55', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (544, '2021-01-25 04:24:33', '2021-01-25 04:34:55', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (545, '2021-01-25 04:39:26', '2021-01-25 04:49:53', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (546, '2021-01-25 04:39:31', '2021-01-25 04:49:53', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (547, '2021-01-25 04:54:32', '2021-01-25 05:04:52', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (548, '2021-01-25 04:54:36', '2021-01-25 05:04:52', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (549, '2021-01-25 05:09:35', '2021-01-25 05:19:42', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (550, '2021-01-25 05:09:40', '2021-01-25 05:19:42', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (551, '2021-01-25 05:24:29', '2021-01-25 05:35:04', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (552, '2021-01-25 05:24:37', '2021-01-25 05:35:04', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (553, '2021-01-25 05:39:28', '2021-01-25 05:50:38', 1, 19272, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (554, '2021-01-25 05:39:37', '2021-01-25 05:50:38', 1, 19273, 3, 'timeout', NULL);
INSERT INTO `tb_hashcat_task_result` VALUES (555, '2021-01-25 15:13:52', '2021-01-25 15:14:29', 1, 19272, 5, 'finish', '[\"8743b52063cd84097a65d1633f5c74f5:hashcat\"]');
INSERT INTO `tb_hashcat_task_result` VALUES (556, '2021-01-25 15:14:35', '2021-01-25 15:15:10', 1, 19273, 5, 'finish', '[\"e28c32958a44e096fd37447ea776615b:1772249015\"]');
COMMIT;

-- ----------------------------
-- Table structure for tb_idle_wallet
-- ----------------------------
DROP TABLE IF EXISTS `tb_idle_wallet`;
CREATE TABLE `tb_idle_wallet` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `type` varchar(63) NOT NULL,
  `address` varchar(511) NOT NULL,
  `extra_info` varchar(511) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_address` (`type`,`address`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_idle_wallet
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_property
-- ----------------------------
DROP TABLE IF EXISTS `tb_property`;
CREATE TABLE `tb_property` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `modified_time` datetime NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `type` varchar(31) NOT NULL,
  `amount` varchar(63) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_property` (`user_id`,`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_property
-- ----------------------------
BEGIN;
INSERT INTO `tb_property` VALUES (5, '2020-03-10 17:05:02', '2020-03-10 17:05:02', 0, 10050, 'oldPlatformBTCAmount', '999');
INSERT INTO `tb_property` VALUES (6, '2020-03-17 15:17:54', '2020-03-17 15:17:54', 0, 10062, 'oldPlatformBTCAmount', '888');
INSERT INTO `tb_property` VALUES (8, '2020-03-22 16:08:33', '2020-11-10 20:45:32', 47, 10050, 'credit', '49999700108322.58020000');
INSERT INTO `tb_property` VALUES (9, '2020-04-03 15:34:25', '2020-04-03 15:34:25', 0, 10032, 'credit', '0');
INSERT INTO `tb_property` VALUES (10, '2020-04-07 11:27:45', '2020-04-07 11:27:45', 0, 10062, 'credit', '0');
INSERT INTO `tb_property` VALUES (11, '2020-05-20 01:07:33', '2020-05-20 01:07:33', 0, 10099, 'oldPlatformBTCAmount', '999');
INSERT INTO `tb_property` VALUES (12, '2020-07-04 22:33:19', '2020-07-04 22:40:42', 1, 10049, 'credit', '9677.41940000');
COMMIT;

-- ----------------------------
-- Table structure for tb_property_exchange
-- ----------------------------
DROP TABLE IF EXISTS `tb_property_exchange`;
CREATE TABLE `tb_property_exchange` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `modified_time` datetime NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `property_id` bigint(20) unsigned NOT NULL,
  `amount` varchar(63) NOT NULL,
  `type` varchar(31) NOT NULL,
  `status` varchar(31) NOT NULL,
  `price` varchar(63) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_id` (`property_id`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_property_exchange
-- ----------------------------
BEGIN;
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
COMMIT;

-- ----------------------------
-- Table structure for tb_user_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_info`;
CREATE TABLE `tb_user_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `modified_time` datetime NOT NULL,
  `version` int(10) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `collection_code_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`) USING BTREE,
  UNIQUE KEY `receive_img` (`collection_code_url`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_user_info
-- ----------------------------
BEGIN;
INSERT INTO `tb_user_info` VALUES (6, '2020-06-25 19:54:06', '2020-06-27 12:00:23', 5, 10050, 'https://s1.ax1x.com/2020/06/27/NyWnrn.png');
COMMIT;

-- ----------------------------
-- Table structure for tb_wallet
-- ----------------------------
DROP TABLE IF EXISTS `tb_wallet`;
CREATE TABLE `tb_wallet` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `address` varchar(511) NOT NULL,
  `extra_info` varchar(511) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_user_address` (`user_id`,`type`) USING BTREE,
  UNIQUE KEY `uk_address` (`type`,`address`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_wallet
-- ----------------------------
BEGIN;
INSERT INTO `tb_wallet` VALUES (10, '2020-02-04 16:05:37', 10050, 'NH_BTC', '39XeYtGmpjbxaXYGNmQsH1WBMhwt6xbUq6', '{\"apiKey\":\"e4ffd016-6122-4b56-b5b0-24b20e1fda5a\",\"apiSecret\":\"f2ac2d53-b0a2-42ee-8d4a-23585a299dd3940e0e2e-0440-44ab-9065-36fc752f8d67\",\"organizationId\":\"1a3f28ca-4ca9-49b2-bbad-0009022d1c31\"}');
INSERT INTO `tb_wallet` VALUES (11, '2020-02-04 16:05:37', 10049, 'NH_BTC', '	35SrdMsdjofQtXxCjcroyeJUiKYNHbG9gR', '{\"apiKey\":\"4bd4fe90-300e-44cd-82bd-cd2d779891ab\",\"apiSecret\":\"aa1e219b-31fb-4906-9222-1d218707339847dce540-720e-4eae-ad0f-32ccd7f43935\",\"organizationId\":\"37f206e1-62d4-4577-9b2c-e0ba040b6f84\"}');
COMMIT;

-- ----------------------------
-- Table structure for tb_wallet_exchange
-- ----------------------------
DROP TABLE IF EXISTS `tb_wallet_exchange`;
CREATE TABLE `tb_wallet_exchange` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL,
  `modified_time` datetime NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `wallet_id` bigint(20) unsigned NOT NULL,
  `amount` varchar(63) NOT NULL,
  `status` varchar(31) NOT NULL,
  `price` varchar(63) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_id` (`wallet_id`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tb_wallet_exchange
-- ----------------------------
BEGIN;
INSERT INTO `tb_wallet_exchange` VALUES (12, '2020-05-24 11:48:03', '2020-06-13 13:46:19', 6, 10, '0.1', 'finish', '76967');
INSERT INTO `tb_wallet_exchange` VALUES (15, '2020-06-13 13:31:05', '2020-06-13 13:46:20', 3, 10, '0.00001', 'finish', '76967');
INSERT INTO `tb_wallet_exchange` VALUES (24, '2020-06-13 17:55:07', '2020-07-01 22:34:19', 1, 10, '0.001', 'finish', '76967');
INSERT INTO `tb_wallet_exchange` VALUES (26, '2020-06-13 17:59:14', '2020-07-01 22:34:19', 1, 10, '0.001', 'finish', '76967');
INSERT INTO `tb_wallet_exchange` VALUES (28, '2020-06-15 14:00:17', '2020-07-01 21:56:27', 4, 10, '0.001', 'finish', '76967');
INSERT INTO `tb_wallet_exchange` VALUES (31, '2020-06-18 11:34:03', '2020-07-01 21:56:28', 4, 10, '0.001', 'finish', '76967');
INSERT INTO `tb_wallet_exchange` VALUES (32, '2020-07-04 22:28:25', '2020-07-04 22:40:42', 1, 10, '0.001', 'finish', '76967');
INSERT INTO `tb_wallet_exchange` VALUES (33, '2020-07-04 22:39:12', '2020-07-04 22:40:42', 1, 11, '0.03', 'finish', '76967');
INSERT INTO `tb_wallet_exchange` VALUES (39, '2020-11-11 10:01:10', '2020-11-11 10:01:10', 0, 10, '0.001', 'wait', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
