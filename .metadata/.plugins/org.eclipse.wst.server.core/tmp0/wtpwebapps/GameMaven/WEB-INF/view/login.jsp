<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="content-wrapper">
		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
			<li class="breadcrumb-item active">Navbar</li>
		</ol>
		<h1>Login</h1>
		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#">Home</a></li>
			<li class="breadcrumb-item active">Login</li>
		</ol>
		<hr>
		<div class="container">
			<div class="card card-login mx-auto mt-5">
				<div class="card-header">Login</div>
				<div class="card-body">
					<form action="checkUser" method="post">
						<div class="form-group">
							<label for="user_name">User Name</label> <input
								class="form-control" id="user_name" type="text" name="user_name"
								aria-describedby="user_name" placeholder="cust=asd ven=qwe">
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input
								class="form-control" id="password" type="password" name="password"
								placeholder="Password">
						</div>
						<div class="form-group">
							<div class="form-check">
								<label class="form-check-label"> <input
									class="form-check-input" type="checkbox"> Remember
									Password
								</label>
							</div>
						</div>
						<input type="submit" class="btn btn-primary btn-block" value="Login">
					</form>
					<div class="text-center">
						<a class="d-block small mt-3" href="register.html">Register an
							Account</a> <a class="d-block small" href="forgot-password.html">Forgot
							Password?</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>