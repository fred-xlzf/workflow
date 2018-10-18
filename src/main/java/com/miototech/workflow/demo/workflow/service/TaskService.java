package com.miototech.workflow.demo.workflow.service;

import java.util.List;

import com.miototech.workflow.demo.workflow.domain.Task;

public interface TaskService {
	List<Task> getTasks(Long teamId,Long personId);
}
