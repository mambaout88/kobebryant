/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : mis

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2016-11-21 20:09:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for button
-- ----------------------------
DROP TABLE IF EXISTS `button`;
CREATE TABLE `button` (
  `ButtonID` int(11) NOT NULL,
  `ButtonName` varchar(45) DEFAULT NULL,
  `ButtonNo` varchar(45) DEFAULT NULL,
  `ButtonClass` varchar(45) DEFAULT NULL,
  `ButtonIcon` varchar(50) DEFAULT NULL,
  `ButtonScript` varchar(45) DEFAULT NULL,
  `MenuNo` int(11) DEFAULT NULL,
  `InitStatus` varchar(45) DEFAULT NULL,
  `SeqNo` int(11) DEFAULT NULL,
  PRIMARY KEY (`ButtonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of button
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `MenuID` int(11) NOT NULL,
  `MenuNo` varchar(50) DEFAULT NULL,
  `MenuParentNo` varchar(50) DEFAULT NULL,
  `MenuOrder` int(11) DEFAULT NULL,
  `MenuName` varchar(45) DEFAULT NULL,
  `MenuUrl` varchar(50) DEFAULT NULL,
  `MenuIcon` varchar(50) DEFAULT NULL,
  `IsVisible` int(11) DEFAULT NULL,
  `IsLeaf` int(11) DEFAULT NULL,
  PRIMARY KEY (`MenuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------

-- ----------------------------
-- Table structure for privilege
-- ----------------------------
DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege` (
  `PrivilegeID` int(11) NOT NULL,
  `PrivilegeMaster` varchar(64) DEFAULT NULL,
  `PrivilegeMasterKey` int(11) DEFAULT NULL,
  `PrivilegeAccess` varchar(50) DEFAULT NULL,
  `PrivilegeAccessKey` int(11) DEFAULT NULL,
  `PrivilegeOperation` varchar(50) DEFAULT NULL,
  `CreateUserID` int(11) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `ModifyUserID` int(11) DEFAULT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  `RecordStatus` varchar(45) CHARACTER SET big5 DEFAULT NULL,
  PRIMARY KEY (`PrivilegeID`),
  KEY `CreateUserID_idx` (`CreateUserID`),
  CONSTRAINT `CreateUserID` FOREIGN KEY (`CreateUserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privilege
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `RoleID` int(11) NOT NULL,
  `RoleName` varchar(45) DEFAULT NULL,
  `RoleDesc` varchar(45) DEFAULT NULL,
  `CreateUserID` int(11) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `ModifyUserID` int(11) DEFAULT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  `RecordStatus` longtext,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `LoginName` longtext,
  `LoginPassword` varchar(50) DEFAULT NULL,
  `DeptID` int(11) DEFAULT NULL,
  `RealName` varchar(45) DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `Sex` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `UserRoleID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `RoleID` int(11) DEFAULT NULL,
  `CreateUserID` int(11) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `ModifyUserID` int(11) DEFAULT NULL,
  `ModifyDate` datetime DEFAULT NULL,
  `RecordStatus` longtext,
  PRIMARY KEY (`UserRoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
