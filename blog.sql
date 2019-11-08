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

 Date: 08/11/2019 23:35:16
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
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, 13, 'Java', 'Java从入门到精通', 'Mango', '2019年10月', '2019-10-20 17:00', 62, 12, 19, '这是博文内容', '<h1>标题蚊子</h1><p></p><p><span style=\"font-weight: bold;\">粗体蚊子</span></p><p><span style=\"font-size: xx-large;\">大蚊子</span></p><p><span style=\"font-size: x-small;\">小蚊子</span></p><p><span style=\"font-family: 宋体;\">宋体蚊子</span></p><p><span style=\"font-style: italic;\">斜体蚊子</span></p><p><span style=\"text-decoration-line: underline;\">下划线</span></p><p><span style=\"text-decoration-line: line-through;\">删除线</span></p><p><span style=\"color: rgb(139, 170, 74);\">蚊子颜色</span></p><p><span style=\"background-color: rgb(70, 172, 200);\">蚊子背景</span></p><p><a href=\"https://baike.baidu.com/item/%E8%9A%8A/6996729?fromtitle=%E8%9A%8A%E5%AD%90\" target=\"_blank\">蚊子百科</a></p><ol><li>有序蚊子</li><li>有序蚊子</li></ol><ul><li>无序蚊子</li><li>无序蚊子</li></ul><p></p><blockquote>引用蚊子</blockquote><p style=\"text-align: center;\">网络图片引用<br></p><p style=\"text-align: center;\"><img src=\"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2241344963,3314667459&amp;fm=26&amp;gp=0.jpg\" style=\"max-width:100%;\"><br></p><pre><code>public class Test{<br>    public static void main(String[] args){<br>        System.out.println(\"Hello World!\");<br>    }<br>}</code></pre>', 'block.jpg');
INSERT INTO `article` VALUES (2, 15, 'HTML', 'HTML开发指南', 'Mango', '2019年11月', '2019-11-08 23:34', 42, 35, 63, '这是博文内容', '<h1>标题蚊子</h1><p></p><p><span style=\"font-weight: bold;\">粗体蚊子</span></p><p><span style=\"font-size: xx-large;\">大蚊子</span></p><p><span style=\"font-size: x-small;\">小蚊子</span></p><p><span style=\"font-family: 宋体;\">宋体蚊子</span></p><p><span style=\"font-style: italic;\">斜体蚊子</span></p><p><span style=\"text-decoration-line: underline;\">下划线</span></p><p><span style=\"text-decoration-line: line-through;\">删除线</span></p><p><span style=\"color: rgb(139, 170, 74);\">蚊子颜色</span></p><p><span style=\"background-color: rgb(70, 172, 200);\">蚊子背景</span></p><p><a href=\"https://baike.baidu.com/item/%E8%9A%8A/6996729?fromtitle=%E8%9A%8A%E5%AD%90\" target=\"_blank\">蚊子百科</a></p><ol><li>有序蚊子</li><li>有序蚊子</li></ol><ul><li>无序蚊子</li><li>无序蚊子</li></ul><p></p><blockquote>引用蚊子</blockquote><p style=\"text-align: center;\">网络图片引用<br></p><p style=\"text-align: center;\"><img src=\"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2241344963,3314667459&amp;fm=26&amp;gp=0.jpg\" style=\"max-width:100%;\"><br></p><pre><code>public class Test{<br>    public static void main(String[] args){<br>        System.out.println(\"Hello World!\");<br>    }<br>}</code></pre>', 'block.jpg');
INSERT INTO `article` VALUES (3, 18, 'Other', '知识付费的发展趋势', 'Mango', '2019年10月', '2019-10-10 14:00', 43, 5, 47, '这是博文内容', '<h1>标题蚊子</h1><p></p><p><span style=\"font-weight: bold;\">粗体蚊子</span></p><p><span style=\"font-size: xx-large;\">大蚊子</span></p><p><span style=\"font-size: x-small;\">小蚊子</span></p><p><span style=\"font-family: 宋体;\">宋体蚊子</span></p><p><span style=\"font-style: italic;\">斜体蚊子</span></p><p><span style=\"text-decoration-line: underline;\">下划线</span></p><p><span style=\"text-decoration-line: line-through;\">删除线</span></p><p><span style=\"color: rgb(139, 170, 74);\">蚊子颜色</span></p><p><span style=\"background-color: rgb(70, 172, 200);\">蚊子背景</span></p><p><a href=\"https://baike.baidu.com/item/%E8%9A%8A/6996729?fromtitle=%E8%9A%8A%E5%AD%90\" target=\"_blank\">蚊子百科</a></p><ol><li>有序蚊子</li><li>有序蚊子</li></ol><ul><li>无序蚊子</li><li>无序蚊子</li></ul><p></p><blockquote>引用蚊子</blockquote><p style=\"text-align: center;\">网络图片引用<br></p><p style=\"text-align: center;\"><img src=\"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2241344963,3314667459&amp;fm=26&amp;gp=0.jpg\" style=\"max-width:100%;\"><br></p><pre><code>public class Test{<br>    public static void main(String[] args){<br>        System.out.println(\"Hello World!\");<br>    }<br>}</code></pre>', 'block.jpg');
INSERT INTO `article` VALUES (4, 18, 'Other', '谈一谈博客的关注解锁文章功能', 'Mango', '2019年09月', '2019-11-07 16:13', 37, 15, 25, '这是博文内容', '<h1>标题蚊子</h1><p></p><p><span style=\"font-weight: bold;\">粗体蚊子</span></p><p><span style=\"font-size: xx-large;\">大蚊子</span></p><p><span style=\"font-size: x-small;\">小蚊子</span></p><p><span style=\"font-family: 宋体;\">宋体蚊子</span></p><p><span style=\"font-style: italic;\">斜体蚊子</span></p><p><span style=\"text-decoration-line: underline;\">下划线</span></p><p><span style=\"text-decoration-line: line-through;\">删除线</span></p><p><span style=\"color: rgb(139, 170, 74);\">蚊子颜色</span></p><p><span style=\"background-color: rgb(70, 172, 200);\">蚊子背景</span></p><p><a href=\"https://baike.baidu.com/item/%E8%9A%8A/6996729?fromtitle=%E8%9A%8A%E5%AD%90\" target=\"_blank\">蚊子百科</a></p><ol><li>有序蚊子</li><li>有序蚊子</li></ol><ul><li>无序蚊子</li><li>无序蚊子</li></ul><p></p><blockquote>引用蚊子</blockquote><p style=\"text-align: center;\">网络图片引用<br></p><p style=\"text-align: center;\"><img src=\"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2241344963,3314667459&amp;fm=26&amp;gp=0.jpg\" style=\"max-width:100%;\"><br></p><pre><code>public class Test{<br>    public static void main(String[] args){<br>        System.out.println(\"Hello World!\");<br>    }<br>}</code></pre>', 'block.jpg');
INSERT INTO `article` VALUES (5, 16, 'Python', 'ADSL 拨号代理', 'Mango', '2019年10月', '2019-10-20 13:30', 43, 14, 65, '这是博文内容', '<h1>标题蚊子</h1><p></p><p><span style=\"font-weight: bold;\">粗体蚊子</span></p><p><span style=\"font-size: xx-large;\">大蚊子</span></p><p><span style=\"font-size: x-small;\">小蚊子</span></p><p><span style=\"font-family: 宋体;\">宋体蚊子</span></p><p><span style=\"font-style: italic;\">斜体蚊子</span></p><p><span style=\"text-decoration-line: underline;\">下划线</span></p><p><span style=\"text-decoration-line: line-through;\">删除线</span></p><p><span style=\"color: rgb(139, 170, 74);\">蚊子颜色</span></p><p><span style=\"background-color: rgb(70, 172, 200);\">蚊子背景</span></p><p><a href=\"https://baike.baidu.com/item/%E8%9A%8A/6996729?fromtitle=%E8%9A%8A%E5%AD%90\" target=\"_blank\">蚊子百科</a></p><ol><li>有序蚊子</li><li>有序蚊子</li></ol><ul><li>无序蚊子</li><li>无序蚊子</li></ul><p></p><blockquote>引用蚊子</blockquote><p style=\"text-align: center;\">网络图片引用<br></p><p style=\"text-align: center;\"><img src=\"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2241344963,3314667459&amp;fm=26&amp;gp=0.jpg\" style=\"max-width:100%;\"><br></p><pre><code>public class Test{<br>    public static void main(String[] args){<br>        System.out.println(\"Hello World!\");<br>    }<br>}</code></pre>', 'block.jpg');
INSERT INTO `article` VALUES (6, 19, '爬虫', '爬虫工程师最想要的JS逆向教程', 'Mango', '2019年11月', '2019-11-08 23:22', 32, 8, 13, '这是博文内容', '<h1>标题蚊子</h1><p></p><p><span style=\"font-weight: bold;\">粗体蚊子</span></p><p><span style=\"font-size: xx-large;\">大蚊子</span></p><p><span style=\"font-size: x-small;\">小蚊子</span></p><p><span style=\"font-family: 宋体;\">宋体蚊子</span></p><p><span style=\"font-style: italic;\">斜体蚊子</span></p><p><span style=\"text-decoration-line: underline;\">下划线</span></p><p><span style=\"text-decoration-line: line-through;\">删除线</span></p><p><span style=\"color: rgb(139, 170, 74);\">蚊子颜色</span></p><p><span style=\"background-color: rgb(70, 172, 200);\">蚊子背景</span></p><p><a href=\"https://baike.baidu.com/item/%E8%9A%8A/6996729?fromtitle=%E8%9A%8A%E5%AD%90\" target=\"_blank\">蚊子百科</a></p><ol><li>有序蚊子</li><li>有序蚊子</li></ol><ul><li>无序蚊子</li><li>无序蚊子</li></ul><p></p><blockquote>引用蚊子</blockquote><p style=\"text-align: center;\">网络图片引用<br></p><p style=\"text-align: center;\"><img src=\"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2241344963,3314667459&amp;fm=26&amp;gp=0.jpg\" style=\"max-width:100%;\"><br></p><pre><code>public class Test{<br>    public static void main(String[] args){<br>        System.out.println(\"Hello World!\");<br>    }<br>}</code></pre>', 'block.jpg');
INSERT INTO `article` VALUES (7, 12, 'C/CPP', 'OpenGL绘图学习总结', 'Mango', '2016年02月', '2016-02-11 21:00', 23, 5, 75, '这是博文内容', '<h1>标题蚊子</h1><p></p><p><span style=\"font-weight: bold;\">粗体蚊子</span></p><p><span style=\"font-size: xx-large;\">大蚊子</span></p><p><span style=\"font-size: x-small;\">小蚊子</span></p><p><span style=\"font-family: 宋体;\">宋体蚊子</span></p><p><span style=\"font-style: italic;\">斜体蚊子</span></p><p><span style=\"text-decoration-line: underline;\">下划线</span></p><p><span style=\"text-decoration-line: line-through;\">删除线</span></p><p><span style=\"color: rgb(139, 170, 74);\">蚊子颜色</span></p><p><span style=\"background-color: rgb(70, 172, 200);\">蚊子背景</span></p><p><a href=\"https://baike.baidu.com/item/%E8%9A%8A/6996729?fromtitle=%E8%9A%8A%E5%AD%90\" target=\"_blank\">蚊子百科</a></p><ol><li>有序蚊子</li><li>有序蚊子</li></ol><ul><li>无序蚊子</li><li>无序蚊子</li></ul><p></p><blockquote>引用蚊子</blockquote><p style=\"text-align: center;\">网络图片引用<br></p><p style=\"text-align: center;\"><img src=\"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2241344963,3314667459&amp;fm=26&amp;gp=0.jpg\" style=\"max-width:100%;\"><br></p><pre><code>public class Test{<br>    public static void main(String[] args){<br>        System.out.println(\"Hello World!\");<br>    }<br>}</code></pre>', 'block.jpg');
INSERT INTO `article` VALUES (8, 14, 'PHP', 'WordPress远程附件上传', 'Mango', '2017年03月', '2017-03-12 08:00', 15, 40, 8, '这是博文内容', '<h1>标题蚊子</h1><p></p><p><span style=\"font-weight: bold;\">粗体蚊子</span></p><p><span style=\"font-size: xx-large;\">大蚊子</span></p><p><span style=\"font-size: x-small;\">小蚊子</span></p><p><span style=\"font-family: 宋体;\">宋体蚊子</span></p><p><span style=\"font-style: italic;\">斜体蚊子</span></p><p><span style=\"text-decoration-line: underline;\">下划线</span></p><p><span style=\"text-decoration-line: line-through;\">删除线</span></p><p><span style=\"color: rgb(139, 170, 74);\">蚊子颜色</span></p><p><span style=\"background-color: rgb(70, 172, 200);\">蚊子背景</span></p><p><a href=\"https://baike.baidu.com/item/%E8%9A%8A/6996729?fromtitle=%E8%9A%8A%E5%AD%90\" target=\"_blank\">蚊子百科</a></p><ol><li>有序蚊子</li><li>有序蚊子</li></ol><ul><li>无序蚊子</li><li>无序蚊子</li></ul><p></p><blockquote>引用蚊子</blockquote><p style=\"text-align: center;\">网络图片引用<br></p><p style=\"text-align: center;\"><img src=\"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2241344963,3314667459&amp;fm=26&amp;gp=0.jpg\" style=\"max-width:100%;\"><br></p><pre><code>public class Test{<br>    public static void main(String[] args){<br>        System.out.println(\"Hello World!\");<br>    }<br>}</code></pre>', 'block.jpg');
INSERT INTO `article` VALUES (9, 20, 'Linux', '关于Ubuntu开机问题', 'Mango', '2019年11月', '2019-11-07 23:16', 18, 2, 56, '这是博文内容', '<h1>标题蚊子</h1><p></p><p><span style=\"font-weight: bold;\">粗体蚊子</span></p><p><span style=\"font-size: xx-large;\">大蚊子</span></p><p><span style=\"font-size: x-small;\">小蚊子</span></p><p><span style=\"font-family: 宋体;\">宋体蚊子</span></p><p><span style=\"font-style: italic;\">斜体蚊子</span></p><p><span style=\"text-decoration-line: underline;\">下划线</span></p><p><span style=\"text-decoration-line: line-through;\">删除线</span></p><p><span style=\"color: rgb(139, 170, 74);\">蚊子颜色</span></p><p><span style=\"background-color: rgb(70, 172, 200);\">蚊子背景</span></p><p><a href=\"https://baike.baidu.com/item/%E8%9A%8A/6996729?fromtitle=%E8%9A%8A%E5%AD%90\" target=\"_blank\">蚊子百科</a></p><ol><li>有序蚊子</li><li>有序蚊子</li></ol><ul><li>无序蚊子</li><li>无序蚊子</li></ul><p></p><blockquote>引用蚊子</blockquote><p style=\"text-align: center;\">网络图片引用<br></p><p style=\"text-align: center;\"><img src=\"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2241344963,3314667459&amp;fm=26&amp;gp=0.jpg\" style=\"max-width:100%;\"><br></p><pre><code>public class Test{<br>    public static void main(String[] args){<br>        System.out.println(\"Hello World!\");<br>    }<br>}</code></pre>', 'block.jpg');
INSERT INTO `article` VALUES (10, 21, 'CSS', '利用Sass自动生成padding和margin边距样式', 'Mango', '2019年11月', '2019-11-07 21:23', 85, 35, 10, '这是博文内容', '<h1>标题蚊子</h1><p></p><p><span style=\"font-weight: bold;\">粗体蚊子</span></p><p><span style=\"font-size: xx-large;\">大蚊子</span></p><p><span style=\"font-size: x-small;\">小蚊子</span></p><p><span style=\"font-family: 宋体;\">宋体蚊子</span></p><p><span style=\"font-style: italic;\">斜体蚊子</span></p><p><span style=\"text-decoration-line: underline;\">下划线</span></p><p><span style=\"text-decoration-line: line-through;\">删除线</span></p><p><span style=\"color: rgb(139, 170, 74);\">蚊子颜色</span></p><p><span style=\"background-color: rgb(70, 172, 200);\">蚊子背景</span></p><p><a href=\"https://baike.baidu.com/item/%E8%9A%8A/6996729?fromtitle=%E8%9A%8A%E5%AD%90\" target=\"_blank\">蚊子百科</a></p><ol><li>有序蚊子</li><li>有序蚊子</li></ol><ul><li>无序蚊子</li><li>无序蚊子</li></ul><p></p><blockquote>引用蚊子</blockquote><p style=\"text-align: center;\">网络图片引用<br></p><p style=\"text-align: center;\"><img src=\"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2241344963,3314667459&amp;fm=26&amp;gp=0.jpg\" style=\"max-width:100%;\"><br></p><pre><code>public class Test{<br>    public static void main(String[] args){<br>        System.out.println(\"Hello World!\");<br>    }<br>}</code></pre>', 'block.jpg');
INSERT INTO `article` VALUES (11, 22, 'Bootstrap', 'Bootstrap提取并编译Flexbox Grid系统', 'Mango', '2019年11月', '2019-11-08 09:50', 36, 11, 25, '这是博文内容', '<h1>标题蚊子</h1><p></p><p><span style=\"font-weight: bold;\">粗体蚊子</span></p><p><span style=\"font-size: xx-large;\">大蚊子</span></p><p><span style=\"font-size: x-small;\">小蚊子</span></p><p><span style=\"font-family: 宋体;\">宋体蚊子</span></p><p><span style=\"font-style: italic;\">斜体蚊子</span></p><p><span style=\"text-decoration-line: underline;\">下划线</span></p><p><span style=\"text-decoration-line: line-through;\">删除线</span></p><p><span style=\"color: rgb(139, 170, 74);\">蚊子颜色</span></p><p><span style=\"background-color: rgb(70, 172, 200);\">蚊子背景</span></p><p><a href=\"https://baike.baidu.com/item/%E8%9A%8A/6996729?fromtitle=%E8%9A%8A%E5%AD%90\" target=\"_blank\">蚊子百科</a></p><ol><li>有序蚊子</li><li>有序蚊子</li></ol><ul><li>无序蚊子</li><li>无序蚊子</li></ul><p></p><blockquote>引用蚊子</blockquote><p style=\"text-align: center;\">网络图片引用<br></p><p style=\"text-align: center;\"><img src=\"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2241344963,3314667459&amp;fm=26&amp;gp=0.jpg\" style=\"max-width:100%;\"><br></p><pre><code>public class Test{<br>    public static void main(String[] args){<br>        System.out.println(\"Hello World!\");<br>    }<br>}</code></pre>', 'block.jpg');
INSERT INTO `article` VALUES (12, 19, '爬虫', '使用代理爬取微信公众号文章', 'Mango', '2019年11月', '2019-11-08 13:38', 31, 0, 15, '爬虫内容简介', '<h1>标题蚊子</h1><p></p><p><span style=\"font-weight: bold;\">粗体蚊子</span></p><p><span style=\"font-size: xx-large;\">大蚊子</span></p><p><span style=\"font-size: x-small;\">小蚊子</span></p><p><span style=\"font-family: 宋体;\">宋体蚊子</span></p><p><span style=\"font-style: italic;\">斜体蚊子</span></p><p><span style=\"text-decoration-line: underline;\">下划线</span></p><p><span style=\"text-decoration-line: line-through;\">删除线</span></p><p><span style=\"color: rgb(139, 170, 74);\">蚊子颜色</span></p><p><span style=\"background-color: rgb(70, 172, 200);\">蚊子背景</span></p><p><a href=\"https://baike.baidu.com/item/%E8%9A%8A/6996729?fromtitle=%E8%9A%8A%E5%AD%90\" target=\"_blank\">蚊子百科</a></p><ol><li>有序蚊子</li><li>有序蚊子</li></ol><ul><li>无序蚊子</li><li>无序蚊子</li></ul><p></p><blockquote>引用蚊子</blockquote><p style=\"text-align: center;\">网络图片引用<br></p><p style=\"text-align: center;\"><img src=\"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2241344963,3314667459&amp;fm=26&amp;gp=0.jpg\" style=\"max-width:100%;\"><br></p><pre><code>public class Test{<br>    public static void main(String[] args){<br>        System.out.println(\"Hello World!\");<br>    }<br>}</code></pre>', 'block.jpg');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论日期',
  `contact` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `article_id` int(10) NULL DEFAULT NULL COMMENT '关联文章id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 183 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 1);
