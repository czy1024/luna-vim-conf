/*
 Navicat Premium Data Transfer

 Source Server         : luna-mysql-collage
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : cdb-5w1wgodg.bj.tencentcdb.com:10067
 Source Schema         : fusion_user

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 06/12/2020 16:06:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_session
-- ----------------------------
DROP TABLE IF EXISTS `tb_session`;
CREATE TABLE `tb_session`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NOT NULL,
  `modified_time` datetime(0) NOT NULL,
  `version` int(11) NOT NULL,
  `key` varchar(127) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `last_visit` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_key`(`key`) USING BTREE,
  INDEX `idx_last_visit`(`last_visit`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10286 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_session
-- ----------------------------

-- ----------------------------
-- Table structure for tb_tag
-- ----------------------------
DROP TABLE IF EXISTS `tb_tag`;
CREATE TABLE `tb_tag`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sequence` int(11) UNSIGNED NOT NULL,
  `mark` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tag_name`(`name`) USING BTREE,
  UNIQUE INDEX `uk_tag`(`sequence`, `mark`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_tag
-- ----------------------------
INSERT INTO `tb_tag` VALUES (7, '2020-02-16 15:12:30', 'IS_ADMIN', 1, 2);
INSERT INTO `tb_tag` VALUES (8, '2020-02-16 15:13:50', 'IS_PASSWORD_EXPIRE', 1, 1);
INSERT INTO `tb_tag` VALUES (9, '2020-11-28 15:38:12', 'IS_HASHCAT_TESTER', 1, 4);

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NOT NULL,
  `modified_time` datetime(0) NOT NULL,
  `version` int(11) UNSIGNED NOT NULL,
  `email` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sites` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_email`(`email`) USING BTREE,
  UNIQUE INDEX `uk_mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10073 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (10020, '2020-01-20 22:35:50', '2020-01-20 22:35:50', 0, NULL, '15696756583', 'd9362e3f575b130f0f551370f4b01438663019025b59df142ab4fe1f018327349710d25cdb1df872dea3da41855e19ef62e9d1c15aec3842d89ffe91352877f9', '[\"wednesday\"]');
INSERT INTO `tb_user` VALUES (10032, '2020-01-21 11:20:53', '2020-10-01 15:38:32', 26, '15696756582@163.com', '15696756584', '484891f3257ece5c35af7cb75b299ad66215b565bb980564c2d3a1a8450df410def8f5c1c54a0618922fc3824f4a41ecc80e2a7286efeca5264920df0669f6c2', '[\"sweeney\",\"wednesday\"]');
INSERT INTO `tb_user` VALUES (10037, '2020-01-31 14:47:42', '2020-01-31 14:47:42', 0, 'iteknical@126.com', NULL, '484891f3257ece5c35af7cb75b299ad66215b565bb980564c2d3a1a8450df410def8f5c1c54a0618922fc3824f4a41ecc80e2a7286efeca5264920df0669f6c2', '[\"wednesday\"]');
INSERT INTO `tb_user` VALUES (10048, '2020-02-01 18:45:26', '2020-02-01 18:45:26', 0, 'admin@qq.com', NULL, '1631b8f9269f257618558f6983dbf528eaaf1e454c157b84e57b8d95a9ac035f99c515ab9ec23be92c87becfb556a8e92860a5e515ee738dddcce5a32423d145', '[\"wednesday\"]');
INSERT INTO `tb_user` VALUES (10049, '2020-02-01 19:07:36', '2020-02-06 15:11:30', 43, '1173282254@qq.com', '15696756582', '1631b8f9269f257618558f6983dbf528eaaf1e454c157b84e57b8d95a9ac035f99c515ab9ec23be92c87becfb556a8e92860a5e515ee738dddcce5a32423d145', '[\"sweeney\",\"wednesday\"]');
INSERT INTO `tb_user` VALUES (10050, '2020-02-01 20:28:49', '2020-05-24 19:33:03', 11, 'pascalqq@126.com', '17606542290', '484891f3257ece5c35af7cb75b299ad66215b565bb980564c2d3a1a8450df410def8f5c1c54a0618922fc3824f4a41ecc80e2a7286efeca5264920df0669f6c2', '[\"sweeney\",\"wednesday\"]');
INSERT INTO `tb_user` VALUES (10051, '2020-02-01 20:29:17', '2020-02-01 20:29:17', 0, 'test2@126.com', NULL, '484891f3257ece5c35af7cb75b299ad66215b565bb980564c2d3a1a8450df410def8f5c1c54a0618922fc3824f4a41ecc80e2a7286efeca5264920df0669f6c2', '[\"wednesday\"]');
INSERT INTO `tb_user` VALUES (10052, '2020-02-01 20:30:49', '2020-02-01 20:30:49', 0, 'test3@126.com', NULL, '484891f3257ece5c35af7cb75b299ad66215b565bb980564c2d3a1a8450df410def8f5c1c54a0618922fc3824f4a41ecc80e2a7286efeca5264920df0669f6c2', '[\"wednesday\"]');
INSERT INTO `tb_user` VALUES (10053, '2020-02-01 22:32:35', '2020-02-01 22:32:35', 0, 'timezonetest@126.com', NULL, '484891f3257ece5c35af7cb75b299ad66215b565bb980564c2d3a1a8450df410def8f5c1c54a0618922fc3824f4a41ecc80e2a7286efeca5264920df0669f6c2', '[\"wednesday\"]');
INSERT INTO `tb_user` VALUES (10055, '2020-02-06 13:46:34', '2020-02-06 13:46:34', 0, 'test@126.com', NULL, '484891f3257ece5c35af7cb75b299ad66215b565bb980564c2d3a1a8450df410def8f5c1c54a0618922fc3824f4a41ecc80e2a7286efeca5264920df0669f6c2', '[\"wednesday\"]');
INSERT INTO `tb_user` VALUES (10056, '2020-02-06 13:47:07', '2020-02-06 13:47:07', 0, 'test5@126.com', NULL, '484891f3257ece5c35af7cb75b299ad66215b565bb980564c2d3a1a8450df410def8f5c1c54a0618922fc3824f4a41ecc80e2a7286efeca5264920df0669f6c2', '[\"wednesday\"]');
INSERT INTO `tb_user` VALUES (10057, '2020-02-06 13:49:48', '2020-05-03 23:36:14', 1, NULL, '17098044227', 'beac6252797210e59c64b8e1cd84473e6084068161dbdcdafb46488268e54e4d0783bca747956e457f436a3d870c9dd1811684269b0b71f34596187e18d0b87c', '[\"wednesday\"]');
INSERT INTO `tb_user` VALUES (10058, '2020-02-06 13:50:19', '2020-02-06 13:50:19', 0, NULL, '17098044228', '484891f3257ece5c35af7cb75b299ad66215b565bb980564c2d3a1a8450df410def8f5c1c54a0618922fc3824f4a41ecc80e2a7286efeca5264920df0669f6c2', '[\"wednesday\"]');
INSERT INTO `tb_user` VALUES (10059, '2020-02-06 13:54:06', '2020-02-06 13:54:06', 0, NULL, '17098044229', '7f93a486735f180eee5095628dda1ec7693b44b1a59368748c951bcc7b7cdf82e2533b38f16a6a0532fff94e4be9b9720d6d3a9d237cc30381f62ada413ea0b4', '[\"wednesday\"]');
INSERT INTO `tb_user` VALUES (10061, '2020-02-07 22:50:51', '2020-02-07 22:50:51', 0, 'techzero@live.com', NULL, '80e055a6e70d1c05bc674d3e8dbc092443ae932343c5e6283cc99bb30deadfb730c66cbcb89395808e7ab5e5f597fc8fa7961fa6dac2b86d9d748212cd4b852c', '[\"wednesday\"]');
INSERT INTO `tb_user` VALUES (10062, '2020-03-17 15:17:42', '2020-03-17 15:17:42', 0, NULL, '15696756588', '1631b8f9269f257618558f6983dbf528eaaf1e454c157b84e57b8d95a9ac035f99c515ab9ec23be92c87becfb556a8e92860a5e515ee738dddcce5a32423d145', '[\"wednesday\"]');
INSERT INTO `tb_user` VALUES (10072, '2020-09-07 12:07:43', '2020-09-07 12:07:43', 0, NULL, '17606542291', '1631b8f9269f257618558f6983dbf528eaaf1e454c157b84e57b8d95a9ac035f99c515ab9ec23be92c87becfb556a8e92860a5e515ee738dddcce5a32423d145', '[\"wednesday\"]');

-- ----------------------------
-- Table structure for tb_user_tag
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_tag`;
CREATE TABLE `tb_user_tag`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NOT NULL,
  `modified_time` datetime(0) NOT NULL,
  `version` int(11) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `tag_1` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `tag_2` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `tag_3` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `tag_4` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `tag_5` bigint(20) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user_tag
-- ----------------------------
INSERT INTO `tb_user_tag` VALUES (62, '2020-02-11 14:50:55', '2020-02-16 15:21:30', 21, 95001, 7, 0, 0, 0, 0);
INSERT INTO `tb_user_tag` VALUES (64, '2020-02-16 18:33:01', '2020-02-16 18:33:01', 1, 10050, 2, 0, 0, 0, 0);
INSERT INTO `tb_user_tag` VALUES (65, '2020-02-16 18:33:01', '2020-02-25 17:12:23', 10, 10032, 3, 0, 0, 0, 0);

SET FOREIGN_KEY_CHECKS = 1;
