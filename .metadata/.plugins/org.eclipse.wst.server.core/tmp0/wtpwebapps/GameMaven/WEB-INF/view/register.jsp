<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="content-wrapper">
		<div class="container-fluid">
			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="home">Dashboard</a></li>
				<li class="breadcrumb-item active">Navbar</li>
			</ol>

			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="home">Home</a></li>
				<li class="breadcrumb-item active">Register</li>
			</ol>
			<h1>Register</h1><c:forEach items="${noUser}" var="product"><c:out value="${product.product_id}" /></c:forEach>
			<br> <br>
			<div class="container">
				<div class="card card-register mx-auto mt-5">
					<div class="card-header">Register an Account</div>
					<div class="card-body">

						<form method="post" action="addUser" id="signupForm">
							<div class="form-group">
								<div class="form-row">
									<div class="col-md-6">
										<label for="first_name">First name</label> <input
											class="form-control" id="first_name" type="text"
											name="first_name" aria-describedby="nameHelp"
											placeholder="Enter first name" required>
									</div>
									<div class="col-md-6">
										<label for="last_name">Last name</label> <input
											class="form-control" id="last_name" type="text"
											name="last_name" aria-describedby="nameHelp"
											placeholder="Enter last name" required>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="email">Email address</label> <input
									class="form-control" id="email" name="email" type="email"
									aria-describedby="emailHelp" placeholder="Enter email" required>
							</div>
							<div class="form-group">
								<label for="user_name">User Name</label> <input
									class="form-control" id="user_name" type="text"
									name="user_name" aria-describedby="emailHelp"
									placeholder="Enter email" required>
							</div>
							<div class="form-group">
								<div class="form-row">
									<div class="col-md-6">
										<label for="password">Password</label> <input
											class="form-control" id="password" name="password"
											type="password" placeholder="Password" required>
									</div>
									<div class="col-md-6">
										<label for="confirm_password">Confirm password</label> <input
											class="form-control" id="confirm_password"
											name="confirm_password" type="password"
											placeholder="Confirm password" required>
									</div>
								</div>
							</div>
							<input type="submit" class="btn btn-primary btn-block"
								value="Register" required/>
						</form>

						<div class="text-center">
							<a class="d-block small mt-3" href="login.html">Login Page</a>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script>
		
		$.validator.setDefaults({
			submitHandler: function() {
				alert("submitted!");
			}
		});
		
		$(document).ready(function() {
			// validate the comment form when it is submitted
		
			// validate signup form on keyup and submit
			$("#signupForm").validate({
				rules: {
					first_name: "required",
					last_name: "required",
					user_name: {
						required: true,
						minlength: 2
					},
					password: {
						required: true,
						minlength: 5
					},
					confirm_password: {
						required: true,
						minlength: 5,
						equalTo: "#password"
					},
					email: {
						required: true,
						email: true
					},
					topic: {
						required: "#newsletter:checked",
						minlength: 2
					},
					agree: "required"
				},
				messages: {
					firstname: "Please enter your firstname",
					lastname: "Please enter your lastname",
					username: {
						required: "Please enter a username",
						minlength: "Your username must consist of at least 2 characters"
					},
					password: {
						required: "Please provide a password",
						minlength: "Your password must be at least 5 characters long"
					},
					confirm_password: {
						required: "Please provide a password",
						minlength: "Your password must be at least 5 characters long",
						equalTo: "Please enter the same password as above"
					},
					email: "Please enter a valid email address",
					agree: "Please accept our policy",
					topic: "Please select at least 2 topics"
				}
			});
		
			// propose username by combining first- and lastname
			$("#username").focus(function() {
				var firstname = $("#firstname").val();
				var lastname = $("#lastname").val();
				if (firstname && lastname && !this.value) {
					this.value = firstname + "." + lastname;
				}
			});
		
			//code to hide topic selection, disable for demo
			var newsletter = $("#newsletter");
			// newsletter topics are optional, hide at first
			var inital = newsletter.is(":checked");
			var topics = $("#newsletter_topics")[inital ? "removeClass" : "addClass"]("gray");
			var topicInputs = topics.find("input").attr("disabled", !inital);
			// show when newsletter is checked
			newsletter.click(function() {
				topics[this.checked ? "removeClass" : "addClass"]("gray");
				topicInputs.attr("disabled", !this.checked);
			});
		});
	</script>
	<jsp:include page="footer.jsp" />
</body>
</html>