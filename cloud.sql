/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50561
Source Host           : localhost:3306
Source Database       : cloud

Target Server Type    : MYSQL
Target Server Version : 50561
File Encoding         : 65001

Date: 2019-02-20 09:31:19
*/

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for `cloud_dir`
-- ----------------------------
DROP TABLE IF EXISTS `cloud_dir`;
CREATE TABLE `cloud_dir` (
  `dir_id`      int(11)       NOT NULL AUTO_INCREMENT,
  `dir_name`    varchar(512)  NOT NULL,
  `parent_dir`  int(11)                DEFAULT NULL,
  `dir_user_id` int(11)       NOT NULL,
  `dir_path`    varchar(1024) NOT NULL,
  PRIMARY KEY (`dir_id`),
  KEY `dir_user_id` (`dir_user_id`),
  CONSTRAINT `dir_inf_ibfk_1` FOREIGN KEY (`dir_user_id`) REFERENCES `cloud_user` (`user_id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 23
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of cloud_dir
-- ----------------------------

-- ----------------------------
-- Table structure for `cloud_file`
-- ----------------------------
DROP TABLE IF EXISTS `cloud_file`;
CREATE TABLE `cloud_file` (
  `file_id`             int(11)      NOT NULL AUTO_INCREMENT,
  `file_name`           varchar(512) NOT NULL,
  `file_size`           int(11)      NOT NULL,
  `file_type`           varchar(128) NOT NULL,
  `file_upload_time`    datetime     NOT NULL,
  `file_dir_id`         int(11)      NOT NULL,
  `file_upload_user_id` int(11)      NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `file_upload_user_id` (`file_upload_user_id`),
  KEY `file_dir_id` (`file_dir_id`),
  CONSTRAINT `file_inf_ibfk_2` FOREIGN KEY (`file_upload_user_id`) REFERENCES `cloud_user` (`user_id`),
  CONSTRAINT `file_inf_ibfk_3` FOREIGN KEY (`file_dir_id`) REFERENCES `cloud_dir` (`dir_id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 27
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of cloud_file
-- ----------------------------

-- ----------------------------
-- Table structure for `cloud_user`
-- ----------------------------

DROP TABLE IF EXISTS `cloud_user`;
CREATE TABLE `cloud_user` (
  `user_id`       int(11)      NOT NULL AUTO_INCREMENT
  COMMENT '用户id',
  `username`      varchar(50)  NOT NULL
  COMMENT '用户名',
  `password`      varchar(50)  NOT NULL
  COMMENT '密码',
  `email`         varchar(100) NOT NULL
  COMMENT '邮箱',
  `register_time` varchar(200) NOT NULL
  COMMENT '注册时间',
  PRIMARY KEY (`user_id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 11
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of cloud_user
-- ----------------------------
INSERT INTO `cloud_user`
VALUES ('10', 'admin', 'admin', '564654@qq.com', '2019-2-19');
