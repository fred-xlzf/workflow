package com.miototech.workflow.demo.workflow.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.miototech.workflow.demo.workflow.repository.TaskRepository;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@Controller
@RequestMapping("/task")
@Api(tags = "任务相关API")
public class TaskController {
	/**
	 * @Autowired
	 * TaskService service;
	 */
	@Autowired
	TaskRepository repo;
	
	@GetMapping("/all")
	@ApiOperation("获取任务列表")
	public String getTaskList(ModelMap map) {
		map.addAttribute("taskList", repo.findAll());
		return "demo";
	}
}
