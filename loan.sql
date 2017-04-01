/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : loan

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2017-04-01 11:49:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminName` varchar(45) NOT NULL,
  `adminPass` varchar(45) NOT NULL,
  `name` varchar(45) default NULL,
  PRIMARY KEY  (`adminName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for loan
-- ----------------------------
DROP TABLE IF EXISTS `loan`;
CREATE TABLE `loan` (
  `id` int(11) NOT NULL auto_increment,
  `stu_id` varchar(45) NOT NULL,
  `stu_name` varchar(45) NOT NULL,
  `stu_depart` varchar(45) NOT NULL,
  `year` varchar(4) NOT NULL,
  `loanNum` float NOT NULL,
  `tuitionNum` float NOT NULL,
  `refundNum` float NOT NULL,
  `date` date NOT NULL,
  `success` int(1) NOT NULL,
  `remark` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2325 DEFAULT CHARSET=utf8;