INSERT INTO `comment` VALUES (2, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 1);
INSERT INTO `comment` VALUES (3, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 1);
INSERT INTO `comment` VALUES (4, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 1);
INSERT INTO `comment` VALUES (5, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 1);
INSERT INTO `comment` VALUES (6, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 1);
INSERT INTO `comment` VALUES (7, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 1);
INSERT INTO `comment` VALUES (8, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 1);
INSERT INTO `comment` VALUES (9, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 1);
INSERT INTO `comment` VALUES (10, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 1);
INSERT INTO `comment` VALUES (11, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 1);
INSERT INTO `comment` VALUES (12, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 1);
INSERT INTO `comment` VALUES (13, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (14, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (15, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (16, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (17, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (18, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (19, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (20, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (21, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (22, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (23, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (24, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (25, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (26, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (27, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (28, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (29, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (30, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (31, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (32, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (33, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (34, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (35, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (36, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (37, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (38, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (39, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (40, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (41, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (42, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (43, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (44, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (45, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (46, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (47, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 2);
INSERT INTO `comment` VALUES (48, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 3);
INSERT INTO `comment` VALUES (49, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 3);
INSERT INTO `comment` VALUES (50, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 3);
INSERT INTO `comment` VALUES (51, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 3);
INSERT INTO `comment` VALUES (52, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 3);
INSERT INTO `comment` VALUES (53, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 4);
INSERT INTO `comment` VALUES (54, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 4);
INSERT INTO `comment` VALUES (55, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 4);
INSERT INTO `comment` VALUES (56, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 4);
INSERT INTO `comment` VALUES (57, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 4);
INSERT INTO `comment` VALUES (58, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 4);
INSERT INTO `comment` VALUES (59, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 4);
INSERT INTO `comment` VALUES (60, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 4);
INSERT INTO `comment` VALUES (61, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 4);
INSERT INTO `comment` VALUES (62, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 4);
INSERT INTO `comment` VALUES (63, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 4);
INSERT INTO `comment` VALUES (64, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 4);
INSERT INTO `comment` VALUES (65, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 4);
INSERT INTO `comment` VALUES (66, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 4);
INSERT INTO `comment` VALUES (67, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 4);
INSERT INTO `comment` VALUES (68, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 5);
INSERT INTO `comment` VALUES (69, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 5);
INSERT INTO `comment` VALUES (70, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 5);
INSERT INTO `comment` VALUES (71, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 5);
INSERT INTO `comment` VALUES (72, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 5);
INSERT INTO `comment` VALUES (73, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 5);
INSERT INTO `comment` VALUES (74, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 5);
INSERT INTO `comment` VALUES (75, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 5);
INSERT INTO `comment` VALUES (76, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 5);
INSERT INTO `comment` VALUES (77, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 5);
INSERT INTO `comment` VALUES (78, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 5);
INSERT INTO `comment` VALUES (79, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 5);
INSERT INTO `comment` VALUES (80, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 5);
INSERT INTO `comment` VALUES (81, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 5);
INSERT INTO `comment` VALUES (82, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 6);
INSERT INTO `comment` VALUES (83, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 6);
INSERT INTO `comment` VALUES (84, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 6);
INSERT INTO `comment` VALUES (85, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 6);
INSERT INTO `comment` VALUES (86, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 6);
INSERT INTO `comment` VALUES (87, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 6);
INSERT INTO `comment` VALUES (88, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 6);
INSERT INTO `comment` VALUES (89, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 6);
INSERT INTO `comment` VALUES (90, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 7);
INSERT INTO `comment` VALUES (91, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 7);
INSERT INTO `comment` VALUES (92, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 7);
INSERT INTO `comment` VALUES (93, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 7);
INSERT INTO `comment` VALUES (94, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 7);
INSERT INTO `comment` VALUES (95, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (96, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (97, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (98, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (99, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (100, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (101, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (102, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (103, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (104, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (105, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (106, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (107, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (108, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (109, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (110, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (111, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (112, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (113, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (114, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (115, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (116, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (117, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (118, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (119, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (120, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (121, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (122, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (123, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (124, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (125, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (126, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (127, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (128, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (129, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (130, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (131, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (132, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (133, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (134, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 8);
INSERT INTO `comment` VALUES (135, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 9);
INSERT INTO `comment` VALUES (136, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 9);
INSERT INTO `comment` VALUES (137, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (138, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (139, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (140, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (141, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (142, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (143, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (144, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (145, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (146, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (147, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (148, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (149, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (150, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (151, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (152, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (153, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (154, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (155, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (156, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (157, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (158, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (159, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (160, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (161, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (162, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (163, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (164, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (165, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (166, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (167, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (168, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (169, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (170, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (171, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 10);
INSERT INTO `comment` VALUES (172, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 11);
INSERT INTO `comment` VALUES (173, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 11);
INSERT INTO `comment` VALUES (174, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 11);
INSERT INTO `comment` VALUES (175, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 11);
INSERT INTO `comment` VALUES (176, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 11);
INSERT INTO `comment` VALUES (177, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 11);
INSERT INTO `comment` VALUES (178, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 11);
INSERT INTO `comment` VALUES (179, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 11);
INSERT INTO `comment` VALUES (180, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 11);
INSERT INTO `comment` VALUES (181, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 11);
INSERT INTO `comment` VALUES (182, '博主讲的真棒', '2019-11-08 10:00', 'QQ:1642223625', 11);

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
