set foreign_key_checks=0;DROP TABLE IF EXISTS `task`;CREATE TABLE `task` (
`id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
`name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'task_name',
`owner_id` int(20) UNSIGNED NOT NULL COMMENT '任务创建人id',
`team_id` int(20) UNSIGNED NULL,
`project_id` int(20) UNSIGNED NULL,
`task_group_id` int(20) UNSIGNED NULL,
`start_date` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
`end_date` datetime NULL ON UPDATE CURRENT_TIMESTAMP,
`priority` int(5) NULL,
`status_id` int(20) UNSIGNED NULL,
`description` varchar(200) NULL,
PRIMARY KEY (`id`) 
);
DROP TABLE IF EXISTS `task_group`;
CREATE TABLE `task_group` (
`id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
`name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'group_name',
`previous_group_id` int(20) UNSIGNED NULL COMMENT '上一个任务组ID，用于记录不同任务组间的（显示/流程等）先后顺序',
`project_id` int(20) UNSIGNED NULL COMMENT '可为空',
PRIMARY KEY (`id`) 
)
COMMENT = '任务组：相当于看板中的列';
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
`id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
`name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'person_name',
PRIMARY KEY (`id`) 
);
DROP TABLE IF EXISTS `task_manager`;
CREATE TABLE `task_manager` (
`id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
`task_id` int(20) UNSIGNED NOT NULL,
`manager_id` int(20) UNSIGNED NOT NULL COMMENT '任务管理者，可为空，默认所有者就是管理者',
PRIMARY KEY (`id`) 
)
COMMENT = '任务管理员关联表：任务（0..n）：人（0..n）';
DROP TABLE IF EXISTS `task_performer`;
CREATE TABLE `task_performer` (
`id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
`task_id` int(20) UNSIGNED NOT NULL,
`performer_id` int(20) UNSIGNED NOT NULL COMMENT '在任务分配前，任务执行者可为空',
PRIMARY KEY (`id`) 
)
COMMENT = '任务执行人员关联表：任务（0..n）：人（0..n）';
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
`id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
`name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'project_name',
`owner_id` int(20) UNSIGNED NOT NULL COMMENT '项目创建人id',
`team_id` int(20) UNSIGNED NULL,
`start_date` datetime NULL COMMENT '项目起始时间，可为空',
`end_date` datetime NULL COMMENT '项目终止时间，可为空',
`priority` int(5) NULL COMMENT '项目优先级',
`status_id` int(20) UNSIGNED NULL,
`description` varchar(200) NULL,
PRIMARY KEY (`id`) 
);
DROP TABLE IF EXISTS `team`;
CREATE TABLE `team` (
`id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
`name` varchar(100) NOT NULL DEFAULT 'team_name',
`owner_id` int(20) UNSIGNED NOT NULL,
`status_id` int(20) UNSIGNED NULL,
`description` varchar(200) NULL,
PRIMARY KEY (`id`) 
);
DROP TABLE IF EXISTS `team_manager`;
CREATE TABLE `team_manager` (
`id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
`team_id` int(20) UNSIGNED NOT NULL,
`manager_id` int(20) UNSIGNED NOT NULL,
PRIMARY KEY (`id`) 
);
DROP TABLE IF EXISTS `task_status`;
CREATE TABLE `task_status` (
`id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
`name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
PRIMARY KEY (`id`) 
);
DROP TABLE IF EXISTS `project_status`;
CREATE TABLE `project_status` (
`id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
`name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
PRIMARY KEY (`id`) 
);
DROP TABLE IF EXISTS `team_status`;
CREATE TABLE `team_status` (
`id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
`name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
PRIMARY KEY (`id`) 
);
DROP TABLE IF EXISTS `team_member`;
CREATE TABLE `team_member` (
`id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
`team_id` int(20) UNSIGNED NOT NULL,
`member_id` int(20) UNSIGNED NOT NULL,
PRIMARY KEY (`id`) 
);
DROP TABLE IF EXISTS `project_member`;
CREATE TABLE `project_member` (
`id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
`project_id` int(20) UNSIGNED NOT NULL,
`member_id` int(20) UNSIGNED NOT NULL,PRIMARY KEY (`id`)
);
DROP TABLE IF EXISTS `project_manager`;
CREATE TABLE `project_manager` (
`id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
`project_id` int(20) UNSIGNED NOT NULL,
`manager_id` int(20) UNSIGNED NOT NULL,
PRIMARY KEY (`id`) 
);
DROP TABLE IF EXISTS `file`;CREATE TABLE `file` (
`id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
`team_id` int(20) UNSIGNED NULL,
`project_id` int(20) UNSIGNED NULL,
`owner_id` int(20) UNSIGNED NULL,
`uri` varchar(200) NOT NULL,
`name` varchar(100) NOT NULL DEFAULT 'file name',
`parent_uri` varchar(200) NULL COMMENT '父文件夹地址，如果存在的话',
`type` varchar(200) NULL COMMENT 'seafile中的文件类型：file (文件）, dir（文件夹）',
`permission` varchar(100) NULL DEFAULT 'rw' COMMENT '文件权限',
PRIMARY KEY (`id`) 
);
DROP TABLE IF EXISTS `sub_task`;
CREATE TABLE `sub_task` (
`id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
`name` varchar(100) NOT NULL,
`is_checked` int(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否完成：0 - 未完成 （默认值）， 1 - 已完成',
`task_id` int(20) UNSIGNED NULL,
PRIMARY KEY (`id`) 
);
DROP TABLE IF EXISTS `task_history`;
CREATE TABLE `task_history` (
`id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
`task_id` int(20) UNSIGNED NOT NULL,
`message` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`date_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
PRIMARY KEY (`id`) 
);
DROP TABLE IF EXISTS `task_comment`;
CREATE TABLE `task_comment` (
`id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
`commentator_id` int(20) UNSIGNED NOT NULL COMMENT '评论者ID',
`task_id` int(20) UNSIGNED NOT NULL COMMENT '评论所关联的任务ID',
`message` varchar(200) NULL,
PRIMARY KEY (`id`) 
)
COMMENT = '基于任务的评论： 任务1 ---  0...n 评论';

