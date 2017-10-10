/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : meijia

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-10-10 15:58:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for mj_about
-- ----------------------------
DROP TABLE IF EXISTS `mj_about`;
CREATE TABLE `mj_about` (
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `time` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mj_about
-- ----------------------------

-- ----------------------------
-- Table structure for mj_admin
-- ----------------------------
DROP TABLE IF EXISTS `mj_admin`;
CREATE TABLE `mj_admin` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `name` varchar(30) NOT NULL COMMENT '管理员名称',
  `password` char(32) NOT NULL COMMENT '管理员密码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mj_admin
-- ----------------------------
INSERT INTO `mj_admin` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3');
INSERT INTO `mj_admin` VALUES ('3', 'sa', 'c12e01f2a13ff5587e1e9e4aedb8242d');

-- ----------------------------
-- Table structure for mj_article
-- ----------------------------
DROP TABLE IF EXISTS `mj_article`;
CREATE TABLE `mj_article` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `title` varchar(60) NOT NULL COMMENT '文章标题',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `desc` varchar(255) NOT NULL COMMENT '描述',
  `author` varchar(30) NOT NULL COMMENT '作者',
  `thumb` varchar(160) DEFAULT '' COMMENT '缩略图',
  `content` text NOT NULL COMMENT '内容',
  `click` mediumint(9) NOT NULL DEFAULT '0' COMMENT '点击数',
  `zan` mediumint(9) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `rec` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:不推荐 1：推荐',
  `time` int(10) NOT NULL COMMENT '发布时间',
  `cateid` mediumint(9) NOT NULL COMMENT '所属栏目',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mj_article
-- ----------------------------
INSERT INTO `mj_article` VALUES ('1', '睫毛嫁接', '', '', '', 'public\\uploads/20171007\\db58f8e60329f5fd97660a0e9d4337d9.jpg', '<p></p><p><article><p>服务时间：60-120分钟<br/>建议保养周期：15-20天<br/>建议新做周期：1个月<br/>产品品牌：美国Lash Be Long</p></article></p><p></p><p><br/></p>', '0', '2', '0', '1507366405', '3');
INSERT INTO `mj_article` VALUES ('2', '法国LaJosee火山泥保湿皮肤护理', '', '', '', 'public\\uploads/20171007\\ae5ca354cf9bfe897af338a403fe10a7.jpg', '<p>服务时间：40-60分钟<br/>建议保养周期：7-10天<br/>建议新做周期：半个月<br/>产品品牌：法国LaJosee</p><p><article></article></p><p></p><p><br/></p>', '0', '0', '0', '1507366541', '1');
INSERT INTO `mj_article` VALUES ('3', '法国LaJosee有机澡胆素补水精华皮肤护理', '', '', '', 'public\\uploads/20171007\\4ebc3acc723bead74b60a0fefd191d2d.jpg', '<p>服务时间：40-60分钟<br/>建议保养周期：7-10天<br/>建议新做周期：半个月<br/>产品品牌：法国LaJosee</p>', '0', '0', '1', '1507514590', '1');
INSERT INTO `mj_article` VALUES ('4', 'LCN手足皮肤护理', '', '', '', 'public\\uploads/20171007\\9918e73519fc939c9517bf213bb25530.jpg', '<p>服务时间：90-120分钟<br/>建议保养周期：7-0天<br/>建议新做周期：1个月<br/>产品品牌：德国LCN</p>', '0', '0', '1', '1507514544', '1');
INSERT INTO `mj_article` VALUES ('5', '光疗甲', '', '', '', 'public\\uploads/20171007\\c63a19053cdb17e31517314bf0db9d61.jpg', '<p>服务时间：120-150分钟<br/>建议保养周期：15-21天<br/>建议新做周期：2-3个月<br/>产品品牌：美国OPI &amp; Ezflow</p>', '0', '0', '0', '1507366740', '1');
INSERT INTO `mj_article` VALUES ('6', '水晶甲', '', '', '', 'public\\uploads/20171007\\7eef9b9af6f3ed898bb5e63e09db1cf3.jpg', '<p>服务时间：100-120分钟<br/>建议保养周期：15-21天<br/>建议新做周期：2-3个月<br/>产品品牌：美国OPI &amp; Ezflow</p>', '0', '0', '1', '1507514571', '1');
INSERT INTO `mj_article` VALUES ('7', '做光疗胶的时候怎样才能避免出现这4个问题！', '', '', '', 'public\\uploads/20171007\\e84d7c45eeea4157a257de4ae99fb1d6.jpg', '<p>做光疗甲的时候需要注意哪些小问题呢？美甲培训学校的小编现在来告诉你们做光疗甲的时候如何才能避免出现这几个问题！<br/></p><p>1、皮肤出现刺痛<br/>有时候有些朋友们涂了光疗胶之后会有一种不适感，这很有可能是因为光疗胶涂到了指甲上了，也有可能是光疗胶涂得太厚了，因为光疗胶聚合的时候会释放热量，所以在涂光疗胶的时候要涂得薄又均匀。<br/><br/>2、光疗后指甲色彩暗淡<br/>涂完光疗胶之后发现指甲的表面浮胶过多，那是因为清洗的方法不当或者你在清洗的时候没有采用专业清洁剂导致的，所以我在清洗指甲的时候可以轻拍少许清洁剂在指甲黏胶表面，等溶解之后在擦除即可。<br/><br/>3、脆裂<br/>光疗胶在操作的时候温度可以控制在20℃左右，如果温度过高或者过低都有可能导致脆裂的原因。还有，光疗胶如果涂抹的厚度不够也会导致指甲脆裂，所以美甲加盟建议大家可以多涂几层，并且每一层都要涂均匀。<br/><br/>4、光疗笔硬结<br/>光疗笔使用完后，必须要用纸巾将光疗笔的刷头擦干净。<br/><br/>以上是美甲培训给大家讲的有关做光疗胶的时候怎样才能避免出现这4个问题的详情，希望对大家有帮助！</p><p><br/></p>', '0', '2', '1', '1507514557', '6');
INSERT INTO `mj_article` VALUES ('8', '个性时尚羽毛美甲教程', '', '', '', '', '<p><span style=\"\"><span style=\"font-family:&amp;quot\"><span style=\"\">羽毛,承载着飞翔的理想。那么，羽毛和美甲碰撞到一起会产生怎样的视觉效果呢？是惊艳，还是轻盈？赶紧随厦门沐上化妆美甲学校的小编一起来学习吧，将飞翔的理想印刻于指尖。</span></span></span><img id=\"aimg_eB7DM\" class=\"zoom\" src=\"http://www.mushang198.com/Uploads/201709/59b88a70b9008.jpg\" alt=\"\"/><br/><span style=\"color:#333333\"><span style=\"font-family:&amp;quot\"><span style=\"\">第一步，指甲清洁后，先上底油，再分别涂黑白双色甲油。下笔要快，尽量在指甲油干透前调匀色彩。为了保证色彩的饱和度，每一个都要涂两遍。</span></span></span><br/><span style=\"color:#333333\"><span style=\"font-family:&amp;quot\"><span style=\"\">第二步，用小号的美甲刷蘸取白色的甲油，在指甲上轻轻描上羽毛的主心轴。</span></span></span><br/><img id=\"aimg_IQbDS\" class=\"zoom\" src=\"http://www.mushang198.com/Uploads/201709/59b88a71d7be8.jpg\" alt=\"\"/><br/><span style=\"color:#333333\"><span style=\"font-family:&amp;quot\"><span style=\"\">第三步，开始描绘羽毛，不要操之过急，要慢慢画，才能做出效果。</span></span></span><br/><span style=\"color:#333333\"><span style=\"font-family:&amp;quot\"><span style=\"\">第四步，羽毛的颜色要淡于主心轴，这样才能勾勒出效果。完成一点了，效果还可以哦!</span></span></span><br/><img id=\"aimg_e2J53\" class=\"zoom\" src=\"http://www.mushang198.com/Uploads/201709/59b88a7230c67.jpg\" alt=\"\"/><br/><span style=\"color:#333333\"><span style=\"font-family:&amp;quot\"><span style=\"\">第五步，完成一个指甲了。怎么样，还可以吧！带有中国风，很有格调的一款美甲。</span></span></span><br/><span style=\"color:#333333\"><span style=\"font-family:&amp;quot\"><span style=\"\">第六步，同理，在黑色甲面上，DIY羽毛造型。熟能生巧，多试几次效果会更好的。</span></span></span><br/><img id=\"aimg_qBmJ0\" class=\"zoom\" src=\"http://www.mushang198.com/Uploads/201709/59b88a7284fc4.jpg\" alt=\"\"/><br/><span style=\"color:#333333\"><span style=\"font-family:&amp;quot\"><span style=\"\">第七步，完成了羽毛部分，就再继续DIY棱形，要迷你型的哦!</span></span></span><br/><span style=\"color:#333333\"><span style=\"font-family:&amp;quot\"><span style=\"\">第八步，把棱形延伸开，“十字架”就完成了。</span></span></span><br/></p><p><span style=\"\"><span style=\"font-family:&amp;quot\"><span style=\"\"><img id=\"aimg_S5hHk\" class=\"zoom\" src=\"http://www.mushang198.com/Uploads/201709/59b88a72c95fc.jpg\" alt=\"\"/></span></span></span></p><p><span style=\"color:#333333\"><span style=\"font-family:&amp;quot\"><span style=\"\">第九步，同理地，在白色的甲面上，DIY黑色羽毛和“十字架”。</span></span></span><br/><span style=\"color:#333333\"><span style=\"font-family:&amp;quot\"><span style=\"\">第十步，涂上一层亮甲油，整个美甲教程就基本结束了。</span></span></span><br/><img id=\"aimg_IC651\" class=\"zoom\" src=\"http://www.mushang198.com/Uploads/201709/59b88a731e3fb.jpg\" alt=\"\"/><br/><span style=\"color:#333333\"><span style=\"font-family:&amp;quot\"><span style=\"\">第十一步，觉得不够抢眼的MM们，还可以继续DIY美甲。不过，要先选好适合的水钻。</span></span></span><br/></p><p><span style=\"\"><span style=\"font-family:&amp;quot\"><span style=\"\">第十二步，终于完成了，喜欢吗?个性时尚，赶紧试试吧。</span></span></span></p><p><br/></p>', '0', '0', '0', '1507367602', '2');
INSERT INTO `mj_article` VALUES ('9', '冰淇淋般甜美可口的法式美甲，忍不住想咬一口', '', '', '', '', '<p><span style=\"color:#333333\"><span style=\"font-family:&amp;quot\"><span style=\"\">只要有想法、肯动手，你的指尖总能美出无限种可能。自己动手DIY美甲，让你的指尖不再千篇一律。今天厦门沐上化妆美甲学校的小编就给大家分享一款甜美范儿美甲，冰淇淋般的色彩搭配展现在指尖上，让人眼前一亮，举手投足间就为自己赢得了好感。</span></span></span><br/><img id=\"aimg_GAE5V\" class=\"zoom\" src=\"http://www.mushang198.com/Uploads/201709/59b1f41906401.jpg\" alt=\"\" width=\"555\" height=\"299\"/><br/><span style=\"color:#333333\"><span style=\"font-family:&amp;quot\"><span style=\"\">Step 1：给指甲涂上粉色指甲油，等第一遍干后可以再涂一遍，涂两遍颜色看起来会更加饱满。</span></span></span><br/><img id=\"aimg_U6rZc\" class=\"zoom\" src=\"http://www.mushang198.com/Uploads/201709/59b1f41942fbb.jpg\" alt=\"\" width=\"555\" height=\"311\"/><br/><span style=\"color:#333333\"><span style=\"font-family:&amp;quot\"><span style=\"\">Step 2：用半圆形的法式贴纸沿着指甲的微笑线位置贴好。</span></span></span><br/></p><p><span style=\"\"><span style=\"font-family:&amp;quot\"><span style=\"\"><img id=\"aimg_WZ2wF\" class=\"zoom\" src=\"http://www.mushang198.com/Uploads/201709/59b1f4198cb01.jpg\" alt=\"\" width=\"555\" height=\"296\"/></span></span></span></p><p><span style=\"color:#333333\"><span style=\"font-family:&amp;quot\"><span style=\"\">Step 3：用玫瑰金色珠光甲油沿着法式贴纸在指甲涂好，待指甲油半干后用镊子将贴纸小心揭下。</span></span></span><br/><img id=\"aimg_acvD7\" class=\"zoom\" src=\"http://www.mushang198.com/Uploads/201709/59b1f419cc6f2.jpg\" alt=\"\" width=\"555\" height=\"298\"/><br/><span style=\"color:#333333\"><span style=\"font-family:&amp;quot\"><span style=\"\">Step 4：用勾花笔沾取奶白色指甲油在指甲根部画一个橄榄形的月牙。</span></span></span><br/><img id=\"aimg_kACrF\" class=\"zoom\" src=\"http://www.mushang198.com/Uploads/201709/59b1f41a1fc9f.jpg\" alt=\"\" width=\"550\" height=\"479\"/><br/></p><p><span style=\"\"><span style=\"font-family:&amp;quot\"><span style=\"\">玫瑰金色的点缀为指甲更添质感。</span></span></span></p><p><br/></p>', '0', '0', '0', '1507367583', '2');
INSERT INTO `mj_article` VALUES ('10', '关于我', '', '', '罗秋洒', '', '<p>本博客系统采用原生PHP+MYSQL语言开发</p><p style=\"font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;默认登录账号：admin &nbsp;密码：admin</p><h2>个人介绍 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</h2><p style=\"font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;罗秋洒，女，现就读于广东工业大学计算机科学与技术专业</p><h2>我的开源项目 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</h2><p style=\"font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;邮箱：18813293912@163.com</p><p style=\"font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;GitHub:https：//github.com/yololololo</p><h2>我的联系方式 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</h2><p style=\"font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;邮箱：18813293912@163.com</p><p style=\"font-size: 14px;\">&nbsp;&nbsp;&nbsp;&nbsp;GitHub:https：//github.com/yololololo</p><p><br/></p>', '0', '0', '0', '1507511374', '7');

-- ----------------------------
-- Table structure for mj_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `mj_auth_group`;
CREATE TABLE `mj_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mj_auth_group
-- ----------------------------
INSERT INTO `mj_auth_group` VALUES ('1', '超级管理员', '1', '1,2,3,4,5');
INSERT INTO `mj_auth_group` VALUES ('2', '普通管理员', '1', '1,2,3');

-- ----------------------------
-- Table structure for mj_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `mj_auth_group_access`;
CREATE TABLE `mj_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mj_auth_group_access
-- ----------------------------
INSERT INTO `mj_auth_group_access` VALUES ('1', '1');
INSERT INTO `mj_auth_group_access` VALUES ('3', '1');

-- ----------------------------
-- Table structure for mj_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `mj_auth_rule`;
CREATE TABLE `mj_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  `pid` mediumint(9) NOT NULL DEFAULT '0',
  `level` tinyint(1) NOT NULL DEFAULT '0',
  `sort` int(5) NOT NULL DEFAULT '50',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mj_auth_rule
-- ----------------------------
INSERT INTO `mj_auth_rule` VALUES ('1', 'link', '链接管理', '1', '1', '', '0', '0', '50');
INSERT INTO `mj_auth_rule` VALUES ('2', 'link/add', '添加链接', '1', '1', '', '1', '1', '50');
INSERT INTO `mj_auth_rule` VALUES ('3', 'link/del', '删除链接', '1', '1', '', '1', '1', '50');
INSERT INTO `mj_auth_rule` VALUES ('4', 'admin/lst', '管理员', '1', '1', '', '0', '0', '50');
INSERT INTO `mj_auth_rule` VALUES ('5', 'admin/add', '管理员添加', '1', '1', '', '0', '0', '50');

-- ----------------------------
-- Table structure for mj_cate
-- ----------------------------
DROP TABLE IF EXISTS `mj_cate`;
CREATE TABLE `mj_cate` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '栏目id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '栏目类型：1:文章列表栏目 2:单页栏目3：图片列表',
  `keyword` varchar(255) NOT NULL COMMENT '栏目关键词',
  `desc` varchar(255) NOT NULL COMMENT '栏目描述',
  `content` text NOT NULL COMMENT '栏目内容',
  `rec` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:不推荐 1：推荐',
  `pid` mediumint(9) NOT NULL DEFAULT '0' COMMENT '上级栏目id',
  `sort` mediumint(9) NOT NULL DEFAULT '50' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mj_cate
-- ----------------------------
INSERT INTO `mj_cate` VALUES ('1', '服务项目', '1', '', '', '', '0', '0', '50');
INSERT INTO `mj_cate` VALUES ('2', '美甲', '1', '', '', '', '0', '1', '50');
INSERT INTO `mj_cate` VALUES ('3', '美睫', '1', '', '', '', '0', '1', '50');
INSERT INTO `mj_cate` VALUES ('4', '纹眉', '1', '', '', '', '0', '1', '50');
INSERT INTO `mj_cate` VALUES ('5', '热门美图', '2', '', '', '', '0', '0', '50');
INSERT INTO `mj_cate` VALUES ('6', '美甲论坛', '1', '', '', '', '0', '0', '50');
INSERT INTO `mj_cate` VALUES ('7', '关于我', '3', '', '', '', '0', '0', '50');
INSERT INTO `mj_cate` VALUES ('8', '皮肤护理', '1', '', '', '', '0', '1', '50');
INSERT INTO `mj_cate` VALUES ('9', '光疗甲', '1', '', '', '', '0', '2', '50');
INSERT INTO `mj_cate` VALUES ('10', '猫眼甲', '1', '', '', '', '0', '2', '50');

-- ----------------------------
-- Table structure for mj_conf
-- ----------------------------
DROP TABLE IF EXISTS `mj_conf`;
CREATE TABLE `mj_conf` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '配置项id',
  `cnname` varchar(50) NOT NULL COMMENT '配置中文名称',
  `enname` varchar(50) NOT NULL COMMENT '英文名称',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '配置类型 1：单行文本框 2：多行文本 3：单选按钮 4：复选按钮 5：下拉菜单',
  `value` varchar(255) DEFAULT NULL COMMENT '配置值',
  `values` varchar(255) NOT NULL COMMENT '配置可选值',
  `sort` smallint(6) NOT NULL DEFAULT '50' COMMENT '配置项排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mj_conf
-- ----------------------------
INSERT INTO `mj_conf` VALUES ('1', '站点名称', 'sitename', '1', 'First Lady美甲官方网站 ', '', '4');
INSERT INTO `mj_conf` VALUES ('2', '站点关键词', 'keywords', '1', '时尚，美容，美甲 ', '', '52');
INSERT INTO `mj_conf` VALUES ('3', '站点描述', 'desc', '2', '【First Lady美甲官方网站】,低价美甲,美容,美发,造型等,品质上门服务;让闺蜜都惊讶的效果!First Lady美甲官方网站是千万女性信赖的“美甲、美容、美发、微整形平台”,致力于与所有爱美女性共享！                                                                                                                                                      ', '', '51');
INSERT INTO `mj_conf` VALUES ('6', '是否关闭网站', 'close', '3', '否', '是,否', '50');
INSERT INTO `mj_conf` VALUES ('7', '启动验证码', 'code', '4', '是', '是', '50');
INSERT INTO `mj_conf` VALUES ('8', '自动清空缓存', 'cache', '5', '1个小时', '1个小时,2个小时,3个小时', '50');
INSERT INTO `mj_conf` VALUES ('9', '允许评论', 'comment', '4', '允许', '允许', '50');
INSERT INTO `mj_conf` VALUES ('11', '', '', '0', null, '', '50');
INSERT INTO `mj_conf` VALUES ('12', '关于我', 'about', '2', '本博客系统采用原生PHP+MYSQL语言开发\r\n\r\n    默认登录账号：admin 密码：admin\r\n个人介绍\r\n\r\n    罗秋洒，女，现就读于广东工业大学计算机科学与技术专业\r\n我的开源项目\r\n\r\n    邮箱：18813293912@163.com\r\n\r\n    GitHub:https：//github.com/yololololo\r\n我的联系方式\r\n\r\n    邮箱：18813293912@163.com\r\n\r\n    GitHub:https：//github.com/yololololo', '', '50');

-- ----------------------------
-- Table structure for mj_link
-- ----------------------------
DROP TABLE IF EXISTS `mj_link`;
CREATE TABLE `mj_link` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '链接id',
  `title` varchar(60) NOT NULL COMMENT '链接标题',
  `desc` varchar(255) NOT NULL COMMENT '链接描述',
  `url` varchar(160) NOT NULL COMMENT '链接地址',
  `sort` mediumint(9) NOT NULL DEFAULT '50' COMMENT '链接排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mj_link
-- ----------------------------
INSERT INTO `mj_link` VALUES ('1', '百度', '百度一下，你就知道', 'https://www.baidu.com', '50');
INSERT INTO `mj_link` VALUES ('2', '新浪', '新浪官方网站', 'http://www.sina.com.cn/', '50');
INSERT INTO `mj_link` VALUES ('3', '网易', '网易官方网站', 'http://www.163.com/', '50');

-- ----------------------------
-- Table structure for mj_meitu
-- ----------------------------
DROP TABLE IF EXISTS `mj_meitu`;
CREATE TABLE `mj_meitu` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `dir` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mj_meitu
-- ----------------------------
INSERT INTO `mj_meitu` VALUES ('12', '3', 'public\\uploads/20171009\\2ccf5ee6ce8e3a9a3e95259272b404ff.jpg', '1507509502');
INSERT INTO `mj_meitu` VALUES ('10', '测试图片1', 'public\\uploads/20171009\\350e7e7aec2bfec38c1432380d746abd.jpg', '1507509477');
INSERT INTO `mj_meitu` VALUES ('11', '测试图片3', 'public\\uploads/20171009\\819f728d4aa013dd44b44c655852b722.jpg', '1507508828');
INSERT INTO `mj_meitu` VALUES ('13', '4', 'public\\uploads/20171009\\7a44d8994210bab1f483d4a5b4017993.jpg', '1507509523');
INSERT INTO `mj_meitu` VALUES ('14', '5', 'public\\uploads/20171009\\9eb6483f2d43d4372ee3edb258bcbf93.jpg', '1507509538');
INSERT INTO `mj_meitu` VALUES ('15', '6', 'public\\uploads/20171009\\43f6791af92d67743f16ba7f5fb63d18.jpg', '1507509551');
INSERT INTO `mj_meitu` VALUES ('16', '7', 'public\\uploads/20171009\\af557d7f37041821d1ed20801f7f9e1e.jpg', '1507509565');
INSERT INTO `mj_meitu` VALUES ('17', '8', 'public\\uploads/20171009\\e54ba48a0858d485c5dffdb43c38cc76.jpg', '1507509579');
INSERT INTO `mj_meitu` VALUES ('18', '9', 'public\\uploads/20171009\\5d5144d9214a1ade1120839b1d754f77.jpg', '1507509590');
INSERT INTO `mj_meitu` VALUES ('19', '3', 'public\\uploads/20171009\\2ccf5ee6ce8e3a9a3e95259272b404ff.jpg', '1507509502');
INSERT INTO `mj_meitu` VALUES ('20', '测试图片1', 'public\\uploads/20171009\\350e7e7aec2bfec38c1432380d746abd.jpg', '1507509477');
INSERT INTO `mj_meitu` VALUES ('21', '测试图片3', 'public\\uploads/20171009\\819f728d4aa013dd44b44c655852b722.jpg', '1507508828');
INSERT INTO `mj_meitu` VALUES ('22', '4', 'public\\uploads/20171009\\7a44d8994210bab1f483d4a5b4017993.jpg', '1507509523');
INSERT INTO `mj_meitu` VALUES ('23', '5', 'public\\uploads/20171009\\9eb6483f2d43d4372ee3edb258bcbf93.jpg', '1507509538');
INSERT INTO `mj_meitu` VALUES ('24', '6', 'public\\uploads/20171009\\43f6791af92d67743f16ba7f5fb63d18.jpg', '1507509551');
INSERT INTO `mj_meitu` VALUES ('25', '7', 'public\\uploads/20171009\\af557d7f37041821d1ed20801f7f9e1e.jpg', '1507509565');
INSERT INTO `mj_meitu` VALUES ('26', '8', 'public\\uploads/20171009\\e54ba48a0858d485c5dffdb43c38cc76.jpg', '1507509579');
INSERT INTO `mj_meitu` VALUES ('27', '9', 'public\\uploads/20171009\\5d5144d9214a1ade1120839b1d754f77.jpg', '1507509590');
INSERT INTO `mj_meitu` VALUES ('28', '3', 'public\\uploads/20171009\\2ccf5ee6ce8e3a9a3e95259272b404ff.jpg', '1507509502');
INSERT INTO `mj_meitu` VALUES ('29', '测试图片1', 'public\\uploads/20171009\\350e7e7aec2bfec38c1432380d746abd.jpg', '1507509477');
INSERT INTO `mj_meitu` VALUES ('30', '测试图片3', 'public\\uploads/20171009\\819f728d4aa013dd44b44c655852b722.jpg', '1507508828');
INSERT INTO `mj_meitu` VALUES ('31', '4', 'public\\uploads/20171009\\7a44d8994210bab1f483d4a5b4017993.jpg', '1507509523');
INSERT INTO `mj_meitu` VALUES ('32', '5', 'public\\uploads/20171009\\9eb6483f2d43d4372ee3edb258bcbf93.jpg', '1507509538');
INSERT INTO `mj_meitu` VALUES ('33', '6', 'public\\uploads/20171009\\43f6791af92d67743f16ba7f5fb63d18.jpg', '1507509551');
INSERT INTO `mj_meitu` VALUES ('34', '7', 'public\\uploads/20171009\\af557d7f37041821d1ed20801f7f9e1e.jpg', '1507509565');
INSERT INTO `mj_meitu` VALUES ('35', '8', 'public\\uploads/20171009\\e54ba48a0858d485c5dffdb43c38cc76.jpg', '1507509579');
INSERT INTO `mj_meitu` VALUES ('36', '9', 'public\\uploads/20171009\\5d5144d9214a1ade1120839b1d754f77.jpg', '1507509590');
INSERT INTO `mj_meitu` VALUES ('37', '3', 'public\\uploads/20171009\\2ccf5ee6ce8e3a9a3e95259272b404ff.jpg', '1507509502');
INSERT INTO `mj_meitu` VALUES ('38', '测试图片1', 'public\\uploads/20171009\\350e7e7aec2bfec38c1432380d746abd.jpg', '1507509477');
INSERT INTO `mj_meitu` VALUES ('39', '测试图片3', 'public\\uploads/20171009\\819f728d4aa013dd44b44c655852b722.jpg', '1507508828');
INSERT INTO `mj_meitu` VALUES ('40', '4', 'public\\uploads/20171009\\7a44d8994210bab1f483d4a5b4017993.jpg', '1507509523');
INSERT INTO `mj_meitu` VALUES ('41', '5', 'public\\uploads/20171009\\9eb6483f2d43d4372ee3edb258bcbf93.jpg', '1507509538');
INSERT INTO `mj_meitu` VALUES ('42', '6', 'public\\uploads/20171009\\43f6791af92d67743f16ba7f5fb63d18.jpg', '1507509551');
INSERT INTO `mj_meitu` VALUES ('43', '7', 'public\\uploads/20171009\\af557d7f37041821d1ed20801f7f9e1e.jpg', '1507509565');
INSERT INTO `mj_meitu` VALUES ('44', '8', 'public\\uploads/20171009\\e54ba48a0858d485c5dffdb43c38cc76.jpg', '1507509579');
INSERT INTO `mj_meitu` VALUES ('45', '9', 'public\\uploads/20171009\\5d5144d9214a1ade1120839b1d754f77.jpg', '1507509590');
INSERT INTO `mj_meitu` VALUES ('46', '3', 'public\\uploads/20171009\\2ccf5ee6ce8e3a9a3e95259272b404ff.jpg', '1507509502');
INSERT INTO `mj_meitu` VALUES ('47', '测试图片1', 'public\\uploads/20171009\\350e7e7aec2bfec38c1432380d746abd.jpg', '1507509477');
INSERT INTO `mj_meitu` VALUES ('48', '测试图片3', 'public\\uploads/20171009\\819f728d4aa013dd44b44c655852b722.jpg', '1507508828');
INSERT INTO `mj_meitu` VALUES ('49', '4', 'public\\uploads/20171009\\7a44d8994210bab1f483d4a5b4017993.jpg', '1507509523');
INSERT INTO `mj_meitu` VALUES ('50', '5', 'public\\uploads/20171009\\9eb6483f2d43d4372ee3edb258bcbf93.jpg', '1507509538');
INSERT INTO `mj_meitu` VALUES ('51', '6', 'public\\uploads/20171009\\43f6791af92d67743f16ba7f5fb63d18.jpg', '1507509551');
INSERT INTO `mj_meitu` VALUES ('52', '7', 'public\\uploads/20171009\\af557d7f37041821d1ed20801f7f9e1e.jpg', '1507509565');
INSERT INTO `mj_meitu` VALUES ('53', '8', 'public\\uploads/20171009\\e54ba48a0858d485c5dffdb43c38cc76.jpg', '1507509579');
INSERT INTO `mj_meitu` VALUES ('54', '9', 'public\\uploads/20171009\\5d5144d9214a1ade1120839b1d754f77.jpg', '1507509590');
INSERT INTO `mj_meitu` VALUES ('55', '3', 'public\\uploads/20171009\\2ccf5ee6ce8e3a9a3e95259272b404ff.jpg', '1507509502');
INSERT INTO `mj_meitu` VALUES ('56', '测试图片1', 'public\\uploads/20171009\\350e7e7aec2bfec38c1432380d746abd.jpg', '1507509477');
INSERT INTO `mj_meitu` VALUES ('57', '测试图片3', 'public\\uploads/20171009\\819f728d4aa013dd44b44c655852b722.jpg', '1507508828');
INSERT INTO `mj_meitu` VALUES ('58', '4', 'public\\uploads/20171009\\7a44d8994210bab1f483d4a5b4017993.jpg', '1507509523');
INSERT INTO `mj_meitu` VALUES ('59', '5', 'public\\uploads/20171009\\9eb6483f2d43d4372ee3edb258bcbf93.jpg', '1507509538');
INSERT INTO `mj_meitu` VALUES ('60', '6', 'public\\uploads/20171009\\43f6791af92d67743f16ba7f5fb63d18.jpg', '1507509551');
INSERT INTO `mj_meitu` VALUES ('61', '7', 'public\\uploads/20171009\\af557d7f37041821d1ed20801f7f9e1e.jpg', '1507509565');
INSERT INTO `mj_meitu` VALUES ('62', '8', 'public\\uploads/20171009\\e54ba48a0858d485c5dffdb43c38cc76.jpg', '1507509579');
INSERT INTO `mj_meitu` VALUES ('63', '9', 'public\\uploads/20171009\\5d5144d9214a1ade1120839b1d754f77.jpg', '1507509590');
INSERT INTO `mj_meitu` VALUES ('64', '3', 'public\\uploads/20171009\\2ccf5ee6ce8e3a9a3e95259272b404ff.jpg', '1507509502');
INSERT INTO `mj_meitu` VALUES ('65', '测试图片1', 'public\\uploads/20171009\\350e7e7aec2bfec38c1432380d746abd.jpg', '1507509477');
INSERT INTO `mj_meitu` VALUES ('66', '测试图片3', 'public\\uploads/20171009\\819f728d4aa013dd44b44c655852b722.jpg', '1507508828');
INSERT INTO `mj_meitu` VALUES ('67', '4', 'public\\uploads/20171009\\7a44d8994210bab1f483d4a5b4017993.jpg', '1507509523');
INSERT INTO `mj_meitu` VALUES ('68', '5', 'public\\uploads/20171009\\9eb6483f2d43d4372ee3edb258bcbf93.jpg', '1507509538');
INSERT INTO `mj_meitu` VALUES ('69', '6', 'public\\uploads/20171009\\43f6791af92d67743f16ba7f5fb63d18.jpg', '1507509551');
INSERT INTO `mj_meitu` VALUES ('70', '7', 'public\\uploads/20171009\\af557d7f37041821d1ed20801f7f9e1e.jpg', '1507509565');
INSERT INTO `mj_meitu` VALUES ('71', '8', 'public\\uploads/20171009\\e54ba48a0858d485c5dffdb43c38cc76.jpg', '1507509579');
INSERT INTO `mj_meitu` VALUES ('72', '9', 'public\\uploads/20171009\\5d5144d9214a1ade1120839b1d754f77.jpg', '1507509590');
INSERT INTO `mj_meitu` VALUES ('73', '3', 'public\\uploads/20171009\\2ccf5ee6ce8e3a9a3e95259272b404ff.jpg', '1507509502');
INSERT INTO `mj_meitu` VALUES ('74', '测试图片1', 'public\\uploads/20171009\\350e7e7aec2bfec38c1432380d746abd.jpg', '1507509477');
INSERT INTO `mj_meitu` VALUES ('75', '测试图片3', 'public\\uploads/20171009\\819f728d4aa013dd44b44c655852b722.jpg', '1507508828');
INSERT INTO `mj_meitu` VALUES ('76', '4', 'public\\uploads/20171009\\7a44d8994210bab1f483d4a5b4017993.jpg', '1507509523');
INSERT INTO `mj_meitu` VALUES ('77', '5', 'public\\uploads/20171009\\9eb6483f2d43d4372ee3edb258bcbf93.jpg', '1507509538');
INSERT INTO `mj_meitu` VALUES ('78', '6', 'public\\uploads/20171009\\43f6791af92d67743f16ba7f5fb63d18.jpg', '1507509551');
INSERT INTO `mj_meitu` VALUES ('79', '7', 'public\\uploads/20171009\\af557d7f37041821d1ed20801f7f9e1e.jpg', '1507509565');
INSERT INTO `mj_meitu` VALUES ('80', '8', 'public\\uploads/20171009\\e54ba48a0858d485c5dffdb43c38cc76.jpg', '1507509579');
INSERT INTO `mj_meitu` VALUES ('81', '9', 'public\\uploads/20171009\\5d5144d9214a1ade1120839b1d754f77.jpg', '1507509590');

-- ----------------------------
-- Table structure for mj_zan
-- ----------------------------
DROP TABLE IF EXISTS `mj_zan`;
CREATE TABLE `mj_zan` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `ip` char(20) NOT NULL,
  `artid` mediumint(9) NOT NULL,
  `num` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mj_zan
-- ----------------------------
