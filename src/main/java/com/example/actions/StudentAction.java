package com.example.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.example.dao.StudentDao;
import com.example.form.StudentForm;
import com.example.pojo.Student;
import com.example.services.StudentService;

public class StudentAction extends DispatchAction {
	
	private StudentDao studentService;
	
	public ActionForward multiRetrieve(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		studentService = new StudentService();
		List<Student> students = studentService.getAll();
		if (students != null) {
			request.setAttribute("studentList", students);
			return mapping.findForward("showMultiple");
		} else {
			return mapping.findForward("failure");
		}
	}
	
	public ActionForward singleRetrieve(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		studentService = new StudentService();
		Student student = null;
		
		if (request.getParameter("rollNo") != null) {
			System.out.println(request.getParameter("rollNo"));
			student = studentService.get(Integer.parseInt(request.getParameter("rollNo")));
		}
		if (student != null) {
			request.setAttribute("student", student);
			request.setAttribute("method", "UPDATE");
		} else {
			request.setAttribute("method", "ADD");
			
		}
		return mapping.findForward("showSingle");
	}
	
	public ActionForward createOrUpdate(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		StudentForm studentForm = (StudentForm) form;
		Student student = new Student();
		BeanUtils.copyProperties(student, studentForm);
		
		if(!request.getParameter("rollNo").equals("")) {
			student.setRollNo(Integer.parseInt(request.getParameter("rollNo")));
		}
			
		studentService = new StudentService();
		String status = studentService.update(student);
		
		if (status.equals("success")) {
			return mapping.findForward("successCreateOrUpdate");
		} else {
			return mapping.findForward(status);
		}
	}
	
	public ActionForward delete(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		studentService = new StudentService();
		String status = studentService.delete(Integer.parseInt(request.getParameter("rollNo")));
		
		if (status.equals("success")) {
			return mapping.findForward("showMultiple");
		} else {
			return mapping.findForward(status);
		}
	}
}
