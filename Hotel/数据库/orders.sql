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

 Date: 28/02/2023 21:41:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `orderTime` datetime NULL DEFAULT NULL,
  `orderPrice` double(10, 2) NULL DEFAULT NULL,
  `realName` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `identificationNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `orderStatus` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `comeTime` datetime NULL DEFAULT NULL,
  `departureTime` datetime NULL DEFAULT NULL,
  `houseId` int(11) NULL DEFAULT NULL,
  `memberId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE,
  INDEX `foreign01`(`houseId`) USING BTREE,
  INDEX `fortign02`(`memberId`) USING BTREE,
  CONSTRAINT `foreign01` FOREIGN KEY (`houseId`) REFERENCES `house` (`hid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fortign02` FOREIGN KEY (`memberId`) REFERENCES `member` (`mid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (10, '2020-06-05 13:17:59', 99.00, '朱晨', '1', '已完成', '2020-05-27 14:00:00', '2020-05-28 14:00:00', 3, 1);
INSERT INTO `orders` VALUES (11, '2020-06-05 13:17:59', 299.00, '朱晨', '1', '待处理', '2020-05-28 14:00:00', '2020-05-29 14:00:00', 12, 1);
INSERT INTO `orders` VALUES (12, '2020-06-05 13:17:59', 399.00, '朱晨', '1', '已预定', '2020-05-14 14:00:00', '2020-05-15 14:00:00', 20, 1);
INSERT INTO `orders` VALUES (13, '2020-06-05 13:17:59', 199.00, '张三', '2', '待处理', '2020-05-14 14:00:00', '2020-05-15 14:00:00', 9, 5);
INSERT INTO `orders` VALUES (14, '2020-06-05 13:17:59', 398.00, '朱晨', '1', '已完成', '2020-05-01 14:00:00', '2020-05-03 14:00:00', 8, 1);
INSERT INTO `orders` VALUES (15, '2020-06-05 13:17:59', 1196.00, '朱晨', '1', '待处理', '2020-04-24 14:00:00', '2020-04-28 14:00:00', 14, 1);
INSERT INTO `orders` VALUES (16, '2020-06-05 13:17:59', 597.00, '朱晨', '1', '已预订', '2020-03-04 14:00:00', '2020-03-07 14:00:00', 6, 1);
INSERT INTO `orders` VALUES (17, '2020-06-05 13:17:59', 1794.00, '张三', '2', '待处理', '2020-04-22 14:00:00', '2020-04-28 14:00:00', 15, 5);
INSERT INTO `orders` VALUES (18, '2020-06-05 18:12:14', 299.00, '李四四', '3', '已完成', '2020-06-05 14:00:00', '2020-06-06 14:00:00', 13, 9);
INSERT INTO `orders` VALUES (21, '2020-06-05 18:49:28', 399.00, '李四四', '3', '已完成', '2020-06-16 14:00:00', '2020-06-17 14:00:00', 21, 9);
INSERT INTO `orders` VALUES (24, '2020-06-06 06:12:42', 1995.00, '梁山伯', '4', '已完成', '2020-06-01 14:00:00', '2020-06-06 14:00:00', 18, 15);
INSERT INTO `orders` VALUES (25, '2020-06-06 14:11:14', 3591.00, '朱晨', '1', '已预订', '2020-07-12 14:00:00', '2020-07-21 14:00:00', 23, 1);
INSERT INTO `orders` VALUES (26, '2020-06-06 18:07:49', 598.00, '测试账户', '6', '已完成', '2020-06-06 14:00:00', '2020-06-08 14:00:00', 16, 17);
INSERT INTO `orders` VALUES (27, '2020-06-06 18:31:07', 297.00, '兽兽', '7', '已完成', '2020-06-06 14:00:00', '2020-06-09 14:00:00', 2, 18);
INSERT INTO `orders` VALUES (28, '2020-06-06 18:39:38', 198.00, '测试账户2', '8', '已完成', '2020-06-07 14:00:00', '2020-06-09 14:00:00', 4, 19);
INSERT INTO `orders` VALUES (29, '2020-06-06 18:45:51', 597.00, '测试账户户', '9', '已完成', '2020-06-07 14:00:00', '2020-06-10 14:00:00', 5, 20);
INSERT INTO `orders` VALUES (32, '2022-08-27 02:14:26', 1995.00, '邓志豪', '10', '已完成', '2022-08-27 14:00:00', '2022-09-01 14:00:00', 22, 23);
INSERT INTO `orders` VALUES (33, '2022-08-27 14:26:27', 297.00, '邓志豪2', '11', '已完成', '2022-08-28 14:00:00', '2022-08-31 14:00:00', 2, 25);
INSERT INTO `orders` VALUES (36, '2022-08-27 23:36:46', 499.00, '颜俊', '123', '已完成', '2022-08-05 14:00:00', '2022-08-06 14:00:00', 26, 28);

SET FOREIGN_KEY_CHECKS = 1;
