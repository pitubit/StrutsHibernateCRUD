<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.example.pojo.Student"%>
<%@page import="org.apache.struts.taglib.bean.IncludeTag"%>
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
input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
  -webkit-appearance: none; 
}

input[type=number] {
  -moz-appearance: textfield;
}
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	text-decoration: none;
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

 	.form { 
 		width: 30vw;
	} 

/* 	.form .input-field, .submit { */
/* 		margin-top: 12px; */
/* 		width: 100%; */
/* 	} */

/* 	.form .input-field { */
/* 		width: 100%; */
/* 		border: 1px solid red; */
/* 		display: flex; */
/* 		justify-content: space-around; */
/* 	} */

/* 	.form .input-field .field { */

/* 	} */

/* 	.form .submit { */
/* 		margin-top: 10px; */
/* 		padding: 6px; */
/* 	} */
</style>
</head>
<body>
	<h2>Student Details</h2>
	<%  
	Student student = (Student) request.getAttribute("student");
	%>
	<html:form styleClass="mt-5 form" action="/students?action=createOrUpdate&rollNo=${student.rollNo}" method="POST">
		<div class="mb-2">
			<label for="exampleFormControlInput1" class="form-label">Name</label>
			<input name="name" value="${student.name}" type="text" class="form-control" autocomplete="off" id="exampleFormControlInput1" />
		</div>
		<div class="mb-2">
			<label for="exampleFormControlInput2" class="form-label">Gender</label>
			<br />
			<div class="form-check">
			  <input name="gender" value="Male" class="form-check-input" type="radio" id="maleRadio">
			  <label class="form-check-label" for="flexRadioDefault1">Male</label>
			</div>
			<div class="form-check">
			  <input name="gender" value="Female" class="form-check-input" type="radio" id="femaleRadio">
			  <label class="form-check-label" for="flexRadioDefault2">Female</label>
			</div>
		</div>
		<div class="mb-2">
			<label for="exampleFormControlInput3" class="form-label">Contact No</label>
			<input name="contactNumber" value="${student.contactNumber}" type="number" class="form-control" id="exampleFormControlInput3" />
		</div>
		<div class="mb-2">
			<label for="exampleFormControlInput4" class="form-label">Address</label>
			<input name="address" value="${student.address}"  type="text" class="form-control" id="exampleFormControlInput4" />
		</div>
		<input type="submit" value=<%= request.getAttribute("method") %> class="mt-2 btn btn-primary px-3" />
	</html:form>
	
	<script type="text/javascript">
		
		const maleRadio = document.getElementById("maleRadio");
		const femaleRadio = document.getElementById("femaleRadio");
		if ("${student.gender}" == "Male") {
			maleRadio.checked = true;
		} else if ("${student.gender}" == "Female") {
			femaleRadio.checked = true;	
		}
		
	
	</script>
</body>
</html>