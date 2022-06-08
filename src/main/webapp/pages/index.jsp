<%@page import="com.example.util.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.example.pojo.Student"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Records</title>
<%@include file="/css/bootstrap.jsp"%>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	display: flex;
	align-items: center;
	flex-direction: column;
	min-height: 100vh;
}

body h2 {
	margin-top: 10vh;
}

body .record-table {
	margin-top: 5vh;
	width: 60%!important;
}
</style>
</head>
<body>
	<h2>Student Records</h2>
	<html:link action="/students?action=singleRetrieve">
		<html:submit styleClass="btn btn-success" value="Add new" />
	</html:link>
	<%
	List<Student> students = (List) request.getAttribute("studentList");
	if (students == null) {
		Session s = FactoryProvider.getFactory().openSession();
		Transaction transaction = s.beginTransaction();
		students = s.createQuery("from Student", Student.class).getResultList();
		transaction.commit();
		s.close();
	}
	if (!students.isEmpty()) {
	%>
	
	<table class="table table-bordered record-table">
	  <thead>
	    <tr>
	      <th scope="col">Roll No</th>
	      <th scope="col">Name</th>
	      <th scope="col">Gender</th>
	      <th scope="col">Contact</th>
	      <th scope="col">Address</th>
	      <th scope="col"></th>
	      <th scope="col"></th>
	    </tr>
	  </thead>
	  <tbody>
	  <%
	  for (Student student : students) {
	  %>
	    <tr>
	      <th scope="row"><%=student.getRollNo()%></th>
	      <td><%=student.getName()%></td>
	      <td><%=student.getGender()%></td>
	      <td><%=student.getContactNumber()%></td>
	      <td><%=student.getAddress()%></td>
	      	<td>
				<a href="students.do?action=singleRetrieve&rollNo=<%=student.getRollNo()%>">
					<button class="btn btn-outline-primary btn-sm">Update</button>
				</a>
			</td>
			<td> 
				<a href="students.do?action=delete&rollNo=<%=student.getRollNo()%>">
					<button class="btn btn-outline-danger btn-sm">Delete</button>
				</a>
			</td>
	    </tr>
	    <%
	    } 
	    %>
	  </tbody>
	</table>
	<%
	}else {
	%>
	<h1>Hello Students</h1>
	<%
	}
	%>
</body>
</html>