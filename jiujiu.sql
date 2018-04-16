/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : jiujiu2

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-04-16 15:28:32
*/
CREATE DATABASE IF NOT EXISTS JiuJiu DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` varchar(32) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nickName` varchar(100) NOT NULL COMMENT '昵称',
  `realName` varchar(100) DEFAULT '未实名',
  `imgPath` varchar(100) DEFAULT NULL,
  `gender` varchar(50) DEFAULT '男',
  `age` int(11) DEFAULT '0',
  `birth` varchar(50) DEFAULT '0',
  `tel` varchar(11) DEFAULT '0',
  `idCard` varchar(50) DEFAULT '0',
  `registDate` datetime DEFAULT NULL,
  PRIMARY KEY (`userid`,`username`,`nickName`),
  KEY `userid` (`userid`,`nickName`),
  KEY `nickName` (`nickName`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('107235727b244f55a6c0c6301bfbc8a6', 'test', 'CY9rzUYh03PK3k6DJie09g==', 'test', '未实名', 'headImg.jpg', '男', '0', '0', '0', '0', '2018-01-04 00:00:00');
INSERT INTO `user` VALUES ('3db34777cb1a42148e5ab1c03d376e0c', '123456', '4QrcOUm6Wau+VuBX8g+IPg==', '赵日天', '未实名', 'headImg.jpg', '男', '15', '1111', '11111111111', '0', '2017-12-28 00:00:00');
INSERT INTO `user` VALUES ('58aec558652f49089efb1e2a3037ab94', 'putian', 'N15liria5Vx2Z8rxljd+3Q==', '屌炸天', '未实名', 'headImg.jpg', '女', '20', '1221', '12222222222', '0', '2017-12-28 00:00:00');
INSERT INTO `user` VALUES ('c62e98ecb4c34bdb9addcc6d76c9c7d9', 'test2', '/mEjp1kBfkoq9KLRmWHtcQ==', 'test2', '未实名', 'headImg.jpg', '男', '0', '0', '0', '0', '2018-01-09 00:00:00');

-- ----------------------------
-- Table structure for `usercomment`
-- ----------------------------
DROP TABLE IF EXISTS `usercomment`;
CREATE TABLE `usercomment` (
  `commentId` int(10) NOT NULL AUTO_INCREMENT,
  `userId` varchar(32) NOT NULL,
  `userNickName` varchar(100) NOT NULL,
  `userHeadImg` varchar(100) NOT NULL,
  `commentUserId` varchar(32) NOT NULL,
  `replyCommentId` int(10) DEFAULT NULL,
  `vpmId` varchar(32) NOT NULL,
  `commentContext` varchar(255) NOT NULL,
  `clickGoodNum` int(10) DEFAULT '0',
  `commentDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`commentId`),
  KEY `Fk_userCommentUserId` (`userId`),
  KEY `Fk_commentUserId` (`commentUserId`),
  KEY `Fk_userComment_vpmId` (`vpmId`),
  CONSTRAINT `usercomment_ibfk_1` FOREIGN KEY (`commentUserId`) REFERENCES `user` (`userid`),
  CONSTRAINT `usercomment_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`userid`),
  CONSTRAINT `usercomment_ibfk_3` FOREIGN KEY (`vpmId`) REFERENCES `vpm` (`vpmId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usercomment
-- ----------------------------
INSERT INTO `usercomment` VALUES ('1', '58aec558652f49089efb1e2a3037ab94', '屌炸天', 'resource/javaweb/JiuJiu/userData/putian/img/headImg.jpg', '58aec558652f49089efb1e2a3037ab94', '1', '007ab7a7c9b84f9699770f9534335d5a', 'adgs', '0', '2018-04-15 20:16:48.000000');

-- ----------------------------
-- Table structure for `vpm`
-- ----------------------------
DROP TABLE IF EXISTS `vpm`;
CREATE TABLE `vpm` (
  `vpmId` varchar(32) NOT NULL,
  `userName` varchar(32) NOT NULL,
  `userNickName` varchar(32) NOT NULL,
  `vpmPath` varchar(255) NOT NULL,
  `coverPath` varchar(255) DEFAULT NULL,
  `vpmContext` varchar(255) DEFAULT NULL,
  `vpmDate` datetime(6) DEFAULT NULL,
  `clickGoodNum` int(10) DEFAULT '0',
  `clickBadNum` int(10) DEFAULT '0',
  `commentNum` int(10) DEFAULT '0',
  `vpmCategory` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`vpmId`),
  KEY `Fk_vpmCategory` (`vpmCategory`),
  KEY `Fk_userNickName` (`userNickName`),
  KEY `Fk_vpm_userName` (`userName`),
  CONSTRAINT `vpm_ibfk_1` FOREIGN KEY (`userNickName`) REFERENCES `user` (`nickName`),
  CONSTRAINT `vpm_ibfk_2` FOREIGN KEY (`vpmCategory`) REFERENCES `vpmcategory` (`vpmCategoryName`),
  CONSTRAINT `vpm_ibfk_3` FOREIGN KEY (`userName`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vpm
-- ----------------------------
INSERT INTO `vpm` VALUES ('00000000000000000000000000000000', 'putian', '屌炸天', '/JiuJiuGuFeng/resource/javaweb/JiuJiu/vpmData/putian/Photo/1139.jpg', null, '没有更多资源了QAQ', '2020-06-06 00:00:00.000000', '10000', '0', '0', 'Photo');
INSERT INTO `vpm` VALUES ('004bc98bdf7841418b2e50230044da33', 'putian', '屌炸天', 'http://gslb.miaopai.com/stream/R7m16GSbNFlMZkLqWUO-Bg__.mp4?vend=miaopai&', null, '', '2018-04-03 08:57:22.920000', '0', '1', '0', 'Photo');
INSERT INTO `vpm` VALUES ('007ab7a7c9b84f9699770f9534335d5a', 'putian', '屌炸天', 'http://i.snssdk.com/neihan/video/playback/?video_id=34092667376148859a8e0185215dce19&amp;quality=480p&amp;line=0&amp;is_gif=0.mp4', 'http://p1.pstatp.com/large/76d4000a7ffd659e5317', '', '2018-04-03 09:01:25.140000', '3', '1', '1', 'Video');
INSERT INTO `vpm` VALUES ('00cb6fc3ce44442b94432802282a8bad', 'putian', '屌炸天', 'http://p3.pstatp.com/large/6f10000122c0556c9c1d', null, '恭喜你，成功摧毁了友军指挥部', '2018-04-03 08:57:31.354000', '2', '0', '0', 'Photo');
INSERT INTO `vpm` VALUES ('0115e7a3fc3d4b509ef59a5c489edf54', 'putian', '屌炸天', 'http://p1.pstatp.com/large/618a0009d326090e0ae0', null, '还有比这更作死的吗？', '2018-04-03 08:55:24.126000', '1', '0', '0', 'Photo');
INSERT INTO `vpm` VALUES ('0137dcf5c19c4bfdbe616cc80fee1b94', 'putian', '屌炸天', 'http://i.snssdk.com/neihan/video/playback/?video_id=baff8f4f8032444ba0dad2e1fd2449d2&amp;quality=480p&amp;line=0&amp;is_gif=0.mp4', 'http://p1.pstatp.com/large/731300045285e04e3ae5', '', '2018-04-03 09:02:55.121000', '1', '0', '0', 'Video');
INSERT INTO `vpm` VALUES ('01928150246d45f7a7dfd8e1983f1d43', 'putian', '屌炸天', 'http://i.snssdk.com/neihan/video/playback/?video_id=fcbb5afd6c144b2696fe2efc996fece2&amp;quality=480p&amp;line=0&amp;is_gif=0.mp4', 'http://p1.pstatp.com/large/6a52000287143e3e8fd9', '', '2018-04-03 09:03:37.912000', '0', '0', '0', 'Video');
INSERT INTO `vpm` VALUES ('01baa038ecf24331ba2166d55e36cf9e', 'putian', '屌炸天', 'http://mpge.5nd.com/2018/2018-3-14/84002/1.mp3', null, '慢慢来吧', '2018-04-03 20:14:16.531000', '0', '0', '0', 'Photo');
INSERT INTO `vpm` VALUES ('01c9d81c956d439880fc6664e86cb352', 'putian', '屌炸天', 'http://gslb.miaopai.com/stream/R7m16GSbNFlMZkLqWUO-Bg__.mp4?vend=miaopai&', 'http://p1.pstatp.com/large/748c000477e8f23ce43e', '菩萨会让看见的人好运', '2018-04-03 09:01:06.017000', '0', '0', '0', 'Video');
INSERT INTO `vpm` VALUES ('034ff76eab5040abb7b5abc0179466a2', 'putian', '屌炸天', 'http://mpge.5nd.com/2018/2018-3-16/84040/1.mp3', null, '有些爱情放不下', '2018-04-03 20:17:24.445000', '0', '0', '0', 'Music');
INSERT INTO `vpm` VALUES ('043dab30fb5e416f95e637371a826fb8', 'putian', '屌炸天', 'http://i.snssdk.com/neihan/video/playback/?video_id=a58954c20a8149bb9fb311609a9774b0&amp;quality=480p&amp;line=0&amp;is_gif=0.mp4', 'http://p3.pstatp.com/large/6055000752e797c5fbda', '', '2018-04-03 09:02:39.088000', '0', '0', '0', 'Video');
INSERT INTO `vpm` VALUES ('052c8a1bbe724c4c8173f5e46b3c4aa0', 'putian', '屌炸天', 'http://i.snssdk.com/neihan/video/playback/?video_id=0482cd11a06f449e9d06dc55de001bc2&amp;quality=480p&amp;line=0&amp;is_gif=0.mp4', 'http://p3.pstatp.com/large/76ae000a249cb02629ca', '', '2018-04-03 09:01:04.884000', '0', '0', '0', 'Video');
INSERT INTO `vpm` VALUES ('056789cd6d9e49e79e7d6d2d83c83ee8', 'putian', '屌炸天', 'http://mpge.5nd.com/2018/2018-3-28/84262/1.mp3', null, '多一点也好', '2018-04-03 20:13:56.903000', '1', '0', '0', 'Photo');
INSERT INTO `vpm` VALUES ('06311117f4e24c868aa2558ac2a86e71', 'putian', '屌炸天', 'http://p1.pstatp.com/large/757e000b249685be57f6', null, '山河已无恙……先辈可以安息……欢迎回家！', '2018-04-03 08:55:49.650000', '0', '0', '0', 'Photo');
INSERT INTO `vpm` VALUES ('06f7d6732aae4c68bf1ce094bf4b6a9e', 'putian', '屌炸天', 'http://i.snssdk.com/neihan/video/playback/?video_id=8c9ba520f5044c4093730a9608aee40e&amp;quality=480p&amp;line=0&amp;is_gif=0.mp4', 'http://p3.pstatp.com/large/685b000edb503f9e3290', '', '2018-04-03 09:02:17.568000', '0', '0', '0', 'Video');
INSERT INTO `vpm` VALUES ('080f9124e5ac44129f189f5f4f64a157', 'putian', '屌炸天', 'http://p1.pstatp.com/large/56f4000bdb8d2fe0cda4', null, '求段友给个没水印的', '2018-04-03 08:55:00.292000', '0', '0', '0', 'Photo');
INSERT INTO `vpm` VALUES ('08c0969d37fe4d499b23c51278141940', 'putian', '屌炸天', 'http://i.snssdk.com/neihan/video/playback/?video_id=cec1d073bf5c449f9cc5ba7a3be139b7&amp;quality=480p&amp;line=0&amp;is_gif=0.mp4', 'http://p1.pstatp.com/large/70d2000c2587423c94b0', '', '2018-04-03 09:03:07.878000', '0', '0', '0', 'Video');
INSERT INTO `vpm` VALUES ('08ec0d41f9b44dc7b5e71295120881eb', 'putian', '屌炸天', 'http://p9.pstatp.com/large/758500076186cafa51ca', null, '滴，滴滴，段友们，求达叔和星爷的强颜欢笑的GIF图，', '2018-04-03 08:58:39.844000', '0', '0', '0', 'Photo');
INSERT INTO `vpm` VALUES ('0933cb2cd287452a857ccbc1ec7be9c5', 'putian', '屌炸天', 'http://p3.pstatp.com/large/5b8f00064edeecc4bda4', null, '', '2018-04-03 08:56:37.986000', '0', '0', '0', 'Photo');
INSERT INTO `vpm` VALUES ('09cdce9f3d0346228b371e15cca2546c', 'putian', '屌炸天', 'http://i.snssdk.com/neihan/video/playback/?video_id=f0eddf8fa3a1481f8bfdc0221119f69e&amp;quality=480p&amp;line=0&amp;is_gif=0.mp4', 'http://p1.pstatp.com/large/76c60005b31a894ce93c', '办公室新来一个漂亮妹子，屌丝动心了……', '2018-04-03 09:03:28.389000', '0', '0', '0', 'Video');
INSERT INTO `vpm` VALUES ('0a5a42a88d7d4bbabd9b7218886d04a2', 'putian', '屌炸天', 'http://i.snssdk.com/neihan/video/playback/?video_id=64b6d873b5d94d028c12cfdf0a76be15&amp;quality=480p&amp;line=0&amp;is_gif=0.mp4', 'http://p3.pstatp.com/large/69ca000deb820ba5c077', '', '2018-04-03 09:01:52.908000', '0', '0', '0', 'Video');
INSERT INTO `vpm` VALUES ('0b0587aec6b24de6ac1b1f7cff62d715', 'putian', '屌炸天', 'http://p9.pstatp.com/large/758b0000593ab01fa703', null, '尊严？不存在的', '2018-04-03 08:58:43.001000', '0', '0', '0', 'Photo');
INSERT INTO `vpm` VALUES ('0b0a19e69baf41c4add725510222bb8a', 'putian', '屌炸天', 'http://i.snssdk.com/neihan/video/playback/?video_id=0c6a8ef746df42a0b7be47a4aef35e8d&amp;quality=480p&amp;line=0&amp;is_gif=0.mp4', 'http://p9.pstatp.com/large/74ea001112539947958a', '', '2018-04-03 09:01:11.341000', '0', '0', '0', 'Video');
INSERT INTO `vpm` VALUES ('0b0e0a3a01b94600bd61920f15cc2f56', 'putian', '屌炸天', 'http://p3.pstatp.com/large/6674000417adec79e83b', null, '同感的留个足迹。。。', '2018-04-03 08:56:55.118000', '0', '0', '0', 'Photo');
INSERT INTO `vpm` VALUES ('0b9ea73e79a74f12a324d23ddb9b15c5', 'putian', '屌炸天', 'http://i.snssdk.com/neihan/video/playback/?video_id=733ed628a6904eaab320c06ce884a38a&amp;quality=480p&amp;line=0&amp;is_gif=0.mp4', 'http://p1.pstatp.com/large/6d2500118088bef1e7e4', '', '2018-04-03 09:02:02.586000', '0', '0', '0', 'Video');
INSERT INTO `vpm` VALUES ('0c11cae51a304a7785579b90e0f1698e', 'putian', '屌炸天', 'http://i.snssdk.com/neihan/video/playback/?video_id=f7ca45d860e4421bb43ac8626962109c&amp;quality=480p&amp;line=0&amp;is_gif=0.mp4', 'http://p3.pstatp.com/large/76e70003283d75e4b344', '', '2018-04-03 09:03:35.811000', '0', '0', '0', 'Video');
INSERT INTO `vpm` VALUES ('0d8e831786a040e5b49e3ac04c8f547c', 'putian', '屌炸天', 'http://i.snssdk.com/neihan/video/playback/?video_id=ca881958c86048589ae9e0a7b9762def&amp;quality=480p&amp;line=0&amp;is_gif=0.mp4', 'http://p3.pstatp.com/large/744c00057a8955af4e5c', '女人每次见到我，都会脱光……', '2018-04-02 10:36:14.657000', '0', '0', '0', 'Video');
INSERT INTO `vpm` VALUES ('0dffbebbea4d4fea9b05c6a9dbcc12c0', 'putian', '屌炸天', 'http://mpge.5nd.com/2018/2018-3-12/83949/1.mp3', null, '武吧', '2018-04-03 20:17:33.189000', '0', '0', '0', 'Music');
INSERT INTO `vpm` VALUES ('0f150ee470c3471ca56148f7cc0bcb77', 'putian', '屌炸天', 'http://p3.pstatp.com/large/6f0d0000321e972613db', null, '致到石狮拼搏的我', '2018-04-03 08:57:28.175000', '0', '0', '0', 'Photo');
INSERT INTO `vpm` VALUES ('0feab12b02004379acaf833c78155cf3', 'putian', '屌炸天', 'http://p1.pstatp.com/large/61870001b5edda513bc7', null, '过年啦♪(๑ᴖ◡ᴖ๑)♪', '2018-04-03 08:55:23.059000', '0', '0', '0', 'Photo');
INSERT INTO `vpm` VALUES ('101ab43965d946438fa37d34f29998dd', 'putian', '屌炸天', 'http://i.snssdk.com/neihan/video/playback/?video_id=4aaca0053a964a00b94ed59f9e3a7713&amp;quality=480p&amp;line=0&amp;is_gif=0.mp4', 'http://p3.pstatp.com/large/5ec90006c7c5cdd39272', '', '2018-04-03 09:01:38.885000', '0', '0', '0', 'Video');
INSERT INTO `vpm` VALUES ('1260d9c96ab241408efdcb5849e2ea02', 'putian', '屌炸天', 'http://p3.pstatp.com/large/6f1200099e55165c8a4c', null, '这简直碉堡了，形象及了', '2018-04-03 08:57:33.509000', '0', '0', '0', 'Photo');
INSERT INTO `vpm` VALUES ('12fcbc5c8c094a3d8239ebd0c204003b', 'putian', '屌炸天', 'http://i.snssdk.com/neihan/video/playback/?video_id=03b875c9bb7a4dcb944085c1e4039999&amp;quality=480p&amp;line=0&amp;is_gif=0.mp4', 'http://p3.pstatp.com/large/712400138851bdb78074', '', '2018-04-03 09:01:03.810000', '0', '0', '0', 'Video');
INSERT INTO `vpm` VALUES ('13fce4b9d97c4ed98e92eb56fdb3ae14', 'putian', '屌炸天', 'http://p3.pstatp.com/large/69bf00091c1722ed5c2f', null, '', '2018-04-03 08:57:14.409000', '0', '0', '0', 'Photo');
INSERT INTO `vpm` VALUES ('141e9e9c51dd4305af271d3116c0e144', 'putian', '屌炸天', 'http://i.snssdk.com/neihan/video/playback/?video_id=23c4bb814cf84349b100b7645045bc10&amp;quality=480p&amp;line=0&amp;is_gif=0.mp4', 'http://p3.pstatp.com/large/5c57000cea405912a7fd', '', '2018-04-03 09:01:19.742000', '0', '0', '0', 'Video');

-- ----------------------------
-- Table structure for `vpmcategory`
-- ----------------------------
DROP TABLE IF EXISTS `vpmcategory`;
CREATE TABLE `vpmcategory` (
  `vpmCategoryId` varchar(32) NOT NULL,
  `vpmCategoryName` varchar(32) NOT NULL,
  PRIMARY KEY (`vpmCategoryId`),
  KEY `vpmCategoryName` (`vpmCategoryName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vpmcategory
-- ----------------------------
INSERT INTO `vpmcategory` VALUES ('3', 'Music');
INSERT INTO `vpmcategory` VALUES ('2', 'Photo');
INSERT INTO `vpmcategory` VALUES ('1', 'Video');

-- ----------------------------
-- Table structure for `vpmcomment`
-- ----------------------------
DROP TABLE IF EXISTS `vpmcomment`;
CREATE TABLE `vpmcomment` (
  `commentId` int(10) NOT NULL AUTO_INCREMENT,
  `vpmId` varchar(32) NOT NULL,
  `commentContext` varchar(255) DEFAULT NULL,
  `userId` varchar(32) DEFAULT NULL,
  `userNickName` varchar(100) DEFAULT NULL,
  `userHeadImg` varchar(100) DEFAULT NULL,
  `clickGoodNum` int(10) DEFAULT '0',
  `commentNum` int(10) DEFAULT '0',
  `commentDate` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`commentId`),
  KEY `Fk_userId` (`userId`),
  KEY `FK_vmpId` (`vpmId`),
  CONSTRAINT `vpmcomment_ibfk_1` FOREIGN KEY (`vpmId`) REFERENCES `vpm` (`vpmId`),
  CONSTRAINT `vpmcomment_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vpmcomment
-- ----------------------------
INSERT INTO `vpmcomment` VALUES ('1', '007ab7a7c9b84f9699770f9534335d5a', 'rwey', '58aec558652f49089efb1e2a3037ab94', '屌炸天', 'resource/javaweb/JiuJiu/userData/putian/img/headImg.jpg', '0', '1', '2018-04-15 20:16:22.000000');
