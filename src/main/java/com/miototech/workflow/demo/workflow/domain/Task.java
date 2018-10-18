package com.miototech.workflow.demo.workflow.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Task {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	private String name;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="owner_id")
	private Person owner;
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "task_manager", joinColumns = @JoinColumn(name = "task_id"),inverseJoinColumns = @JoinColumn(name = "manager_id"))
	private List<Person> managers = new ArrayList<>();
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "task_performer", joinColumns = @JoinColumn(name = "task_id"), inverseJoinColumns = @JoinColumn(name = "performer_id"))
	private List<Person> performers = new ArrayList<>();
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="task_group_id")
	private TaskGroup taskGroup;
	
	@Column(name="start_date")
	private Date startDate;
	
	@Column(name="end_date")
	private Date endDate;
	
	private int priority;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="status_id")
	private TaskStatus taskStatus;
	
	private String description="";
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="team_id")
	private Team team;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="project_id")
	private Project project;
	
	@OneToMany(mappedBy="task", cascade = CascadeType.ALL)
	private Set<SubTask> subs;
	
	@OneToMany(mappedBy="task", cascade = CascadeType.ALL)
	private Set<TaskHistory> histories;
	
	@OneToMany(mappedBy="task", cascade = CascadeType.ALL)
	private Set<TaskComment> comments;
	
	
	//private Set<File> files;
	
	//Getters & Setters
	public String getName() {
		return this.name;
	}
	
	public String getDescription() {
		return this.description;
	}
	
	public Set getSubTask() {
		return this.subs;
	}
	
	public TaskStatus getStatus() {
		return this.taskStatus;
	}
}
