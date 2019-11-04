/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 04/11/2019 17:57:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '文章ID，可用于检索该文章的评论',
  `menu_id` int(10) NULL DEFAULT NULL COMMENT '对应菜单的id',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章标题',
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '粗略发布时间，年+月',
  `detailDate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布时间',
  `browse` int(10) NULL DEFAULT NULL COMMENT '浏览量',
  `comment` int(10) NULL DEFAULT NULL COMMENT '评论数',
  `collect` int(10) NULL DEFAULT NULL COMMENT '喜欢',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '论文内容',
  `picUri` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题图片Uri',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, 13, 'Java', 'Java从入门到精通', 'Mango', '2019年十月', '2019-10-20 17:00', 100, 100, 100, '这是博文内容', NULL);
INSERT INTO `article` VALUES (2, 15, 'HTML', 'HTML开发指南', 'Mango', '2019年十一月', '2019-11-5 10:20', 200, 200, 200, '这也是博文内容', NULL);
INSERT INTO `article` VALUES (3, 18, 'Other', '知识付费的发展趋势', 'Mango', '2019年十月', '2019-10-10 14:00', 300, 300, 300, '这还是博文内容', NULL);
INSERT INTO `article` VALUES (4, 18, 'Other', '谈一谈博客的关注解锁文章功能', 'Mango', '2019年十一月', '2019-11-10 18:00', 400, 400, 400, '哈哈，博文内容', NULL);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `belong` int(10) NULL DEFAULT NULL COMMENT '菜单所属父级ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, '首页', 0);
INSERT INTO `menu` VALUES (2, '生活笔记', 0);
INSERT INTO `menu` VALUES (3, '技术杂谈', 0);
INSERT INTO `menu` VALUES (4, '福利专区', 0);
INSERT INTO `menu` VALUES (5, '关于博主', 0);
INSERT INTO `menu` VALUES (6, '给我留言', 0);
INSERT INTO `menu` VALUES (7, '赞助作者', 0);
INSERT INTO `menu` VALUES (8, '技术交流', 0);
INSERT INTO `menu` VALUES (9, '个人随笔', 2);
INSERT INTO `menu` VALUES (10, '个人日记', 2);
INSERT INTO `menu` VALUES (11, '个人展示', 2);
INSERT INTO `menu` VALUES (12, 'C/C++', 3);
INSERT INTO `menu` VALUES (13, 'Java', 3);
INSERT INTO `menu` VALUES (14, 'PHP', 3);
INSERT INTO `menu` VALUES (15, 'HTML', 3);
INSERT INTO `menu` VALUES (16, 'Python', 3);
INSERT INTO `menu` VALUES (17, 'JS', 3);
INSERT INTO `menu` VALUES (18, 'Other', 3);

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `portrait` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES (12, '张三', '');
INSERT INTO `test` VALUES (13, '李四', '');
INSERT INTO `test` VALUES (14, '王五', '');
INSERT INTO `test` VALUES (15, '赵六', NULL);

SET FOREIGN_KEY_CHECKS = 1;
