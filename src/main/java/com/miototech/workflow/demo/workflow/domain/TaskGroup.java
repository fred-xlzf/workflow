package com.miototech.workflow.demo.workflow.domain;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "task_group")
public class TaskGroup {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	private String name;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "previous_group_id")
	private TaskGroup previousGroup = null;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "project_id")
	private Project project;
}
