package com.miototech.workflow.demo.workflow.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.miototech.workflow.demo.workflow.domain.Person;

public interface PersonRepository extends JpaRepository<Person, Long> {
}
