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
				<li class="breadcrumb-item active">Cart</li>
			</ol>

			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="home">Dashboard</a></li>
				<li class="breadcrumb-item active">kart</li>
				<li class="breadcrumb-item active">Shipping and Billing</li>
								<li class="breadcrumb-item active">Order Confirmed</li>
				
			</ol>
			<div class="mb-0 mt-4">
				<i class="fa fa-circle-o-notch fa-spin fa-3x fa-fw"></i><i
					class="fa fa-newspaper-o"></i> Purchase Game
			</div>
			<hr class="mt-2">

			<c:forEach items="${products}" var="product">

				<form action="home" method="">
					<div class="row">
						<div class="col-sm-4">
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">

										<tr>
											<td>Product Name -</td>
											<td><c:out value="${product.prod_name}" /></td>
										</tr>
										<tr>
											<td>Publishing Studio -</td>
											<td><c:out value="${product.store_id}" /></td>
										</tr>
										<tr>
											<td>Free Memory required -</td>
											<td><c:out value="${product.prod_size}" /></td>
										</tr>
										<tr>
											<td>Product Category -</td>
											<td><c:out value="${product.cat_id}" /></td>
										</tr>
										<tr>
											<td>Product Description -</td>
											<td><c:out value="${product.description}" /></td>
										</tr>

									</table>
								</div>
							</div>
						</div>
						<!-- end of sm -->

						<div class="col-sm-8">
						<div class="centered"><h1>Order Confirmed !</h1></div>
						<br>
						<br>
						<input type="submit"  class="btn btn-primary btn-block" value="return to home">
						</div>
						
					</div>
				</form>
				<!-- form end --------------------------------------- -->
			</c:forEach>
			<!-- foreach end -------------------------------------- -->
			<hr>
			<br>

			<!-- end divs container -->
		</div>
	</div>
	<script>
		$(document).ready(function() {
			function randomWholeNum() {
	
				// Only change code below this line.
	
				return Math.random();
			}
			$("#submit").click(function() {
				alert("OrderConfrimed.");
			});
		});
	</script>
	<jsp:include page="footer.jsp" />
</body>
</html>