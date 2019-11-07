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

 Date: 07/11/2019 23:23:03
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
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '论文内容',
  `htmlContent` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '论文内容，带HTML标签',
  `picUri` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题图片Uri',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, 13, 'Java', 'Java从入门到精通', 'Mango', '2019年10月', '2019-10-20 17:00', 100, 100, 100, '这是博文内容', '<h1>这是博文内容</h1>', 'block.jpg');
INSERT INTO `article` VALUES (2, 15, 'HTML', 'HTML开发指南', 'Mango', '2019年11月', '2019-11-05 10:20', 200, 200, 200, '这是博文内容', '<h1>这是博文内容</h1>', 'block.jpg');
INSERT INTO `article` VALUES (3, 18, 'Other', '知识付费的发展趋势', 'Mango', '2019年10月', '2019-10-10 14:00', 300, 300, 300, '这是博文内容', '<h1>这是博文内容</h1>', 'block.jpg');
INSERT INTO `article` VALUES (4, 18, 'Other', '谈一谈博客的关注解锁文章功能', 'Mango', '2019年09月', '2019-11-07 16:13:03', 400, 400, 400, '这是博文内容', '<h1>这是博文内容</h1>', 'block.jpg');
INSERT INTO `article` VALUES (5, 16, 'Python', 'ADSL 拨号代理', 'Mango', '2019年10月', '2019-10-20 13:30', 150, 150, 150, '这是博文内容', '<h1>这是博文内容</h1>', 'block.jpg');
INSERT INTO `article` VALUES (6, 19, '爬虫', '爬虫工程师最想要的JS逆向教程', 'Mango', '2019年11月', '2019-11-19 09:50', 350, 350, 350, '这是博文内容', '<h1>这是博文内容</h1>', 'block.jpg');
INSERT INTO `article` VALUES (7, 12, 'C/CPP', 'OpenGL绘图学习总结', 'Mango', '2016年02月', '2016-02-11 21:00', 100, 100, 100, '这是博文内容', '<h1>这是博文内容</h1>', 'block.jpg');
INSERT INTO `article` VALUES (8, 14, 'PHP', 'WordPress远程附件上传', 'Mango', '2017年03月', '2017-03-12 08:00', 300, 300, 300, '这是博文内容', '<h1>这是博文内容</h1>', 'block.jpg');
INSERT INTO `article` VALUES (9, 20, 'Linux', '关于Ubuntu开机问题', 'Mango', '2019年11月', '2019-11-07 23:16:08', 450, 450, 450, '这是博文内容', '<h1>这是博文内容</h1>', 'block.jpg');
INSERT INTO `article` VALUES (10, 21, 'CSS', '利用Sass自动生成padding和margin边距样式', 'Mango', '2019年11月', '2019-11-07 21:23:18', 550, 550, 550, '这是博文内容', '<h1>这是博文内容</h1>', 'block.jpg');
INSERT INTO `article` VALUES (11, 22, 'Bootstrap', 'Bootstrap提取并编译Flexbox Grid系统', 'Mango', '2019年11月', '2019-11-07 21:22:00', 600, 600, 600, '这是博文内容', '<h1>这是博文内容</h1>', 'block.jpg');

