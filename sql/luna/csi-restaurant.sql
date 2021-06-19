/*
 Navicat Premium Data Transfer

 Source Server         : luna-local
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:3306
 Source Schema         : csi-restaurant

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 19/06/2021 20:59:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_app
-- ----------------------------
DROP TABLE IF EXISTS `tb_app`;
CREATE TABLE `tb_app` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(32) NOT NULL COMMENT '应用编号',
  `api_key` varchar(32) NOT NULL COMMENT '应用key',
  `secret_key` varchar(32) NOT NULL COMMENT '应用密钥',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL COMMENT '锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='百度ApiKey';

-- ----------------------------
-- Records of tb_app
-- ----------------------------
BEGIN;
INSERT INTO `tb_app` VALUES (1, '15436824', '6kkP0eWEu5rGss7IwW0DQr8s', 'jz0XbDKln7DO2Bep5c9rzDVtFgq3Xjq9', '2021-05-27 14:27:57', '2021-05-27 14:27:59', 0);
INSERT INTO `tb_app` VALUES (2, '15949958', 'fDCBonu1DWRf8FQUt6VrnqER', '561cLBZsXcmSGL7tvjqz4GZkGb8rCpjk', '2021-06-17 17:38:48', '2021-06-17 17:38:50', 0);
COMMIT;

-- ----------------------------
-- Table structure for tb_cart
-- ----------------------------
DROP TABLE IF EXISTS `tb_cart`;
CREATE TABLE `tb_cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '购物车',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `meal_id` bigint(20) NOT NULL COMMENT '商品编号',
  `count` int(11) NOT NULL COMMENT '数量',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL COMMENT '锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='商品购物车';

-- ----------------------------
-- Records of tb_cart
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_meal
-- ----------------------------
DROP TABLE IF EXISTS `tb_meal`;
CREATE TABLE `tb_meal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '食物编号',
  `series_id` bigint(20) NOT NULL COMMENT '菜系编号',
  `meal_name` varchar(20) NOT NULL DEFAULT '' COMMENT '食物名称',
  `summarize` varchar(255) DEFAULT NULL COMMENT '食物摘要',
  `description` varchar(1023) DEFAULT '' COMMENT '食物描述',
  `meal_price` decimal(8,2) DEFAULT NULL COMMENT '物品价格',
  `image` varchar(250) DEFAULT NULL COMMENT '物品图片',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL COMMENT '锁',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mealSeriesId` (`series_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='餐品信息表';

-- ----------------------------
-- Records of tb_meal
-- ----------------------------
BEGIN;
INSERT INTO `tb_meal` VALUES (1, 1, '锅塌豆腐', '塌豆腐玲珑别致，整齐端庄。', '最早的锅塌系列菜是来自山东地区，早在明代山东济南就出现了锅塌豆腐，此菜到了清乾隆年间荣升宫廷菜。后传遍山东各地，又传入到天津、北京及上海等地。\n', 15.00, 'http://127.0.0.1:8081/Users/luna/Document/project/meal/2021/06/18/3dad85a5e6d64436b1e0e5aba6093645.jpg', '2021-06-18 19:07:42', '2021-06-18 22:54:45', 2);
INSERT INTO `tb_meal` VALUES (2, 2, '回锅肉', '口味独特，色泽红亮，肥而不腻	', '回锅肉是一种四川传统菜式，属于川菜系列。制作原料主要有猪肉、青椒、蒜苗等，口味独特，色泽红亮，肥而不腻。\n', 25.00, 'http://127.0.0.1:8081/Users/luna/Document/project/meal/2021/06/18/4a5e38b227c84d228962ea0193183f9e.jpg', '2021-06-18 19:08:45', '2021-06-18 22:53:39', 3);
INSERT INTO `tb_meal` VALUES (3, 4, '青椒炒鸡蛋', '青椒炒鸡蛋', '青椒炒鸡蛋', 12.00, 'http://127.0.0.1:8081/Users/luna/Document/project/meal/2021/06/19/4038607a2eed4e2989f2510c7d506a1b.jpg', '2021-06-18 21:15:57', '2021-06-19 16:18:42', 1);
INSERT INTO `tb_meal` VALUES (5, 2, '酸菜鱼', '酸菜鱼', '酸菜鱼', 27.00, 'http://127.0.0.1:8081/Users/luna/Document/project/meal/2021/06/19/9785ee2fd07d4774950aa920c15ac202.jpg', '2021-06-18 21:18:01', '2021-06-19 16:20:19', 6);
COMMIT;

-- ----------------------------
-- Table structure for tb_meal_series
-- ----------------------------
DROP TABLE IF EXISTS `tb_meal_series`;
CREATE TABLE `tb_meal_series` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜系编号',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `series_name` varchar(10) DEFAULT NULL COMMENT '菜系名称',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL COMMENT '锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='菜系表';

-- ----------------------------
-- Records of tb_meal_series
-- ----------------------------
BEGIN;
INSERT INTO `tb_meal_series` VALUES (1, 1, '鲁菜', '2021-06-17 17:36:48', '2021-06-18 14:59:47', 2);
INSERT INTO `tb_meal_series` VALUES (2, 2, '川菜', '2021-06-17 17:36:48', '2021-06-17 17:36:48', 0);
INSERT INTO `tb_meal_series` VALUES (3, 3, '粤菜', '2021-06-17 17:36:48', '2021-06-17 17:36:48', 0);
INSERT INTO `tb_meal_series` VALUES (4, 4, '苏菜', '2021-06-17 17:36:48', '2021-06-17 17:36:48', 0);
INSERT INTO `tb_meal_series` VALUES (5, 5, '闽菜', '2021-06-17 17:36:48', '2021-06-17 17:36:48', 0);
INSERT INTO `tb_meal_series` VALUES (6, 6, '浙菜', '2021-06-17 17:36:48', '2021-06-17 17:36:48', 0);
INSERT INTO `tb_meal_series` VALUES (7, 7, '湘菜', '2021-06-17 17:36:48', '2021-06-17 17:36:48', 0);
INSERT INTO `tb_meal_series` VALUES (8, 8, '徽菜', '2021-06-17 17:36:48', '2021-06-18 14:43:48', 2);
INSERT INTO `tb_meal_series` VALUES (9, 9, '西餐', '2021-06-17 17:36:48', '2021-06-17 17:36:48', 0);
INSERT INTO `tb_meal_series` VALUES (10, 10, '西点', '2021-06-17 17:36:48', '2021-06-17 17:36:48', 0);
INSERT INTO `tb_meal_series` VALUES (11, 13, '药膳', '2021-06-17 17:36:48', '2021-06-18 14:59:55', 1);
INSERT INTO `tb_meal_series` VALUES (12, 12, '私房菜', '2021-06-17 17:36:48', '2021-06-17 17:36:48', 0);
COMMIT;

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '创建用户',
  `order_time` datetime DEFAULT NULL COMMENT '订单时间',
  `order_state` int(1) DEFAULT NULL COMMENT '订单状态',
  `order_price` decimal(8,2) DEFAULT NULL COMMENT '订单价格',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL COMMENT '锁',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `UserId` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='订单主表';

-- ----------------------------
-- Records of tb_order
-- ----------------------------
BEGIN;
INSERT INTO `tb_order` VALUES (1, 8, '2021-06-19 09:41:26', 3, 30.00, '2021-06-19 09:41:38', '2021-06-19 16:16:17', 9);
INSERT INTO `tb_order` VALUES (16, 8, '2021-06-19 20:58:36', 3, 15.00, '2021-06-19 20:58:36', '2021-06-19 20:58:40', 2);
COMMIT;

-- ----------------------------
-- Table structure for tb_order_meal
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_meal`;
CREATE TABLE `tb_order_meal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单详细表',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单编号',
  `meal_id` bigint(20) DEFAULT NULL COMMENT '物品编号',
  `meal_price` decimal(8,2) DEFAULT NULL COMMENT '物品数量x单价',
  `meal_count` int(11) DEFAULT NULL COMMENT '物品数量',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL COMMENT '锁',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `OID` (`order_id`),
  KEY `MealId` (`meal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order_meal
-- ----------------------------
BEGIN;
INSERT INTO `tb_order_meal` VALUES (1, 1, 1, 30.00, 2, '2021-06-19 10:33:40', '2021-06-19 10:33:42', 0);
INSERT INTO `tb_order_meal` VALUES (31, 12, 1, 15.00, 1, '2021-06-19 18:06:50', '2021-06-19 18:06:50', 0);
INSERT INTO `tb_order_meal` VALUES (32, 12, 1, 75.00, 5, '2021-06-19 18:06:50', '2021-06-19 18:06:50', 0);
INSERT INTO `tb_order_meal` VALUES (33, 12, 2, 25.00, 1, '2021-06-19 18:06:50', '2021-06-19 18:06:50', 0);
INSERT INTO `tb_order_meal` VALUES (34, 13, 2, 25.00, 1, '2021-06-19 18:07:51', '2021-06-19 18:07:51', 0);
INSERT INTO `tb_order_meal` VALUES (35, 13, 3, 12.00, 1, '2021-06-19 18:07:51', '2021-06-19 18:07:51', 0);
INSERT INTO `tb_order_meal` VALUES (36, 14, 3, 12.00, 1, '2021-06-19 18:55:57', '2021-06-19 18:55:57', 0);
INSERT INTO `tb_order_meal` VALUES (37, 15, 2, 25.00, 1, '2021-06-19 18:56:32', '2021-06-19 18:56:32', 0);
INSERT INTO `tb_order_meal` VALUES (38, 15, 1, 15.00, 1, '2021-06-19 18:56:34', '2021-06-19 18:56:34', 0);
INSERT INTO `tb_order_meal` VALUES (39, 16, 1, 15.00, 1, '2021-06-19 20:58:36', '2021-06-19 20:58:36', 0);
COMMIT;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `username` varchar(20) NOT NULL COMMENT '登陆名称',
  `password` varchar(32) NOT NULL COMMENT '登陆密码',
  `real_name` varchar(20) NOT NULL COMMENT '真实名称',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `phone` varchar(20) NOT NULL COMMENT '手机',
  `address` varchar(50) NOT NULL COMMENT '收货地址',
  `face_path` varchar(255) DEFAULT NULL COMMENT '人脸地址',
  `face_data` varchar(255) DEFAULT NULL COMMENT '人脸key',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL COMMENT '锁',
  `admin` char(1) NOT NULL DEFAULT '1' COMMENT '管理员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
BEGIN;
INSERT INTO `tb_user` VALUES (1, 'luna', 'f1a9c4b4feab871cc6a93165eca2e655', '陈章月', 'luna_nov@163.com', '15696756582', '江苏省南通市如皋市万寿南路766号', 'http://127.0.0.1:8081/Users/luna/Document/project/meal/2021/06/19/c4ca4238a0b923820dcc509a6f75849b.jpg', 'ed09aa1bfcfb61fdf5639a2252093233', '2021-06-18 10:33:30', '2021-06-19 20:46:34', 27, '0');
INSERT INTO `tb_user` VALUES (2, 'chenzhnagyue', 'f1a9c4b4feab871cc6a93165eca2e655', '陈章月', 'luna_nov@163.com', '15696756582', '江苏省南通市如皋市万寿南路766号', NULL, NULL, '2021-06-18 10:49:45', '2021-06-18 12:44:19', 1, '1');
INSERT INTO `tb_user` VALUES (3, 'luojie', 'f1a9c4b4feab871cc6a93165eca2e655', '罗杰', 'luojie@163.com', '15696756583', '江苏省南通市如皋市万寿南路766号', NULL, NULL, '2021-06-18 12:56:31', '2021-06-18 12:57:43', 1, '1');
INSERT INTO `tb_user` VALUES (4, 'zhaowenjun', 'f1a9c4b4feab871cc6a93165eca2e655', '赵文军', 'wenjun@163.com', '15696756583', '江苏省南通市如皋市万寿南路766号', NULL, NULL, '2021-06-18 12:56:31', '2021-06-18 12:57:43', 1, '1');
INSERT INTO `tb_user` VALUES (5, 'hanzhiqiang', 'f1a9c4b4feab871cc6a93165eca2e655', '韩志强', 'zhiqiang@163.com', '15696756583', '江苏省南通市如皋市万寿南路766号', NULL, NULL, '2021-06-18 12:56:31', '2021-06-18 12:57:43', 1, '1');
INSERT INTO `tb_user` VALUES (6, 'yanghao', 'f1a9c4b4feab871cc6a93165eca2e655', '杨昊', 'yanghao@163.com', '15696756583', '江苏省南通市如皋市万寿南路766号', NULL, NULL, '2021-06-18 12:56:31', '2021-06-18 12:57:43', 1, '1');
INSERT INTO `tb_user` VALUES (7, 'wanghuaqiang', 'f1a9c4b4feab871cc6a93165eca2e655', '王华强', 'huaqiang@163.com', '15696756583', '江苏省南通市如皋市万寿南路766号', NULL, NULL, '2021-06-18 12:56:31', '2021-06-18 12:57:43', 1, '1');
INSERT INTO `tb_user` VALUES (8, 'luna2', 'f1a9c4b4feab871cc6a93165eca2e655', '陈章月', 'luna_nov@163.com', '15696756584', '江苏省南通市如皋市万寿南路766号', 'http://127.0.0.1:8081/Users/luna/Document/project/meal/2021/06/19/c9f0f895fb98ab9159f51fd0297e236d.jpg', '384c15c1453caa4c73f6ba1719ef98fd', '2021-06-18 10:33:30', '2021-06-19 20:46:10', 31, '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
