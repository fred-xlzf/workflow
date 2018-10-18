package com.miototech.workflow.demo.workflow.domain;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "task_comment")
public class TaskComment {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "commentator_id")
	private Person commentator;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "task_id")
	private Task task;
	
	private String message = "";
	
}
