package com.example.services;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.example.dao.StudentDao;
import com.example.pojo.Student;
import com.example.util.FactoryProvider;

public class StudentService implements StudentDao {
	
	@Override
	public List<Student> getAll() {
		Transaction transaction = null;
		
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			Query<Student> q = session.createQuery("from Student", Student.class);
			List<Student> students = q.getResultList();
			transaction.commit();
			session.close();
			
			return students;
		} catch (Exception e) {
			transaction.rollback();
		}
		return null;
	}

	@Override
	public Student get(int rollNo) {
		Transaction transaction = null;
		
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			Student student = session.get(Student.class, rollNo);
			transaction.commit();
			session.close();
			return student;
		} catch (Exception e) {
			transaction.rollback();
		}
		return null;
	}

	@Override
	public String update(Student student) {
		String status = "";
		Transaction transaction = null;
		
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			session.saveOrUpdate(student);
			transaction.commit();
			session.close();
			
			status = "success";
		} catch (Exception e) {
			transaction.rollback();
			status = "failure";
		}
		
		return status;
	}

	@Override
	public String delete(int rollNo) {
		String status = "";
		Transaction transaction = null;
		
		try {
			Session session = FactoryProvider.getFactory().openSession();
			transaction = session.beginTransaction();
			Student student = session.get(Student.class, rollNo);
			session.delete(student);
			transaction.commit();
			session.close();
			
			status = "success";
		} catch (Exception e) {
			transaction.rollback();
			status = "failure";
		}
		
		return status;
	}
	
}
