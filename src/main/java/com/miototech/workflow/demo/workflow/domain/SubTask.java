package com.miototech.workflow.demo.workflow.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "sub_task")
public class SubTask {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	private String name = "";
	
	@Column(name = "is_checked")
	private int isChecked = 0;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "task_id")
	private Task task;
	
	
	//Getters & Setters
	public String getName() {
		return this.name;
	}
	
	public boolean getStatus() {
		return isChecked == 0 ? false : true; 
	}
}
