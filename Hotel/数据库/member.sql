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

 Date: 28/02/2023 21:41:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `mid` int(20) NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `passWord` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `nickName` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `realName` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `identificationNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`mid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (1, '17shou', '123', 'Diesel_chenas', '朱晨', '男', '1', '15032382351', '875243448@qq.com');
INSERT INTO `member` VALUES (5, 'zhangsan', '123', '小三三', '张三', '男', '2', '15032382351', '1212@qq.com');
INSERT INTO `member` VALUES (9, 'lisi', '123', '小皮蛋', '李四四', '女', '3', '15632158792', '121564@qq.com');
INSERT INTO `member` VALUES (15, 'liangshanbo', 'liangshanbo', NULL, '梁山伯', NULL, '4', '13701827134', NULL);
INSERT INTO `member` VALUES (16, 'haha', '123', NULL, '小王', NULL, '5', '13701827134', NULL);
INSERT INTO `member` VALUES (17, 'test01', '123456', NULL, '测试账户', NULL, '6', '13701827134', NULL);
INSERT INTO `member` VALUES (18, 'shoushou', 'shoushou', NULL, '兽兽', NULL, '7', '15032382351', NULL);
INSERT INTO `member` VALUES (19, 'tese02', '123456', '晨晨', '测试账户2', '男', '8', '15032382351', '');
INSERT INTO `member` VALUES (20, 'ceshizhanghuhu', 'ceshizhanghuhu', NULL, '测试账户户', NULL, '9', '15032382351', NULL);
INSERT INTO `member` VALUES (23, 'dengzhihao', 'dengzhihao', NULL, '邓志豪', NULL, '10', '15574801017', NULL);
INSERT INTO `member` VALUES (25, 'dengzhihao2', 'dengzhihao2', NULL, '邓志豪2', NULL, '11', '15574801017', NULL);
INSERT INTO `member` VALUES (27, 'dc1d32a0-a48b-4e04-99bf-003f824988d6', '', NULL, '', NULL, '', '', NULL);
INSERT INTO `member` VALUES (28, '16c8950c-5155-48ae-93ac-1a11b9a43debyanjun', 'yanjun', NULL, '颜俊', NULL, '123', '1111', NULL);

SET FOREIGN_KEY_CHECKS = 1;
