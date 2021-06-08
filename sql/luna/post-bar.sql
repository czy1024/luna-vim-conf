/*
 Navicat Premium Data Transfer

 Source Server         : luna-local
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:3306
 Source Schema         : post-bar

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 08/06/2021 19:38:19
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='百度ApiKey';

-- ----------------------------
-- Records of tb_app
-- ----------------------------
BEGIN;
INSERT INTO `tb_app` VALUES (1, '15436824', '6kkP0eWEu5rGss7IwW0DQr8s', 'jz0XbDKln7DO2Bep5c9rzDVtFgq3Xjq9', '2021-05-27 14:27:57', '2021-05-27 14:27:59', 0);
COMMIT;

-- ----------------------------
-- Table structure for tb_audio
-- ----------------------------
DROP TABLE IF EXISTS `tb_audio`;
CREATE TABLE `tb_audio` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户Id',
  `audio_spd` int(1) NOT NULL DEFAULT '5' COMMENT '0-9',
  `audio_pit` int(1) NOT NULL DEFAULT '5' COMMENT '0-9',
  `audio_vol` int(2) NOT NULL DEFAULT '5' COMMENT '0-15',
  `audio_voi_per` int(1) NOT NULL DEFAULT '0' COMMENT '0-4',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL COMMENT '锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='音频配置表';

-- ----------------------------
-- Records of tb_audio
-- ----------------------------
BEGIN;
INSERT INTO `tb_audio` VALUES (2, 1, 5, 5, 5, 4, '2021-05-28 17:46:50', '2021-05-30 15:49:31', 2);
COMMIT;

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文章编号',
  `post_id` bigint(20) NOT NULL COMMENT '文章编号',
  `user_id` varchar(20) NOT NULL COMMENT '用户编号',
  `content` text NOT NULL COMMENT '评论内容',
  `audio` varchar(255) DEFAULT NULL COMMENT '评论音频',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL COMMENT '锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='评论\n';

-- ----------------------------
-- Records of tb_comment
-- ----------------------------
BEGIN;
INSERT INTO `tb_comment` VALUES (38, 34, '1', '真不错啊，写得真好', 'http://127.0.0.1:8081//Users/luna/Document/project/post/2021/05/31/cb6a5d65a9c94dc88f3219372014f554.mp3', '2021-05-31 11:27:22', '2021-05-31 11:27:22', 0);
INSERT INTO `tb_comment` VALUES (39, 34, '1', '是的，原来可以这么用啊', 'http://127.0.0.1:8081//Users/luna/Document/project/post/2021/05/31/36911f9480a344ba8e85900fbcff3897.mp3', '2021-05-31 11:29:31', '2021-05-31 11:29:31', 0);
INSERT INTO `tb_comment` VALUES (40, 34, '1', '好厉害啊', 'http://127.0.0.1:8081//Users/luna/Document/project/post/2021/05/31/7be2e142475f481184f6119bc081a170.mp3', '2021-05-31 11:35:14', '2021-05-31 11:35:14', 0);
INSERT INTO `tb_comment` VALUES (41, 35, '1', '哇 大佬又发文章了&nbsp;', 'http://127.0.0.1:8081//Users/luna/Document/project/post/2021/05/31/bf0300e616e544989f388b066c503218.mp3', '2021-05-31 11:38:15', '2021-05-31 11:38:15', 0);
COMMIT;

-- ----------------------------
-- Table structure for tb_comment_praise
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment_praise`;
CREATE TABLE `tb_comment_praise` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `praise` int(11) DEFAULT NULL COMMENT '赞的数目?',
  `post_id` bigint(20) DEFAULT NULL COMMENT '文章编号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户编号',
  `comment_id` bigint(20) DEFAULT NULL COMMENT '评论编号',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL COMMENT '锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='评论扩展表';

-- ----------------------------
-- Records of tb_comment_praise
-- ----------------------------
BEGIN;
INSERT INTO `tb_comment_praise` VALUES (37, 14, 33, 1, 0, '2021-05-31 11:05:32', '2021-05-31 11:21:23', 14);
INSERT INTO `tb_comment_praise` VALUES (45, 9, 34, 1, 0, '2021-05-31 11:26:54', '2021-05-31 11:27:06', 9);
INSERT INTO `tb_comment_praise` VALUES (46, 6, 34, 1, 38, '2021-05-31 11:27:22', '2021-05-31 11:28:32', 6);
INSERT INTO `tb_comment_praise` VALUES (47, 0, 34, 1, 39, '2021-05-31 11:29:31', '2021-05-31 11:29:31', 0);
INSERT INTO `tb_comment_praise` VALUES (48, 0, 34, 1, 40, '2021-05-31 11:35:14', '2021-05-31 11:35:14', 0);
INSERT INTO `tb_comment_praise` VALUES (49, 10, 35, 1, 0, '2021-05-31 11:37:58', '2021-05-31 16:21:18', 10);
INSERT INTO `tb_comment_praise` VALUES (50, 15, 35, 1, 41, '2021-05-31 11:38:16', '2021-05-31 16:21:20', 15);
COMMIT;

-- ----------------------------
-- Table structure for tb_post
-- ----------------------------
DROP TABLE IF EXISTS `tb_post`;
CREATE TABLE `tb_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `post_title` varchar(16) NOT NULL COMMENT '文章标题',
  `post_text` text NOT NULL COMMENT '文章内容',
  `post_page_views` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文章阅读数',
  `post_audio` varchar(255) DEFAULT NULL COMMENT '文章音频',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL COMMENT '锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='文章帖子\n';

-- ----------------------------
-- Records of tb_post
-- ----------------------------
BEGIN;
INSERT INTO `tb_post` VALUES (33, 1, '今日周一', '今天是周一美好的一天，\n<p style=\"color:#333333;font-family:&quot;font-size:15px;background-color:#FFFFFF;\">\n	“大爷，我现场采访您一下，您这样晨跑锻炼坚持几年了？”\n</p>\n<span style=\"color:#333333;font-family:&quot;font-size:15px;background-color:#FFFFFF;\">“姑娘别挡道！我尿急！ ”</span>', 13, 'http://127.0.0.1:8081//Users/luna/Document/project/post/2021/05/31/9072501b0b314bcd8bbd1723705136ae.mp3', '2021-05-31 10:38:10', '2021-05-31 11:22:31', 13);
INSERT INTO `tb_post` VALUES (34, 1, 'JVM查看内存相关', '<p style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;\">\n	1、jps:查看本地正在运行的java进程和进程ID（pid）\n</p>\n<p style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;\">\n	<img src=\"https://img2018.cnblogs.com/blog/1031555/201903/1031555-20190330210116689-1588206683.png\" alt=\"\" style=\"height:auto;\" />\n</p>\n<p style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;\">\n	2、jinfo pid，查看指定pid的所有JVM信息\n</p>\n<p style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;\">\n	&emsp;&emsp;1）jinfo -flags pid 查询虚拟机运行参数信息。\n</p>\n<p style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;\">\n	&emsp;&emsp;2）jinfo -flag name pid，查询具体参数信息，如jinfo -flag&nbsp;UseSerialGC 42324，查看是否启用UseSerialGC\n</p>\n<p style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;\">\n	<img src=\"https://img2018.cnblogs.com/blog/1031555/201903/1031555-20190331120005666-2136368791.png\" alt=\"\" class=\"medium-zoom-image\" style=\"height:auto;\" />\n</p>\n<p style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;\">\n	&nbsp;\n</p>\n<div>\n	<br />\n</div>', 3, 'http://127.0.0.1:8081//Users/luna/Document/project/post/2021/05/31/13be7de31a1240f2b81dd7ff1d7d7d1c.mp3', '2021-05-31 11:26:53', '2021-05-31 11:35:04', 3);
INSERT INTO `tb_post` VALUES (35, 1, 'JVM内存监控', '<p>\n	这个好厉害，JVM内存回收2\n</p>\n<p>\n	<p style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;\">\n		3、jmap\n	</p>\n	<p style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;\">\n		&emsp;&emsp;1）jmap -heap pid：输出堆内存设置和使用情况（JDK11使用jhsdb jmap --heap --pid pid）\n	</p>\n	<p style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;\">\n		&emsp;&emsp;2）jmap -histo pid：输出heap的直方图，包括类名，对象数量，对象占用大小\n	</p>\n	<p style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;\">\n		&emsp;&emsp;3）jmap -histo:live pid：同上，只输出存活对象信息\n	</p>\n	<p style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;\">\n		&emsp;&emsp;4）jmap -clstats pid：输出加载类信息\n	</p>\n	<p style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;\">\n		&emsp;&emsp;5）jmap -help：jmap命令帮助信息\n	</p>\n	<p style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;\">\n		4、jstat：Java虚拟机统计工具，全称“Java Virtual Machine statistics monitoring tool”。可以用于监视JVM各种堆和非堆内存大小和使用量\n	</p>\n	<p style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;\">\n		&emsp;&emsp;1）jstat -class pid：输出加载类的数量及所占空间信息。\n	</p>\n	<p style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;\">\n		&emsp;&emsp;2）jstat -gc pid：输出gc信息，包括gc次数和时间，内存使用状况（可带时间和显示条目参数）\n	</p>\n	<p style=\"font-family:&quot;font-size:14px;background-color:#FFFFFF;\">\n		&emsp;&emsp;其他命令不一一列举。\n	</p>\n</p>', 1, 'http://127.0.0.1:8081//Users/luna/Document/project/post/2021/05/31/802c6c5d5dba4a47a6220bea3a861a44.mp3', '2021-05-31 11:36:58', '2021-05-31 16:18:42', 1);
COMMIT;

-- ----------------------------
-- Table structure for tb_post_praise
-- ----------------------------
DROP TABLE IF EXISTS `tb_post_praise`;
CREATE TABLE `tb_post_praise` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '创建编号',
  `post_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '文章编号',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL COMMENT '锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章扩展表\n';

-- ----------------------------
-- Records of tb_post_praise
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_register
-- ----------------------------
DROP TABLE IF EXISTS `tb_register`;
CREATE TABLE `tb_register` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '注册信息编号',
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `sex` varchar(1) NOT NULL COMMENT '性别',
  `age` int(3) NOT NULL COMMENT '年龄',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL COMMENT '锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='注册表';

-- ----------------------------
-- Records of tb_register
-- ----------------------------
BEGIN;
INSERT INTO `tb_register` VALUES (1, 1, '1', 14, 'luna_nov@163.com', 'http://127.0.0.1:8081/Users/luna/Document/project/post/2021/05/28/2606092767b340109a2d9f41e871f1bc.png', '2021-05-27 21:15:01', '2021-05-30 15:21:47', 6);
COMMIT;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `name` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `login_time` datetime DEFAULT NULL COMMENT '上次登陆时间',
  `admin` varchar(20) DEFAULT '0' COMMENT '是否管理员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间',
  `version` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '锁',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
BEGIN;
INSERT INTO `tb_user` VALUES (1, 'admin123', '8b283e8957f744ae5a1a6add05fc354f', '2021-05-31 16:18:38', '0', '2021-05-27 16:01:58', '2021-05-31 16:18:37', 18);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
