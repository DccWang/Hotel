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

 Date: 28/02/2023 21:41:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for users_role
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role`  (
  `userId` int(11) NOT NULL DEFAULT 0,
  `roleId` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`userId`, `roleId`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE,
  CONSTRAINT `users_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users_role
-- ----------------------------
INSERT INTO `users_role` VALUES (1, 1);
INSERT INTO `users_role` VALUES (2, 1);
INSERT INTO `users_role` VALUES (1, 2);
INSERT INTO `users_role` VALUES (1, 3);
INSERT INTO `users_role` VALUES (2, 3);
INSERT INTO `users_role` VALUES (3, 3);
INSERT INTO `users_role` VALUES (1, 4);
INSERT INTO `users_role` VALUES (2, 4);
INSERT INTO `users_role` VALUES (1, 5);
INSERT INTO `users_role` VALUES (3, 5);
INSERT INTO `users_role` VALUES (1, 6);
INSERT INTO `users_role` VALUES (3, 6);
INSERT INTO `users_role` VALUES (1, 7);
INSERT INTO `users_role` VALUES (3, 7);
INSERT INTO `users_role` VALUES (1, 8);
INSERT INTO `users_role` VALUES (3, 8);
INSERT INTO `users_role` VALUES (1, 9);
INSERT INTO `users_role` VALUES (3, 9);
INSERT INTO `users_role` VALUES (1, 10);
INSERT INTO `users_role` VALUES (3, 10);
INSERT INTO `users_role` VALUES (1, 11);
INSERT INTO `users_role` VALUES (4, 11);

SET FOREIGN_KEY_CHECKS = 1;
