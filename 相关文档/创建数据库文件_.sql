/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1:3306
Source Server Version : 50623
Source Host           : localhost:3306
Source Database       : recruitwebsite

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2017-05-20 00:00:43
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `t_company`
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company` (
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近的一次更新时间',
  `id` char(32) NOT NULL COMMENT '主键',
  `user_id` char(32) NOT NULL DEFAULT '' COMMENT '创建此公司的用户的id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '公司的名字',
  `logo` varchar(255) NOT NULL DEFAULT '' COMMENT '公司的logo',
  `person_scale_low` int(11) NOT NULL DEFAULT '0' COMMENT '公司规模n~m人的n',
  `person_scale_high` int(11) NOT NULL DEFAULT '0' COMMENT '公司规模,n~m人中的m\r\n            ',
  `desc_content` varchar(3000) NOT NULL DEFAULT '' COMMENT '公司相关描述内容',
  `contact` varchar(50) NOT NULL DEFAULT '' COMMENT '公司负责人联系方式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司表';

-- ----------------------------
-- Records of t_company
-- ----------------------------

-- ----------------------------
-- Table structure for `t_job`
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job` (
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近的一次更新时间',
  `id` char(32) NOT NULL COMMENT '主键',
  `user_id` char(32) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `company_id` char(32) NOT NULL DEFAULT '' COMMENT '此职位关联到的公司的id',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '职位名称',
  `salary_low` int(11) NOT NULL DEFAULT '0' COMMENT '最低薪水',
  `salary_high` int(11) NOT NULL DEFAULT '0' COMMENT '最高薪水',
  `location` varchar(50) NOT NULL DEFAULT '' COMMENT '工作位置',
  `work_experience_low` tinyint(4) NOT NULL DEFAULT '0' COMMENT '工作经验要求,最低年限',
  `work_experience_high` tinyint(4) NOT NULL DEFAULT '0' COMMENT '工作经验要求，最高年限',
  `desc_content` varchar(3000) NOT NULL DEFAULT '' COMMENT '职位描述信息',
  `education_require` tinyint(4) NOT NULL DEFAULT '0' COMMENT '学历要求',
  `contact` varchar(50) NOT NULL DEFAULT '' COMMENT '职位负责人的联系方式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='职位表';

-- ----------------------------
-- Records of t_job
-- ----------------------------

-- ----------------------------
-- Table structure for `t_msg`
-- ----------------------------
DROP TABLE IF EXISTS `t_msg`;
CREATE TABLE `t_msg` (
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近的一次更新时间',
  `id` char(32) NOT NULL COMMENT '主键',
  `user_id` char(32) NOT NULL DEFAULT '' COMMENT '接收用户的id',
  `msg_content` varchar(3000) NOT NULL DEFAULT '' COMMENT '消息的内容',
  `is_have_read` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否已经读过了，\r\n            0=未读\r\n            1=已读',
  `have_read_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '被阅读时的时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息表';

-- ----------------------------
-- Records of t_msg
-- ----------------------------

-- ----------------------------
-- Table structure for `t_resume`
-- ----------------------------
DROP TABLE IF EXISTS `t_resume`;
CREATE TABLE `t_resume` (
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近的一次更新时间',
  `id` char(32) NOT NULL COMMENT '主键',
  `user_id` char(32) NOT NULL DEFAULT '' COMMENT '这份简历是属于哪个用户的',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '简历的名字',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '简历的路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简历表';

-- ----------------------------
-- Records of t_resume
-- ----------------------------

-- ----------------------------
-- Table structure for `t_resume_deliver`
-- ----------------------------
DROP TABLE IF EXISTS `t_resume_deliver`;
CREATE TABLE `t_resume_deliver` (
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近的一次更新时间',
  `id` char(32) NOT NULL COMMENT '主键',
  `resume_id` char(32) NOT NULL DEFAULT '' COMMENT '投递的简历的id，关联到简历表',
  `job_id` char(32) NOT NULL DEFAULT '' COMMENT '职位id，简历投给了哪个职位',
  `result` tinyint(4) NOT NULL DEFAULT '0' COMMENT '简历的结果\r\n            0=未处理\r\n            1=不合适\r\n            2=邀请面试',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简历投递情况表';

-- ----------------------------
-- Records of t_resume_deliver
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近的一次更新时间',
  `id` char(32) NOT NULL COMMENT '主键',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(20) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `passwd` char(60) NOT NULL DEFAULT '' COMMENT '密码',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像的路径',
  `user_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户类型，\r\n            0=求职者\r\n            1=企业方\r\n            2=管理员',
  `is_freeze` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否已经被冻结\r\n            0=否\r\n            1=是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO t_user VALUES ('2017-05-19 23:59:15', '2017-05-19 23:59:15', '04d0e3fe836a4d38a36b71c73cb0c40e', 'admin', '管理员', '93c1f48066a2932351b94a812b4a1c66', 'defaultAvatar.png', '2', '0');
