package com.miototech.workflow.demo.workflow.domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;

@Entity
public class Team {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	private String name;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "owner_id")
	private Person owner;
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "team_manager", joinColumns = @JoinColumn(name = "team_id"),inverseJoinColumns = @JoinColumn(name = "manager_id"))
	private List<Person> managers = new ArrayList<>();
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "team_member", joinColumns = @JoinColumn(name = "team_id"), inverseJoinColumns = @JoinColumn(name = "member_id"))
	private List<Person> members = new ArrayList<>();

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "status_id")
	private TeamStatus status;
}
