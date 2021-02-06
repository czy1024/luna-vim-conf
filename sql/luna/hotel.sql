/*
 Navicat Premium Data Transfer

 Source Server         : luna-mysql-collage
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : cdb-5w1wgodg.bj.tencentcdb.com:10067
 Source Schema         : hotel

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 06/12/2020 16:11:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_checkin_with
-- ----------------------------
DROP TABLE IF EXISTS `tb_checkin_with`;
CREATE TABLE `tb_checkin_with`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pre_customerid` bigint(20) NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `idcard` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `room_number` int(11) NULL DEFAULT NULL,
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `last_time` datetime(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_checkin_with
-- ----------------------------

-- ----------------------------
-- Table structure for tb_department
-- ----------------------------
DROP TABLE IF EXISTS `tb_department`;
CREATE TABLE `tb_department`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `staff_numbers` int(11) NULL DEFAULT NULL COMMENT '部门员工数量',
  `staff_id` bigint(20) NOT NULL COMMENT '负责人Id',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97012 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_department
-- ----------------------------
INSERT INTO `tb_department` VALUES (1, '清洁部', 0, 95001, '2020-02-26 17:34:05', '2020-02-26 17:34:06');
INSERT INTO `tb_department` VALUES (97001, '后勤部', 55, 12, '2020-02-17 19:15:10', '2020-02-17 19:15:12');
INSERT INTO `tb_department` VALUES (97002, '保卫部', 20, 0, '2020-02-14 15:51:32', '2020-02-14 15:51:32');
INSERT INTO `tb_department` VALUES (97003, '策划部', 6, 0, '2020-02-17 19:15:10', '2020-02-17 19:15:12');
INSERT INTO `tb_department` VALUES (97004, '宣传部', 6, 0, '2020-02-14 15:51:32', '2020-02-14 15:51:32');
INSERT INTO `tb_department` VALUES (97005, '财政部', 10, 0, '2020-02-17 19:15:10', '2020-02-17 19:15:12');
INSERT INTO `tb_department` VALUES (97006, '人事部', 5, 0, '2020-02-14 15:51:32', '2020-02-14 15:51:32');
INSERT INTO `tb_department` VALUES (97007, '礼仪部', 15, 0, '2020-02-17 19:15:10', '2020-02-17 19:15:12');
INSERT INTO `tb_department` VALUES (97008, '餐饮部', 15, 0, '2020-02-17 19:15:10', '2020-02-17 19:15:12');
INSERT INTO `tb_department` VALUES (97011, '测试部门', 15, 12, '2020-02-14 15:51:32', '2020-02-14 15:51:32');

-- ----------------------------
-- Table structure for tb_floor
-- ----------------------------
DROP TABLE IF EXISTS `tb_floor`;
CREATE TABLE `tb_floor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roomnumbers` int(20) NULL DEFAULT NULL COMMENT '房间数量',
  `plan_diagram` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二维平面图',
  `fireevacuation_diagram` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消防疏散图',
  `three_d_diagram` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '3D结构图',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `房间编号-楼层`(`roomnumbers`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_floor
-- ----------------------------
INSERT INTO `tb_floor` VALUES (3, 15, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1075363116,1932699212&fm=26&gp=0.jpg', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2143477528,2322165400&fm=26&gp=0.jpg', NULL, NULL, NULL);
INSERT INTO `tb_floor` VALUES (4, 10, 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1075363116,1932699212&fm=26&gp=0.jpg', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2143477528,2322165400&fm=26&gp=0.jpg', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物品所属房间列表,没有为null',
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物品图片',
  `buy_time` datetime(0) NULL DEFAULT NULL COMMENT '购买时间',
  `price` double(11, 0) NULL DEFAULT NULL COMMENT '购买价格',
  `compensation_money` double(11, 0) NULL DEFAULT NULL COMMENT '损坏赔偿金额',
  `state` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态(开关.是否借出等)',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `所属房间`(`room_list`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10039 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_goods
-- ----------------------------
INSERT INTO `tb_goods` VALUES (1001, '', 'Type-C充电器', 'http://img2.imgtn.bdimg.com/it/u=160546933,3112685227&fm=26&gp=0.jpg', '2020-02-13 00:00:00', 33, 33, '1', '2020-02-18 15:33:13', '2020-02-27 18:55:56');
INSERT INTO `tb_goods` VALUES (1002, '115,329,448,445', '吹风机', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=402004023,2033609402&fm=26&gp=0.jpg', '2020-01-04 17:21:40', 120, 120, '0', '2020-01-30 17:23:13', '2020-01-31 17:23:18');
INSERT INTO `tb_goods` VALUES (1003, 'All', '防滑垫', 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3205385768,2005555174&fm=26&gp=0.jpg', '2020-01-04 17:24:36', 30, 30, '1', '2020-02-03 17:25:10', '2020-02-06 17:25:14');
INSERT INTO `tb_goods` VALUES (1004, 'All', '电视', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2849077269,3073669123&fm=26&gp=0.jpg', '2020-01-04 17:28:54', 6000, 6000, '1', '2020-01-31 17:29:11', '2020-02-02 17:29:16');
INSERT INTO `tb_goods` VALUES (1005, '504（5）,508（1）,509（1）', '电熨斗', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1731630908,1382339098&fm=26&gp=0.jpg', '2020-01-04 17:44:24', 1000, 1000, '0', '2020-01-27 17:45:06', '2020-01-28 17:45:11');
INSERT INTO `tb_goods` VALUES (1006, 'All', '浴巾', 'https://ns-strategy.cdn.bcebos.com/ns-strategy/upload/fc_big_pic/part-00097-1387.jpg', '2020-01-04 09:40:17', 80, 80, '1', '2020-02-05 09:40:31', '2020-02-05 09:40:34');
INSERT INTO `tb_goods` VALUES (1007, 'All', '水杯', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=176724700,587743273&fm=26&gp=0.jpg', '2020-01-04 09:41:11', 15, 15, '1', '2020-02-05 09:41:26', '2020-02-05 09:41:53');
INSERT INTO `tb_goods` VALUES (1008, 'All', '窗帘', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1014902899,2137896393&fm=26&gp=0.jpg', '2020-01-04 09:42:48', 1500, 1500, '1', '2020-02-05 09:43:03', '2020-02-05 09:43:07');
INSERT INTO `tb_goods` VALUES (1009, 'All', '空调', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3810310275,3104526412&fm=26&gp=0.jpg', '2020-01-04 10:40:07', 3000, 3000, '1', '2020-02-05 10:40:32', '2020-02-05 10:40:38');
INSERT INTO `tb_goods` VALUES (1010, NULL, '床垫', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582457619525&di=b4af2ab2020a427afcb6c9c945229afa&imgtype=0&src=http%3A%2F%2Fimg006.hc360.cn%2Fg2%2FM09%2F30%2FC4%2FwKhQulLXQEGEcPLEAAAAACjnAA0892.jpg', '2020-02-22 00:00:00', 1000, 1200, '1', '2020-02-05 10:41:32', '2020-02-22 16:45:13');
INSERT INTO `tb_goods` VALUES (1011, 'All', '马桶', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582457643569&di=42c8f32bd0d41a0033658d525e6fbc44&imgtype=0&src=http%3A%2F%2Fimg5.cache.netease.com%2Fhome%2F2011%2F9%2F6%2F20110906102324b96af.jpg', '2020-01-04 10:42:03', 800, 800, '1', '2020-02-05 10:43:53', '2020-02-05 10:43:57');
INSERT INTO `tb_goods` VALUES (1012, 'All', '马桶盖', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2349780362,4230107025&fm=26&gp=0.jpg', '2020-01-04 10:44:12', 300, 300, '1', '2020-02-05 10:44:30', '2020-02-05 10:44:38');
INSERT INTO `tb_goods` VALUES (1013, '503（16），504（5）,507（8）,508（1）,509（1）', '沙发', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582457703443&di=cfd4c1fb0678901dae86f03277612107&imgtype=0&src=http%3A%2F%2Fstatic-news.17house.com%2Fweb%2Ftoutiao%2F201701%2F07%2F1483793534294482667.png', '2020-01-04 10:45:47', 2000, 2000, '1', '2020-02-05 10:46:10', '2020-02-05 10:46:13');
INSERT INTO `tb_goods` VALUES (1014, '504（5）,508（1）,509（1）', '冰箱', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582457741231&di=ec9cae0f00d9530f5003a6e05ee44398&imgtype=0&src=http%3A%2F%2Fgfs17.gomein.net.cn%2FT1hODTBmET1RCvBVdK_800.jpg', '2020-01-04 10:46:31', 5000, 5000, '0', '2020-02-05 10:46:52', '2020-02-05 10:46:58');
INSERT INTO `tb_goods` VALUES (1015, '504（5）,508（1）,509（1）', '衣柜', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582457765803&di=4756522c8eac14c1be15c0f684366a70&imgtype=0&src=http%3A%2F%2Fwww.baitesi.com%2Finc%2Fkindeditor%2Fattached%2Fimage%2F20141106%2F20141106092148_17453.jpg', '2020-01-04 10:47:17', 5000, 5000, '1', '2020-02-05 10:47:44', '2020-02-05 10:47:48');
INSERT INTO `tb_goods` VALUES (1016, '504（5）,508（1）,509（1）', '化妆镜', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582457843253&di=aa78d621ae59a335e54cadc20553d889&imgtype=0&src=http%3A%2F%2Fwww.xinjiadiy.com%2Fimages%2Farticle_img%2Ftuwen%2F20170511%2F3669.jpg', '2020-01-04 10:48:37', 200, 200, '1', '2020-02-05 10:48:54', '2020-02-05 10:48:58');
INSERT INTO `tb_goods` VALUES (1017, 'All', '空调遥控器', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582457885084&di=2843831082e16e343fc530a5f354cdae&imgtype=0&src=http%3A%2F%2Fimg.shushi100.com%2F2018%2F01%2F13%2F1515804344-5819268055142480.jpg', '2020-01-04 10:49:46', 150, 150, '1', '2020-02-05 10:50:15', '2020-02-05 10:50:24');
INSERT INTO `tb_goods` VALUES (1018, 'All', '电视遥控器', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=202385638,2900167658&fm=26&gp=0.jpg', '2020-02-04 10:50:45', 300, 300, '1', '2020-02-05 10:51:01', '2020-02-05 10:51:08');
INSERT INTO `tb_goods` VALUES (1019, 'All', '立体垃圾桶', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1403762405,3518508263&fm=26&gp=0.jpg', '2020-02-09 20:30:13', 150, 150, '1', '2020-02-09 20:30:52', '2020-02-09 20:30:57');
INSERT INTO `tb_goods` VALUES (1020, '448,333,227', '雨伞', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582457990233&di=2f3a0e4308349bd1aded45e0ba3ec86e&imgtype=jpg&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D1060487727%2C143508545%26fm%3D214%26gp%3D0.jpg', '2020-02-09 20:31:50', 100, 100, '0', '2020-02-09 20:32:10', '2020-02-09 20:32:14');
INSERT INTO `tb_goods` VALUES (1021, '508（1），509（1）', '电话机', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582458051050&di=f5f12285a3b58374d59908509e582766&imgtype=0&src=http%3A%2F%2Fimage1.wulinsoso.com%2Fhdpic%2Fzcool%2F2014%2F01%2F05%2F0039036688.jpg', '2020-02-09 20:33:36', 150, 150, '1', '2020-02-09 20:33:50', '2020-02-09 20:33:54');
INSERT INTO `tb_goods` VALUES (1022, '508（1），509（1）', '地毯', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582458073435&di=2586f3136e811bf10421ff72d0eaaff9&imgtype=0&src=http%3A%2F%2Fwww.williamgol-home.com%2Fuploads%2Fallimg%2F151106%2F1-151106110J6251.jpg', '2020-02-09 20:36:38', 100, 100, '0', '2020-02-09 20:36:59', '2020-02-09 20:37:03');
INSERT INTO `tb_goods` VALUES (1023, '503（16），504（5）,507（8）,508（1）,509（1）', '床头柜', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582458108161&di=f2b561c4e64a7fb3fae883c859022395&imgtype=0&src=http%3A%2F%2Fimg005.hc360.cn%2Fm3%2FM02%2FC2%2F1E%2FwKhQ5lTAWeWEKRamAAAAAMWPq90026.jpg', '2020-02-09 20:39:42', 500, 500, '1', '2020-02-09 20:39:55', '2020-02-09 20:39:59');
INSERT INTO `tb_goods` VALUES (1024, '448,333,227', '雨衣', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582458179191&di=bfce07cd7e84a6453fc9fa42bcacb8fb&imgtype=0&src=http%3A%2F%2Fimg1.99114.com%2Fgroup10%2FM00%2F24%2FC5%2FrBADs1opW5eAQEWmAACJtv0xfjs355.jpg', '2020-02-21 14:28:57', 100, 100, '0', '2020-02-21 14:29:28', '2020-02-21 14:29:31');
INSERT INTO `tb_goods` VALUES (1025, 'All', '充电宝', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582458274574&di=1f7f083f8cc596c704f72f54ebb897c3&imgtype=0&src=http%3A%2F%2Fimage.it168.com%2Fn%2F640x480%2F8%2F8042%2F8042328.jpg', '2020-02-21 14:30:31', 100, 100, '0', '2020-02-21 14:30:41', '2020-02-21 14:30:43');

-- ----------------------------
-- Table structure for tb_hotel
-- ----------------------------
DROP TABLE IF EXISTS `tb_hotel`;
CREATE TABLE `tb_hotel`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '酒店名称',
  `floornumbers` int(11) NULL DEFAULT NULL COMMENT '楼层数',
  `roomnumbers` int(11) NULL DEFAULT NULL COMMENT '房间数',
  `mobile` int(11) NULL DEFAULT NULL COMMENT '联系方式',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `rules` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规章制度',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_hotel
-- ----------------------------
INSERT INTO `tb_hotel` VALUES (2, 'Alters', 2, 800, 95500106, NULL, NULL, '2020-01-31 14:56:21', '2020-01-31 14:56:21');

-- ----------------------------
-- Table structure for tb_lease
-- ----------------------------
DROP TABLE IF EXISTS `tb_lease`;
CREATE TABLE `tb_lease`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) NULL DEFAULT NULL COMMENT '租赁物品编号',
  `customer_id` bigint(20) NULL DEFAULT NULL COMMENT '客户id',
  `lease_rentaltime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预计租赁时长',
  `lease_returntime` datetime(0) NULL DEFAULT NULL COMMENT '实际归还时长',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90380169944 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_lease
-- ----------------------------
INSERT INTO `tb_lease` VALUES (4, 7, 10035, '24th', '2020-02-22 18:00:00', '2020-02-08 17:46:14', '2020-02-22 18:25:52');
INSERT INTO `tb_lease` VALUES (5, 1000, 10013, '5', NULL, '2020-02-22 15:24:31', '2020-02-22 15:24:31');
INSERT INTO `tb_lease` VALUES (30434000377, 120, 10013, '-4', NULL, '2020-02-22 21:47:25', '2020-02-22 21:47:25');
INSERT INTO `tb_lease` VALUES (31983947170, 0, 10013, '-4', NULL, '2020-02-22 21:50:49', '2020-02-22 21:50:49');
INSERT INTO `tb_lease` VALUES (40568530358, 1001, 10013, '-2', NULL, '2020-02-27 00:11:56', '2020-02-27 00:11:56');
INSERT INTO `tb_lease` VALUES (41209763096, 0, 10013, '-1', NULL, '2020-02-26 23:03:45', '2020-02-26 23:03:45');
INSERT INTO `tb_lease` VALUES (81560876742, 0, 10013, '-2', NULL, '2020-02-27 00:10:54', '2020-02-27 00:10:54');
INSERT INTO `tb_lease` VALUES (90164406825, 1002, 10050, '-1', NULL, '2020-03-11 16:04:33', '2020-03-11 16:04:33');
INSERT INTO `tb_lease` VALUES (90380169943, 0, 10013, '-1', NULL, '2020-02-26 23:57:22', '2020-02-26 23:57:22');

-- ----------------------------
-- Table structure for tb_mealdistribution
-- ----------------------------
DROP TABLE IF EXISTS `tb_mealdistribution`;
CREATE TABLE `tb_mealdistribution`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room_number` int(11) NULL DEFAULT NULL COMMENT '配送房间',
  `staff_id` bigint(20) NULL DEFAULT NULL COMMENT '配送员工编号',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单编号',
  `mealdistribution_intime` datetime(0) NULL DEFAULT NULL COMMENT '开始配送',
  `mealdistribution_outtime` datetime(0) NULL DEFAULT NULL COMMENT '送达时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '订单创建时间',
  `modify_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_10`(`order_id`) USING BTREE,
  INDEX `FK_Reference_9`(`staff_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_mealdistribution
-- ----------------------------
INSERT INTO `tb_mealdistribution` VALUES (47, 327, 95005, 95521522, NULL, NULL, '2020-02-18 02:32:58', '2020-02-18 15:59:42');
INSERT INTO `tb_mealdistribution` VALUES (48, 327, 95005, 95521522, NULL, NULL, '2020-02-18 02:32:58', '2020-02-18 15:59:42');
INSERT INTO `tb_mealdistribution` VALUES (49, 327, 95005, 95521522, NULL, NULL, '2020-02-18 02:32:58', '2020-02-18 15:59:42');
INSERT INTO `tb_mealdistribution` VALUES (50, 327, 95005, 95521522, NULL, NULL, '2020-02-18 02:32:58', '2020-02-18 15:59:42');
INSERT INTO `tb_mealdistribution` VALUES (51, 327, 95005, 95521522, NULL, NULL, '2020-02-18 02:32:58', '2020-02-18 15:59:42');
INSERT INTO `tb_mealdistribution` VALUES (52, 327, 95005, 95521522, NULL, NULL, '2020-02-18 02:32:58', '2020-02-18 15:59:42');
INSERT INTO `tb_mealdistribution` VALUES (53, 327, 95005, 95521522, NULL, NULL, '2020-02-18 02:32:58', '2020-02-18 15:59:42');
INSERT INTO `tb_mealdistribution` VALUES (54, 327, 95005, 95521522, NULL, NULL, '2020-02-18 02:32:58', '2020-02-18 15:59:42');
INSERT INTO `tb_mealdistribution` VALUES (61, 103, 10016, 4552269401, NULL, NULL, '2020-03-11 15:56:49', '2020-03-11 15:56:49');

-- ----------------------------
-- Table structure for tb_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜品名称',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜品图片',
  `numbers` int(11) NULL DEFAULT NULL COMMENT '菜品数量',
  `price` double(11, 2) NULL DEFAULT NULL COMMENT '价格',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES (4, '西红柿炒鸡蛋', 'http://111.229.114.126:8087/iszychen/img/menu/4.jpg', 20, 18.00, '2020-02-03 17:48:46', '2020-02-03 17:48:52');
INSERT INTO `tb_menu` VALUES (5, '拔丝地瓜', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4201028016,587045812&fm=26&gp=0.jpg', 20, 28.00, '2020-02-04 17:49:38', '2020-02-04 17:49:45');
INSERT INTO `tb_menu` VALUES (6, '紫菜蛋汤', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581262764588&di=222d815b8e7a94bdbedca918abe48b5b&imgtype=0&src=http%3A%2F%2Fimg.mp.sohu.com%2Fq_mini%2Cc_zoom%2Cw_640%2Fupload%2F20170531%2F38e324a5de664000a079fe62ca7fa216_th.jpg', 20, 10.00, '2020-02-02 17:50:29', '2020-02-02 17:50:35');
INSERT INTO `tb_menu` VALUES (7, '米饭', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581262899042&di=09532ef08a18a282d1ac002704fb5cac&imgtype=0&src=http%3A%2F%2Fthumb.takefoto.cn%2Fwp-content%2Fuploads%2F2015%2F05%2F201505040536561161.jpg', 20, 2.00, '2020-02-05 17:53:37', '2020-02-05 17:53:41');
INSERT INTO `tb_menu` VALUES (8, '梅菜扣肉', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581262966549&di=6b48d4a322c99f7878c60ab920dfec57&imgtype=0&src=http%3A%2F%2Fimg009.hc360.cn%2Fm7%2FM0D%2F37%2F1A%2FwKhQo1b3QhOEDhheAAAAACCrqQw490.jpg', 20, 30.00, '2020-02-05 09:36:35', '2020-02-05 09:36:39');
INSERT INTO `tb_menu` VALUES (9, '红烧鲫鱼', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581262996956&di=3be1b3e653caa9bd6564280b4572f669&imgtype=0&src=http%3A%2F%2Fcp2.douguo.net%2Fupload%2Fcaiku%2F2%2F8%2F9%2Fyuan_28db0831f5e515de27185f0b331cf1d9.jpg', 20, 25.00, '2020-02-05 09:37:05', '2020-02-05 09:37:10');
INSERT INTO `tb_menu` VALUES (10, '清炒时蔬', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581263071320&di=2b16d637dbafc77dc05e3f257d293f31&imgtype=0&src=http%3A%2F%2Fpic1.nipic.com%2F2008-10-23%2F20081023111619306_2.jpg', 20, 10.00, '2020-02-05 09:37:42', '2020-02-05 09:37:45');
INSERT INTO `tb_menu` VALUES (11, '白切鸡', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581263106327&di=92066e9318f4bec81a2227806ef23752&imgtype=0&src=http%3A%2F%2Fupload4.95171.cn%2Falbumpicimages%2F20110727%2F2676d817-728e-4959-bfd4-b04e9d1b0d3d.jpg', 20, 28.00, '2020-02-09 20:57:24', '2020-02-09 20:57:27');
INSERT INTO `tb_menu` VALUES (12, '五香煎饼', 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=544222105,3646375735&fm=26&gp=0.jpg', 20, 15.00, '2020-01-14 18:19:17', '2020-01-14 18:19:27');
INSERT INTO `tb_menu` VALUES (13, '小笼蒸饺', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581426943177&di=3dca09c9e47b3faee1fc0478ca04a25f&imgtype=0&src=http%3A%2F%2Fpic6.58cdn.com.cn%2Fmobile%2Fbig%2Fn_v1bl2lwkipdrmfmvnv2joa.jpg%3Fw%3D425%26h%3D320', 20, 18.00, '2020-02-04 18:28:13', '2020-02-04 18:28:17');
INSERT INTO `tb_menu` VALUES (15, '东安鸡', 'http://111.229.114.126:8087/iszychen/img/menu/15.jpg', 10, 150.00, '2020-02-15 19:16:42', '2020-02-15 19:16:42');

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
) ENGINE = InnoDB AUTO_INCREMENT = 92 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_news
-- ----------------------------
INSERT INTO `tb_news` VALUES (2, '附近旅游景点', NULL, '2020-02-02 18:02:17.000000', '2020-02-02 18:02:21.000000');
INSERT INTO `tb_news` VALUES (3, '新闻', NULL, '2020-02-03 18:02:24.000000', '2020-02-03 18:02:28.000000');
INSERT INTO `tb_news` VALUES (69, '测试', '菜品预定', '2020-02-18 17:55:38.000000', '2020-02-18 17:55:38.000000');
INSERT INTO `tb_news` VALUES (70, '测试', '菜品预定', '2020-02-18 18:00:30.000000', '2020-02-18 18:00:30.000000');
INSERT INTO `tb_news` VALUES (71, '测试', '测试', '2020-02-18 19:33:07.000000', '2020-02-18 19:33:07.000000');
INSERT INTO `tb_news` VALUES (72, '测试', '测试', '2020-02-18 20:00:32.000000', '2020-02-18 20:00:32.000000');
INSERT INTO `tb_news` VALUES (73, '房间打扫', '麻烦再下午三点打扫一下房间', '2020-02-18 21:11:36.000000', '2020-02-18 21:11:36.000000');
INSERT INTO `tb_news` VALUES (74, '测试', '测试', '2020-02-18 21:22:05.000000', '2020-02-18 21:22:05.000000');
INSERT INTO `tb_news` VALUES (75, '测试', '测试', '2020-02-18 21:32:14.000000', '2020-02-18 21:32:14.000000');
INSERT INTO `tb_news` VALUES (76, '测试', '菜品预定', '2020-02-18 21:33:38.000000', '2020-02-18 21:33:38.000000');
INSERT INTO `tb_news` VALUES (77, '测试', '测试', '2020-02-18 21:36:20.000000', '2020-02-18 21:36:20.000000');
INSERT INTO `tb_news` VALUES (78, '房间打扫完成', '测试', '2020-02-18 22:22:54.000000', '2020-02-18 22:22:54.000000');
INSERT INTO `tb_news` VALUES (79, '房间打扫完成', '测试', '2020-02-18 22:23:03.000000', '2020-02-18 22:23:03.000000');
INSERT INTO `tb_news` VALUES (80, '房间打扫完成', '房间打扫完成', '2020-02-18 22:26:49.000000', '2020-02-18 22:26:49.000000');
INSERT INTO `tb_news` VALUES (81, '您有新的订单', '327该房间用户10013已经下单西红柿炒鸡蛋2份,请速联系并配送', '2020-02-20 18:13:21.000000', '2020-02-20 18:13:21.000000');
INSERT INTO `tb_news` VALUES (82, '您有新的订单', '327该房间用户10013已经下单西红柿炒鸡蛋2份,请速联系并配送', '2020-02-20 18:13:40.000000', '2020-02-20 18:13:40.000000');
INSERT INTO `tb_news` VALUES (83, '您有新的订单', '327该房间用户10013已经下单紫菜蛋汤1份,请速联系并配送', '2020-02-20 18:33:00.000000', '2020-02-20 18:33:00.000000');
INSERT INTO `tb_news` VALUES (84, '您有新的订单', '327该房间用户10013已经下单紫菜蛋汤1份,请速联系并配送', '2020-02-20 18:33:48.000000', '2020-02-20 18:33:48.000000');
INSERT INTO `tb_news` VALUES (85, '您有新的订单', '327该房间用户10013已经下单拔丝地瓜1份,请速联系并配送', '2020-02-20 18:34:20.000000', '2020-02-20 18:34:20.000000');
INSERT INTO `tb_news` VALUES (86, '您有新的订单', '327该房间用户10013已经下单紫菜蛋汤1份,请速联系并配送', '2020-02-20 18:34:21.000000', '2020-02-20 18:34:21.000000');
INSERT INTO `tb_news` VALUES (87, '您有新的订单', '327该房间用户10013已经下单西红柿炒鸡蛋1份,请速联系并配送', '2020-02-20 18:34:32.000000', '2020-02-20 18:34:32.000000');
INSERT INTO `tb_news` VALUES (88, '您有新的订单', '327该房间用户10013已经下单拔丝地瓜1份,请速联系并配送', '2020-02-20 18:34:34.000000', '2020-02-20 18:34:34.000000');
INSERT INTO `tb_news` VALUES (89, '您有新的订单', '327该房间用户10013已经下单清炒时蔬1份,请速联系并配送', '2020-02-20 18:34:52.000000', '2020-02-20 18:34:52.000000');
INSERT INTO `tb_news` VALUES (90, '您有新的订单', '327该房间用户10013已经下单西红柿炒鸡蛋1份,请速联系并配送', '2020-02-26 22:16:11.000000', '2020-02-26 22:16:11.000000');
INSERT INTO `tb_news` VALUES (91, '您有新的订单', '103该房间用户10050已经下单西红柿炒鸡蛋1份,请速联系并配送', '2020-03-11 15:56:49.000000', '2020-03-11 15:56:49.000000');

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜品编号',
  `numbers` int(11) NULL DEFAULT NULL COMMENT '房间号',
  `customer_id` bigint(20) NULL DEFAULT NULL COMMENT '下单客户',
  `pay_money` double(20, 2) NULL DEFAULT NULL COMMENT '应付款金额',
  `state` int(20) UNSIGNED NULL DEFAULT NULL COMMENT '是否完成付款',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 202002111601580002 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES (527717830, 4, 1, 10013, 18.00, 1, '2020-02-18 02:19:40', '2020-04-25 16:22:42');
INSERT INTO `tb_order` VALUES (752928534, 5, 1, 10013, 28.00, 1, '2020-02-18 01:53:55', '2020-04-25 16:22:42');
INSERT INTO `tb_order` VALUES (1993479495, 5, 1, 10013, 28.00, 1, '2020-02-18 02:19:41', '2020-04-25 16:22:42');
INSERT INTO `tb_order` VALUES (2191864842, 6, 1, 10013, 10.00, 1, '2020-02-18 02:19:42', '2020-04-25 16:22:42');
INSERT INTO `tb_order` VALUES (4552269401, 4, 1, 10050, 18.00, 0, '2020-03-11 15:56:49', '2020-03-11 15:56:49');
INSERT INTO `tb_order` VALUES (5211149954, 4, 1, 10013, 18.00, 1, '2020-02-18 02:32:57', '2020-04-25 16:22:42');
INSERT INTO `tb_order` VALUES (5961008192, 4, 1, 10013, 18.00, 1, '2020-02-18 01:47:10', '2020-04-25 16:22:42');
INSERT INTO `tb_order` VALUES (8717177024, 5, 1, 10013, 28.00, 1, '2020-02-18 01:45:22', '2020-04-25 16:22:42');

-- ----------------------------
-- Table structure for tb_permission
-- ----------------------------
DROP TABLE IF EXISTS `tb_permission`;
CREATE TABLE `tb_permission`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(52) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名称',
  `resource` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性',
  `create_time` datetime(6) NULL DEFAULT NULL,
  `modify_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`resource`) USING BTREE,
  UNIQUE INDEX `权限唯一`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10002 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_permission
-- ----------------------------
INSERT INTO `tb_permission` VALUES (1, '权限管理', 'admin:authorityManagement', '2019-01-29 13:38:49.000000', '2019-01-29 13:38:49.000000');
INSERT INTO `tb_permission` VALUES (2, '角色管理', 'admin:roleManagement', '2019-07-07 19:19:06.000000', '2019-07-07 19:19:08.000000');
INSERT INTO `tb_permission` VALUES (3, '楼层信息', 'staff:FireFigure', '2020-02-17 14:01:03.000000', '2020-02-17 14:01:08.000000');
INSERT INTO `tb_permission` VALUES (5, '物品租赁', 'customer:RentalOfGoods', '2020-02-20 16:27:30.000000', '2020-02-20 16:27:33.000000');
INSERT INTO `tb_permission` VALUES (6, '餐品预订', 'customer:MealReservation', '2020-02-20 16:28:28.000000', '2020-02-20 16:28:31.000000');
INSERT INTO `tb_permission` VALUES (7, '住房服务', 'customer:HousingService', '2020-02-20 16:29:26.000000', '2020-02-20 16:29:29.000000');
INSERT INTO `tb_permission` VALUES (8, '我的房间', 'customer:MyRoom', '2020-02-20 16:30:17.000000', '2020-02-20 16:30:20.000000');
INSERT INTO `tb_permission` VALUES (9, '客房历史订单', 'customer:GuesRoomHistory', '2020-02-20 16:31:08.000000', '2020-02-20 16:31:11.000000');
INSERT INTO `tb_permission` VALUES (10, '餐品历史订单', 'customer:FoodHistoryOrder', '2020-02-20 16:32:28.000000', '2020-02-20 16:32:31.000000');
INSERT INTO `tb_permission` VALUES (11, '房间个性化', 'customer:RoomPersonalization', '2020-02-20 16:33:30.000000', '2020-02-20 16:33:44.000000');
INSERT INTO `tb_permission` VALUES (12, '查看我的租赁', 'customer:ViewLease', '2020-02-20 16:34:28.000000', '2020-02-20 16:34:31.000000');
INSERT INTO `tb_permission` VALUES (13, '设置设备状态', 'customer:DeviceStatus', '2020-02-20 16:35:26.000000', '2020-02-20 16:35:29.000000');
INSERT INTO `tb_permission` VALUES (14, '在线退房', 'customer:CheckOutOnline', '2020-02-20 16:36:32.000000', '2020-02-20 16:36:34.000000');
INSERT INTO `tb_permission` VALUES (15, '评价系统', 'customer:EvaluationSystem', '2020-02-20 16:37:45.000000', '2020-02-20 16:37:48.000000');
INSERT INTO `tb_permission` VALUES (16, '会员系统', 'staff:MembershipSystem', '2020-02-20 16:39:32.000000', '2020-02-20 16:39:34.000000');
INSERT INTO `tb_permission` VALUES (17, '客房订单', 'staff:RoomOrder', '2020-02-20 16:40:12.000000', '2020-02-20 16:40:15.000000');
INSERT INTO `tb_permission` VALUES (18, '餐品配送', 'staff:MealDistribution', '2020-02-20 16:40:55.000000', '2020-02-20 16:40:57.000000');
INSERT INTO `tb_permission` VALUES (19, '餐品订单', 'staff:OrderForFood', '2020-02-20 16:41:34.000000', '2020-02-20 16:41:37.000000');
INSERT INTO `tb_permission` VALUES (20, '商品设置', 'staff:CommoditySetup', '2020-02-20 16:42:16.000000', '2020-02-20 16:42:19.000000');
INSERT INTO `tb_permission` VALUES (21, '房间类别设置', 'staff:RoomTypeSettings', '2020-02-20 16:43:03.000000', '2020-02-20 16:43:06.000000');
INSERT INTO `tb_permission` VALUES (22, '房间物品状态设置', 'staff:ItemStatusSettings', '2020-02-20 16:37:45.000000', '2020-02-20 16:37:48.000000');
INSERT INTO `tb_permission` VALUES (23, '物品设置', 'staff:ItemSetup', '2020-02-20 16:39:32.000000', '2020-02-20 16:39:34.000000');
INSERT INTO `tb_permission` VALUES (24, '菜品设置', 'staff:DishesSetUp', '2020-02-20 16:40:12.000000', '2020-02-20 16:40:15.000000');
INSERT INTO `tb_permission` VALUES (25, '部门管理', 'staff:DepartmentManagement', '2020-02-20 16:40:55.000000', '2020-02-20 16:40:57.000000');
INSERT INTO `tb_permission` VALUES (26, '部门分配', 'staff:DepartmentalDistribution', '2020-02-20 16:41:34.000000', '2020-02-20 16:41:37.000000');
INSERT INTO `tb_permission` VALUES (27, '员工信息', 'staff:EmployeeInformation', '2020-02-20 16:39:32.000000', '2020-02-20 16:42:19.000000');
INSERT INTO `tb_permission` VALUES (28, '客户信息', 'satff:UserInformation', '2020-02-20 20:26:20.000000', '2020-02-20 20:26:24.000000');
INSERT INTO `tb_permission` VALUES (29, '房间设置', 'staff:RoomSettings', '2020-02-20 20:52:35.000000', '2020-02-20 20:52:38.000000');
INSERT INTO `tb_permission` VALUES (30, '客户会员权益', 'customer:ViewVipGrade', '2020-02-20 20:54:19.000000', '2020-02-20 20:54:21.000000');
INSERT INTO `tb_permission` VALUES (31, '会员信息设置', 'staff:MembershipSetup', '2020-02-20 20:55:26.000000', '2020-02-20 20:55:28.000000');
INSERT INTO `tb_permission` VALUES (32, '会员权益设置', 'staff:MembershipVipGradeSetup', '2020-02-20 20:56:12.000000', '2020-02-20 20:56:14.000000');
INSERT INTO `tb_permission` VALUES (33, '角色权限管理', 'admin:RoleJurisdiction', '2020-02-21 15:11:04.000000', '2020-02-21 15:11:06.000000');
INSERT INTO `tb_permission` VALUES (34, '租赁设置', 'staff:LeaseSetUp', '2020-02-22 21:58:24.000000', '2020-02-22 21:58:26.000000');
INSERT INTO `tb_permission` VALUES (35, '房间预订', 'customer:RoomReservation', '2020-02-24 13:07:41.000000', '2020-02-24 13:07:43.000000');
INSERT INTO `tb_permission` VALUES (36, '订单系统', 'staff:RecordSystem', '2020-02-27 18:40:57.000000', '2020-02-27 18:41:00.000000');

-- ----------------------------
-- Table structure for tb_permission_group
-- ----------------------------
DROP TABLE IF EXISTS `tb_permission_group`;
CREATE TABLE `tb_permission_group`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL COMMENT '权限组名',
  `create_time` datetime(6) NULL DEFAULT NULL,
  `modify_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100022 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_permission_group
-- ----------------------------
INSERT INTO `tb_permission_group` VALUES (90000, 'customer', '2020-02-26 22:34:45.000000', '2020-02-26 22:34:47.000000');
INSERT INTO `tb_permission_group` VALUES (90001, 'administrator', '2019-01-29 16:09:51.000000', '2019-01-29 16:09:53.000000');
INSERT INTO `tb_permission_group` VALUES (90002, 'staff', '2020-02-28 11:29:44.000000', '2020-02-28 11:29:44.000000');
INSERT INTO `tb_permission_group` VALUES (90003, 'reception', '2020-02-28 12:51:02.000000', '2020-02-28 12:51:02.000000');
INSERT INTO `tb_permission_group` VALUES (90004, 'security', '2020-02-28 12:48:25.000000', '2020-02-28 12:48:25.000000');

-- ----------------------------
-- Table structure for tb_permission_group_permission
-- ----------------------------
DROP TABLE IF EXISTS `tb_permission_group_permission`;
CREATE TABLE `tb_permission_group_permission`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `permission_group_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '权限组id',
  `permission_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '权限id',
  `create_time` datetime(6) NULL DEFAULT NULL,
  `modify_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_permission_group_id`(`permission_group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100058 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_permission_group_permission
-- ----------------------------
INSERT INTO `tb_permission_group_permission` VALUES (1, 90001, 1, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (50, 90001, 2, '2020-02-17 14:27:52.000000', '2020-02-17 14:27:52.000000');
INSERT INTO `tb_permission_group_permission` VALUES (51, 90001, 3, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (52, 90001, 5, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (53, 90001, 6, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (54, 90001, 7, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (55, 90001, 8, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (56, 90001, 9, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (57, 90001, 10, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (58, 90001, 11, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (59, 90001, 12, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (60, 90001, 13, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (61, 90001, 14, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (62, 90001, 15, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (63, 90001, 16, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (64, 90001, 17, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (65, 90001, 18, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (66, 90001, 19, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (67, 90001, 20, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (68, 90001, 21, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (69, 90001, 22, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (70, 90001, 23, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (71, 90001, 24, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (72, 90001, 25, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (73, 90001, 26, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (74, 90001, 27, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (75, 90001, 28, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (76, 90001, 29, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (77, 90001, 30, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (78, 90001, 31, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (79, 90001, 32, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (80, 90001, 33, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (87, 90001, 34, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (88, 90001, 35, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (106, 90000, 5, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (107, 90000, 6, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (108, 90000, 7, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (109, 90000, 8, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (110, 90000, 9, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (111, 90000, 10, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (112, 90000, 11, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (113, 90000, 12, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (114, 90000, 13, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (115, 90000, 14, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (116, 90000, 15, '2020-01-28 15:57:21.000000', '2020-01-28 15:57:21.000000');
INSERT INTO `tb_permission_group_permission` VALUES (126, 90000, 35, '2020-02-27 18:40:05.000000', '2020-02-27 18:40:07.000000');
INSERT INTO `tb_permission_group_permission` VALUES (131, 90000, 35, '2020-02-27 18:48:55.000000', '2020-02-27 18:48:57.000000');
INSERT INTO `tb_permission_group_permission` VALUES (132, 90001, 36, '2020-02-27 18:49:07.000000', '2020-02-27 18:49:10.000000');
INSERT INTO `tb_permission_group_permission` VALUES (100036, 90004, 3, '2020-02-28 12:48:25.000000', '2020-02-28 12:48:25.000000');
INSERT INTO `tb_permission_group_permission` VALUES (100037, 90003, 3, '2020-02-28 12:51:02.000000', '2020-02-28 12:51:02.000000');
INSERT INTO `tb_permission_group_permission` VALUES (100038, 90003, 5, '2020-02-28 12:51:03.000000', '2020-02-28 12:51:03.000000');
INSERT INTO `tb_permission_group_permission` VALUES (100039, 90003, 6, '2020-02-28 12:51:03.000000', '2020-02-28 12:51:03.000000');
INSERT INTO `tb_permission_group_permission` VALUES (100040, 90003, 7, '2020-02-28 12:51:03.000000', '2020-02-28 12:51:03.000000');
INSERT INTO `tb_permission_group_permission` VALUES (100041, 90003, 16, '2020-02-28 12:51:03.000000', '2020-02-28 12:51:03.000000');
INSERT INTO `tb_permission_group_permission` VALUES (100042, 90003, 17, '2020-02-28 12:51:03.000000', '2020-02-28 12:51:03.000000');
INSERT INTO `tb_permission_group_permission` VALUES (100043, 90003, 18, '2020-02-28 12:51:04.000000', '2020-02-28 12:51:04.000000');
INSERT INTO `tb_permission_group_permission` VALUES (100044, 90003, 19, '2020-02-28 12:51:04.000000', '2020-02-28 12:51:04.000000');
INSERT INTO `tb_permission_group_permission` VALUES (100045, 90003, 20, '2020-02-28 12:51:04.000000', '2020-02-28 12:51:04.000000');
INSERT INTO `tb_permission_group_permission` VALUES (100046, 90003, 21, '2020-02-28 12:51:04.000000', '2020-02-28 12:51:04.000000');
INSERT INTO `tb_permission_group_permission` VALUES (100047, 90003, 22, '2020-02-28 12:51:04.000000', '2020-02-28 12:51:04.000000');
INSERT INTO `tb_permission_group_permission` VALUES (100048, 90003, 23, '2020-02-28 12:51:05.000000', '2020-02-28 12:51:05.000000');
INSERT INTO `tb_permission_group_permission` VALUES (100049, 90003, 24, '2020-02-28 12:51:05.000000', '2020-02-28 12:51:05.000000');
INSERT INTO `tb_permission_group_permission` VALUES (100050, 90003, 28, '2020-02-28 12:51:05.000000', '2020-02-28 12:51:05.000000');
INSERT INTO `tb_permission_group_permission` VALUES (100051, 90003, 29, '2020-02-28 12:51:05.000000', '2020-02-28 12:51:05.000000');
INSERT INTO `tb_permission_group_permission` VALUES (100052, 90003, 30, '2020-02-28 12:51:05.000000', '2020-02-28 12:51:05.000000');
INSERT INTO `tb_permission_group_permission` VALUES (100053, 90003, 31, '2020-02-28 12:51:06.000000', '2020-02-28 12:51:06.000000');
INSERT INTO `tb_permission_group_permission` VALUES (100054, 90003, 32, '2020-02-28 12:51:06.000000', '2020-02-28 12:51:06.000000');
INSERT INTO `tb_permission_group_permission` VALUES (100055, 90003, 34, '2020-02-28 12:51:06.000000', '2020-02-28 12:51:06.000000');
INSERT INTO `tb_permission_group_permission` VALUES (100056, 90003, 35, '2020-02-28 12:51:06.000000', '2020-02-28 12:51:06.000000');
INSERT INTO `tb_permission_group_permission` VALUES (100057, 90003, 36, '2020-02-28 12:51:06.000000', '2020-02-28 12:51:06.000000');

-- ----------------------------
-- Table structure for tb_permission_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_permission_user`;
CREATE TABLE `tb_permission_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `permission_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '权限id',
  `create_time` datetime(6) NULL DEFAULT NULL,
  `modify_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `权限id`(`permission_id`) USING BTREE,
  CONSTRAINT `权限id` FOREIGN KEY (`permission_id`) REFERENCES `tb_permission` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `用户id` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB AUTO_INCREMENT = 667 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_permission_user
-- ----------------------------
INSERT INTO `tb_permission_user` VALUES (338, 10013, 1, '2020-02-05 10:48:23.000000', '2020-02-05 10:48:23.000000');
INSERT INTO `tb_permission_user` VALUES (339, 10013, 2, '2020-02-05 10:48:23.000000', '2020-02-05 10:48:23.000000');
INSERT INTO `tb_permission_user` VALUES (340, 10013, 3, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (342, 10013, 5, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (343, 10013, 6, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (344, 10013, 7, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (345, 10013, 8, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (346, 10013, 9, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (347, 10013, 10, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (348, 10013, 11, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (349, 10013, 12, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (350, 10013, 13, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (351, 10013, 14, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (352, 10013, 15, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (353, 10013, 16, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (354, 10013, 17, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (355, 10013, 18, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (356, 10013, 19, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (357, 10013, 20, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (358, 10013, 21, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (359, 10013, 22, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (360, 10013, 23, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (361, 10013, 24, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (362, 10013, 25, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (363, 10013, 26, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (364, 10013, 27, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (365, 10013, 28, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (366, 10013, 29, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (367, 10013, 30, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (368, 10013, 31, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (369, 10013, 32, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (370, 10023, 16, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (371, 10023, 17, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (372, 10023, 18, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (373, 10023, 19, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (374, 10023, 20, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (375, 10023, 21, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (376, 10023, 22, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (377, 10023, 23, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (378, 10023, 24, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (379, 10023, 25, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (380, 10023, 26, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (381, 10023, 27, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (382, 10023, 3, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (384, 10035, 5, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (385, 10035, 6, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (386, 10035, 7, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (387, 10035, 8, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (388, 10035, 9, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (389, 10035, 10, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (390, 10035, 11, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (391, 10035, 12, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (392, 10035, 13, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (393, 10035, 14, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (394, 10035, 15, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (395, 10023, 28, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (396, 10023, 29, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (397, 10035, 30, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (398, 10023, 31, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (399, 10023, 32, '2020-02-17 14:04:21.000000', '2020-02-17 14:04:21.000000');
INSERT INTO `tb_permission_user` VALUES (400, 10013, 35, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (405, 10013, 34, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (406, 10014, 1, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (407, 10014, 2, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (408, 10014, 3, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (409, 10014, 5, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (410, 10014, 6, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (411, 10014, 7, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (412, 10014, 8, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (413, 10014, 9, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (414, 10014, 10, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (415, 10014, 11, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (416, 10014, 12, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (417, 10014, 13, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (418, 10014, 14, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (419, 10014, 15, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (420, 10014, 16, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (421, 10014, 17, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (422, 10014, 18, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (423, 10014, 19, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (424, 10014, 20, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (425, 10014, 21, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (426, 10014, 22, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (427, 10014, 23, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (428, 10014, 24, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (429, 10014, 25, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (430, 10014, 26, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (431, 10014, 27, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (432, 10014, 28, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (433, 10014, 29, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (434, 10014, 31, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (435, 10014, 32, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (436, 10014, 33, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (437, 10014, 34, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (438, 10014, 35, '2020-02-24 13:08:18.000000', '2020-02-24 13:08:20.000000');
INSERT INTO `tb_permission_user` VALUES (451, 10013, 33, '2020-02-26 22:49:47.000000', '2020-02-26 22:49:47.000000');
INSERT INTO `tb_permission_user` VALUES (459, NULL, 1, '2020-02-27 00:37:30.000000', '2020-02-27 00:37:30.000000');
INSERT INTO `tb_permission_user` VALUES (460, NULL, 2, '2020-02-27 00:37:30.000000', '2020-02-27 00:37:30.000000');
INSERT INTO `tb_permission_user` VALUES (461, NULL, 3, '2020-02-27 00:37:30.000000', '2020-02-27 00:37:30.000000');
INSERT INTO `tb_permission_user` VALUES (462, NULL, 5, '2020-02-27 00:37:30.000000', '2020-02-27 00:37:30.000000');
INSERT INTO `tb_permission_user` VALUES (463, NULL, 6, '2020-02-27 00:37:31.000000', '2020-02-27 00:37:31.000000');
INSERT INTO `tb_permission_user` VALUES (464, NULL, 7, '2020-02-27 00:37:31.000000', '2020-02-27 00:37:31.000000');
INSERT INTO `tb_permission_user` VALUES (465, NULL, 8, '2020-02-27 00:37:31.000000', '2020-02-27 00:37:31.000000');
INSERT INTO `tb_permission_user` VALUES (466, NULL, 9, '2020-02-27 00:37:31.000000', '2020-02-27 00:37:31.000000');
INSERT INTO `tb_permission_user` VALUES (467, NULL, 10, '2020-02-27 00:37:31.000000', '2020-02-27 00:37:31.000000');
INSERT INTO `tb_permission_user` VALUES (468, NULL, 11, '2020-02-27 00:37:31.000000', '2020-02-27 00:37:31.000000');
INSERT INTO `tb_permission_user` VALUES (469, NULL, 12, '2020-02-27 00:37:32.000000', '2020-02-27 00:37:32.000000');
INSERT INTO `tb_permission_user` VALUES (470, NULL, 13, '2020-02-27 00:37:32.000000', '2020-02-27 00:37:32.000000');
INSERT INTO `tb_permission_user` VALUES (471, NULL, 14, '2020-02-27 00:37:32.000000', '2020-02-27 00:37:32.000000');
INSERT INTO `tb_permission_user` VALUES (472, NULL, 15, '2020-02-27 00:37:32.000000', '2020-02-27 00:37:32.000000');
INSERT INTO `tb_permission_user` VALUES (473, NULL, 16, '2020-02-27 00:37:32.000000', '2020-02-27 00:37:32.000000');
INSERT INTO `tb_permission_user` VALUES (474, NULL, 17, '2020-02-27 00:37:32.000000', '2020-02-27 00:37:32.000000');
INSERT INTO `tb_permission_user` VALUES (475, NULL, 18, '2020-02-27 00:37:33.000000', '2020-02-27 00:37:33.000000');
INSERT INTO `tb_permission_user` VALUES (476, NULL, 19, '2020-02-27 00:37:33.000000', '2020-02-27 00:37:33.000000');
INSERT INTO `tb_permission_user` VALUES (477, NULL, 20, '2020-02-27 00:37:33.000000', '2020-02-27 00:37:33.000000');
INSERT INTO `tb_permission_user` VALUES (478, NULL, 21, '2020-02-27 00:37:33.000000', '2020-02-27 00:37:33.000000');
INSERT INTO `tb_permission_user` VALUES (479, NULL, 22, '2020-02-27 00:37:33.000000', '2020-02-27 00:37:33.000000');
INSERT INTO `tb_permission_user` VALUES (480, NULL, 23, '2020-02-27 00:37:33.000000', '2020-02-27 00:37:33.000000');
INSERT INTO `tb_permission_user` VALUES (481, NULL, 24, '2020-02-27 00:37:33.000000', '2020-02-27 00:37:33.000000');
INSERT INTO `tb_permission_user` VALUES (482, NULL, 25, '2020-02-27 00:37:34.000000', '2020-02-27 00:37:34.000000');
INSERT INTO `tb_permission_user` VALUES (483, NULL, 26, '2020-02-27 00:37:34.000000', '2020-02-27 00:37:34.000000');
INSERT INTO `tb_permission_user` VALUES (484, NULL, 27, '2020-02-27 00:37:34.000000', '2020-02-27 00:37:34.000000');
INSERT INTO `tb_permission_user` VALUES (485, NULL, 28, '2020-02-27 00:37:34.000000', '2020-02-27 00:37:34.000000');
INSERT INTO `tb_permission_user` VALUES (486, NULL, 29, '2020-02-27 00:37:34.000000', '2020-02-27 00:37:34.000000');
INSERT INTO `tb_permission_user` VALUES (487, NULL, 30, '2020-02-27 00:37:34.000000', '2020-02-27 00:37:34.000000');
INSERT INTO `tb_permission_user` VALUES (488, NULL, 31, '2020-02-27 00:37:35.000000', '2020-02-27 00:37:35.000000');
INSERT INTO `tb_permission_user` VALUES (489, NULL, 32, '2020-02-27 00:37:35.000000', '2020-02-27 00:37:35.000000');
INSERT INTO `tb_permission_user` VALUES (490, NULL, 33, '2020-02-27 00:37:35.000000', '2020-02-27 00:37:35.000000');
INSERT INTO `tb_permission_user` VALUES (491, NULL, 34, '2020-02-27 00:37:35.000000', '2020-02-27 00:37:35.000000');
INSERT INTO `tb_permission_user` VALUES (492, NULL, 35, '2020-02-27 00:37:36.000000', '2020-02-27 00:37:36.000000');
INSERT INTO `tb_permission_user` VALUES (493, 10050, 5, '2020-02-27 17:55:55.000000', '2020-02-27 17:55:55.000000');
INSERT INTO `tb_permission_user` VALUES (494, 10050, 6, '2020-02-27 17:55:55.000000', '2020-02-27 17:55:55.000000');
INSERT INTO `tb_permission_user` VALUES (495, 10050, 7, '2020-02-27 17:55:55.000000', '2020-02-27 17:55:55.000000');
INSERT INTO `tb_permission_user` VALUES (496, 10050, 8, '2020-02-27 17:55:55.000000', '2020-02-27 17:55:55.000000');
INSERT INTO `tb_permission_user` VALUES (497, 10050, 9, '2020-02-27 17:55:56.000000', '2020-02-27 17:55:56.000000');
INSERT INTO `tb_permission_user` VALUES (498, 10050, 10, '2020-02-27 17:55:56.000000', '2020-02-27 17:55:56.000000');
INSERT INTO `tb_permission_user` VALUES (499, 10050, 11, '2020-02-27 17:55:56.000000', '2020-02-27 17:55:56.000000');
INSERT INTO `tb_permission_user` VALUES (500, 10050, 12, '2020-02-27 17:55:56.000000', '2020-02-27 17:55:56.000000');
INSERT INTO `tb_permission_user` VALUES (501, 10050, 13, '2020-02-27 17:55:56.000000', '2020-02-27 17:55:56.000000');
INSERT INTO `tb_permission_user` VALUES (502, 10050, 14, '2020-02-27 17:55:56.000000', '2020-02-27 17:55:56.000000');
INSERT INTO `tb_permission_user` VALUES (503, 10050, 15, '2020-02-27 17:55:56.000000', '2020-02-27 17:55:56.000000');
INSERT INTO `tb_permission_user` VALUES (504, 10051, 16, '2020-02-27 18:42:44.000000', '2020-02-27 18:42:44.000000');
INSERT INTO `tb_permission_user` VALUES (505, 10051, 17, '2020-02-27 18:42:44.000000', '2020-02-27 18:42:44.000000');
INSERT INTO `tb_permission_user` VALUES (506, 10051, 18, '2020-02-27 18:42:45.000000', '2020-02-27 18:42:45.000000');
INSERT INTO `tb_permission_user` VALUES (507, 10051, 19, '2020-02-27 18:42:45.000000', '2020-02-27 18:42:45.000000');
INSERT INTO `tb_permission_user` VALUES (508, 10051, 20, '2020-02-27 18:42:45.000000', '2020-02-27 18:42:45.000000');
INSERT INTO `tb_permission_user` VALUES (509, 10051, 21, '2020-02-27 18:42:46.000000', '2020-02-27 18:42:46.000000');
INSERT INTO `tb_permission_user` VALUES (510, 10051, 22, '2020-02-27 18:42:46.000000', '2020-02-27 18:42:46.000000');
INSERT INTO `tb_permission_user` VALUES (511, 10051, 23, '2020-02-27 18:42:46.000000', '2020-02-27 18:42:46.000000');
INSERT INTO `tb_permission_user` VALUES (512, 10051, 24, '2020-02-27 18:42:47.000000', '2020-02-27 18:42:47.000000');
INSERT INTO `tb_permission_user` VALUES (513, 10051, 25, '2020-02-27 18:42:47.000000', '2020-02-27 18:42:47.000000');
INSERT INTO `tb_permission_user` VALUES (514, 10051, 26, '2020-02-27 18:42:47.000000', '2020-02-27 18:42:47.000000');
INSERT INTO `tb_permission_user` VALUES (515, 10051, 27, '2020-02-27 18:42:47.000000', '2020-02-27 18:42:47.000000');
INSERT INTO `tb_permission_user` VALUES (516, 10051, 3, '2020-02-27 18:42:47.000000', '2020-02-27 18:42:47.000000');
INSERT INTO `tb_permission_user` VALUES (517, 10051, 28, '2020-02-27 18:42:47.000000', '2020-02-27 18:42:47.000000');
INSERT INTO `tb_permission_user` VALUES (518, 10051, 29, '2020-02-27 18:42:47.000000', '2020-02-27 18:42:47.000000');
INSERT INTO `tb_permission_user` VALUES (519, 10051, 30, '2020-02-27 18:42:47.000000', '2020-02-27 18:42:47.000000');
INSERT INTO `tb_permission_user` VALUES (520, 10050, 35, '2020-02-27 18:47:36.000000', '2020-02-27 18:47:37.000000');
INSERT INTO `tb_permission_user` VALUES (521, 10051, 31, '2020-02-27 18:50:58.000000', '2020-02-27 18:50:59.000000');
INSERT INTO `tb_permission_user` VALUES (522, 10051, 32, '2020-02-27 18:51:02.000000', '2020-02-27 18:51:04.000000');
INSERT INTO `tb_permission_user` VALUES (523, 10051, 34, '2020-02-27 18:51:07.000000', '2020-02-27 18:51:08.000000');
INSERT INTO `tb_permission_user` VALUES (524, 10051, 36, '2020-02-27 18:51:10.000000', '2020-02-27 18:51:12.000000');
INSERT INTO `tb_permission_user` VALUES (525, 10052, 16, '2020-02-27 18:54:37.000000', '2020-02-27 18:54:37.000000');
INSERT INTO `tb_permission_user` VALUES (526, 10052, 17, '2020-02-27 18:54:37.000000', '2020-02-27 18:54:37.000000');
INSERT INTO `tb_permission_user` VALUES (527, 10052, 18, '2020-02-27 18:54:37.000000', '2020-02-27 18:54:37.000000');
INSERT INTO `tb_permission_user` VALUES (528, 10052, 19, '2020-02-27 18:54:37.000000', '2020-02-27 18:54:37.000000');
INSERT INTO `tb_permission_user` VALUES (529, 10052, 20, '2020-02-27 18:54:37.000000', '2020-02-27 18:54:37.000000');
INSERT INTO `tb_permission_user` VALUES (530, 10052, 21, '2020-02-27 18:54:37.000000', '2020-02-27 18:54:37.000000');
INSERT INTO `tb_permission_user` VALUES (531, 10052, 22, '2020-02-27 18:54:37.000000', '2020-02-27 18:54:37.000000');
INSERT INTO `tb_permission_user` VALUES (532, 10052, 23, '2020-02-27 18:54:37.000000', '2020-02-27 18:54:37.000000');
INSERT INTO `tb_permission_user` VALUES (533, 10052, 24, '2020-02-27 18:54:37.000000', '2020-02-27 18:54:37.000000');
INSERT INTO `tb_permission_user` VALUES (534, 10052, 25, '2020-02-27 18:54:38.000000', '2020-02-27 18:54:38.000000');
INSERT INTO `tb_permission_user` VALUES (535, 10052, 26, '2020-02-27 18:54:38.000000', '2020-02-27 18:54:38.000000');
INSERT INTO `tb_permission_user` VALUES (536, 10052, 27, '2020-02-27 18:54:38.000000', '2020-02-27 18:54:38.000000');
INSERT INTO `tb_permission_user` VALUES (537, 10052, 3, '2020-02-27 18:54:38.000000', '2020-02-27 18:54:38.000000');
INSERT INTO `tb_permission_user` VALUES (538, 10052, 28, '2020-02-27 18:54:38.000000', '2020-02-27 18:54:38.000000');
INSERT INTO `tb_permission_user` VALUES (539, 10052, 29, '2020-02-27 18:54:38.000000', '2020-02-27 18:54:38.000000');
INSERT INTO `tb_permission_user` VALUES (540, 10052, 30, '2020-02-27 18:54:38.000000', '2020-02-27 18:54:38.000000');
INSERT INTO `tb_permission_user` VALUES (541, 10052, 31, '2020-02-27 18:54:38.000000', '2020-02-27 18:54:38.000000');
INSERT INTO `tb_permission_user` VALUES (542, 10052, 32, '2020-02-27 18:54:38.000000', '2020-02-27 18:54:38.000000');
INSERT INTO `tb_permission_user` VALUES (543, 10052, 34, '2020-02-27 18:54:38.000000', '2020-02-27 18:54:38.000000');
INSERT INTO `tb_permission_user` VALUES (544, 10052, 36, '2020-02-27 18:54:38.000000', '2020-02-27 18:54:38.000000');
INSERT INTO `tb_permission_user` VALUES (545, 10053, 5, '2020-02-27 18:57:36.000000', '2020-02-27 18:57:36.000000');
INSERT INTO `tb_permission_user` VALUES (546, 10053, 6, '2020-02-27 18:57:36.000000', '2020-02-27 18:57:36.000000');
INSERT INTO `tb_permission_user` VALUES (547, 10053, 7, '2020-02-27 18:57:36.000000', '2020-02-27 18:57:36.000000');
INSERT INTO `tb_permission_user` VALUES (548, 10053, 8, '2020-02-27 18:57:36.000000', '2020-02-27 18:57:36.000000');
INSERT INTO `tb_permission_user` VALUES (549, 10053, 9, '2020-02-27 18:57:36.000000', '2020-02-27 18:57:36.000000');
INSERT INTO `tb_permission_user` VALUES (550, 10053, 10, '2020-02-27 18:57:36.000000', '2020-02-27 18:57:36.000000');
INSERT INTO `tb_permission_user` VALUES (551, 10053, 11, '2020-02-27 18:57:36.000000', '2020-02-27 18:57:36.000000');
INSERT INTO `tb_permission_user` VALUES (552, 10053, 12, '2020-02-27 18:57:36.000000', '2020-02-27 18:57:36.000000');
INSERT INTO `tb_permission_user` VALUES (553, 10053, 13, '2020-02-27 18:57:36.000000', '2020-02-27 18:57:36.000000');
INSERT INTO `tb_permission_user` VALUES (554, 10053, 14, '2020-02-27 18:57:36.000000', '2020-02-27 18:57:36.000000');
INSERT INTO `tb_permission_user` VALUES (555, 10053, 15, '2020-02-27 18:57:37.000000', '2020-02-27 18:57:37.000000');
INSERT INTO `tb_permission_user` VALUES (556, 10053, 35, '2020-02-27 18:57:37.000000', '2020-02-27 18:57:37.000000');
INSERT INTO `tb_permission_user` VALUES (557, 10053, 35, '2020-02-27 18:57:37.000000', '2020-02-27 18:57:37.000000');
INSERT INTO `tb_permission_user` VALUES (558, 10013, 36, '2020-02-28 12:59:13.000000', '2020-02-28 12:59:15.000000');
INSERT INTO `tb_permission_user` VALUES (559, 10055, 1, '2020-02-28 13:04:57.000000', '2020-02-28 13:04:57.000000');
INSERT INTO `tb_permission_user` VALUES (560, 10055, 2, '2020-02-28 13:04:57.000000', '2020-02-28 13:04:57.000000');
INSERT INTO `tb_permission_user` VALUES (561, 10055, 3, '2020-02-28 13:04:57.000000', '2020-02-28 13:04:57.000000');
INSERT INTO `tb_permission_user` VALUES (562, 10055, 5, '2020-02-28 13:04:57.000000', '2020-02-28 13:04:57.000000');
INSERT INTO `tb_permission_user` VALUES (563, 10055, 6, '2020-02-28 13:04:57.000000', '2020-02-28 13:04:57.000000');
INSERT INTO `tb_permission_user` VALUES (564, 10055, 7, '2020-02-28 13:04:57.000000', '2020-02-28 13:04:57.000000');
INSERT INTO `tb_permission_user` VALUES (565, 10055, 8, '2020-02-28 13:04:58.000000', '2020-02-28 13:04:58.000000');
INSERT INTO `tb_permission_user` VALUES (566, 10055, 9, '2020-02-28 13:04:58.000000', '2020-02-28 13:04:58.000000');
INSERT INTO `tb_permission_user` VALUES (567, 10055, 10, '2020-02-28 13:04:58.000000', '2020-02-28 13:04:58.000000');
INSERT INTO `tb_permission_user` VALUES (568, 10055, 11, '2020-02-28 13:04:58.000000', '2020-02-28 13:04:58.000000');
INSERT INTO `tb_permission_user` VALUES (569, 10055, 12, '2020-02-28 13:04:58.000000', '2020-02-28 13:04:58.000000');
INSERT INTO `tb_permission_user` VALUES (570, 10055, 13, '2020-02-28 13:04:58.000000', '2020-02-28 13:04:58.000000');
INSERT INTO `tb_permission_user` VALUES (571, 10055, 14, '2020-02-28 13:04:58.000000', '2020-02-28 13:04:58.000000');
INSERT INTO `tb_permission_user` VALUES (572, 10055, 15, '2020-02-28 13:04:59.000000', '2020-02-28 13:04:59.000000');
INSERT INTO `tb_permission_user` VALUES (573, 10055, 16, '2020-02-28 13:04:59.000000', '2020-02-28 13:04:59.000000');
INSERT INTO `tb_permission_user` VALUES (574, 10055, 17, '2020-02-28 13:04:59.000000', '2020-02-28 13:04:59.000000');
INSERT INTO `tb_permission_user` VALUES (575, 10055, 18, '2020-02-28 13:04:59.000000', '2020-02-28 13:04:59.000000');
INSERT INTO `tb_permission_user` VALUES (576, 10055, 19, '2020-02-28 13:04:59.000000', '2020-02-28 13:04:59.000000');
INSERT INTO `tb_permission_user` VALUES (577, 10055, 20, '2020-02-28 13:04:59.000000', '2020-02-28 13:04:59.000000');
INSERT INTO `tb_permission_user` VALUES (578, 10055, 21, '2020-02-28 13:05:00.000000', '2020-02-28 13:05:00.000000');
INSERT INTO `tb_permission_user` VALUES (579, 10055, 22, '2020-02-28 13:05:00.000000', '2020-02-28 13:05:00.000000');
INSERT INTO `tb_permission_user` VALUES (580, 10055, 23, '2020-02-28 13:05:00.000000', '2020-02-28 13:05:00.000000');
INSERT INTO `tb_permission_user` VALUES (581, 10055, 24, '2020-02-28 13:05:00.000000', '2020-02-28 13:05:00.000000');
INSERT INTO `tb_permission_user` VALUES (582, 10055, 25, '2020-02-28 13:05:00.000000', '2020-02-28 13:05:00.000000');
INSERT INTO `tb_permission_user` VALUES (583, 10055, 26, '2020-02-28 13:05:00.000000', '2020-02-28 13:05:00.000000');
INSERT INTO `tb_permission_user` VALUES (584, 10055, 27, '2020-02-28 13:05:00.000000', '2020-02-28 13:05:00.000000');
INSERT INTO `tb_permission_user` VALUES (585, 10055, 28, '2020-02-28 13:05:01.000000', '2020-02-28 13:05:01.000000');
INSERT INTO `tb_permission_user` VALUES (586, 10055, 29, '2020-02-28 13:05:01.000000', '2020-02-28 13:05:01.000000');
INSERT INTO `tb_permission_user` VALUES (587, 10055, 30, '2020-02-28 13:05:01.000000', '2020-02-28 13:05:01.000000');
INSERT INTO `tb_permission_user` VALUES (588, 10055, 31, '2020-02-28 13:05:01.000000', '2020-02-28 13:05:01.000000');
INSERT INTO `tb_permission_user` VALUES (589, 10055, 32, '2020-02-28 13:05:01.000000', '2020-02-28 13:05:01.000000');
INSERT INTO `tb_permission_user` VALUES (590, 10055, 33, '2020-02-28 13:05:01.000000', '2020-02-28 13:05:01.000000');
INSERT INTO `tb_permission_user` VALUES (591, 10055, 34, '2020-02-28 13:05:02.000000', '2020-02-28 13:05:02.000000');
INSERT INTO `tb_permission_user` VALUES (592, 10055, 35, '2020-02-28 13:05:02.000000', '2020-02-28 13:05:02.000000');
INSERT INTO `tb_permission_user` VALUES (593, 10055, 36, '2020-02-28 13:05:02.000000', '2020-02-28 13:05:02.000000');
INSERT INTO `tb_permission_user` VALUES (594, 10056, 5, '2020-03-01 14:03:41.000000', '2020-03-01 14:03:41.000000');
INSERT INTO `tb_permission_user` VALUES (595, 10056, 6, '2020-03-01 14:03:42.000000', '2020-03-01 14:03:42.000000');
INSERT INTO `tb_permission_user` VALUES (596, 10056, 7, '2020-03-01 14:03:42.000000', '2020-03-01 14:03:42.000000');
INSERT INTO `tb_permission_user` VALUES (597, 10056, 8, '2020-03-01 14:03:42.000000', '2020-03-01 14:03:42.000000');
INSERT INTO `tb_permission_user` VALUES (598, 10056, 9, '2020-03-01 14:03:42.000000', '2020-03-01 14:03:42.000000');
INSERT INTO `tb_permission_user` VALUES (599, 10056, 10, '2020-03-01 14:03:42.000000', '2020-03-01 14:03:42.000000');
INSERT INTO `tb_permission_user` VALUES (600, 10056, 11, '2020-03-01 14:03:43.000000', '2020-03-01 14:03:43.000000');
INSERT INTO `tb_permission_user` VALUES (601, 10056, 12, '2020-03-01 14:03:43.000000', '2020-03-01 14:03:43.000000');
INSERT INTO `tb_permission_user` VALUES (602, 10056, 13, '2020-03-01 14:03:43.000000', '2020-03-01 14:03:43.000000');
INSERT INTO `tb_permission_user` VALUES (603, 10056, 14, '2020-03-01 14:03:43.000000', '2020-03-01 14:03:43.000000');
INSERT INTO `tb_permission_user` VALUES (604, 10056, 15, '2020-03-01 14:03:43.000000', '2020-03-01 14:03:43.000000');
INSERT INTO `tb_permission_user` VALUES (605, 10056, 35, '2020-03-01 14:03:43.000000', '2020-03-01 14:03:43.000000');
INSERT INTO `tb_permission_user` VALUES (606, 10056, 35, '2020-03-01 14:03:44.000000', '2020-03-01 14:03:44.000000');
INSERT INTO `tb_permission_user` VALUES (607, 10058, 5, '2020-03-01 14:08:50.000000', '2020-03-01 14:08:50.000000');
INSERT INTO `tb_permission_user` VALUES (608, 10058, 6, '2020-03-01 14:08:50.000000', '2020-03-01 14:08:50.000000');
INSERT INTO `tb_permission_user` VALUES (609, 10058, 7, '2020-03-01 14:08:50.000000', '2020-03-01 14:08:50.000000');
INSERT INTO `tb_permission_user` VALUES (610, 10058, 8, '2020-03-01 14:08:50.000000', '2020-03-01 14:08:50.000000');
INSERT INTO `tb_permission_user` VALUES (611, 10058, 9, '2020-03-01 14:08:50.000000', '2020-03-01 14:08:50.000000');
INSERT INTO `tb_permission_user` VALUES (612, 10058, 10, '2020-03-01 14:08:50.000000', '2020-03-01 14:08:50.000000');
INSERT INTO `tb_permission_user` VALUES (613, 10058, 11, '2020-03-01 14:08:51.000000', '2020-03-01 14:08:51.000000');
INSERT INTO `tb_permission_user` VALUES (614, 10058, 12, '2020-03-01 14:08:51.000000', '2020-03-01 14:08:51.000000');
INSERT INTO `tb_permission_user` VALUES (615, 10058, 13, '2020-03-01 14:08:51.000000', '2020-03-01 14:08:51.000000');
INSERT INTO `tb_permission_user` VALUES (616, 10058, 14, '2020-03-01 14:08:51.000000', '2020-03-01 14:08:51.000000');
INSERT INTO `tb_permission_user` VALUES (617, 10058, 15, '2020-03-01 14:08:51.000000', '2020-03-01 14:08:51.000000');
INSERT INTO `tb_permission_user` VALUES (618, 10058, 35, '2020-03-01 14:08:51.000000', '2020-03-01 14:08:51.000000');
INSERT INTO `tb_permission_user` VALUES (619, 10058, 35, '2020-03-01 14:08:52.000000', '2020-03-01 14:08:52.000000');
INSERT INTO `tb_permission_user` VALUES (620, 10037, 5, '2020-03-10 18:11:54.000000', '2020-03-10 18:11:54.000000');
INSERT INTO `tb_permission_user` VALUES (621, 10037, 6, '2020-03-10 18:11:55.000000', '2020-03-10 18:11:55.000000');
INSERT INTO `tb_permission_user` VALUES (622, 10037, 7, '2020-03-10 18:11:55.000000', '2020-03-10 18:11:55.000000');
INSERT INTO `tb_permission_user` VALUES (623, 10037, 8, '2020-03-10 18:11:55.000000', '2020-03-10 18:11:55.000000');
INSERT INTO `tb_permission_user` VALUES (624, 10037, 9, '2020-03-10 18:11:55.000000', '2020-03-10 18:11:55.000000');
INSERT INTO `tb_permission_user` VALUES (625, 10037, 10, '2020-03-10 18:11:56.000000', '2020-03-10 18:11:56.000000');
INSERT INTO `tb_permission_user` VALUES (626, 10037, 11, '2020-03-10 18:11:56.000000', '2020-03-10 18:11:56.000000');
INSERT INTO `tb_permission_user` VALUES (627, 10037, 12, '2020-03-10 18:11:56.000000', '2020-03-10 18:11:56.000000');
INSERT INTO `tb_permission_user` VALUES (628, 10037, 13, '2020-03-10 18:11:56.000000', '2020-03-10 18:11:56.000000');
INSERT INTO `tb_permission_user` VALUES (629, 10037, 14, '2020-03-10 18:11:56.000000', '2020-03-10 18:11:56.000000');
INSERT INTO `tb_permission_user` VALUES (630, 10037, 15, '2020-03-10 18:11:56.000000', '2020-03-10 18:11:56.000000');
INSERT INTO `tb_permission_user` VALUES (631, 10037, 35, '2020-03-10 18:11:56.000000', '2020-03-10 18:11:56.000000');
INSERT INTO `tb_permission_user` VALUES (632, 10037, 35, '2020-03-10 18:11:56.000000', '2020-03-10 18:11:56.000000');
INSERT INTO `tb_permission_user` VALUES (633, 10059, 3, '2020-03-10 18:18:26.000000', '2020-03-10 18:18:26.000000');
INSERT INTO `tb_permission_user` VALUES (634, 10059, 5, '2020-03-10 18:18:26.000000', '2020-03-10 18:18:26.000000');
INSERT INTO `tb_permission_user` VALUES (635, 10059, 6, '2020-03-10 18:18:26.000000', '2020-03-10 18:18:26.000000');
INSERT INTO `tb_permission_user` VALUES (636, 10059, 7, '2020-03-10 18:18:26.000000', '2020-03-10 18:18:26.000000');
INSERT INTO `tb_permission_user` VALUES (637, 10059, 16, '2020-03-10 18:18:26.000000', '2020-03-10 18:18:26.000000');
INSERT INTO `tb_permission_user` VALUES (638, 10059, 17, '2020-03-10 18:18:26.000000', '2020-03-10 18:18:26.000000');
INSERT INTO `tb_permission_user` VALUES (639, 10059, 18, '2020-03-10 18:18:26.000000', '2020-03-10 18:18:26.000000');
INSERT INTO `tb_permission_user` VALUES (640, 10059, 19, '2020-03-10 18:18:26.000000', '2020-03-10 18:18:26.000000');
INSERT INTO `tb_permission_user` VALUES (641, 10059, 20, '2020-03-10 18:18:26.000000', '2020-03-10 18:18:26.000000');
INSERT INTO `tb_permission_user` VALUES (642, 10059, 21, '2020-03-10 18:18:26.000000', '2020-03-10 18:18:26.000000');
INSERT INTO `tb_permission_user` VALUES (643, 10059, 22, '2020-03-10 18:18:26.000000', '2020-03-10 18:18:26.000000');
INSERT INTO `tb_permission_user` VALUES (644, 10059, 23, '2020-03-10 18:18:26.000000', '2020-03-10 18:18:26.000000');
INSERT INTO `tb_permission_user` VALUES (645, 10059, 24, '2020-03-10 18:18:26.000000', '2020-03-10 18:18:26.000000');
INSERT INTO `tb_permission_user` VALUES (646, 10059, 28, '2020-03-10 18:18:27.000000', '2020-03-10 18:18:27.000000');
INSERT INTO `tb_permission_user` VALUES (647, 10059, 29, '2020-03-10 18:18:27.000000', '2020-03-10 18:18:27.000000');
INSERT INTO `tb_permission_user` VALUES (648, 10059, 30, '2020-03-10 18:18:27.000000', '2020-03-10 18:18:27.000000');
INSERT INTO `tb_permission_user` VALUES (649, 10059, 31, '2020-03-10 18:18:27.000000', '2020-03-10 18:18:27.000000');
INSERT INTO `tb_permission_user` VALUES (650, 10059, 32, '2020-03-10 18:18:27.000000', '2020-03-10 18:18:27.000000');
INSERT INTO `tb_permission_user` VALUES (651, 10059, 34, '2020-03-10 18:18:27.000000', '2020-03-10 18:18:27.000000');
INSERT INTO `tb_permission_user` VALUES (652, 10059, 35, '2020-03-10 18:18:27.000000', '2020-03-10 18:18:27.000000');
INSERT INTO `tb_permission_user` VALUES (653, 10059, 36, '2020-03-10 18:18:27.000000', '2020-03-10 18:18:27.000000');
INSERT INTO `tb_permission_user` VALUES (654, 10060, 5, '2020-04-23 12:06:29.000000', '2020-04-23 12:06:29.000000');
INSERT INTO `tb_permission_user` VALUES (655, 10060, 6, '2020-04-23 12:06:29.000000', '2020-04-23 12:06:29.000000');
INSERT INTO `tb_permission_user` VALUES (656, 10060, 7, '2020-04-23 12:06:29.000000', '2020-04-23 12:06:29.000000');
INSERT INTO `tb_permission_user` VALUES (657, 10060, 8, '2020-04-23 12:06:29.000000', '2020-04-23 12:06:29.000000');
INSERT INTO `tb_permission_user` VALUES (658, 10060, 9, '2020-04-23 12:06:29.000000', '2020-04-23 12:06:29.000000');
INSERT INTO `tb_permission_user` VALUES (659, 10060, 10, '2020-04-23 12:06:29.000000', '2020-04-23 12:06:29.000000');
INSERT INTO `tb_permission_user` VALUES (660, 10060, 11, '2020-04-23 12:06:30.000000', '2020-04-23 12:06:30.000000');
INSERT INTO `tb_permission_user` VALUES (661, 10060, 12, '2020-04-23 12:06:30.000000', '2020-04-23 12:06:30.000000');
INSERT INTO `tb_permission_user` VALUES (662, 10060, 13, '2020-04-23 12:06:30.000000', '2020-04-23 12:06:30.000000');
INSERT INTO `tb_permission_user` VALUES (663, 10060, 14, '2020-04-23 12:06:30.000000', '2020-04-23 12:06:30.000000');
INSERT INTO `tb_permission_user` VALUES (664, 10060, 15, '2020-04-23 12:06:30.000000', '2020-04-23 12:06:30.000000');
INSERT INTO `tb_permission_user` VALUES (665, 10060, 35, '2020-04-23 12:06:30.000000', '2020-04-23 12:06:30.000000');
INSERT INTO `tb_permission_user` VALUES (666, 10060, 35, '2020-04-23 12:06:30.000000', '2020-04-23 12:06:30.000000');

-- ----------------------------
-- Table structure for tb_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_record`;
CREATE TABLE `tb_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room_number` int(20) NULL DEFAULT NULL COMMENT '预定房间',
  `customer_id` bigint(20) NULL DEFAULT NULL COMMENT '下单客户',
  `staff_id` bigint(20) NULL DEFAULT NULL COMMENT '处理员工,线上为null',
  `pay_money` double(255, 2) NULL DEFAULT NULL COMMENT '实际付款金额',
  `state` int(20) UNSIGNED NULL DEFAULT NULL COMMENT '是否付款',
  `record_checkintime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入住时间',
  `record_checkouttime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退房时间',
  `pre_checkintime` varbinary(255) NULL DEFAULT NULL COMMENT '预计入住时间',
  `record_evaluate` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_3`(`room_number`) USING BTREE,
  INDEX `FK_Reference_4`(`customer_id`) USING BTREE,
  INDEX `FK_Reference_7`(`staff_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 202002121443070003 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_record
-- ----------------------------
INSERT INTO `tb_record` VALUES (95003, 111, 10013, 95055, 336.55, NULL, '2020-05-02', '2020-06-03', 0x39, '', '2020-02-12 15:33:21', '2020-02-26 22:52:40');
INSERT INTO `tb_record` VALUES (11268461506, 111, 10014, 0, 0.00, 1, '2020-02-26', '2020-05-20', 0x32, NULL, '2020-02-26 23:35:37', '2020-02-26 23:35:37');
INSERT INTO `tb_record` VALUES (20918121203, 111, 10050, 0, 311.65, 1, '2020-02-26', '2020-05-20', 0x31, NULL, '2020-02-26 22:11:15', '2020-02-26 22:13:22');
INSERT INTO `tb_record` VALUES (40208614336, 102, 10026, 95011, 311.65, 1, '2019-11-1', '2019-11-2', 0x31, '舒适', '2020-02-07 14:40:22', '2020-02-19 16:25:02');
INSERT INTO `tb_record` VALUES (40208616336, 111, 10013, 95011, 311.65, 1, '2020-02-17', '2020-05-20', 0x33, '酒店环境整洁,房间布局堪称完美,优雅又不失情调,服务周到,让人无比舒心。给我营造了一种家的感觉,无论大处到小处都是那么无懈可击,价格也很合理。', '2020-02-18 00:15:27', '2020-02-18 00:15:27');
INSERT INTO `tb_record` VALUES (41419770732, 103, 10050, 0, 295.02, 1, '2020-03-10', '2020-05-20', 0x31, '1', '2020-03-10 20:28:13', '2020-03-10 21:59:00');
INSERT INTO `tb_record` VALUES (41419770733, 103, 10060, 0, 295.02, 1, '2020-05-02', '2020-05-20', 0x31, '1', '2020-03-10 20:28:13', '2020-03-10 21:59:00');
INSERT INTO `tb_record` VALUES (41829707758, 327, 10013, 0, 1184.50, 1, '2020-02-27', '2020-06-20', 0x32, NULL, '2020-02-28 04:34:24', '2020-02-28 04:35:16');
INSERT INTO `tb_record` VALUES (52186163362, 114, 10013, 95011, 311.65, 1, '2019-11-1', '2020-05-20', 0x31, '宽敞', '2020-02-07 14:40:22', '2020-02-07 14:40:22');
INSERT INTO `tb_record` VALUES (60350058709, 111, 10030, 0, 946.60, 1, '2020-02-27', '2020-05-20', 0x34, NULL, '2020-02-28 02:02:58', '2020-02-28 02:04:43');
INSERT INTO `tb_record` VALUES (82091162610, 327, 10014, 0, 1148.30, 1, '2020-04-25', '2020-05-20', 0x32, NULL, '2020-04-25 16:21:47', '2020-04-25 16:22:42');
INSERT INTO `tb_record` VALUES (90569770026, 111, 10014, 0, 588.04, 1, '2020-04-30', '2020-05-03', 0x32, '', '2020-02-26 23:36:51', '2020-02-26 23:36:51');
INSERT INTO `tb_record` VALUES (90864689456, 327, 10050, 0, 774.05, 1, '2020-02-20', '2020-02-26', 0x39, '超级无敌的号', '2020-02-12 15:36:06', '2020-02-26 22:57:43');
INSERT INTO `tb_record` VALUES (91066731870, 103, 10050, 0, 295.02, 1, '2020-03-11', '2020-03-12', 0x31, NULL, '2020-03-11 15:55:20', '2020-03-11 15:55:57');
INSERT INTO `tb_record` VALUES (20200311075649, 103, 10050, 10016, 18.00, 1, NULL, NULL, NULL, NULL, '2020-03-11 15:56:49', '2020-03-11 15:58:42');
INSERT INTO `tb_record` VALUES (202002121443070002, 1111, 10013, NULL, NULL, 10060, '', '', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_room
-- ----------------------------
DROP TABLE IF EXISTS `tb_room`;
CREATE TABLE `tb_room`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `floor_id` int(11) NULL DEFAULT NULL,
  `room_number` int(11) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` double(20, 2) NULL DEFAULT NULL COMMENT '售价',
  `deposit` double(20, 2) NOT NULL COMMENT '押金',
  `state` int(20) NULL DEFAULT NULL COMMENT '房间状态  见@constant.entity.RoomState',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `楼层号`(`floor_id`) USING BTREE,
  INDEX `room_number`(`room_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_room
-- ----------------------------
INSERT INTO `tb_room` VALUES (2, 1, 102, '单人间', 200.00, 100.00, 20000, NULL, '2020-04-30 21:13:28');
INSERT INTO `tb_room` VALUES (3, 1, 103, '单人间', 199.00, 100.00, 20000, NULL, '2020-05-03 10:50:15');
INSERT INTO `tb_room` VALUES (4, 1, 104, '单人间', 199.00, 100.00, 20002, NULL, NULL);
INSERT INTO `tb_room` VALUES (5, 1, 105, '单人间', 199.00, 100.00, 20003, NULL, NULL);
INSERT INTO `tb_room` VALUES (6, 1, 106, '单人间', 199.00, 100.00, 20000, NULL, NULL);
INSERT INTO `tb_room` VALUES (7, 1, 107, '单人间', 199.00, 100.00, 20001, NULL, NULL);
INSERT INTO `tb_room` VALUES (8, 1, 108, '单人间', 199.00, 100.00, 20002, NULL, NULL);
INSERT INTO `tb_room` VALUES (9, 1, 109, '单人间', 199.00, 100.00, 20003, NULL, NULL);
INSERT INTO `tb_room` VALUES (10, 1, 110, '单人间', 199.00, 100.00, 20000, NULL, NULL);
INSERT INTO `tb_room` VALUES (11, 1, 111, '大床房', 249.00, 100.00, 20000, NULL, '2020-05-01 13:07:50');
INSERT INTO `tb_room` VALUES (12, 1, 112, '大床房', 249.00, 100.00, 20002, NULL, NULL);
INSERT INTO `tb_room` VALUES (13, 1, 113, '大床房', 249.00, 100.00, 20003, NULL, NULL);
INSERT INTO `tb_room` VALUES (14, 1, 114, '大床房', 249.00, 100.00, 20000, NULL, NULL);
INSERT INTO `tb_room` VALUES (15, 1, 115, '豪华标准间', 299.00, 150.00, 20001, NULL, NULL);
INSERT INTO `tb_room` VALUES (16, 1, 116, '豪华标准间', 299.00, 150.00, 20002, NULL, NULL);
INSERT INTO `tb_room` VALUES (17, 1, 117, '豪华标准间', 299.00, 150.00, 20003, NULL, NULL);
INSERT INTO `tb_room` VALUES (18, 1, 118, '豪华标准间', 299.00, 150.00, 20000, NULL, NULL);
INSERT INTO `tb_room` VALUES (19, 1, 119, '豪华标准间', 299.00, 150.00, 20001, NULL, NULL);
INSERT INTO `tb_room` VALUES (20, 1, 120, '豪华标准间', 299.00, 150.00, 20002, NULL, NULL);
INSERT INTO `tb_room` VALUES (21, 2, 221, '健身房', NULL, 0.00, 29999, NULL, NULL);
INSERT INTO `tb_room` VALUES (22, 2, 222, '酒吧', NULL, 0.00, 29999, NULL, NULL);
INSERT INTO `tb_room` VALUES (23, 2, 223, '餐厅', NULL, 0.00, 29999, NULL, NULL);
INSERT INTO `tb_room` VALUES (24, 2, 224, '游泳池', NULL, 0.00, 29999, NULL, NULL);
INSERT INTO `tb_room` VALUES (25, 3, 325, '家庭房', 499.00, 300.00, 20003, NULL, NULL);
INSERT INTO `tb_room` VALUES (26, 3, 326, '家庭房', 499.00, 300.00, 20000, NULL, NULL);
INSERT INTO `tb_room` VALUES (27, 3, 327, '家庭房', 499.00, 300.00, 20000, NULL, '2020-05-23 13:58:58');
INSERT INTO `tb_room` VALUES (28, 3, 328, '家庭房', 499.00, 300.00, 20002, NULL, NULL);
INSERT INTO `tb_room` VALUES (29, 3, 329, '家庭房', 499.00, 300.00, 20003, NULL, NULL);
INSERT INTO `tb_room` VALUES (30, 3, 330, '豪华标准间', 299.00, 150.00, 20000, NULL, NULL);
INSERT INTO `tb_room` VALUES (31, 3, 331, '豪华标准间', 299.00, 150.00, 20001, NULL, NULL);
INSERT INTO `tb_room` VALUES (32, 3, 332, '豪华标准间', 299.00, 150.00, 20002, NULL, NULL);
INSERT INTO `tb_room` VALUES (33, 3, 333, '豪华标准间', 299.00, 150.00, 20003, NULL, NULL);
INSERT INTO `tb_room` VALUES (34, 3, 334, '豪华标准间', 299.00, 150.00, 20000, NULL, NULL);
INSERT INTO `tb_room` VALUES (35, 3, 335, '豪华标准间', 299.00, 150.00, 20001, NULL, NULL);
INSERT INTO `tb_room` VALUES (36, 3, 336, '豪华标准间', 299.00, 150.00, 20002, NULL, NULL);
INSERT INTO `tb_room` VALUES (37, 3, 337, '豪华标准间', 299.00, 150.00, 20003, NULL, NULL);
INSERT INTO `tb_room` VALUES (38, 3, 338, '豪华标准间', 299.00, 150.00, 20000, NULL, NULL);
INSERT INTO `tb_room` VALUES (39, 3, 339, '豪华标准间', 299.00, 150.00, 20001, NULL, NULL);
INSERT INTO `tb_room` VALUES (40, 4, 440, '豪华双人房', 399.00, 200.00, 20002, NULL, NULL);
INSERT INTO `tb_room` VALUES (41, 4, 441, '豪华双人房', 399.00, 200.00, 20003, NULL, NULL);
INSERT INTO `tb_room` VALUES (42, 4, 442, '豪华双人房', 399.00, 200.00, 20000, NULL, NULL);
INSERT INTO `tb_room` VALUES (43, 4, 443, '豪华双人房', 399.00, 200.00, 20001, NULL, NULL);
INSERT INTO `tb_room` VALUES (44, 4, 444, '豪华双人房', 399.00, 200.00, 20002, NULL, NULL);
INSERT INTO `tb_room` VALUES (45, 4, 445, '豪华双人房', 399.00, 200.00, 20003, NULL, NULL);
INSERT INTO `tb_room` VALUES (46, 4, 446, '豪华双人房', 399.00, 200.00, 20000, NULL, NULL);
INSERT INTO `tb_room` VALUES (47, 4, 447, '豪华双人房', 399.00, 200.00, 20001, NULL, NULL);
INSERT INTO `tb_room` VALUES (48, 4, 448, '商务套房', 1499.00, 400.00, 20002, NULL, NULL);
INSERT INTO `tb_room` VALUES (49, 4, 449, '总统套房', 1999.00, 400.00, 20003, NULL, NULL);

-- ----------------------------
-- Table structure for tb_room_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_room_goods`;
CREATE TABLE `tb_room_goods`  (
  `room_number` int(11) NULL DEFAULT NULL COMMENT '门牌号',
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '物品名称',
  `state` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '物品状态',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modify_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  INDEX `房间门牌`(`room_number`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_room_goods
-- ----------------------------
INSERT INTO `tb_room_goods` VALUES (327, '空调温度', '23', '2020-02-20 21:00:15', '2020-02-20 21:31:36');
INSERT INTO `tb_room_goods` VALUES (327, '空调模式', '制冷', '2020-02-20 21:00:49', '2020-02-20 21:31:36');
INSERT INTO `tb_room_goods` VALUES (327, '空调开关', '关闭', '2020-02-20 21:01:51', '2020-02-20 21:31:36');
INSERT INTO `tb_room_goods` VALUES (327, '窗户开关', '关闭', '2020-02-20 21:02:39', '2020-02-20 21:31:36');
INSERT INTO `tb_room_goods` VALUES (327, '窗帘开关', '关闭', '2020-02-20 21:04:30', '2020-02-20 21:31:37');
INSERT INTO `tb_room_goods` VALUES (327, '厕所灯光', '开启', '2020-02-20 21:05:19', '2020-02-20 21:31:37');
INSERT INTO `tb_room_goods` VALUES (327, '房间灯光', '开启', '2020-02-20 21:06:23', '2020-02-20 21:31:37');
INSERT INTO `tb_room_goods` VALUES (327, '玄光灯光', '开启', '2020-02-20 21:09:00', '2020-02-20 21:31:37');
INSERT INTO `tb_room_goods` VALUES (111, '空调温度', '22', '2020-02-20 21:16:42', '2020-02-27 16:28:17');
INSERT INTO `tb_room_goods` VALUES (111, '空调模式', '制冷', '2020-02-20 21:19:00', '2020-02-27 16:28:17');
INSERT INTO `tb_room_goods` VALUES (111, '空调开关', '开启', '2020-02-20 21:19:56', '2020-02-27 16:28:17');
INSERT INTO `tb_room_goods` VALUES (111, '窗户开关', '开启', '2020-02-20 21:21:31', '2020-02-27 16:28:18');
INSERT INTO `tb_room_goods` VALUES (111, '窗帘开关', '开启', '2020-02-20 21:22:45', '2020-02-27 16:28:18');
INSERT INTO `tb_room_goods` VALUES (111, '厕所灯光', '开启', '2020-02-20 21:24:07', '2020-02-27 16:28:18');
INSERT INTO `tb_room_goods` VALUES (111, '房间灯光', '开启', '2020-02-20 21:25:06', '2020-02-27 16:28:19');
INSERT INTO `tb_room_goods` VALUES (111, '玄光灯光', '开启', '2020-02-20 21:25:48', '2020-02-27 16:28:19');

-- ----------------------------
-- Table structure for tb_room_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_room_type`;
CREATE TABLE `tb_room_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '房间类型',
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '房间名称',
  `type_picture` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '房间类型图片',
  `user_number` int(20) NULL DEFAULT NULL COMMENT '预计入住人数',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '房间描述',
  `wide` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '房间大小',
  `add_bed` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否可加床',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `room_type`(`room_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_room_type
-- ----------------------------
INSERT INTO `tb_room_type` VALUES (2, '502', '大床房', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581412994689&di=f61e3691f665ebfa2958e6395cb0f35a&imgtype=0&src=http%3A%2F%2Fimages4.c-ctrip.com%2Ftarget%2Ftuangou%2F751%2F507%2F862%2F52272b266a4b4fd1a0fae8a3cba7d33d_720_480_s.jpg', 2, '停车费免费，无额外服务费', '25', '有', '2020-02-02 22:07:26', '2020-02-02 22:07:26');
INSERT INTO `tb_room_type` VALUES (4, '504', '家庭房', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581413679387&di=e2949b6647d4e52caba3cb0fd637fc89&imgtype=0&src=http%3A%2F%2Fimg.alicdn.com%2Ftfscom%2Fi6%2FTB1LFyroxGYBuNjy0Fnadt5lpXa_034652.jpg', 3, '整体是温馨的风格，可以让您和您的家人在这里好好放松，享受与家庭成员一起的快乐', '30', '有', '2020-02-05 09:01:18', '2020-02-05 09:01:26');
INSERT INTO `tb_room_type` VALUES (5, '507', '豪华双人房', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581413498416&di=10f09857adaa11007e9507a2d84c41b8&imgtype=0&src=http%3A%2F%2Fpix10.agoda.net%2FhotelImages%2F491%2F4916138%2F4916138_18050316250065211014.jpg%3Fs%3D1024x768', 2, '停车费免费，无额外服务费', '35', '有', '2020-02-05 09:01:18', '2020-02-05 15:55:50');
INSERT INTO `tb_room_type` VALUES (6, '508', '商务套房', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581413342058&di=fddccdb00ef997a787567a58252ea4fd&imgtype=0&src=http%3A%2F%2Fimages4.c-ctrip.com%2Ftarget%2F2A0e070000002q0vb5592.jpg', 2, '环境舒适，整体风格低调，大气，是出差与办公的最佳选择', '50', '无', '2020-02-05 09:01:18', '2020-02-05 09:01:26');
INSERT INTO `tb_room_type` VALUES (7, '509', '总统套房', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581413280699&di=9e530ef2da00cdd75ff46e140871645b&imgtype=0&src=http%3A%2F%2Fimg5.ddove.com%2Fupload%2F20160311%2F141420789017.jpg', 2, '免费提供管家服务', '70', '无', '2020-02-05 09:01:18', '2020-02-05 09:01:26');
INSERT INTO `tb_room_type` VALUES (8, '510', '健身房', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581413706383&di=990a50209418043e816c87f975fa9453&imgtype=0&src=http%3A%2F%2Fpic3.40017.cn%2Fzzy%2Frimage%2F2015%2F03%2F19%2F15%2F2WCC4c.jpg', 50, NULL, '100', '无', '2020-02-05 15:56:01', '2020-02-05 15:56:06');
INSERT INTO `tb_room_type` VALUES (9, '511', '酒吧', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581413887362&di=f3b530346fbdb603944c238f30596c9c&imgtype=0&src=http%3A%2F%2Fwww.myvacation.cn%2Fattchment%2Fuploadimg%2F20091214%2F1260761743740550.jpg', 50, NULL, '100', '无', '2020-02-05 15:56:10', '2020-02-05 15:56:15');
INSERT INTO `tb_room_type` VALUES (10, '512', '游泳池', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581413857961&di=6333ed78f128c62196cf11aaddceb400&imgtype=0&src=http%3A%2F%2Fimg.zx123.cn%2FResources%2Fzx123cn%2Fuploadfile%2F2016%2F1014%2F76793179b6fe3181b81114ed85e9f5fe.jpg', 30, NULL, '120', '无', '2020-02-05 15:56:19', '2020-02-05 15:56:23');
INSERT INTO `tb_room_type` VALUES (11, '513', '餐厅', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581417284537&di=71caa01c3e6f365ec51d6f900979b372&imgtype=0&src=http%3A%2F%2Fpic1.shejiben.com%2Fcase%2F2015%2F08%2F06%2F20150806193313-31447f48.jpg', 60, NULL, '150', '无', '2020-02-05 15:56:27', '2020-02-05 15:56:32');
INSERT INTO `tb_room_type` VALUES (12, '514', '单人间', NULL, 1, NULL, '20', '无', '2020-03-10 20:26:50', '2020-03-10 20:26:52');
INSERT INTO `tb_room_type` VALUES (13, '515', '豪华标准间', NULL, 2, NULL, '30', '有', '2020-03-10 20:27:49', '2020-03-10 20:27:52');

-- ----------------------------
-- Table structure for tb_staff_data
-- ----------------------------
DROP TABLE IF EXISTS `tb_staff_data`;
CREATE TABLE `tb_staff_data`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `staff_id` bigint(20) NULL DEFAULT NULL,
  `salary` double(20, 2) NULL DEFAULT NULL COMMENT '工资',
  `salary_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工资发放时间',
  `daytime` int(11) NULL DEFAULT NULL COMMENT '请假天数',
  `staff_years` int(11) NULL DEFAULT NULL COMMENT '工作年限',
  `staff_address` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工地址',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_staff_data
-- ----------------------------
INSERT INTO `tb_staff_data` VALUES (2, 10015, 5000.00, '2020-3-15', 0, 0, '江苏省无锡市', '2020-02-04 16:53:21', '2020-02-04 16:53:25');
INSERT INTO `tb_staff_data` VALUES (3, 10016, 5000.00, '2020-3-15', 0, 0, '江苏省泰州市', '2020-02-04 16:54:22', '2020-02-04 16:54:25');
INSERT INTO `tb_staff_data` VALUES (4, 10017, 5000.00, '2020-3-15', 0, 0, '江苏省苏州市', '2020-02-04 16:56:44', '2020-02-04 16:56:47');
INSERT INTO `tb_staff_data` VALUES (5, 10018, 5000.00, '2020-3-15', 0, 0, '山东省济南市', '2020-02-04 16:57:55', '2020-02-04 16:57:59');
INSERT INTO `tb_staff_data` VALUES (6, 10019, 5000.00, '2020-3-15', 0, 0, '江苏省徐州市', '2020-02-04 16:59:12', '2020-02-04 16:59:17');
INSERT INTO `tb_staff_data` VALUES (7, 10020, 4000.00, '2020-3-15', 0, 0, '江苏省宿迁市', '2020-02-04 17:00:34', '2020-02-04 17:00:37');
INSERT INTO `tb_staff_data` VALUES (8, 10021, 3500.00, '2020-3-15', 0, 0, '江苏省淮安市', '2020-02-04 17:01:18', '2020-02-04 17:01:22');
INSERT INTO `tb_staff_data` VALUES (9, 10022, 3500.00, '2020-3-15', 0, 0, '江苏省连云港市', '2020-02-04 17:01:30', '2020-02-04 17:01:33');
INSERT INTO `tb_staff_data` VALUES (10, 10023, 3000.00, '2020-3-15', 0, 0, '江苏省盐城市', '2020-02-04 17:01:41', '2020-02-04 17:01:51');
INSERT INTO `tb_staff_data` VALUES (11, 10024, 3000.00, '2020-3-15', 0, 0, '江苏省徐州市', '2020-02-04 17:01:58', '2020-02-04 17:02:02');
INSERT INTO `tb_staff_data` VALUES (12, 10025, 3000.00, '2020-3-15', 0, 0, '江苏省泰州市', '2020-02-04 17:02:21', '2020-02-04 17:02:30');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `number` varchar(20) CHARACTER SET big5 COLLATE big5_chinese_ci NULL DEFAULT NULL COMMENT '会员卡号/员工工号',
  `department_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `account` double(20, 2) NULL DEFAULT NULL,
  `age` int(10) NULL DEFAULT NULL COMMENT '年龄',
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `type` bigint(11) UNSIGNED NOT NULL COMMENT '用户类别',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `id_card_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `mail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人脸照片',
  `face_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人脸标识',
  `create_time` datetime(6) NOT NULL COMMENT '创建时间',
  `modify_time` datetime(6) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_id_card_number`(`id_card_number`) USING BTREE,
  UNIQUE INDEX `uk_phone`(`phone`) USING BTREE,
  UNIQUE INDEX `uk_mail`(`mail`) USING BTREE,
  UNIQUE INDEX `uk_picture`(`picture`) USING BTREE,
  UNIQUE INDEX `uk_face_token`(`face_token`) USING BTREE,
  UNIQUE INDEX `会员号`(`number`) USING BTREE,
  INDEX `idx_type`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10061 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (10013, '95002', 0, 999.70, 20, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '陈章月', 90001, '男', '500384199911072412', '15696756582', '15696756582@163.com', 'http://111.229.114.126:8087/iszychen/img/userInfo/95002.jpg', 'http://111.229.114.126:8087/iszychen/img/userInfo/10013.jpg', '2020-01-24 12:29:00.000000', '2020-05-23 13:53:17.000000');
INSERT INTO `tb_user` VALUES (10014, '95003', 97000, 8.00, 18, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '小明', 90002, '男', '500384199911072413', '15516320148', '15696756585@163.com', 'http://111.229.114.126:8087/iszychen/img/userInfo/95003.jpg', 'http://111.229.114.126:8087/iszychen/img/userInfo/10014.jpg', '2020-01-28 20:18:15.000000', '2020-05-01 13:35:26.000000');
INSERT INTO `tb_user` VALUES (10015, '95004', 97000, NULL, 21, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '马达', 90002, '男', '320802200007251512', '12739837263', '1782764940@qq.com', NULL, NULL, '2020-02-04 16:06:24.000000', '2020-02-04 16:06:30.000000');
INSERT INTO `tb_user` VALUES (10016, '95005', 97008, NULL, 33, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '李娟', 90002, '女', '320721198705104663', '19893864784', '1827684938@qq.com', NULL, NULL, '2020-02-04 16:09:30.000000', '2020-02-04 16:09:32.000000');
INSERT INTO `tb_user` VALUES (10017, '95006', 97002, NULL, 32, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '杨波', 90002, '男', '612732198804230315', '18219271624', '1827495067@qq.com', NULL, NULL, '2020-02-04 16:12:41.000000', '2020-02-04 16:12:48.000000');
INSERT INTO `tb_user` VALUES (10018, '95007', 97003, NULL, 30, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '王丹', 90002, '女', '321284199011230021', '18263976252', '1245672634@qq.com', NULL, NULL, '2020-02-04 16:14:12.000000', '2020-02-04 16:14:15.000000');
INSERT INTO `tb_user` VALUES (10019, '95008', 97004, NULL, 25, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '丁建', 90002, '男', '320582199508107615', '18273659342', '1762817649@qq.com', NULL, NULL, '2020-02-04 16:15:40.000000', '2020-02-04 16:15:42.000000');
INSERT INTO `tb_user` VALUES (10020, '95009', 97005, NULL, 26, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '刘晓梅', 90002, '女', '522722199407032000', '18369263784', '1826472358@qq.com', NULL, NULL, '2020-02-04 16:17:07.000000', '2020-02-04 16:17:13.000000');
INSERT INTO `tb_user` VALUES (10021, '95010', 97006, NULL, 0, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '贾天华', 90002, '男', '320830200009251213', '17378234552', '1251674845@qq.com', NULL, NULL, '2020-02-05 16:18:48.000000', '2020-02-05 16:18:55.000000');
INSERT INTO `tb_user` VALUES (10022, '95011', 97007, NULL, 0, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '杨敏', 90002, '女', '500236199912222762', '17834585167', '1675234267@qq.com', NULL, NULL, '2020-02-04 16:20:09.000000', '2020-02-04 16:20:14.000000');
INSERT INTO `tb_user` VALUES (10023, '95012', 97001, NULL, 25, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '李勇', 90002, '男', '320721200007114619', '18634162452', '1764782364@qq.com', 'http://111.229.114.126:8087/iszychen/img/userInfo/95012.jpg', NULL, '2020-02-01 16:21:42.000000', '2020-02-21 18:00:49.000000');
INSERT INTO `tb_user` VALUES (10024, '95013', 97002, NULL, 0, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '罗美', 90002, '女', '452122200201300000', '18126484781', '1262847825@qq.com', NULL, NULL, '2020-01-31 16:23:07.000000', '2020-01-31 16:23:14.000000');
INSERT INTO `tb_user` VALUES (10025, '95014', 97002, NULL, 0, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '曹磊', 90002, '男', '32068219991103677x', '18274152647', '1837295273@qq.com', NULL, NULL, '2020-01-29 16:24:35.000000', '2020-01-29 16:24:41.000000');
INSERT INTO `tb_user` VALUES (10026, '96001', 0, NULL, 0, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '陈莉', 90000, '女', '3201252025100225', '19802616223', '1551515151515', NULL, NULL, '2020-02-03 16:28:48.000000', '2020-02-13 21:46:06.000000');
INSERT INTO `tb_user` VALUES (10027, '96002', 0, NULL, 0, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '李莎', 90000, '女', '32038220000923042X', '18648236283', '1268242835@qq.com', NULL, NULL, '2020-02-06 16:30:12.000000', '2020-02-06 16:30:19.000000');
INSERT INTO `tb_user` VALUES (10028, '96003', 0, NULL, 0, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '胡瑞', 90000, '男', '322012521252154540', '18796526586', '210504200006211078', NULL, NULL, '2020-02-03 16:31:38.000000', '2020-02-13 21:29:02.000000');
INSERT INTO `tb_user` VALUES (10029, '96004', 0, NULL, 0, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '赵静', 90000, '女', '320826199912020040', '19268126484', '1872125463@qq.com', NULL, NULL, '2020-01-29 16:33:11.000000', '2020-02-05 16:33:17.000000');
INSERT INTO `tb_user` VALUES (10030, '96005', 0, NULL, 0, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '蒋平', 90000, '男', '513022199906066359', '12567235732', '1826278345@qq.com', NULL, NULL, '2020-02-07 16:34:41.000000', '2020-02-07 16:34:46.000000');
INSERT INTO `tb_user` VALUES (10031, '96006', 0, NULL, 0, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '杨国栋', 90000, '男', '220723199808243000', '12682374823', '1826824233@qq.com', NULL, NULL, '2020-01-29 16:36:10.000000', '2020-01-29 16:36:22.000000');
INSERT INTO `tb_user` VALUES (10032, '96007', 0, NULL, 0, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '彭虎', 90000, '男', '52212919980905201X', '19283826428', '1286283462@qq.com', NULL, NULL, '2020-02-11 16:38:02.000000', '2020-02-11 16:38:10.000000');
INSERT INTO `tb_user` VALUES (10033, '96008', 0, NULL, 0, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '刘兰', 90000, '女', '21038120000601536X', '12764823756', '1827468237@qq.com', NULL, NULL, '2020-02-06 16:39:19.000000', '2020-02-06 16:39:23.000000');
INSERT INTO `tb_user` VALUES (10034, '96009', 0, NULL, 0, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '陈春梅', 90000, '女', '320830199910292063', '18246283467', '1282834526@qq.com', NULL, NULL, '2020-02-09 16:41:16.000000', '2020-02-09 16:41:20.000000');
INSERT INTO `tb_user` VALUES (10035, '96010', 0, NULL, 0, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '陈明', 90000, '男', '320922200006139037', '12648274235', '1276827462@qq.com', NULL, NULL, '2020-02-08 16:42:46.000000', '2020-02-08 16:42:50.000000');
INSERT INTO `tb_user` VALUES (10036, '96011', 0, NULL, 0, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '李媛媛', 90000, '女', '520330200001010124', '18452835266', '1254836528@qq.com', NULL, NULL, '2020-02-05 09:29:37.000000', '2020-02-05 09:29:42.000000');
INSERT INTO `tb_user` VALUES (10037, '96012', 0, NULL, 0, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '王磊', 90000, '男', '320283200007037598', '17265273643', '1253465376@qq.com', NULL, NULL, '2020-02-06 09:31:40.000000', '2020-02-06 09:31:47.000000');
INSERT INTO `tb_user` VALUES (10046, '6666666', 0, NULL, 0, 'eb754f7512ef99ebf6d031b1355b496c0ecec0f08bcd1f6d7a790a5a8264be0c', '乔伟', 90001, '男', NULL, '15161755195', '1427292228@qq.com', NULL, NULL, '2020-02-26 21:58:36.000000', '2020-02-26 21:58:36.000000');
INSERT INTO `tb_user` VALUES (10050, '97001', 0, 500.00, 0, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '小明', 90000, '男', NULL, '15696756588', '1173282254@qq.com', NULL, NULL, '2020-02-27 17:55:55.000000', '2020-03-10 21:59:01.000000');
INSERT INTO `tb_user` VALUES (10051, '96020', 0, NULL, 0, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '小红', 90002, '女', NULL, '15369854523', '546546@163.com', NULL, NULL, '2020-02-27 18:42:44.000000', '2020-02-27 18:42:44.000000');
INSERT INTO `tb_user` VALUES (10052, '96021', 0, NULL, 21, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '小李', 90002, '女', '', '13896758458', '156465@qq.com', '', NULL, '2020-02-27 18:54:37.000000', '2020-02-27 18:55:21.000000');
INSERT INTO `tb_user` VALUES (10053, '97002', 0, NULL, 0, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '小罗', 90000, '男', NULL, '15468459678', '15635784@qq.com', NULL, NULL, '2020-02-27 18:57:36.000000', '2020-02-27 18:57:36.000000');
INSERT INTO `tb_user` VALUES (10055, '98001', 0, NULL, 0, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '小天', 90001, '男', NULL, '1235698756', '135454@qq.com', NULL, NULL, '2020-02-28 13:04:56.000000', '2020-02-28 13:04:56.000000');
INSERT INTO `tb_user` VALUES (10056, '97003', 0, NULL, 0, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '小张', 90000, '女', NULL, '1567845967', '12381263@qq.com', NULL, NULL, '2020-03-01 14:03:41.000000', '2020-03-01 14:03:41.000000');
INSERT INTO `tb_user` VALUES (10058, '96022', 0, NULL, 0, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '小王', 90000, '男', NULL, '1658672457', '1232187821@qq.com', NULL, NULL, '2020-03-01 14:08:49.000000', '2020-03-01 14:08:49.000000');
INSERT INTO `tb_user` VALUES (10059, '95022', 0, NULL, 0, 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', '小明', 90003, '男', NULL, '15696756587', '9525582@163.com', NULL, NULL, '2020-03-10 18:18:25.000000', '2020-03-10 18:18:25.000000');
INSERT INTO `tb_user` VALUES (10060, '95055', 0, NULL, 0, 'ec4c88ca7f69534f10c0611c1ecd13e7c2cdf73e1b915e9fd0cf27ac10da43fa', '乔伟', 90000, '男', '320802200007251513', '19851542386', '1656370528@qq.com', NULL, 'http://111.229.114.126:8087/iszychen/img/userInfo/10060.jpg', '2020-04-23 12:06:28.000000', '2020-05-03 10:47:55.000000');

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
) ENGINE = InnoDB AUTO_INCREMENT = 170 CHARACTER SET = big5 COLLATE = big5_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user_news
-- ----------------------------
INSERT INTO `tb_user_news` VALUES (2, 10013, 2, 0, '2020-02-03 18:16:34.000000', '2020-02-03 18:16:37.000000');
INSERT INTO `tb_user_news` VALUES (149, 10023, 71, 0, '2020-02-18 19:33:07.000000', '2020-02-18 19:33:07.000000');
INSERT INTO `tb_user_news` VALUES (150, 10023, 72, 0, '2020-02-18 20:00:32.000000', '2020-02-18 20:00:32.000000');
INSERT INTO `tb_user_news` VALUES (152, 10023, 74, 0, '2020-02-18 21:22:06.000000', '2020-02-18 21:22:06.000000');
INSERT INTO `tb_user_news` VALUES (153, 10023, 75, 0, '2020-02-18 21:32:14.000000', '2020-02-18 21:32:14.000000');
INSERT INTO `tb_user_news` VALUES (154, 10023, 76, 0, '2020-02-18 21:33:38.000000', '2020-02-18 21:33:38.000000');
INSERT INTO `tb_user_news` VALUES (155, 10023, 77, 0, '2020-02-18 21:36:21.000000', '2020-02-18 21:36:21.000000');
INSERT INTO `tb_user_news` VALUES (158, 10013, 80, 0, '2020-02-18 22:26:49.000000', '2020-02-18 22:26:49.000000');
INSERT INTO `tb_user_news` VALUES (159, 10016, 81, 0, '2020-02-20 18:13:21.000000', '2020-02-20 18:13:21.000000');
INSERT INTO `tb_user_news` VALUES (160, 10016, 82, 0, '2020-02-20 18:13:41.000000', '2020-02-20 18:13:41.000000');
INSERT INTO `tb_user_news` VALUES (161, 10016, 83, 0, '2020-02-20 18:33:00.000000', '2020-02-20 18:33:00.000000');
INSERT INTO `tb_user_news` VALUES (162, 10016, 84, 0, '2020-02-20 18:33:48.000000', '2020-02-20 18:33:48.000000');
INSERT INTO `tb_user_news` VALUES (163, 10016, 85, 0, '2020-02-20 18:34:20.000000', '2020-02-20 18:34:20.000000');
INSERT INTO `tb_user_news` VALUES (164, 10016, 86, 0, '2020-02-20 18:34:21.000000', '2020-02-20 18:34:21.000000');
INSERT INTO `tb_user_news` VALUES (165, 10016, 87, 0, '2020-02-20 18:34:32.000000', '2020-02-20 18:34:32.000000');
INSERT INTO `tb_user_news` VALUES (166, 10016, 88, 0, '2020-02-20 18:34:34.000000', '2020-02-20 18:34:34.000000');
INSERT INTO `tb_user_news` VALUES (167, 10016, 89, 0, '2020-02-20 18:34:52.000000', '2020-02-20 18:34:52.000000');
INSERT INTO `tb_user_news` VALUES (168, 10016, 90, 0, '2020-02-26 22:16:11.000000', '2020-02-26 22:16:11.000000');
INSERT INTO `tb_user_news` VALUES (169, 10016, 91, 0, '2020-03-11 15:56:49.000000', '2020-03-11 15:56:49.000000');

-- ----------------------------
-- Table structure for tb_vip
-- ----------------------------
DROP TABLE IF EXISTS `tb_vip`;
CREATE TABLE `tb_vip`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NULL DEFAULT NULL,
  `grade` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pay_amount` double(11, 2) NULL DEFAULT NULL COMMENT '消费金额',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_14`(`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8880020 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_vip
-- ----------------------------
INSERT INTO `tb_vip` VALUES (95002, 10013, '瑰金会员', 9999.00, '2020-02-16 15:59:01', '2020-02-16 15:59:04');
INSERT INTO `tb_vip` VALUES (95003, 10014, '星会员', 250.00, '2020-02-26 23:36:31', '2020-02-26 23:36:33');
INSERT INTO `tb_vip` VALUES (95055, 10060, '星会员', 0.00, '2020-05-02 16:57:59', '2020-05-02 16:57:59');
INSERT INTO `tb_vip` VALUES (96001, 10026, '金会员', 562.00, '2020-02-05 09:58:35', '2020-02-05 10:18:32');
INSERT INTO `tb_vip` VALUES (96002, 10027, '银会员', 399.00, '2020-02-05 09:58:35', '2020-04-30 21:01:25');
INSERT INTO `tb_vip` VALUES (96003, 10028, '瑰金会员', 887.00, '2020-02-05 09:58:35', '2020-02-05 10:18:32');
INSERT INTO `tb_vip` VALUES (96004, 10029, '星会员', 199.00, '2020-02-05 09:58:35', '2020-02-05 10:18:32');
INSERT INTO `tb_vip` VALUES (96005, 10030, '瑰金会员', 887.00, '2020-02-05 09:58:35', '2020-02-05 10:18:32');
INSERT INTO `tb_vip` VALUES (96006, 10031, '银会员', 399.00, '2020-02-05 09:58:35', '2020-02-05 10:18:32');
INSERT INTO `tb_vip` VALUES (96007, 10032, '金会员', 562.00, '2020-02-05 09:58:35', '2020-02-05 10:18:32');
INSERT INTO `tb_vip` VALUES (96008, 10033, '星会员', 199.00, '2020-02-05 09:58:35', '2020-02-05 10:18:32');
INSERT INTO `tb_vip` VALUES (96009, 10034, '银会员', 399.00, '2020-02-05 09:58:35', '2020-02-05 10:18:32');
INSERT INTO `tb_vip` VALUES (96010, 10035, '星会员', 199.00, '2020-02-05 09:58:35', '2020-02-05 10:18:32');
INSERT INTO `tb_vip` VALUES (96011, 10036, '金会员', 562.00, '2020-02-05 09:58:35', '2020-02-05 10:18:32');
INSERT INTO `tb_vip` VALUES (96012, 10037, '星会员', 250.00, '2020-02-12 13:57:28', '2020-02-14 19:20:51');
INSERT INTO `tb_vip` VALUES (97001, 10050, '星会员', 0.00, '2020-03-10 20:24:20', '2020-03-10 20:24:20');

-- ----------------------------
-- Table structure for tb_vip_grade
-- ----------------------------
DROP TABLE IF EXISTS `tb_vip_grade`;
CREATE TABLE `tb_vip_grade`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `equity` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '权益-对应权限',
  `grade` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '等级',
  `discount` double(20, 2) NULL DEFAULT NULL COMMENT '折扣',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '会员卡的图片',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '会员资格描述',
  `update_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '会员升级描述',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_vip_grade
-- ----------------------------
INSERT INTO `tb_vip_grade` VALUES (1, '送两张早餐券', '星会员', 0.98, 'http://111.229.114.126:8087/iszychen/img/xing.png', '您仅需以合资格房价入住Alter Hotel，即可成为我们的星会员', '您仅需于一个日历年内，在任何一间Alter Hotel拥有10晚或5次合资格的入住记录，即可升级成为银会员', '2020-02-03 16:27:58', '2020-02-03 16:28:04');
INSERT INTO `tb_vip_grade` VALUES (2, '送2张早餐券，延迟退房至15:00点前', '银会员', 0.92, 'http://111.229.114.126:8087/iszychen/img/silver.png', '您仅需于一个日历年内，在任何一间Alter Hotel拥有10晚或5次合资格的入住记录，即可成为银会员', '您仅需于一个日历年内，在任何一间Alter Hotel拥有20晚或10次合资格的入住记录，即可升级成为黄金会员', '2020-01-28 09:18:38', '2020-01-28 09:18:43');
INSERT INTO `tb_vip_grade` VALUES (3, '送2张早餐券，延迟退房至15:00点前，娱乐消费八折', '金会员', 0.90, 'http://111.229.114.126:8087/iszychen/img/golden.png', '您仅需于一个日历年内，在任何一间Alter Hotel拥有20晚或10次合资格的入住记录，即可成为金会员', '您仅需于一个日历年内，在任何一间Alter Hotel拥有50晚或25次合资格的入住记录，即可升级成为瑰金会员', '2020-04-01 09:18:47', '2020-01-28 09:18:52');
INSERT INTO `tb_vip_grade` VALUES (4, '送2张早餐券，延迟退房至15:00点前，娱乐消费七折', '瑰金会员', 0.85, 'http://111.229.114.126:8087/iszychen/img/rose%20golden.png', '您仅需于一个日历年内，在任何一间Alter Hotel拥有50晚或25次合资格的入住记录，即可成为瑰金会员', '瑰金会员是我们最高会员级别', '2020-01-28 09:18:58', '2020-01-28 09:19:03');

SET FOREIGN_KEY_CHECKS = 1;
