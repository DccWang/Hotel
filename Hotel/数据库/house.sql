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

 Date: 28/02/2023 21:41:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house`  (
  `hid` int(11) NOT NULL AUTO_INCREMENT,
  `houseName` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `houseState` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `housePrice` double NOT NULL,
  `houseNum` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`hid`) USING BTREE,
  UNIQUE INDEX `houseNum`(`houseNum`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of house
-- ----------------------------
INSERT INTO `house` VALUES (1, '单人间', '预订', 99, 101);
INSERT INTO `house` VALUES (2, '单人间', '空房', 99, 102);
INSERT INTO `house` VALUES (3, '单人间', '空房', 99, 103);
INSERT INTO `house` VALUES (4, '单人间', '住人', 99, 104);
INSERT INTO `house` VALUES (5, '标准间', '住人', 199, 201);
INSERT INTO `house` VALUES (6, '标准间', '预定', 199, 202);
INSERT INTO `house` VALUES (7, '标准间', '空房', 199, 203);
INSERT INTO `house` VALUES (8, '标准间', '住人', 199, 204);
INSERT INTO `house` VALUES (9, '标准间', '预订', 199, 205);
INSERT INTO `house` VALUES (10, '标准间', '空房', 199, 206);
INSERT INTO `house` VALUES (11, '大床房', '空房', 299, 301);
INSERT INTO `house` VALUES (12, '大床房', '预订', 299, 302);
INSERT INTO `house` VALUES (13, '大床房', '空房', 299, 303);
INSERT INTO `house` VALUES (14, '大床房', '预订', 299, 304);
INSERT INTO `house` VALUES (15, '大床房', '预订', 299, 305);
INSERT INTO `house` VALUES (16, '大床房', '住人', 299, 306);
INSERT INTO `house` VALUES (17, '大床房', '空房', 299, 307);
INSERT INTO `house` VALUES (18, '套间', '空房', 399, 401);
INSERT INTO `house` VALUES (19, '套间', '空房', 399, 402);
INSERT INTO `house` VALUES (20, '套间', '空房', 399, 403);
INSERT INTO `house` VALUES (21, '套间', '空房', 399, 407);
INSERT INTO `house` VALUES (22, '套间', '住人', 399, 405);
INSERT INTO `house` VALUES (23, '套间', '预定', 399, 406);
INSERT INTO `house` VALUES (24, '总统套房', '空房', 499, 501);
INSERT INTO `house` VALUES (25, '总统套房', '空房', 499, 502);
INSERT INTO `house` VALUES (26, '总统套房', '住人', 499, 503);
INSERT INTO `house` VALUES (33, '储物室', '禁用', 0, 404);

SET FOREIGN_KEY_CHECKS = 1;
