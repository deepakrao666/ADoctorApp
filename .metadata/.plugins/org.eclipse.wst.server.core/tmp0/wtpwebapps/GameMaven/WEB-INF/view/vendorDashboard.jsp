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
				<li class="breadcrumb-item active">vendor - Dashboard</li>
			</ol>
			<h1>Vendor DashBoard !</h1>


			<div class="container">
				<div class="card-header">Add products to shop</div>
				<div class="card-body">
					<form method="post" action="addProduct" id="signupForm">
						<div class="form-group">
							<div class="form-row">
								<div class="col-md-6">
									<label for="prod_name">Product Name</label> <input
										class="form-control" id="prod_name" type="text"
										name="prod_name" aria-describedby="nameHelp"
										placeholder="Enter product name">
								</div>
								<div class="col-md-6">
									<label for="cat_id">Select category</label>
									<div class="form-group">
										<select class="form-control" name="cat_id" id="cat_id">
											<option>Action</option>
											<option>Adventure</option>
											<option>RPG</option>
											<option>Shooter</option>
											<option>Puzzle</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="form-row">
								<div class="col-md-6">
									<label for=price>Price</label> <input class="form-control"
										id="price" name="price" type="number"
										placeholder="100$ ~price">
								</div>
								<div class="col-md-6">
									<label for="prod_size">Size Of File</label>
									<div class="form-group">
										<select class="form-control" name="prod_size" id="prod_size">
											<option>1MB ~ 10MB</option>
											<option>11MB ~ 50MB</option>
											<option>51MB ~ 1GB</option>
											<option>1.1GB ~ 5GB</option>
											<option>5.1GB and above</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="form-row">
								<div class="col-md-6">
									<label for="store_id">Publishing Studio</label> <input
										class="form-control" id="store_id" name="store_id" type="text"
										placeholder="Game CompanyName">
								</div>
								<div class="col-md-6">
									<label for="stock">GameKeys in Market</label> <input
										class="form-control" id="stock" name="stock" type="number"
										placeholder="Number of Keys in Market">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="description">Description</label> <input
								class="form-control" id="description" type="text"
								name="description" aria-describedby="emailHelp"
								placeholder="Enter description" />
						</div>
						<div class="form-group">
							<label for="color">Image Url./</label>
							<div class="form-group">
								<select class="form-control" name="color" id="color">
									<option>http://news.amoofile.com/wp-content/uploads/2015/06/dota-2-official1.jpg</option>
								</select>
							</div>
						</div>

						<input type="submit" id="addProduct" class="btn btn-primary btn-block"
							value="Add Product" />
					</form>
				</div>
			</div>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#addProduct").click(function(){
		alert("Product Added")
	});
});

</script>


			<!-- *********************************************************************************************************** -->
<br><br>
			<div class="row">
				<div class="col-lg-8">
					<!-- Card Columns Example Social Feed-->
					<div class="mb-0 mt-4">
						<i class="fa fa-newspaper-o"></i> List of Products
					</div>
					<hr class="mt-2">
					<div class="card-columns">
						<c:forEach items="${products}" var="product">
							<div class="card mb-3">
								<a href="#"> <img class="card-img-top img-fluid w-100"
									src="http://news.amoofile.com/wp-content/uploads/2015/06/dota-2-official1.jpg"
									alt="">
								</a>
								<div class="card-body">
									<h5 class="card-title mb-1">
										<c:out value="${product.product_id}" />. <c:out value="${product.prod_name}" />
									</h5>
									<p class="card-text small">
										<c:out value="${product.description}" />
										<a href="#">#kickflip</a> <a href="#">#holdmybeer</a> <a
											href="#">#igotthis</a>
									</p>
								</div>
								<hr class="my-0">
								<div class="card-body py-2 small">
									<a class="mr-3 d-inline-block" href="#"> <i
										class="fa fa-fw fa-thumbs-up"></i>Like
									</a> <a class="mr-3 d-inline-block" href="#"> <i
										class="fa fa-fw fa-comment"></i>Comment
									</a> <a class="d-inline-block" href="#"> <i
										class="fa fa-fw fa-share"></i>Share
									</a>
								</div>
								<div class="card-footer small text-muted">
									<form>
										<input type="hidden"
											value="<c:out value="${product.product_id}" />" />Posted 1 hr ago <input
											type="submit" value="select">
									</form>
								</div>
							</div>
						</c:forEach>

						<!-- end card -->
					</div>

					<!-- /Card Columns-->
				</div>
				<div class="col-lg-4">
					<!-- Example Notifications Card-->
					<div class="card mb-3">
						<div class="card-header">
							<i class="fa fa-bell-o"></i> Feed Example
						</div>
						<div class="list-group list-group-flush small">
							<a class="list-group-item list-group-item-action" href="#">
								<div class="media">
									<img class="d-flex mr-3 rounded-circle"
										src="http://placehold.it/45x45" alt="">
									<div class="media-body">
										<strong>David Miller</strong>posted a new article to <strong>David
											Miller Website</strong>.
										<div class="text-muted smaller">Today at 5:43 PM - 5m
											ago</div>
									</div>
								</div>
							</a> <a class="list-group-item list-group-item-action" href="#">
								<div class="media">
									<img class="d-flex mr-3 rounded-circle"
										src="http://placehold.it/45x45" alt="">
									<div class="media-body">
										<strong>Samantha King</strong>sent you a new message!
										<div class="text-muted smaller">Today at 4:37 PM - 1hr
											ago</div>
									</div>
								</div>
							</a> <a class="list-group-item list-group-item-action" href="#">
								<div class="media">
									<img class="d-flex mr-3 rounded-circle"
										src="http://placehold.it/45x45" alt="">
									<div class="media-body">
										<strong>Jeffery Wellings</strong>added a new photo to the
										album <strong>Beach</strong>.
										<div class="text-muted smaller">Today at 4:31 PM - 1hr
											ago</div>
									</div>
								</div>
							</a> <a class="list-group-item list-group-item-action" href="#">
								<div class="media">
									<img class="d-flex mr-3 rounded-circle"
										src="http://placehold.it/45x45" alt="">
									<div class="media-body">
										<i class="fa fa-code-fork"></i> <strong>Monica Dennis</strong>forked
										the <strong>startbootstrap-sb-admin</strong>repository on <strong>GitHub</strong>.
										<div class="text-muted smaller">Today at 3:54 PM - 2hrs
											ago</div>
									</div>
								</div>
							</a> <a class="list-group-item list-group-item-action" href="#">View
								all activity...</a>
						</div>
						<div class="card-footer small text-muted">Updated yesterday
							at 11:59 PM</div>
					</div>
				</div>
			</div>


			<!-- *************************************************************** -->
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>