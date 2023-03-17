/*
 Navicat Premium Data Transfer

 Source Server         : Project
 Source Server Type    : MySQL
 Source Server Version : 50540
 Source Host           : localhost:3306
 Source Schema         : hotel

 Target Server Type    : MySQL
 Target Server Version : 50540
 File Encoding         : 65001

 Date: 28/02/2023 21:41:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `roleDesc` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'STAFF1', '工作人员管理');
INSERT INTO `role` VALUES (2, 'STAFF2', '权限管理');
INSERT INTO `role` VALUES (3, 'STAFF3', '会员信息查询');
INSERT INTO `role` VALUES (4, 'STAFF4', '会员信息添加');
INSERT INTO `role` VALUES (5, 'STAFF5', '确认预定');
INSERT INTO `role` VALUES (6, 'STAFF6', '入住办理');
INSERT INTO `role` VALUES (7, 'STAFF7', '离店办理');
INSERT INTO `role` VALUES (8, 'STAFF8', '订单信息管理');
INSERT INTO `role` VALUES (9, 'STAFF9', '客房信息查询');
INSERT INTO `role` VALUES (10, 'STAFF10', '客房信息添加');
INSERT INTO `role` VALUES (11, 'STAFF11', '客房打扫');

SET FOREIGN_KEY_CHECKS = 1;
