/*
 Navicat MySQL Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : localhost:3306
 Source Schema         : answer_system

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 27/01/2022 10:17:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `admin_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员名称',
  `admin_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员密码',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '123');

-- ----------------------------
-- Table structure for knowledge
-- ----------------------------
DROP TABLE IF EXISTS `knowledge`;
CREATE TABLE `knowledge`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `subjectId` int(11) NOT NULL COMMENT '所属课程',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '知识点名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of knowledge
-- ----------------------------
INSERT INTO `knowledge` VALUES (1, 1, '指针');
INSERT INTO `knowledge` VALUES (2, 1, '结构体');
INSERT INTO `knowledge` VALUES (3, 2, '线性表');
INSERT INTO `knowledge` VALUES (4, 2, '树');
INSERT INTO `knowledge` VALUES (5, 3, 'for循环');
INSERT INTO `knowledge` VALUES (8, 6, '函数');
INSERT INTO `knowledge` VALUES (9, 1, '链表');
INSERT INTO `knowledge` VALUES (10, 2, '串');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `question_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `question_poid` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question_des` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question_time` datetime NULL DEFAULT NULL,
  `answer_poid` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `answer_time` datetime NULL DEFAULT NULL,
  `answer_des` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subId` int(11) NULL DEFAULT NULL,
  `knowId` int(11) NULL DEFAULT NULL,
  `subName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `knowName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question_score` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '5',
  PRIMARY KEY (`question_id`) USING BTREE,
  INDEX `ans_id`(`answer_poid`) USING BTREE,
  CONSTRAINT `ans_id` FOREIGN KEY (`answer_poid`) REFERENCES `teacher` (`teacher_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (1, 's1', '这bug咋修啊 ', 'Error starting ApplicationContext.\r\nTo display the auto-configuration report re-run your application with ‘debug’ enabled.', '2021-12-28 12:03:04', 't1', '2021-12-16 00:00:00', '		去百度看看		', 3, 5, 'Java', 'for循环', '5');
INSERT INTO `question` VALUES (2, 's1', 'Mybatis查询传入一个字符串传参数报错', 'mapper接口：\r\nPkRecord findByPkStudentNumber(String pkStudentNumber);\r\n对应的mapper配置文件\r\n< select id=“findByPkStudentNumber” resultMap=“recordMap” >\r\nSELECT * FROM pk_record\r\n< where>\r\n< if test=“pkStudentNumber!=null”>\r\npk_student_number=#{pkStudentNumber}\r\n< /if>\r\n< /where>\r\n< /select>\r\n\r\n然后就会报如下错误\r\nThere is no getter for property named ‘XXX’ in ‘class java.lang.String’', '2021-12-13 15:34:03', 't1', '2021-12-21 00:00:00', '			1341eqfwsdfasf	', 3, 5, 'Java', 'for循环', '5');
INSERT INTO `question` VALUES (5, 's1', '问题提问', '如何优雅的进行For循环', '2021-12-22 21:34:54', 't1', '2021-12-23 00:00:00', '再次测试', 3, 5, 'Java', 'for循环', '0');
INSERT INTO `question` VALUES (6, 's1', '线性表如何实现', '线性表的数据结构如何定义', '2021-12-23 17:33:55', 't1', '2021-12-23 00:00:00', '参考书上例题	', 2, 3, '数据结构', '线性表', '5');
INSERT INTO `question` VALUES (7, 's1', '树怎么实现', '二叉搜索树怎么实现', '2021-12-23 16:43:55', NULL, NULL, NULL, 2, 4, '数据结构', '树', '5');
INSERT INTO `question` VALUES (8, 's1', '线性表删除节点步骤', '不太懂怎么删除的', '2022-01-02 00:00:00', NULL, NULL, NULL, 2, 3, '数据结构', '线性表', '5');

-- ----------------------------
-- Table structure for stu_tea
-- ----------------------------
DROP TABLE IF EXISTS `stu_tea`;
CREATE TABLE `stu_tea`  (
  `student_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`student_id`) USING BTREE,
  INDEX `tea_id`(`teacher_id`) USING BTREE,
  CONSTRAINT `stu_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tea_id` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stu_tea
-- ----------------------------
INSERT INTO `stu_tea` VALUES ('s1', 't1');
INSERT INTO `stu_tea` VALUES ('s4', 't1');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `student_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `student_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `student_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `student_sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `student_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `student_score` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`student_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('s1', '123456', '小金', '男', '13800000001', 25);
INSERT INTO `student` VALUES ('s2', '123456', '小李', '男', '13800000002', 0);
INSERT INTO `student` VALUES ('s4', '123456', '小妮', '女', '13800000003', 0);

-- ----------------------------
-- Table structure for sub_tea
-- ----------------------------
DROP TABLE IF EXISTS `sub_tea`;
CREATE TABLE `sub_tea`  (
  `subName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '科目信息',
  `teaId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师名称'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sub_tea
-- ----------------------------
INSERT INTO `sub_tea` VALUES ('操作系统', 't2');
INSERT INTO `sub_tea` VALUES ('数据结构', 't1');
INSERT INTO `sub_tea` VALUES ('软件工程', 't2');

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES (1, 'C');
INSERT INTO `subject` VALUES (2, '数据结构');
INSERT INTO `subject` VALUES (3, 'Java');
INSERT INTO `subject` VALUES (4, '操作系统');
INSERT INTO `subject` VALUES (5, '软件工程');
INSERT INTO `subject` VALUES (6, 'Python');
INSERT INTO `subject` VALUES (7, '计算机网络');
INSERT INTO `subject` VALUES (8, '数据库');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `teacher_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `teacher_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `teacher_sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `teacher_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jobtitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`teacher_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('t1', '123456', '王五', '男', '13800000011', '教导主任');
INSERT INTO `teacher` VALUES ('t2', '123456', '李四', '男', '13800000012', '副教授');

SET FOREIGN_KEY_CHECKS = 1;
