package com.miototech.workflow.demo.workflow.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.miototech.workflow.demo.workflow.domain.Person;
import com.miototech.workflow.demo.workflow.domain.Task;

@Repository
public interface TaskRepository extends JpaRepository<Task, Long> {
}
