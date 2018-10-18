package com.miototech.workflow.demo.workflow.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="task_status")
public class TaskStatus {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	private String name;
	
	// Getters & Setters
	public String getName() {
		return this.name;
	}
}