-- ALTER TABLE `sub_task` ADD CONSTRAINT `fk_sub_task_task` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`);ALTER TABLE `task` ADD CONSTRAINT `fk_task_task_1` FOREIGN KEY (`owner_id`) REFERENCES `person` (`id`);
ALTER TABLE `task` ADD CONSTRAINT `fk_task_task_2` FOREIGN KEY (`task_group_id`) REFERENCES `task_group` (`id`);
ALTER TABLE `task` ADD CONSTRAINT `fk_task_task_3` FOREIGN KEY (`status_id`) REFERENCES `task_status` (`id`);ALTER TABLE `task` ADD CONSTRAINT `fk_task_team` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`);ALTER TABLE `task` ADD CONSTRAINT `fk_task_project` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`);ALTER TABLE `task_history` ADD CONSTRAINT `fk_task_history_task` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`);ALTER TABLE `task_comment` ADD CONSTRAINT `fk_comments_person` FOREIGN KEY (`commentator_id`) REFERENCES `person` (`id`);ALTER TABLE `task_comment` ADD CONSTRAINT `fk_comments_task` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`);ALTER TABLE `task_group` ADD CONSTRAINT `fk_task_group_task_group_1` FOREIGN KEY (`previous_group_id`) REFERENCES `task_group` (`id`);
ALTER TABLE `task_group` ADD CONSTRAINT `fk_task_group_task_group_2` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`);ALTER TABLE `task_manager` ADD CONSTRAINT `fk_task_manager_task_manager_1` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`);
ALTER TABLE `task_manager` ADD CONSTRAINT `fk_task_manager_task_manager_2` FOREIGN KEY (`manager_id`) REFERENCES `person` (`id`);ALTER TABLE `task_performer` ADD CONSTRAINT `fk_task_member_task_member_1` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`);ALTER TABLE `task_performer` ADD CONSTRAINT `fk_task_member_task_member_2` FOREIGN KEY (`performer_id`) REFERENCES `person` (`id`);ALTER TABLE `project` ADD CONSTRAINT `fk_project_project_1` FOREIGN KEY (`owner_id`) REFERENCES `person` (`id`);
ALTER TABLE `project` ADD CONSTRAINT `fk_project_project_2` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`);
ALTER TABLE `project` ADD CONSTRAINT `fk_project_project_3` FOREIGN KEY (`status_id`) REFERENCES `project_status` (`id`);ALTER TABLE `project_member` ADD CONSTRAINT `fk_project_member_project_member_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`);ALTER TABLE `project_member` ADD CONSTRAINT `fk_project_member_project_member_2` FOREIGN KEY (`member_id`) REFERENCES `person` (`id`);ALTER TABLE `project_manager` ADD CONSTRAINT `fk_project_manager_project_manager_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`);ALTER TABLE `project_manager` ADD CONSTRAINT `fk_project_manager_project_manager_2` FOREIGN KEY (`manager_id`) REFERENCES `person` (`id`);ALTER TABLE `team` ADD CONSTRAINT `fk_team_team_1` FOREIGN KEY (`owner_id`) REFERENCES `person` (`id`);ALTER TABLE `team` ADD CONSTRAINT `fk_team_team_2` FOREIGN KEY (`status_id`) REFERENCES `team_status` (`id`);ALTER TABLE `team_manager` ADD CONSTRAINT `fk_team_manager_team_manager_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`);
ALTER TABLE `team_manager` ADD CONSTRAINT `fk_team_manager_team_manager_2` FOREIGN KEY (`manager_id`) REFERENCES `person` (`id`);
ALTER TABLE `team_member` ADD CONSTRAINT `fk_team_member_team_member_1` FOREIGN KEY (`member_id`) REFERENCES `person` (`id`);
ALTER TABLE `team_member` ADD CONSTRAINT `fk_team_member_team_member_2` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`);
ALTER TABLE `file` ADD CONSTRAINT `fk_file_team` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`);
ALTER TABLE `file` ADD CONSTRAINT `fk_file_project` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`);
ALTER TABLE `file` ADD CONSTRAINT `fk_file_person` FOREIGN KEY (`owner_id`) REFERENCES `person` (`id`);
