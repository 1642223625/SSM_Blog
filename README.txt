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
