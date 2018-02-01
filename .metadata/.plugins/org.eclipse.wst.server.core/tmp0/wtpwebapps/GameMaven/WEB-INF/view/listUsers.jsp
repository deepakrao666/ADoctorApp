<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type='text/javascript'>
	$(document).ready(function() {

		$("#delete").click(function() {

			//Collecting  values
			var user_id = $("#user_id").val();

			$.ajax({
				type : 'POST',
				url : "deleteUser",
				data : {
					user_id : user_id,
				},
				success : function(data) {

					alert("Successfully Saved");


				}
			});

		});
		
		$("#edit").click(function() {
			

			//Collecting  values
			var user_id = $("#user_id").val();
			var first_name = $("#fname").val();
			var email_id = $("#email").val();
			var password = $("#password").val();

			$.ajax({
				type : 'POST',
				url : "editUser",
				data : {
					user_id : user_id,
					first_name : first_name,
					email_id : email_id,
					password : password,
				},
				success : function(data) {

					alert("Successfully Saved");


				}
			});

		});
	});
</script>
</head>
<body>
	<h1>lists of all</h1>
	<c:if test="${!empty userBean}">
		<h2>List users</h2>
		<table border="1">
			<tr>
				<th>userId</th>
				<th>Name</th>
				<th>email</th>
				<th>password</th>
				<th>edit / Delete</th>


			</tr>

			<c:forEach items="${userBean}" var="user">
				<tr>
					<td><c:out value="${user.user_id}" /></td>
					<td><c:out  value="${user.first_name}" /></td>
					<td><c:out  value="${user.email_id}" /></td>
					<td><c:out  value="${user.password}" /></td>

					<td><input type="hidden" id="user_id" value="${user.user_id}">
						<button id="delete">delete</button></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<c:if test="${!empty userBean}">
		<h2>List edit</h2>
		<table border="1">
			<tr>
				<th>userId</th>
				<th>Name</th>
				<th>email</th>
				<th>password</th>
				<th>edit / Delete</th>


			</tr>

			<c:forEach items="${userBean}" var="user">
				<tr>
					<td><input type="text" disabled="disabled" value="${user.user_id}" /></td>
					<td><input id = "fname" type="text" value="${user.first_name}" /></td>
					<td><input id = "email" type="text" value="${user.email_id}" /></td>
					<td><input id = "password" type="text" value="${user.password}" /></td>

					<td><input type="hidden" id="user_id" value="${user.user_id}">
						<button id="edit">edit</button></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>