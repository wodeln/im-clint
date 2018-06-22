/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : cprsim

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-06-22 15:33:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cpr_args
-- ----------------------------
DROP TABLE IF EXISTS `cpr_args`;
CREATE TABLE `cpr_args` (
  `args_id` int(11) NOT NULL AUTO_INCREMENT,
  `args_name` varchar(100) NOT NULL,
  `args_type_id` int(11) NOT NULL,
  `args_point` int(3) NOT NULL,
  `args_key` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`args_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cpr_args
-- ----------------------------
INSERT INTO `cpr_args` VALUES ('4', '什么鬼', '1', '20', null);
INSERT INTO `cpr_args` VALUES ('3', 'keguan', '1', '300', null);

-- ----------------------------
-- Table structure for cpr_args_score
-- ----------------------------
DROP TABLE IF EXISTS `cpr_args_score`;
CREATE TABLE `cpr_args_score` (
  `train_score_id` int(11) NOT NULL AUTO_INCREMENT,
  `args_id` int(11) NOT NULL,
  `args_name` varchar(100) NOT NULL,
  `args_score` int(5) NOT NULL,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`train_score_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cpr_args_score
-- ----------------------------
INSERT INTO `cpr_args_score` VALUES ('1', '3', 'keguan', '15', '4', '3');
INSERT INTO `cpr_args_score` VALUES ('2', '3', 'keguan', '5', '4', '4');

-- ----------------------------
-- Table structure for cpr_args_type
-- ----------------------------
DROP TABLE IF EXISTS `cpr_args_type`;
CREATE TABLE `cpr_args_type` (
  `args_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `args_type_name` varchar(100) NOT NULL,
  `args_type_key` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`args_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cpr_args_type
-- ----------------------------
INSERT INTO `cpr_args_type` VALUES ('1', '客观评分', null);
INSERT INTO `cpr_args_type` VALUES ('2', '急救器材准备', null);
INSERT INTO `cpr_args_type` VALUES ('3', '急救流程、操作和配合', null);
INSERT INTO `cpr_args_type` VALUES ('4', '心肺复苏', null);
INSERT INTO `cpr_args_type` VALUES ('5', '测试一个鬼1', null);

-- ----------------------------
-- Table structure for cpr_args_version
-- ----------------------------
DROP TABLE IF EXISTS `cpr_args_version`;
CREATE TABLE `cpr_args_version` (
  `args_version` double(7,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cpr_args_version
-- ----------------------------
INSERT INTO `cpr_args_version` VALUES ('0.06');

-- ----------------------------
-- Table structure for cpr_event
-- ----------------------------
DROP TABLE IF EXISTS `cpr_event`;
CREATE TABLE `cpr_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL COMMENT '练考计划ID',
  `add_time` varchar(100) NOT NULL COMMENT '时间',
  `event_name` varchar(100) NOT NULL COMMENT '事件名称',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cpr_event
-- ----------------------------
INSERT INTO `cpr_event` VALUES ('1', '3', '00:00:36', '第七个事件', '3');
INSERT INTO `cpr_event` VALUES ('2', '3', '00:00:35', '第六事件', '3');
INSERT INTO `cpr_event` VALUES ('3', '3', '00:00:34', '第五事件', '3');
INSERT INTO `cpr_event` VALUES ('4', '3', '00:00:33', '事件四四', '3');
INSERT INTO `cpr_event` VALUES ('5', '3', '00:00:32', '第三个', '3');
INSERT INTO `cpr_event` VALUES ('6', '3', '00:00:31', '事件', '3');
INSERT INTO `cpr_event` VALUES ('7', '3', '00:00:30', '事', '3');

-- ----------------------------
-- Table structure for cpr_exam
-- ----------------------------
DROP TABLE IF EXISTS `cpr_exam`;
CREATE TABLE `cpr_exam` (
  `exam_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '练考计划自增主键',
  `exam_name` varchar(100) NOT NULL COMMENT '练考计划名称',
  `exam_type` tinyint(1) DEFAULT NULL COMMENT '培训类别 1:考试 2:练习',
  `exam_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '培训时间',
  `exam_minutes` int(5) DEFAULT NULL COMMENT '培训时长 (分钟)',
  `exam_kind` varchar(255) DEFAULT NULL COMMENT '培训对象',
  `exam_place` varchar(100) DEFAULT NULL COMMENT '培训地点',
  `exam_target` varchar(255) DEFAULT NULL COMMENT '培训目标',
  `exam_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '练考计划状态 0:关闭 1:激活',
  PRIMARY KEY (`exam_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cpr_exam
-- ----------------------------
INSERT INTO `cpr_exam` VALUES ('2', 'ewerw', null, '2018-04-02 08:46:01', '30', 'qqqwer', '333', '2342', '1');

-- ----------------------------
-- Table structure for cpr_folder
-- ----------------------------
DROP TABLE IF EXISTS `cpr_folder`;
CREATE TABLE `cpr_folder` (
  `folder_id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_name` varchar(255) DEFAULT NULL COMMENT '权限(菜单)名称',
  `key_name` varchar(255) DEFAULT NULL,
  `ico_str` varchar(50) DEFAULT '' COMMENT 'ICO图表class',
  `parent_id` int(11) DEFAULT '0' COMMENT '父ID',
  `sort` int(3) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '状态 0:删除 1:锁定 2:正常',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `folder_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1: 菜单 2: 按钮',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_id` int(11) DEFAULT NULL COMMENT '添加人id',
  `create_name` varchar(50) DEFAULT NULL COMMENT '添加人姓名',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人id',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人姓名',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`folder_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='权限(菜单)表';

-- ----------------------------
-- Records of cpr_folder
-- ----------------------------
INSERT INTO `cpr_folder` VALUES ('1', '系统设置', 'SYS_SET', 'fa-gear', '0', '7', '2', null, '1', '2018-05-14 08:40:39', '2018-05-14 08:40:39', null, null, null, null, null);
INSERT INTO `cpr_folder` VALUES ('2', '菜单列表', 'MENU_LIST', 'fa-navicon', '1', '1', '2', '/menu/index.html', '1', '2018-01-08 09:10:28', '2018-01-08 09:10:28', null, null, null, null, null);
INSERT INTO `cpr_folder` VALUES ('3', '添加菜单', 'MENU_ADD', '', '2', '0', '2', '/menu/add_menu.html', '2', '2018-01-08 11:22:27', '2018-01-08 11:22:27', null, null, null, null, null);
INSERT INTO `cpr_folder` VALUES ('4', '编辑菜单', 'MENU_EDIT', '', '2', '0', '2', '/menu/edit_menu.html', '2', '2018-01-08 11:23:08', null, null, null, null, null, null);
INSERT INTO `cpr_folder` VALUES ('5', '删除菜单', 'MENU_DEL', '', '2', '0', '2', '/menu/del_menu.html', '2', '2018-01-08 11:23:59', null, null, null, null, null, null);
INSERT INTO `cpr_folder` VALUES ('6', '练考计划', 'TRAIN', 'fa-heartbeat', '0', '2', '2', '/train/index.html', '1', '2018-03-30 08:42:04', '2018-03-30 08:42:04', '1', '超级管理员', null, null, null);
INSERT INTO `cpr_folder` VALUES ('7', '学员管理', 'STUDENT', 'fa-users', '0', '3', '2', '/student/index.html', '1', '2018-05-30 08:51:51', '2018-05-30 08:51:51', '1', '超级管理员', null, null, null);
INSERT INTO `cpr_folder` VALUES ('8', '模型管理', 'MODEL_LIST', 'fa-odnoklassniki', '0', '4', '2', '/mould/index.html', '1', '2018-03-30 08:42:21', '2018-03-30 08:42:21', '1', '超级管理员', null, null, null);
INSERT INTO `cpr_folder` VALUES ('9', '参数设置', 'ARGS_SETTING', 'fa-th-large', '0', '5', '2', '/args/index.html', '1', '2018-05-03 11:47:06', '2018-05-03 11:47:06', '1', '超级管理员', null, null, null);
INSERT INTO `cpr_folder` VALUES ('10', '添加模型', 'MOULD_ADD', '', '8', '0', '2', '/mould/add.html', '2', '2018-03-28 09:40:44', null, '1', '超级管理员', null, null, null);
INSERT INTO `cpr_folder` VALUES ('11', '编辑模型', 'MOULD_EDIT', '', '8', '0', '2', '/mould/edit.html', '2', '2018-03-28 15:54:35', '2018-03-28 15:54:35', '1', '超级管理员', null, null, null);
INSERT INTO `cpr_folder` VALUES ('12', '删除模型', 'MOULD_DEL', '', '8', '0', '2', '/mould/del.html', '2', '2018-03-28 15:48:35', null, '1', '超级管理员', null, null, null);
INSERT INTO `cpr_folder` VALUES ('13', '批量删除', 'MOULD_BATCH_DEL', '', '8', '0', '2', '/mould/batch_del.html', '2', '2018-03-28 15:50:26', null, '1', '超级管理员', null, null, null);
INSERT INTO `cpr_folder` VALUES ('14', '培训项目', 'EXAM_LIST', 'fa-calendar-plus-o', '0', '1', '2', '/exam/index.html', '1', '2018-03-30 08:41:53', '2018-03-30 08:41:53', '1', '超级管理员', null, null, null);
INSERT INTO `cpr_folder` VALUES ('15', '添加培训项目', 'EXAM_ADD', '', '14', '0', '2', '/exam/add.html', '2', '2018-03-30 11:27:53', null, '1', '超级管理员', null, null, null);
INSERT INTO `cpr_folder` VALUES ('16', '编辑培训项目', 'EXAM_EDIT', '', '14', '0', '2', '/exam/edit.html', '2', '2018-03-30 13:35:26', '2018-03-30 13:35:26', '1', '超级管理员', null, null, null);
INSERT INTO `cpr_folder` VALUES ('17', '删除培训项目', 'EXAM_DEL', '', '14', '0', '2', '/exam/del.html', '2', '2018-03-30 11:28:50', null, '1', '超级管理员', null, null, null);
INSERT INTO `cpr_folder` VALUES ('18', '批量删除培训项目', 'EXAM_BATCH_DEL', '', '14', '0', '2', '/exam/batch_del.html', '2', '2018-03-30 11:29:27', null, '1', '超级管理员', null, null, null);
INSERT INTO `cpr_folder` VALUES ('19', '添加培训人员', 'EXAM_ADD_USER', '', '14', '0', '2', '/exam/exam_add_user.html', '2', '2018-04-02 13:55:22', '2018-04-02 13:55:22', '1', '超级管理员', '1', '超级管理员', null);
INSERT INTO `cpr_folder` VALUES ('20', '添加学生', 'STUDENT_ADD', '', '14', '0', '2', '/exam/exam_add_user.html', '2', '2018-04-02 13:55:22', '2018-04-02 13:55:22', '1', '超级管理员', '1', '超级管理员', null);
INSERT INTO `cpr_folder` VALUES ('21', '编辑学生', 'STUDENT_EDIT', '', '14', '0', '2', '/student/edit.html', '2', '2018-04-02 15:43:32', null, '1', '超级管理员', null, null, null);
INSERT INTO `cpr_folder` VALUES ('22', '批量删除学员', 'STUDENT_BATCH_DEL', '', '14', '0', '2', '', '2', '2018-04-08 10:01:43', null, '1', '超级管理员', null, null, null);
INSERT INTO `cpr_folder` VALUES ('23', '添加练考计划', 'TRAIN_ADD', '', '6', '0', '2', '', '2', '2018-04-08 14:32:10', null, '1', '超级管理员', null, null, null);
INSERT INTO `cpr_folder` VALUES ('24', '编辑练考计划', 'TRAIN_EDIT', '', '6', '0', '2', '', '2', '2018-04-08 14:34:52', null, '1', '超级管理员', null, null, null);
INSERT INTO `cpr_folder` VALUES ('25', '删除练考计划', 'TRAIN_DEL', '', '6', '0', '2', '', '2', '2018-04-08 14:35:12', null, '1', '超级管理员', null, null, null);
INSERT INTO `cpr_folder` VALUES ('26', '批量删除练考计划', 'TRAIN_BATCH_DEL', '', '6', '0', '2', '', '2', '2018-04-08 14:35:40', null, '1', '超级管理员', null, null, null);
INSERT INTO `cpr_folder` VALUES ('27', '批量删除练考计划', 'TRAIN_BATCH_DEL', '', '6', '0', '0', '', '0', '2018-04-08 14:35:45', '2018-04-08 14:35:45', '1', '超级管理员', '1', '超级管理员', null);
INSERT INTO `cpr_folder` VALUES ('28', '统计信息', 'CENSUS_INFO', 'fa-bar-chart-o', '0', '6', '2', '/census/index.html', '1', '2018-05-14 08:40:34', '2018-05-14 08:40:34', '1', '超级管理员', null, null, null);

-- ----------------------------
-- Table structure for cpr_mould
-- ----------------------------
DROP TABLE IF EXISTS `cpr_mould`;
CREATE TABLE `cpr_mould` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(100) NOT NULL COMMENT '模型名称/设备名称',
  `m_version` varchar(100) DEFAULT NULL COMMENT '模型型号',
  `m_no` varchar(255) DEFAULT NULL COMMENT '模型编码',
  `m_serial_number` varchar(255) DEFAULT NULL COMMENT '序列号',
  `m_buy_time` date DEFAULT NULL COMMENT '购买时间',
  `m_repair_days` varchar(255) DEFAULT NULL COMMENT '保修期',
  `m_place` varchar(255) DEFAULT NULL COMMENT '存放地点',
  `m_use_time` int(100) DEFAULT NULL COMMENT '使用次数',
  `m_repair_tel` varchar(255) DEFAULT NULL COMMENT '维修电话',
  `m_status` tinyint(1) DEFAULT '1' COMMENT '0:故障 1:正常',
  PRIMARY KEY (`m_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cpr_mould
-- ----------------------------
INSERT INTO `cpr_mould` VALUES ('4', '12324112', '', '123', '', null, '', '', null, '', '1');
INSERT INTO `cpr_mould` VALUES ('5', 'adq', '', '1234', '', '2018-03-29', '', '', null, '', '1');

-- ----------------------------
-- Table structure for cpr_role
-- ----------------------------
DROP TABLE IF EXISTS `cpr_role`;
CREATE TABLE `cpr_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `key_name` varchar(255) NOT NULL,
  `role_name` varchar(90) NOT NULL COMMENT '角色名称',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态 0:删除 1:锁定 2:正常',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_id` int(11) DEFAULT NULL COMMENT '添加人id',
  `create_name` varchar(50) DEFAULT NULL COMMENT '添加人姓名',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人id',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人姓名',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`),
  KEY `role_name` (`role_name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of cpr_role
-- ----------------------------
INSERT INTO `cpr_role` VALUES ('1', 'ADMIN', '超级管理员', '2', '2018-01-08 09:21:37', '2018-01-08 09:21:37', '1', '超级管理员', null, null, '');

-- ----------------------------
-- Table structure for cpr_role_folder
-- ----------------------------
DROP TABLE IF EXISTS `cpr_role_folder`;
CREATE TABLE `cpr_role_folder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_id` int(11) NOT NULL COMMENT '权限ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `folder_role` (`folder_id`,`role_id`) USING BTREE,
  KEY `folder_id` (`folder_id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='角色权限表';

-- ----------------------------
-- Records of cpr_role_folder
-- ----------------------------
INSERT INTO `cpr_role_folder` VALUES ('1', '1', '1');
INSERT INTO `cpr_role_folder` VALUES ('2', '2', '1');
INSERT INTO `cpr_role_folder` VALUES ('3', '3', '1');
INSERT INTO `cpr_role_folder` VALUES ('4', '4', '1');
INSERT INTO `cpr_role_folder` VALUES ('5', '5', '1');
INSERT INTO `cpr_role_folder` VALUES ('6', '6', '1');
INSERT INTO `cpr_role_folder` VALUES ('7', '7', '1');
INSERT INTO `cpr_role_folder` VALUES ('8', '8', '1');
INSERT INTO `cpr_role_folder` VALUES ('9', '9', '1');
INSERT INTO `cpr_role_folder` VALUES ('10', '10', '1');
INSERT INTO `cpr_role_folder` VALUES ('11', '11', '1');
INSERT INTO `cpr_role_folder` VALUES ('12', '12', '1');
INSERT INTO `cpr_role_folder` VALUES ('13', '13', '1');
INSERT INTO `cpr_role_folder` VALUES ('14', '14', '1');
INSERT INTO `cpr_role_folder` VALUES ('15', '15', '1');
INSERT INTO `cpr_role_folder` VALUES ('16', '16', '1');
INSERT INTO `cpr_role_folder` VALUES ('17', '17', '1');
INSERT INTO `cpr_role_folder` VALUES ('18', '18', '1');
INSERT INTO `cpr_role_folder` VALUES ('19', '19', '1');
INSERT INTO `cpr_role_folder` VALUES ('20', '20', '1');
INSERT INTO `cpr_role_folder` VALUES ('21', '21', '1');
INSERT INTO `cpr_role_folder` VALUES ('22', '22', '1');
INSERT INTO `cpr_role_folder` VALUES ('23', '23', '1');
INSERT INTO `cpr_role_folder` VALUES ('24', '24', '1');
INSERT INTO `cpr_role_folder` VALUES ('25', '25', '1');
INSERT INTO `cpr_role_folder` VALUES ('26', '26', '1');
INSERT INTO `cpr_role_folder` VALUES ('27', '27', '1');
INSERT INTO `cpr_role_folder` VALUES ('28', '28', '1');

-- ----------------------------
-- Table structure for cpr_score
-- ----------------------------
DROP TABLE IF EXISTS `cpr_score`;
CREATE TABLE `cpr_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sum_grade` int(5) NOT NULL DEFAULT '0' COMMENT '总成绩',
  `grade_obj` int(5) NOT NULL DEFAULT '0' COMMENT '客观评分值',
  `grade_sub` int(5) NOT NULL DEFAULT '0' COMMENT '主观评分值',
  `full_mark` int(5) DEFAULT '0' COMMENT '满分值',
  `sum_time` int(5) DEFAULT '0' COMMENT '最大用时（单位：秒）',
  `op_time` int(5) DEFAULT '0' COMMENT '实际操作时间（单位：秒）',
  `project` varchar(100) DEFAULT NULL COMMENT '项目名称',
  `type` tinyint(1) DEFAULT '0' COMMENT '练习(0x00)，考核(0x01)',
  `op_success` tinyint(1) DEFAULT '0' COMMENT '操作成功(0x01),失败(0x00)',
  `interrupt_time` int(5) DEFAULT '0' COMMENT '中断时间(单位：秒)',
  `ccf` int(5) DEFAULT '0' COMMENT '按压比例 CCF > 60%',
  `defibr_num` int(5) DEFAULT '0' COMMENT '除颤次数',
  `pressure_pce` int(5) DEFAULT '0' COMMENT '按压正确百分比',
  `breath_pce` int(5) DEFAULT '0' COMMENT '吹气正确百分比',
  `p_sum_num` int(10) DEFAULT '0' COMMENT '按压总次数',
  `p_right` int(10) DEFAULT '0' COMMENT '按压正确次数',
  `p_error` int(10) DEFAULT '0' COMMENT '按压错误次数',
  `p_over` int(10) DEFAULT '0' COMMENT '按压过大',
  `p_lower` int(10) DEFAULT '0' COMMENT '按压过小',
  `release_error` int(10) DEFAULT '0' COMMENT '释放不足次数',
  `pos_error` int(10) DEFAULT '0' COMMENT '按压位置错误次数',
  `pos_l` int(10) DEFAULT '0' COMMENT '按压过左',
  `pos_r` int(10) DEFAULT '0' COMMENT '按压过右',
  `pos_t` int(10) DEFAULT '0' COMMENT '按压过高',
  `pos_b` int(10) DEFAULT '0' COMMENT '按压过低',
  `p_over_num` int(10) DEFAULT '0' COMMENT '按压多按次数',
  `p_lower_num` int(10) DEFAULT '0' COMMENT '按压少按次数',
  `p_rate_pce` int(10) DEFAULT '0' COMMENT '按压正确频率百分比',
  `p_rate_right` int(10) DEFAULT '0',
  `p_rate_error` int(10) DEFAULT '0' COMMENT '按压正确率错误数',
  `p_average_depth` int(10) DEFAULT '0' COMMENT '按压平均深度',
  `b_sum_num` int(10) DEFAULT '0' COMMENT '吹气总次数',
  `b_right` int(10) DEFAULT '0' COMMENT '吹气正确次数',
  `b_error` int(10) DEFAULT '0' COMMENT '吹气错误次数',
  `b_over` int(10) DEFAULT '0' COMMENT '吹气过大',
  `b_lower` int(10) DEFAULT '0' COMMENT '吹气过小',
  `pipe_close` int(10) DEFAULT '0' COMMENT '气道未开放次数',
  `stomach` int(10) DEFAULT '0' COMMENT '进胃次数',
  `b_over_num` int(10) DEFAULT '0' COMMENT '吹气多吹次数',
  `b_lower_num` int(10) DEFAULT '0' COMMENT '吹气少吹次数',
  `b_average_rate` int(10) DEFAULT '0' COMMENT '平均吹气频率',
  `b_average_volume` int(10) DEFAULT '0' COMMENT '平均吹气量',
  `b_rate_pce` int(10) DEFAULT '0' COMMENT '吹气正确频率百分比',
  `ventila_time_right` int(10) DEFAULT '0' COMMENT '通气时间正确次数',
  `ventila_time_short` int(10) DEFAULT '0' COMMENT '通气时间过短次数',
  `ventila_time_long` int(10) DEFAULT '0' COMMENT '通气时间过长次数',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `project_id` int(11) NOT NULL COMMENT '练考计划ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cpr_score
-- ----------------------------
INSERT INTO `cpr_score` VALUES ('1', '80', '45', '-1', '100', '200', '121', 'xxx', '0', '1', '1', '10', '10', '80', '20', '20', '5', '2', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '1', '1', '1', '2', '3');
INSERT INTO `cpr_score` VALUES ('2', '80', '45', '-1', '100', '200', '100', 'xxx', '0', '0', '0', '10', '1', '80', '20', '20', '5', '2', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '1', '1', '1', '2', '3');
INSERT INTO `cpr_score` VALUES ('3', '80', '45', '-1', '100', '200', '123', 'xxx', '0', '1', '0', '10', '2', '80', '20', '20', '5', '2', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '1', '1', '1', '5', '3');
INSERT INTO `cpr_score` VALUES ('4', '80', '45', '-1', '100', '200', '122', 'xxx', '0', '0', '0', '10', '3', '80', '20', '20', '5', '2', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '1', '1', '1', '5', '3');

-- ----------------------------
-- Table structure for cpr_student
-- ----------------------------
DROP TABLE IF EXISTS `cpr_student`;
CREATE TABLE `cpr_student` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_true_name` varchar(255) DEFAULT NULL COMMENT '用户姓名',
  `user_sex` tinyint(1) DEFAULT NULL COMMENT '性别 1:男 0:女',
  `user_degree` varchar(255) DEFAULT NULL COMMENT '学历',
  `user_card_no` varchar(100) DEFAULT NULL COMMENT '身份证',
  `user_company` varchar(255) DEFAULT NULL COMMENT '单位',
  `user_home_address` varchar(255) DEFAULT NULL COMMENT '家庭地址',
  `user_email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `user_phone` varchar(255) DEFAULT NULL,
  `exam_id` int(11) DEFAULT NULL COMMENT '项目id',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cpr_student
-- ----------------------------
INSERT INTO `cpr_student` VALUES ('2', '2333', '0', '本科', '', '33333', 'adddd', '', '23423423', '2');
INSERT INTO `cpr_student` VALUES ('3', '123123', '1', '本科', '220323198209102015', '上海嘉贻医学', '撒旦法阿斯蒂芬', 'wodeln@163.com', '123123123', '2');
INSERT INTO `cpr_student` VALUES ('4', '123123', '1', '本科', '220323198209102015', '上海嘉贻医学', '撒旦法阿斯蒂芬', 'wodeln@163.com', '123123123', '2');
INSERT INTO `cpr_student` VALUES ('5', '454545', '0', 'sdfsdfsf', '', '', '', '', '15021464551', '2');
INSERT INTO `cpr_student` VALUES ('6', '454545', '0', 'sdfsdfsf', '', '', '', '', '15021464551', '2');

-- ----------------------------
-- Table structure for cpr_train
-- ----------------------------
DROP TABLE IF EXISTS `cpr_train`;
CREATE TABLE `cpr_train` (
  `train_id` int(11) NOT NULL AUTO_INCREMENT,
  `train_name` varchar(100) NOT NULL COMMENT '培训项目名称',
  `train_content` varchar(100) DEFAULT NULL COMMENT '培训对象',
  `train_type` tinyint(1) DEFAULT '1' COMMENT '训练类型 0:练习 1:考试',
  `train_begin_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '培训开始时间',
  `train_minites` int(100) DEFAULT NULL COMMENT '培训时长 分钟',
  `train_place` varchar(255) DEFAULT NULL COMMENT '培训地点',
  `train_status` tinyint(1) DEFAULT '1' COMMENT '培训项目状态 0:关闭 1:开启',
  `exam_id` int(11) DEFAULT NULL COMMENT '所属培训项目ID',
  PRIMARY KEY (`train_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cpr_train
-- ----------------------------
INSERT INTO `cpr_train` VALUES ('3', '测试练考计划', null, '0', '2018-04-10 00:00:00', '120', '', '1', '2');
INSERT INTO `cpr_train` VALUES ('4', '12333', null, '0', '2018-05-08 00:00:00', '20', '', '1', '2');
INSERT INTO `cpr_train` VALUES ('5', '再来一个测试', null, '1', '2018-05-08 00:00:00', '120', '', '1', '2');
INSERT INTO `cpr_train` VALUES ('6', '再来一个呢', null, '0', '2018-05-10 11:25:19', '200', '', '0', null);
INSERT INTO `cpr_train` VALUES ('7', '2333', null, '3', '2018-05-16 00:00:00', '2333', '', '1', '2');

-- ----------------------------
-- Table structure for cpr_train_log
-- ----------------------------
DROP TABLE IF EXISTS `cpr_train_log`;
CREATE TABLE `cpr_train_log` (
  `train_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `train_id` int(11) NOT NULL COMMENT '练考ID',
  `exam_id` int(11) NOT NULL COMMENT '培训项目ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `train_point` float(5,2) NOT NULL COMMENT '得分',
  `if_pass` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否及格 0:未及格 1:及格',
  PRIMARY KEY (`train_log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cpr_train_log
-- ----------------------------

-- ----------------------------
-- Table structure for cpr_train_setting
-- ----------------------------
DROP TABLE IF EXISTS `cpr_train_setting`;
CREATE TABLE `cpr_train_setting` (
  `train_setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `handle_time` int(7) NOT NULL COMMENT '操作时间',
  `interruption_time` int(7) DEFAULT NULL COMMENT '中断时间',
  `massage_time_percent` int(3) DEFAULT NULL COMMENT '按压时间占比',
  `massage_right_percent` int(3) DEFAULT NULL COMMENT '按压正确率',
  `ventilate_right_percent` int(3) DEFAULT NULL COMMENT '吹气正确率',
  `massage_frequency_percent` int(3) DEFAULT NULL COMMENT '按压正确率',
  `opt_type` tinyint(1) DEFAULT NULL COMMENT '操作模式 1:普及 2:标准',
  `massage_speed_min` int(5) NOT NULL COMMENT '按压速度最小值',
  `massage_speed_max` int(5) NOT NULL COMMENT '按压速度最大值',
  `massage_deep_min` int(5) NOT NULL COMMENT '按压深度最小值',
  `massage_deep_max` int(5) NOT NULL COMMENT '按压深度最大值',
  `ventilate_time_min` int(5) NOT NULL COMMENT '通气时间最小值',
  `ventilate_time_max` int(5) NOT NULL COMMENT '通气时间最大值',
  `ventilate_volume_min` int(5) NOT NULL COMMENT '通气体积最小值',
  `ventilate_volume_max` int(5) NOT NULL COMMENT '通气体积最大值',
  `rhythm` varchar(30) NOT NULL COMMENT '节拍音',
  `voice_prompt` tinyint(4) NOT NULL COMMENT '语音提示 0:关闭 1:开启',
  `defibrillation` tinyint(1) NOT NULL COMMENT '能否除颤 1:能 2:否 3:忽略',
  `defibrillation_times` int(5) DEFAULT NULL COMMENT '除颤次数',
  `success_condition` varchar(20) DEFAULT NULL COMMENT '成功条件',
  `train_id` int(11) NOT NULL COMMENT '练考计划ID',
  PRIMARY KEY (`train_setting_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cpr_train_setting
-- ----------------------------
INSERT INTO `cpr_train_setting` VALUES ('10', '0', '0', '330', '700', '0', null, '1', '100', '1200', '51', '6000', '500', '1500', '500', '1000', '1000', '1', '2', null, 'CPR', '3');
INSERT INTO `cpr_train_setting` VALUES ('11', '150', '0', null, null, null, null, '1', '100', '120', '50', '60', '500', '1500', '500', '1000', '1000', '1', '3', null, 'CPR', '4');
INSERT INTO `cpr_train_setting` VALUES ('13', '150', '0', null, null, null, null, '1', '100', '120', '50', '60', '500', '1500', '500', '1000', '1000', '1', '1', '150', '除颤', '6');
INSERT INTO `cpr_train_setting` VALUES ('14', '150', '0', null, null, null, null, '1', '100', '120', '50', '60', '500', '1500', '500', '1000', '1000', '1', '3', null, 'CPR', '7');

-- ----------------------------
-- Table structure for cpr_train_student
-- ----------------------------
DROP TABLE IF EXISTS `cpr_train_student`;
CREATE TABLE `cpr_train_student` (
  `train_student_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学员ID',
  `train_id` int(11) NOT NULL COMMENT '练考计划ID',
  PRIMARY KEY (`train_student_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cpr_train_student
-- ----------------------------
INSERT INTO `cpr_train_student` VALUES ('7', '2', '3');
INSERT INTO `cpr_train_student` VALUES ('6', '5', '3');

-- ----------------------------
-- Table structure for cpr_user
-- ----------------------------
DROP TABLE IF EXISTS `cpr_user`;
CREATE TABLE `cpr_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT NULL COMMENT '用户名',
  `head_img` varchar(255) DEFAULT NULL COMMENT '头像',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `real_name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `sex` tinyint(1) DEFAULT '1' COMMENT '性别 1:男 2:女',
  `status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '状态 0:删除 1:锁定 2:正常',
  `user_tel` varchar(15) DEFAULT NULL COMMENT '联系电话',
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_id` int(11) DEFAULT NULL COMMENT '添加人id',
  `create_name` varchar(50) DEFAULT NULL COMMENT '添加人姓名',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人id',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人姓名',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of cpr_user
-- ----------------------------
INSERT INTO `cpr_user` VALUES ('1', 'admin', null, '81dc9bdb52d04dc20036dbd8313ed055', '超级管理员', '1', '2', null, '1', '2018-03-27 09:29:46', '2018-03-27 09:29:46', null, null, null, null, null);

-- ----------------------------
-- Table structure for cpr_user_role
-- ----------------------------
DROP TABLE IF EXISTS `cpr_user_role`;
CREATE TABLE `cpr_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_id` int(11) DEFAULT NULL COMMENT '添加人id',
  `create_name` varchar(50) DEFAULT NULL COMMENT '添加人姓名',
  `update_id` int(11) DEFAULT NULL COMMENT '更新人id',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人姓名',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户与角色对应表';

-- ----------------------------
-- Records of cpr_user_role
-- ----------------------------
