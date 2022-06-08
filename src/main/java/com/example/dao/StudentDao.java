package com.example.dao;

import java.util.List;

import com.example.pojo.Student;

public interface StudentDao {
	public List<Student> getAll();
	public Student get(int rollNo);
	public String update(Student student);
	public String delete(int rollNo);
}
