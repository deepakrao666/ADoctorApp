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
				<li class="breadcrumb-item"><a href="home">Dashboard</a></li>
				<li class="breadcrumb-item active"><i class="fa fa-cart-plus"
					aria-hidden="true"></i>Kart</li>
			</ol>
			<div class="mb-0 mt-4">
				<i class="fa fa-circle-o-notch fa-spin fa-3x fa-fw"></i><i
					class="fa fa-newspaper-o"></i>
				<h3>Shopping Cart</h3>
			</div>
			<div class="row">
				<div class="col-sm-8">
					<div class="card">

						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th>Product Name</th>
										<th>Description</th>
										<th>Quantity</th>
										<th>Studio</th>
										<th>Price</th>
										<th>Change</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${productInList}" var="product">
										<tr>
											<td><i class="fa fa-gavel" aria-hidden="true"></i> <c:out
													value="${product.prod_name}" /></td>
											<td><c:out value="${product.description}" /></td>
											<td>
												<input type="number" value="<c:out value="${product.color}" />">
											</td>
											<td><c:out value="${product.store_id}" /></td>
											<td><c:out value="${product.price}" /> $$</td>
											<td><button value="">Remove</button>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>


					</div>
				</div>

				<div class="col-sm-4">
					<div class="card">
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<c:forEach items="${UserInList}" var="product">
										<tr>
											<td>User Name -</td>
											<td><c:out value="${product.user_name}" /></td>
										</tr>
										<tr>
											<td>First Name -</td>
											<td><c:out value="${product.first_name}" /></td>
										</tr>
										<tr>
										
										<td>
										<form action="finalBuy" >
										<input type="hidden" name="user_name" value="<c:out value="${product.user_name}" />">
										<input type="submit" value="Buy Products">
										</form>
										</tr>

									</c:forEach>

								</table>
							</div>
						</div>

					</div>
				</div>

			</div>

			<!-- end divs container -->
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>