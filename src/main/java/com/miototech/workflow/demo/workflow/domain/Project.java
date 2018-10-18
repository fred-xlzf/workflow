package com.miototech.workflow.demo.workflow.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;

@Entity
public class Project {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	private String name;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "owner_id")
	private Person owner;
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "project_manager", joinColumns = @JoinColumn(name = "project_id"),inverseJoinColumns = @JoinColumn(name = "manager_id"))
	private List<Person> managers = new ArrayList<>();
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "project_member", joinColumns = @JoinColumn(name = "project_id"), inverseJoinColumns = @JoinColumn(name = "member_id"))
	private List<Person> members = new ArrayList<>();

	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "team_id")
	private Team team;
	
	@Column(name = "start_date")
	private Date startDate;
	
	@Column(name = "end_date")
	private Date endDate;
	
	private int priority;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "status_id")
	private ProjectStatus status;
}
