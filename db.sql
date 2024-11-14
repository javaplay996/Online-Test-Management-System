/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - ssm43131
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm43131` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssm43131`;

/*Table structure for table `banji` */

DROP TABLE IF EXISTS `banji`;

CREATE TABLE `banji` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `banji` varchar(200) NOT NULL COMMENT '班级',
  PRIMARY KEY (`id`),
  UNIQUE KEY `banji` (`banji`)
) ENGINE=InnoDB AUTO_INCREMENT=1620610324280 DEFAULT CHARSET=utf8 COMMENT='班级';

/*Data for the table `banji` */

insert  into `banji`(`id`,`addtime`,`banji`) values (11,'2021-05-10 09:30:52','班级1');
insert  into `banji`(`id`,`addtime`,`banji`) values (12,'2021-05-10 09:30:52','班级2');
insert  into `banji`(`id`,`addtime`,`banji`) values (13,'2021-05-10 09:30:52','班级3');
insert  into `banji`(`id`,`addtime`,`banji`) values (14,'2021-05-10 09:30:52','班级4');
insert  into `banji`(`id`,`addtime`,`banji`) values (15,'2021-05-10 09:30:52','班级5');
insert  into `banji`(`id`,`addtime`,`banji`) values (16,'2021-05-10 09:30:52','班级6');
insert  into `banji`(`id`,`addtime`,`banji`) values (1620610324279,'2021-05-10 09:32:04','土木1902班');

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'picture1','http://localhost:8080/ssm43131/upload/picture1.jpg');
insert  into `config`(`id`,`name`,`value`) values (2,'picture2','http://localhost:8080/ssm43131/upload/picture2.jpg');
insert  into `config`(`id`,`name`,`value`) values (3,'picture3','http://localhost:8080/ssm43131/upload/picture3.jpg');
insert  into `config`(`id`,`name`,`value`) values (6,'homepage',NULL);

/*Table structure for table `exampaper` */

DROP TABLE IF EXISTS `exampaper`;

CREATE TABLE `exampaper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) NOT NULL COMMENT '试卷名称',
  `time` int(11) NOT NULL COMMENT '考试时长(分钟)',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '试卷状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1620610427700 DEFAULT CHARSET=utf8 COMMENT='试卷表';

/*Data for the table `exampaper` */

insert  into `exampaper`(`id`,`addtime`,`name`,`time`,`status`) values (1620610427699,'2021-05-10 09:33:47','高等数学测试-土木1902班',30,1);

/*Table structure for table `examquestion` */

DROP TABLE IF EXISTS `examquestion`;

CREATE TABLE `examquestion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `paperid` bigint(20) NOT NULL COMMENT '所属试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `type` bigint(20) DEFAULT '0' COMMENT '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
  `sequence` bigint(20) DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1620610559544 DEFAULT CHARSET=utf8 COMMENT='试题表';

/*Data for the table `examquestion` */

insert  into `examquestion`(`id`,`addtime`,`paperid`,`papername`,`questionname`,`options`,`score`,`answer`,`analysis`,`type`,`sequence`) values (1620610482494,'2021-05-10 09:34:42',1620610427699,'高等数学测试-土木1902班','10以内的质数有几个','[{\"text\":\"A.2\",\"code\":\"A\"},{\"text\":\"B.3\",\"code\":\"B\"},{\"text\":\"C.4\",\"code\":\"C\"},{\"text\":\"D.5\",\"code\":\"D\"}]',25,'C','FRTRE',0,1);
insert  into `examquestion`(`id`,`addtime`,`paperid`,`papername`,`questionname`,`options`,`score`,`answer`,`analysis`,`type`,`sequence`) values (1620610503490,'2021-05-10 09:35:03',1620610427699,'高等数学测试-土木1902班','10以内的合数有4个','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',25,'B','FRTGRE',2,3);
insert  into `examquestion`(`id`,`addtime`,`paperid`,`papername`,`questionname`,`options`,`score`,`answer`,`analysis`,`type`,`sequence`) values (1620610539869,'2021-05-10 09:35:39',1620610427699,'高等数学测试-土木1902班','10以内的质数有哪些','[{\"text\":\"A.2\",\"code\":\"A\"},{\"text\":\"B.3\",\"code\":\"B\"},{\"text\":\"C.5\",\"code\":\"C\"},{\"text\":\"D.8\",\"code\":\"D\"}]',25,'A,B,C','RTRYTR',1,2);
insert  into `examquestion`(`id`,`addtime`,`paperid`,`papername`,`questionname`,`options`,`score`,`answer`,`analysis`,`type`,`sequence`) values (1620610559543,'2021-05-10 09:35:58',1620610427699,'高等数学测试-土木1902班','10以内的合数有哪些','[]',25,'468910','FSRFRE',3,4);

