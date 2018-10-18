package com.miototech.workflow.demo.workflow.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.miototech.workflow.demo.workflow.domain.Task;
import com.miototech.workflow.demo.workflow.repository.TaskRepository;
import com.miototech.workflow.demo.workflow.service.TaskService;

@Service
public class TaskServiceImpl implements TaskService {
	@Autowired
	TaskRepository repository;
	
	@Override
	public List<Task> getTasks(Long teamId, Long personId) {
		// TODO Auto-generated method stub
		return null;
	}

}
