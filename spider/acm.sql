/*
 Navicat Premium Data Transfer

 Source Server         : 测试
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:3306
 Source Schema         : acm

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 11/07/2023 10:33:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for atcoder
-- ----------------------------
DROP TABLE IF EXISTS `atcoder`;
CREATE TABLE `atcoder`  (
  `ac_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `ac_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日期',
  `ac_contest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '比赛名称',
  `ac_rank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '排名',
  `ac_performance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表现',
  `ac_newRating` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '新积分',
  `ac_diff` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '积分变化',
  `ac_count` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '比赛次数',
  `ac_maxRating` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '最高积分',
  PRIMARY KEY (`ac_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of atcoder
-- ----------------------------
INSERT INTO `atcoder` VALUES ('2021040048', '2023-04-09 22:40:00+0900', 'AtCoder Beginner Contest 297', '6684', '-', '-', '-', '58', '1772');
INSERT INTO `atcoder` VALUES ('buctAI2001lpf', '2022-08-21 22:40:00+0900', 'AtCoder Beginner Contest 265', '6754', '-', '-', '-', '28', '763');
INSERT INTO `atcoder` VALUES ('BUCTZZW', '2022-12-03 22:40:00+0900', 'Denso Create Programming Contest 2022 Winter(AtCoder Beginner Contest 280)', '5767', '-', '-', '-', '31', '840');
INSERT INTO `atcoder` VALUES ('code__learner', '2022-03-12 22:40:00+0900', 'AtCoder Beginner Contest 243', '1440', '1289', '910', '+56', '20', '910');
INSERT INTO `atcoder` VALUES ('disloss', '2021-11-13 22:40:00+0900', 'KEYENCE Programming Contest 2021 (AtCoder Beginner Contest 227)', '4949', '97', '537', '-61', '22', '598');
INSERT INTO `atcoder` VALUES ('DragonBingling', '2022-11-12 22:40:00+0900', 'Daiwa Securities Co. Ltd. Programming Contest 2022 Autumn (AtCoder Beginner Contest 277)', '2181', '1017', '700', '+50', '15', '700');
INSERT INTO `atcoder` VALUES ('empathy117', '2023-02-04 22:40:00+0900', 'Toyota Programming Contest 2023 Spring Qual A（AtCoder Beginner Contest 288）', '1523', '-', '-', '-', '81', '1487');
INSERT INTO `atcoder` VALUES ('happen', '2022-11-12 22:40:00+0900', 'Daiwa Securities Co. Ltd. Programming Contest 2022 Autumn (AtCoder Beginner Contest 277)', '3871', '598', '513', '+11', '24', '513');
INSERT INTO `atcoder` VALUES ('LetMeFly', '2022-10-02 23:00:00+0900', 'AtCoder Regular Contest 149', '1812', '-', '-', '-', '73', '1091');
INSERT INTO `atcoder` VALUES ('liangkaixing', '2022-11-05 22:40:00+0900', 'AtCoder Beginner Contest 276', '246', '2103', '1642', '+65', '67', '1642');
INSERT INTO `atcoder` VALUES ('lucyvan', '2022-06-18 22:40:00+0900', 'Tokio Marine & Nichido Fire Insurance Programming Contest 2022（AtCoder Beginner Contest 256)', '3444', '714', '285', '+89', '4', '285');
INSERT INTO `atcoder` VALUES ('t2021210481', '2022-11-12 22:40:00+0900', 'Daiwa Securities Co. Ltd. Programming Contest 2022 Autumn (AtCoder Beginner Contest 277)', '2521', '924', '454', '+72', '21', '454');
INSERT INTO `atcoder` VALUES ('tlopex', '2022-11-20 23:00:00+0900', 'AtCoder Regular Contest 152', '2052', '-', '-', '-', '41', '1134');
INSERT INTO `atcoder` VALUES ('waiiting', '2023-07-09 23:00:00+0900', 'AtCoder Regular Contest 164', '1634', '1042', '1140', '-12', '36', '1152');
INSERT INTO `atcoder` VALUES ('XSQ', '2022-11-12 22:40:00+0900', 'Daiwa Securities Co. Ltd. Programming Contest 2022 Autumn (AtCoder Beginner Contest 277)', '3763', '623', '403', '+29', '24', '403');
INSERT INTO `atcoder` VALUES ('xsysgrandfather', '2023-02-25 23:00:00+0900', 'AtCoder Regular Contest 157', '2361', '-', '-', '-', '31', '1203');
INSERT INTO `atcoder` VALUES ('Yangjize', '2022-11-12 22:40:00+0900', 'Daiwa Securities Co. Ltd. Programming Contest 2022 Autumn (AtCoder Beginner Contest 277)', '4574', '437', '290', '+15', '21', '290');
INSERT INTO `atcoder` VALUES ('yzzupup', '2022-11-12 22:40:00+0900', 'Daiwa Securities Co. Ltd. Programming Contest 2022 Autumn (AtCoder Beginner Contest 277)', '2622', '897', '866', '+3', '30', '873');
INSERT INTO `atcoder` VALUES ('zpf', '2022-05-14 22:40:00+0900', 'Panasonic Programming Contest 2022(AtCoder Beginner Contest 251)', '7125', '38', '535', '-86', '18', '621');
INSERT INTO `atcoder` VALUES ('ZxChang', '2022-06-18 22:40:00+0900', 'Tokio Marine & Nichido Fire Insurance Programming Contest 2022（AtCoder Beginner Contest 256)', '3738', '649', '118', '+66', '4', '118');
INSERT INTO `atcoder` VALUES ('ZZXzzx0_0', '2023-05-20 22:40:00+0900', 'TOYOTA MOTOR CORPORATION Programming Contest 2023#2 (AtCoder Beginner Contest 302)', '7509', '-', '-', '-', '76', '1716');

-- ----------------------------
-- Table structure for codeforces
-- ----------------------------
DROP TABLE IF EXISTS `codeforces`;
CREATE TABLE `codeforces`  (
  `cf_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'id',
  `cf_contest` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '比赛名称',
  `cf_contest_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '比赛名称id',
  `cf_rank` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '比赛的排名',
  `cf_old_rating` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '旧积分',
  `cf_new_rating` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '最新积分',
  `cf_sum_contest` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '参与比赛的总数',
  `cf_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`cf_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of codeforces
-- ----------------------------
INSERT INTO `codeforces` VALUES ('1710252529', 'Codeforces Round #604 (Div. 2)', '1265', '1769', '1561', '1551', '13', '2019-12-06 00:35:00');
INSERT INTO `codeforces` VALUES ('buctAI2001lipeifeng', 'Educational Codeforces Round 135 (Rated for Div. 2)', '1728', '2402', '1637', '1607', '54', '2022-09-09 00:35:00');
INSERT INTO `codeforces` VALUES ('CleverXun', 'CodeTON Round 3 (Div. 1 + Div. 2, Rated, Prizes!)', '1750', '996', '1962', '1958', '49', '2022-11-07 01:05:00');
INSERT INTO `codeforces` VALUES ('code__learner', 'Codeforces Round 788 (Div. 2)', '1670', '774', '1693', '1721', '65', '2022-05-07 00:35:00');
INSERT INTO `codeforces` VALUES ('disloss', 'Codeforces Round 791 (Div. 2)', '1679', '2633', '1404', '1406', '61', '2022-05-14 19:35:00');
INSERT INTO `codeforces` VALUES ('empathy117', 'Codeforces Round 815 (Div. 2)', '1720', '284', '1865', '1924', '89', '2022-08-18 23:35:00');
INSERT INTO `codeforces` VALUES ('happen', 'Codeforces Round #545 (Div. 2)', '1138', '1319', '1247', '1308', '9', '2019-03-08 19:35:00');
INSERT INTO `codeforces` VALUES ('langa', 'Codeforces Round #560 (Div. 3)', '1165', '2817', '1389', '1331', '17', '2019-05-15 00:35:00');
INSERT INTO `codeforces` VALUES ('LetMeFly', 'Codeforces Round 791 (Div. 2)', '1679', '2340', '1602', '1566', '99', '2022-05-14 19:35:00');
INSERT INTO `codeforces` VALUES ('liangdaye', 'Codeforces Round 821 (Div. 2)', '1733', '251', '1936', '1974', '57', '2022-09-20 00:35:00');
INSERT INTO `codeforces` VALUES ('Tlopex', 'Codeforces Round 822 (Div. 2)', '1734', '620', '1878', '1878', '63', '2022-09-23 22:05:00');
INSERT INTO `codeforces` VALUES ('Vanthoci', 'Codeforces Round 861 (Div. 2)', '1808', '1203', '1801', '1766', '39', '2023-03-29 19:05:00');
INSERT INTO `codeforces` VALUES ('waiiting', 'Educational Codeforces Round 147 (Rated for Div. 2)', '1821', '692', '1673', '1713', '40', '2023-04-21 00:35:00');
INSERT INTO `codeforces` VALUES ('xiaopengyou', 'Educational Codeforces Round 50 (Rated for Div. 2)', '1036', '2682', '1421', '1392', '16', '2018-09-08 00:35:00');
INSERT INTO `codeforces` VALUES ('xushuyu-s-grandfather', 'CodeTON Round 4 (Div. 1 + Div. 2, Rated, Prizes!)', '1810', '1137', '1761', '1794', '45', '2023-04-01 00:35:00');
INSERT INTO `codeforces` VALUES ('zpf666', 'Codeforces Round 808 (Div. 2)', '1708', '336', '1769', '1833', '41', '2022-07-17 00:35:00');

-- ----------------------------
-- Table structure for competition information
-- ----------------------------
DROP TABLE IF EXISTS `competition information`;
CREATE TABLE `competition information`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `platform` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `starting time` datetime(0) NULL DEFAULT NULL,
  `closing time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of competition information
-- ----------------------------
INSERT INTO `competition information` VALUES (1, 'CF', 'Codeforces Round 883 (Div. 3)', 'https://codeforces.com/contest/1846', '2023-07-07 22:35:00', '2023-07-08 00:50:00');
INSERT INTO `competition information` VALUES (2, 'CF', 'Codeforces Round 882 (Div. 2)', 'https://codeforces.com/contest/1847', '2023-07-06 22:35:00', '2023-07-07 00:50:00');
INSERT INTO `competition information` VALUES (3, 'CF', 'Educational Codeforces Round 151 (Rated for Div. 2)', 'https://codeforces.com/contest/1845', '2023-06-29 22:35:00', '2023-06-30 00:35:00');
INSERT INTO `competition information` VALUES (4, 'CF', 'CodeTON Round 5 (Div. 1 + Div. 2, Rated, Prizes!)', 'https://codeforces.com/contest/1842', '2023-06-24 22:05:00', '2023-06-25 01:05:00');
INSERT INTO `competition information` VALUES (5, 'CF', 'Codeforces Round 881 (Div. 3)', 'https://codeforces.com/contest/1843', '2023-06-20 22:35:00', '2023-06-21 00:50:00');
INSERT INTO `competition information` VALUES (6, 'CF', 'Codeforces Round 880 (Div. 1)', 'https://codeforces.com/contest/1835', '2023-06-18 22:35:00', '2023-06-19 00:35:00');
INSERT INTO `competition information` VALUES (7, 'CF', 'Codeforces Round 880 (Div. 2)', 'https://codeforces.com/contest/1836', '2023-06-18 22:35:00', '2023-06-19 00:35:00');
INSERT INTO `competition information` VALUES (8, 'CF', 'Codeforces Round 879 (Div. 2)', 'https://codeforces.com/contest/1834', '2023-06-18 16:05:00', '2023-06-18 18:05:00');
INSERT INTO `competition information` VALUES (9, 'CF', 'Educational Codeforces Round 150 (Rated for Div. 2)', 'https://codeforces.com/contest/1841', '2023-06-12 22:35:00', '2023-06-13 00:35:00');
INSERT INTO `competition information` VALUES (10, 'CF', 'Codeforces Round 878 (Div. 3)', 'https://codeforces.com/contest/1840', '2023-06-06 22:35:00', '2023-06-07 00:50:00');
INSERT INTO `competition information` VALUES (11, 'AT', 'Toyota Programming Contest 2023#4（AtCoder Beginner Contest 311）', 'https://atcoder.jp/contests/abc311', '2023-07-22 20:00:00', '2023-07-22 21:40:00');
INSERT INTO `competition information` VALUES (12, 'AT', 'AtCoder Grand Contest 063', 'https://atcoder.jp/contests/agc063', '2023-07-30 20:00:00', '2023-07-30 23:00:00');
INSERT INTO `competition information` VALUES (13, 'AT', 'AtCoder Beginner Contest 313', 'https://atcoder.jp/contests/abc313', '2023-08-05 20:00:00', '2023-08-05 21:40:00');
INSERT INTO `competition information` VALUES (14, 'AT', 'GAMEFREAK Programming Contest 2023 (AtCoder Beginner Contest 317)\r\n\r\n', 'https://atcoder.jp/contests/abc317', '2023-08-26 20:00:00', '2023-08-26 21:40:00');
INSERT INTO `competition information` VALUES (15, 'AT', 'World Tour Finals 2022 Day1', 'https://atcoder.jp/contests/wtf22-day1', '2023-09-08 12:00:00', '2023-09-08 16:00:00');
INSERT INTO `competition information` VALUES (16, 'AT', 'World Tour Finals 2022 Day1（Open Contest）', 'https://atcoder.jp/contests/wtf22-day1-open', '2023-09-08 12:00:00', '2023-09-08 16:00:00');
INSERT INTO `competition information` VALUES (17, 'AT', 'World Tour Finals 2022 Day2', 'https://atcoder.jp/contests/wtf22-day2', '2023-09-09 12:00:00', '2023-09-09 16:00:00');
INSERT INTO `competition information` VALUES (18, 'AT', 'World Tour Finals 2022 Day2（Open Contest）', 'https://atcoder.jp/contests/wtf22-day2-open', '2023-09-09 12:00:00', '2023-09-09 16:00:00');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `stu_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `stu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `stu_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `stu_ac_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `stu_cf_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`stu_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '田帅华', '2105', 't2021210481', 'BUCTTSH');
INSERT INTO `student` VALUES ('10', '洪枢适', '2111', 'tlopex', 'Tlopex');
INSERT INTO `student` VALUES ('11', '曾朴凡', '2001', 'zpf', 'zpf666');
INSERT INTO `student` VALUES ('12', '梁凯星', '2004', 'liangkaixing', 'liangdaye');
INSERT INTO `student` VALUES ('13', '巴同学', '2004', 'empathy117', 'empathy117');
INSERT INTO `student` VALUES ('14', '陈柯舟', '1906', 'disloss', 'disloss');
INSERT INTO `student` VALUES ('15', '黄东琦', '2102', '2021040048', 'Vanthoci');
INSERT INTO `student` VALUES ('16', '李佩峰', '2001', 'buctAI2001lpf', 'buctAI2001lipeifeng');
INSERT INTO `student` VALUES ('17', '李腾飞', '1906', 'LetMeFly', 'LetMeFly');
INSERT INTO `student` VALUES ('18', '刘祥睿', '2104', 'xsysgrandfather', 'xushuyu-s-grandfather');
INSERT INTO `student` VALUES ('19', '邱若昕', '2106', 'waiiting', 'waiiting');
INSERT INTO `student` VALUES ('2', '常泽星', '2105', 'ZxChang', 'xiaopengyou');
INSERT INTO `student` VALUES ('20', '闫阳旭', '1901', 'code__learner', 'code__learner');
INSERT INTO `student` VALUES ('21', '曾梓勋', '2007', 'ZZXzzx0_0', 'CleverXun');
INSERT INTO `student` VALUES ('3', '范露曦', '2105', 'lucyvan', 'langa');
INSERT INTO `student` VALUES ('4', '张占文', '2105', 'BUCTZZW', '1710252529');
INSERT INTO `student` VALUES ('5', '许舜清', '2105', 'XSQ', 'XSQ');
INSERT INTO `student` VALUES ('6', '郭力玮', '2105', 'happen', 'happen');
INSERT INTO `student` VALUES ('7', '杨济泽', '2105', 'Yangjize', 'kukuZe');
INSERT INTO `student` VALUES ('8', '刘洋滔', '2105', 'DragonBingling', '');
INSERT INTO `student` VALUES ('9', '杨泽忠', '2105', 'yzzupup', 'yzzupup');

SET FOREIGN_KEY_CHECKS = 1;
