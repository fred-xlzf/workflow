-- insert data to: person 
INSERT INTO person (name) VALUES ('User 1');
INSERT INTO person (name) VALUES ('User 2');
INSERT INTO person (name) VALUES ('User 3');
-- INSERT INTO person (name) VALUES ('User 4');
-- INSERT INTO person (name) VALUES ('User 5');


-- insert data to: team_status
INSERT INTO team_status (name) VALUES ('开放');
INSERT INTO team_status (name) VALUES ('解散');


-- insert data to: project_status
INSERT INTO project_status (name) VALUES ('待开始');
INSERT INTO project_status (name) VALUES ('进行中');
INSERT INTO project_status (name) VALUES ('已结束');

-- insert data to: task_status
INSERT INTO task_status (name) VALUES ('未分配');
INSERT INTO task_status (name) VALUES ('未开始');
INSERT INTO task_status (name) VALUES ('进行中');
INSERT INTO task_status (name) VALUES ('待确认');
INSERT INTO task_status (name) VALUES ('已交付');

-- insert data to: team
INSERT INTO team (name, owner_id, status_id,description) VALUES('团队1',1,2,'这是一个处于解散状态的团队');
INSERT INTO team (name, owner_id, status_id,description) VALUES('团队2',1,1,'这是一个处于开发状态的团队');
INSERT INTO team (name, owner_id, status_id,description) VALUES('团队3',2,1,'这是一个处于开发状态的团队');


-- insert data to: project
INSERT INTO project (name, owner_id, team_id,start_date,end_date,priority,status_id,description) VALUES ('项目1',1,1,'2018-09-30 00:00:01','2018-10-03 00:00:01',10,3,'一个在已解散团队里的提前结束状态的项目');
INSERT INTO project (name, owner_id, team_id,start_date,end_date,priority,status_id,description) VALUES ('项目2',2,2,'2018-10-01 00:00:01','2018-10-01 00:00:01',10,1,'一个待开始的项目');
INSERT INTO project (name, owner_id, team_id,start_date,end_date,priority,status_id,description) VALUES ('项目3',3,2,'2018-09-23 00:00:01','2018-09-25 00:00:01',10,1,'一个待开始的项目');
INSERT INTO project (name, owner_id, team_id,start_date,end_date,priority,status_id,description) VALUES ('项目4',2,2,'2018-08-23 00:00:01','2018-08-25 00:00:01',10,3,'一个已结束的项目');
INSERT INTO project (name, owner_id, team_id,start_date,end_date,priority,status_id,description) VALUES ('项目5',3,3,'2018-09-13 00:00:01','2018-09-14 00:00:01',10,2,'一个进行中的项目');
INSERT INTO project (name, owner_id, team_id,start_date,end_date,priority,status_id,description) VALUES ('项目6',1,3,'2018-09-03 00:00:01','2018-09-19 00:00:01',10,2,'一个进行中但延期交付的项目');

-- INSERT DATA TO: task_group
INSERT INTO task_group (name, project_id) VALUES ('to-do',2);
INSERT INTO task_group (name, previous_group_id, project_id) VALUES ('doing',1,2);
INSERT INTO task_group (name, previous_group_id, project_id) VALUES ('done',2,2);

-- INSERT DATA TO: task
INSERT INTO task (name, owner_id, team_id, project_id, task_group_id, start_date, end_date, priority, status_id, description) VALUES ('任务1',3,3,2,1,'2018-09-13 00:00:01','2018-09-14 00:00:01',10,2,'一个进行中的任务');
INSERT INTO task (name, owner_id, team_id, project_id, task_group_id, start_date, end_date, priority, status_id, description) VALUES ('任务2',3,3,3,2,'2018-09-13 00:00:01','2018-09-14 00:00:01',10,2,'一个进行中的任务');
INSERT INTO task (name, owner_id, team_id, project_id, task_group_id, start_date, end_date, priority, status_id, description) VALUES ('任务3',3,3,4,3,'2018-09-13 00:00:01','2018-09-14 00:00:01',10,2,'一个进行中的任务');

-- INSERT DATA TO: sub_task
INSERT INTO sub_task (name, task_id) VALUES ('子任务1',1);
INSERT INTO sub_task (name, task_id) VALUES ('子任务2',1);
INSERT INTO sub_task (name, task_id) VALUES ('子任务3',1);