-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES (1, '91博客', 'http://www.9191boke.com/');
INSERT INTO `link` VALUES (2, 'Cpphp', 'https://www.3maio.com/');
INSERT INTO `link` VALUES (3, 'Diygod', 'https://diygod.me/');
INSERT INTO `link` VALUES (4, 'Findspace', 'https://www.findhao.net/');
INSERT INTO `link` VALUES (5, 'Higuoxing', 'https://higuoxing.com/');
INSERT INTO `link` VALUES (6, 'it技术社区', 'http://www.51dev.com/');
INSERT INTO `link` VALUES (7, 'jank', 'http://www.jankl.com/');
INSERT INTO `link` VALUES (8, 'Monkey前端博客', 'http://monkeyblog.cn/');
INSERT INTO `link` VALUES (9, 'nopcommerce', 'http://www.urselect.com/?aid=dnk9st');
INSERT INTO `link` VALUES (10, 'Python教程', 'https://www.yuanrenxue.com/');
INSERT INTO `link` VALUES (11, 'Python量化投资', 'http://www.lizenghai.com/');
INSERT INTO `link` VALUES (12, '云立方', 'http://www.yunlifang.cn/?jm');
INSERT INTO `link` VALUES (13, '冰蓝', 'http://lanbing510.info/');
INSERT INTO `link` VALUES (14, '冷月的博客', 'https://lengyue.me/');
INSERT INTO `link` VALUES (15, '千寻啊千寻', 'http://qianxunclub.com/');
INSERT INTO `link` VALUES (16, '可道云', 'http://kodcloud.com/');
INSERT INTO `link` VALUES (17, '坤坤大神', 'http://www.kunkundashen.cn/');
INSERT INTO `link` VALUES (18, '天善智能', 'http://www.hellobi.com/');
INSERT INTO `link` VALUES (19, '岑冲个人博客', 'http://www.cenchong.com/');
INSERT INTO `link` VALUES (20, '开飞机的小蜗牛', 'https://upliu.net/');
INSERT INTO `link` VALUES (21, '张小鸡', 'http://www.zxiaoji.com/');
INSERT INTO `link` VALUES (22, '张弦先生', 'http://www.chrafz.com/');
INSERT INTO `link` VALUES (23, '张志明的个人博客', 'http://www.503error.com/');
INSERT INTO `link` VALUES (24, '方法SEO顾问', 'https://seofangfa.com/');
INSERT INTO `link` VALUES (25, '极客导航', 'http://www.jikedaohang.com/');
INSERT INTO `link` VALUES (26, '汇智网', 'http://www.hubwiz.com/');
INSERT INTO `link` VALUES (27, '江南消夏', 'http://frankchen.xyz/');
INSERT INTO `link` VALUES (28, '泥瓦匠BYSocket', 'http://bysocket.com/');
INSERT INTO `link` VALUES (29, '熊哥club', 'http://www.xiongge.club/');
INSERT INTO `link` VALUES (30, '知语', 'http://zerlong.com/');
INSERT INTO `link` VALUES (31, '码农De边缘世界', 'https://www.binblogs.cn/');
INSERT INTO `link` VALUES (32, '程序员虾说', 'http://ysir308.com/');
INSERT INTO `link` VALUES (33, '程序喵', 'http://ibloger.net/');
INSERT INTO `link` VALUES (34, '红色石头', 'http://redstonewill.com/');
INSERT INTO `link` VALUES (35, '老董博客', 'http://www.laodong.me/');
INSERT INTO `link` VALUES (36, '蓝骑兵', 'http://www.lanqibing.com/');
INSERT INTO `link` VALUES (37, '赵帅的个人博客', 'http://zhaoshuai.me/');
INSERT INTO `link` VALUES (38, '陈文管的博客', 'https://www.chenwenguan.com/');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `belong` int(10) NULL DEFAULT NULL COMMENT '菜单所属父级ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
INSERT INTO `menu` VALUES (12, 'C/CPP', 3);
INSERT INTO `menu` VALUES (13, 'Java', 3);
INSERT INTO `menu` VALUES (14, 'PHP', 3);
INSERT INTO `menu` VALUES (15, 'HTML', 3);
INSERT INTO `menu` VALUES (16, 'Python', 3);
INSERT INTO `menu` VALUES (17, 'JS', 3);
INSERT INTO `menu` VALUES (18, 'Other', 3);
INSERT INTO `menu` VALUES (19, '爬虫', 3);
INSERT INTO `menu` VALUES (20, 'Linux', 3);
INSERT INTO `menu` VALUES (21, 'CSS', 3);
INSERT INTO `menu` VALUES (22, 'Bootstrap', 3);

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
