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
			</ol>
			<h1>Home !</h1>
			<div class="mb-0 mt-4">
				<i class="fa fa-newspaper-o"></i> Lastest Games
			</div>
			<hr class="mt-2">
			<div class="row">
				<c:forEach items="${products}" var="product">
					<div class="col-sm-4">
						<div class="card">
							<div class="card-block">
								<!-- Example Social Card-->
								<div class="card mb-3">
									<a href="#"> <img class="card-img-top img-fluid w-100"
										src="http://news.amoofile.com/wp-content/uploads/2015/06/dota-2-official1.jpg"
										alt="">
									</a>
									<div class="card-body">
										<h5 class="card-title mb-1">
											<c:out value="${product.product_id}" />
											.
											<c:out value="${product.prod_name}" />
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
										<form action="buyGame" method="post">
											<input type="hidden" name="product_id" id="product_id"
												value="<c:out value="${product.product_id}" />" /> <input
												type="submit" class="btn btn-danger" value="Select">
											<span class="pull-right"><button type="button"
													class="btn btn-outline-danger" disabled>$ <c:out value="${product.price}" /></button></span>
										</form>
									</div>
								</div>

								<!-- end -->
							</div>
						</div>
					</div>
					<!-- end of sm -->
				</c:forEach>

			</div>
			<!-- end divs container -->
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>