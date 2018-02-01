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
				<li class="breadcrumb-item active">Admin - Dashboard</li>
			</ol>
			<h1>Welcome Admin !</h1>
			<br> <br>
			<div class="container-fluid">
				<!-- Example DataTables Card-->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fa fa-table"></i> List of vendors
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>Vendeor ID</th>
										<th>Name</th>
										<th>Position</th>
										<th>Office</th>
										<th>Shop Name</th>
										<th>Salary</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>Vendor ID</th>
										<th>Name</th>
										<th>Position</th>
										<th>Office</th>
										<th>Shop Name</th>
										<th>Salary</th>
									</tr>
								</tfoot>
								<tbody>
									<c:forEach items="${vendor}" var="vendor">
										<tr>
											<td><c:out value="${vendor.user_id}" /></td>
											<td><c:out value="${vendor.first_name}" /></td>
											<td>GoldClass Vendor</td>
											<td>Illinois</td>
											<td><c:out value="${vendor.shopName}" /></td>
											<td>$320,800</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="card-footer small text-muted">Updated yesterday
						at 11:59 PM</div>
				</div>
				<div class="card mb-3">
					<div class="card-header">
						<i class="fa fa-table"></i> Add Vendors
					</div>
					<div class="card-body">
						<div class="table-responsive">

							<form action="addVendor" method="post">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>Vendor UserName</th>
											<th>Name</th>
											<th>Password</th>
										</tr>
										<tr>
											<td><input type="text" name="user_name"
												placeholder="johnDoe" /></td>
											<td><input type="text" name="first_name"
												placeholder="john" /></td>
											<td><input type="text" name="password"
												placeholder="password" /></td>
										</tr>
										<tr>
											<th>VendorClass</th>
											<th>Office</th>
											<th>Shop Name</th>
											

										</tr>
										<tr>
											<td>
												<div class="form-group">
													<select class="form-control" name="last_name"
														id="last_name">
														<option>Gold</option>
														<option>Silver</option>
													</select>
												</div></td>
											<td><input type="text" name="address"
												placeholder="123, St name, city" /></td>
											<td><input type="text" name="shopName"
												placeholder="EA games" /></td>

										</tr>
									</thead>
									<tbody>
										<tr>
											<th></th>
											<td><input id="addVendor" type="submit" value="Submit"></td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
$(document).ready(function(){
	
	$("#addVendor").click(function(){
		alert("Vendor Added")
	});
});

</script>
	<jsp:include page="footer.jsp" />
</body>
</html>