/*Table structure for table `examrecord` */

DROP TABLE IF EXISTS `examrecord`;

CREATE TABLE `examrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `paperid` bigint(20) NOT NULL COMMENT '试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionid` bigint(20) NOT NULL COMMENT '试题id（外键）',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `myscore` bigint(20) NOT NULL DEFAULT '0' COMMENT '试题得分',
  `myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1620610610054 DEFAULT CHARSET=utf8 COMMENT='考试记录表';

/*Data for the table `examrecord` */

insert  into `examrecord`(`id`,`addtime`,`userid`,`username`,`paperid`,`papername`,`questionid`,`questionname`,`options`,`score`,`answer`,`analysis`,`myscore`,`myanswer`) values (1620610595732,'2021-05-10 09:36:34',1620610339015,NULL,1620610427699,'高等数学测试-土木1902班',1620610482494,'10以内的质数有几个','[{\"text\":\"A.2\",\"code\":\"A\"},{\"text\":\"B.3\",\"code\":\"B\"},{\"text\":\"C.4\",\"code\":\"C\"},{\"text\":\"D.5\",\"code\":\"D\"}]',25,'C','FRTRE',25,'C');
insert  into `examrecord`(`id`,`addtime`,`userid`,`username`,`paperid`,`papername`,`questionid`,`questionname`,`options`,`score`,`answer`,`analysis`,`myscore`,`myanswer`) values (1620610599101,'2021-05-10 09:36:38',1620610339015,NULL,1620610427699,'高等数学测试-土木1902班',1620610539869,'10以内的质数有哪些','[{\"text\":\"A.2\",\"code\":\"A\"},{\"text\":\"B.3\",\"code\":\"B\"},{\"text\":\"C.5\",\"code\":\"C\"},{\"text\":\"D.8\",\"code\":\"D\"}]',25,'A,B,C','RTRYTR',25,'A,B,C');
insert  into `examrecord`(`id`,`addtime`,`userid`,`username`,`paperid`,`papername`,`questionid`,`questionname`,`options`,`score`,`answer`,`analysis`,`myscore`,`myanswer`) values (1620610603468,'2021-05-10 09:36:42',1620610339015,NULL,1620610427699,'高等数学测试-土木1902班',1620610503490,'10以内的合数有4个','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',25,'B','FRTGRE',0,'A');
insert  into `examrecord`(`id`,`addtime`,`userid`,`username`,`paperid`,`papername`,`questionid`,`questionname`,`options`,`score`,`answer`,`analysis`,`myscore`,`myanswer`) values (1620610610053,'2021-05-10 09:36:49',1620610339015,NULL,1620610427699,'高等数学测试-土木1902班',1620610559543,'10以内的合数有哪些','[]',25,'468910','FSRFRE',25,'468910');

/*Table structure for table `jiaoshi` */

DROP TABLE IF EXISTS `jiaoshi`;

CREATE TABLE `jiaoshi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jiaoshigonghao` varchar(200) NOT NULL COMMENT '教师工号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `zhaopian` varchar(200) DEFAULT NULL COMMENT '照片',
  `zhicheng` varchar(200) DEFAULT NULL COMMENT '职称',
  `renjiaokemu` varchar(200) DEFAULT NULL COMMENT '任教科目',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `jiaoshiyouxiang` varchar(200) DEFAULT NULL COMMENT '教师邮箱',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jiaoshigonghao` (`jiaoshigonghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1620610365758 DEFAULT CHARSET=utf8 COMMENT='教师';

/*Data for the table `jiaoshi` */

insert  into `jiaoshi`(`id`,`addtime`,`jiaoshigonghao`,`mima`,`jiaoshixingming`,`xingbie`,`zhaopian`,`zhicheng`,`renjiaokemu`,`lianxidianhua`,`jiaoshiyouxiang`) values (31,'2021-05-10 09:30:52','教师1','123456','教师姓名1','男','http://localhost:8080/ssm43131/upload/jiaoshi_zhaopian1.jpg','职称1','任教科目1','13823888881','773890001@qq.com');
insert  into `jiaoshi`(`id`,`addtime`,`jiaoshigonghao`,`mima`,`jiaoshixingming`,`xingbie`,`zhaopian`,`zhicheng`,`renjiaokemu`,`lianxidianhua`,`jiaoshiyouxiang`) values (32,'2021-05-10 09:30:52','教师2','123456','教师姓名2','男','http://localhost:8080/ssm43131/upload/jiaoshi_zhaopian2.jpg','职称2','任教科目2','13823888882','773890002@qq.com');
insert  into `jiaoshi`(`id`,`addtime`,`jiaoshigonghao`,`mima`,`jiaoshixingming`,`xingbie`,`zhaopian`,`zhicheng`,`renjiaokemu`,`lianxidianhua`,`jiaoshiyouxiang`) values (33,'2021-05-10 09:30:52','教师3','123456','教师姓名3','男','http://localhost:8080/ssm43131/upload/jiaoshi_zhaopian3.jpg','职称3','任教科目3','13823888883','773890003@qq.com');
insert  into `jiaoshi`(`id`,`addtime`,`jiaoshigonghao`,`mima`,`jiaoshixingming`,`xingbie`,`zhaopian`,`zhicheng`,`renjiaokemu`,`lianxidianhua`,`jiaoshiyouxiang`) values (34,'2021-05-10 09:30:52','教师4','123456','教师姓名4','男','http://localhost:8080/ssm43131/upload/jiaoshi_zhaopian4.jpg','职称4','任教科目4','13823888884','773890004@qq.com');
insert  into `jiaoshi`(`id`,`addtime`,`jiaoshigonghao`,`mima`,`jiaoshixingming`,`xingbie`,`zhaopian`,`zhicheng`,`renjiaokemu`,`lianxidianhua`,`jiaoshiyouxiang`) values (35,'2021-05-10 09:30:52','教师5','123456','教师姓名5','男','http://localhost:8080/ssm43131/upload/jiaoshi_zhaopian5.jpg','职称5','任教科目5','13823888885','773890005@qq.com');
insert  into `jiaoshi`(`id`,`addtime`,`jiaoshigonghao`,`mima`,`jiaoshixingming`,`xingbie`,`zhaopian`,`zhicheng`,`renjiaokemu`,`lianxidianhua`,`jiaoshiyouxiang`) values (36,'2021-05-10 09:30:52','教师6','123456','教师姓名6','男','http://localhost:8080/ssm43131/upload/jiaoshi_zhaopian6.jpg','职称6','任教科目6','13823888886','773890006@qq.com');
insert  into `jiaoshi`(`id`,`addtime`,`jiaoshigonghao`,`mima`,`jiaoshixingming`,`xingbie`,`zhaopian`,`zhicheng`,`renjiaokemu`,`lianxidianhua`,`jiaoshiyouxiang`) values (1620610365757,'2021-05-10 09:32:45','2','2','张悦','女','http://localhost:8080/ssm43131/upload/1620610352283.jpg','高级教师','高等数学','12345678978','159@qq.com');

/*Table structure for table `kechengxinxi` */

DROP TABLE IF EXISTS `kechengxinxi`;

CREATE TABLE `kechengxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengmingcheng` varchar(200) NOT NULL COMMENT '课程名称',
  `kechengleixing` varchar(200) DEFAULT NULL COMMENT '课程类型',
  `xueqi` varchar(200) DEFAULT NULL COMMENT '学期',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `xingqi` varchar(200) DEFAULT NULL COMMENT '星期',
  `shangkeshijian` varchar(200) DEFAULT NULL COMMENT '上课时间',
  `jiaoshigonghao` varchar(200) DEFAULT NULL COMMENT '教师工号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1620610396612 DEFAULT CHARSET=utf8 COMMENT='课程信息';

/*Data for the table `kechengxinxi` */

insert  into `kechengxinxi`(`id`,`addtime`,`kechengmingcheng`,`kechengleixing`,`xueqi`,`banji`,`xingqi`,`shangkeshijian`,`jiaoshigonghao`,`jiaoshixingming`) values (41,'2021-05-10 09:30:52','课程名称1','公共课','上学期','班级1','星期一','第一节','教师工号1','教师姓名1');
insert  into `kechengxinxi`(`id`,`addtime`,`kechengmingcheng`,`kechengleixing`,`xueqi`,`banji`,`xingqi`,`shangkeshijian`,`jiaoshigonghao`,`jiaoshixingming`) values (42,'2021-05-10 09:30:52','课程名称2','公共课','上学期','班级2','星期一','第一节','教师工号2','教师姓名2');
insert  into `kechengxinxi`(`id`,`addtime`,`kechengmingcheng`,`kechengleixing`,`xueqi`,`banji`,`xingqi`,`shangkeshijian`,`jiaoshigonghao`,`jiaoshixingming`) values (43,'2021-05-10 09:30:52','课程名称3','公共课','上学期','班级3','星期一','第一节','教师工号3','教师姓名3');
insert  into `kechengxinxi`(`id`,`addtime`,`kechengmingcheng`,`kechengleixing`,`xueqi`,`banji`,`xingqi`,`shangkeshijian`,`jiaoshigonghao`,`jiaoshixingming`) values (44,'2021-05-10 09:30:52','课程名称4','公共课','上学期','班级4','星期一','第一节','教师工号4','教师姓名4');
insert  into `kechengxinxi`(`id`,`addtime`,`kechengmingcheng`,`kechengleixing`,`xueqi`,`banji`,`xingqi`,`shangkeshijian`,`jiaoshigonghao`,`jiaoshixingming`) values (45,'2021-05-10 09:30:52','课程名称5','公共课','上学期','班级5','星期一','第一节','教师工号5','教师姓名5');
insert  into `kechengxinxi`(`id`,`addtime`,`kechengmingcheng`,`kechengleixing`,`xueqi`,`banji`,`xingqi`,`shangkeshijian`,`jiaoshigonghao`,`jiaoshixingming`) values (46,'2021-05-10 09:30:52','课程名称6','公共课','上学期','班级6','星期一','第一节','教师工号6','教师姓名6');
insert  into `kechengxinxi`(`id`,`addtime`,`kechengmingcheng`,`kechengleixing`,`xueqi`,`banji`,`xingqi`,`shangkeshijian`,`jiaoshigonghao`,`jiaoshixingming`) values (1620610383284,'2021-05-10 09:33:02','高等数学','公共课','上学期','土木1902班','星期一','第一节','2','张悦');
insert  into `kechengxinxi`(`id`,`addtime`,`kechengmingcheng`,`kechengleixing`,`xueqi`,`banji`,`xingqi`,`shangkeshijian`,`jiaoshigonghao`,`jiaoshixingming`) values (1620610396611,'2021-05-10 09:33:16','高等数学','公共课','上学期','土木1902班','星期三','第三节','2','张悦');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'abo','users','管理员','ratwbs7hguy9eu5jst6wjec9ooqic6pi','2021-05-10 09:31:53','2021-05-10 10:37:18');
insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (2,1620610365757,'2','jiaoshi','管理员','3ulxcubnj07milvgzch939qhezkej19x','2021-05-10 09:33:22','2021-05-10 10:37:05');
insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (3,1620610339015,'1','xuesheng','学生','75vvqscq7giam6s3jawlgmk7gpzy60ax','2021-05-10 09:36:07','2021-05-10 10:36:08');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'abo','abo','管理员','2021-05-10 09:30:52');

/*Table structure for table `xuesheng` */

DROP TABLE IF EXISTS `xuesheng`;

CREATE TABLE `xuesheng` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xuehao` varchar(200) NOT NULL COMMENT '学号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xueshengxingming` varchar(200) NOT NULL COMMENT '学生姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `touxiang` varchar(200) DEFAULT NULL COMMENT '头像',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`),
  UNIQUE KEY `xuehao` (`xuehao`)
) ENGINE=InnoDB AUTO_INCREMENT=1620610339016 DEFAULT CHARSET=utf8 COMMENT='学生';

/*Data for the table `xuesheng` */

insert  into `xuesheng`(`id`,`addtime`,`xuehao`,`mima`,`xueshengxingming`,`xingbie`,`touxiang`,`banji`,`shouji`,`youxiang`) values (21,'2021-05-10 09:30:52','学生1','123456','学生姓名1','男','http://localhost:8080/ssm43131/upload/xuesheng_touxiang1.jpg','班级1','13823888881','773890001@qq.com');
insert  into `xuesheng`(`id`,`addtime`,`xuehao`,`mima`,`xueshengxingming`,`xingbie`,`touxiang`,`banji`,`shouji`,`youxiang`) values (22,'2021-05-10 09:30:52','学生2','123456','学生姓名2','男','http://localhost:8080/ssm43131/upload/xuesheng_touxiang2.jpg','班级2','13823888882','773890002@qq.com');
insert  into `xuesheng`(`id`,`addtime`,`xuehao`,`mima`,`xueshengxingming`,`xingbie`,`touxiang`,`banji`,`shouji`,`youxiang`) values (23,'2021-05-10 09:30:52','学生3','123456','学生姓名3','男','http://localhost:8080/ssm43131/upload/xuesheng_touxiang3.jpg','班级3','13823888883','773890003@qq.com');
insert  into `xuesheng`(`id`,`addtime`,`xuehao`,`mima`,`xueshengxingming`,`xingbie`,`touxiang`,`banji`,`shouji`,`youxiang`) values (24,'2021-05-10 09:30:52','学生4','123456','学生姓名4','男','http://localhost:8080/ssm43131/upload/xuesheng_touxiang4.jpg','班级4','13823888884','773890004@qq.com');
insert  into `xuesheng`(`id`,`addtime`,`xuehao`,`mima`,`xueshengxingming`,`xingbie`,`touxiang`,`banji`,`shouji`,`youxiang`) values (25,'2021-05-10 09:30:52','学生5','123456','学生姓名5','男','http://localhost:8080/ssm43131/upload/xuesheng_touxiang5.jpg','班级5','13823888885','773890005@qq.com');
insert  into `xuesheng`(`id`,`addtime`,`xuehao`,`mima`,`xueshengxingming`,`xingbie`,`touxiang`,`banji`,`shouji`,`youxiang`) values (26,'2021-05-10 09:30:52','学生6','123456','学生姓名6','男','http://localhost:8080/ssm43131/upload/xuesheng_touxiang6.jpg','班级6','13823888886','773890006@qq.com');
insert  into `xuesheng`(`id`,`addtime`,`xuehao`,`mima`,`xueshengxingming`,`xingbie`,`touxiang`,`banji`,`shouji`,`youxiang`) values (1620610339015,'2021-05-10 09:32:19','1','11','陈一','女','http://localhost:8080/ssm43131/upload/1620610575551.jpg','土木1902班','12345678978','1247@qq.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
