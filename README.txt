数据库：MySQL5.5
连接工具：Navicat
测试数据库名称：blog
测试表名：test
SQL语句：

create database blog default character set utf8;

use blog;

CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `portrait` varchar(255) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

insert into test values(default,"张三","");
insert into test values(default,"李四","");
insert into test values(default,"王五","");

之后的数据库信息附带在blog.sql中
导入方法
如果没有blog数据库则新建，有则跳过这一步
在Navicat中连接上数据库后选中该数据库右键
选择运行SQL文件
在文件中找到blog.sql文件
点击开始即可

博文图片如果显示不全，则现在数据库执行以下语句恢复默认图片
update article set picUri='block.jpg'