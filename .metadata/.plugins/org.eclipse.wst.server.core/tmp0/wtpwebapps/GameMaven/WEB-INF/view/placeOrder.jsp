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
				<li class="breadcrumb-item active">AddToCart</li>
			</ol>
			<div class="mb-0 mt-4">
				<i class="fa fa-circle-o-notch fa-spin fa-3x fa-fw"></i><i
					class="fa fa-newspaper-o"></i> Purchase Game
			</div>
			<hr class="mt-2">

			<c:forEach items="${products}" var="product">

				<form action="addToCart" method="post">
					<div class="row">
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
												<a href="#">#kickflip</a> <a href="#">#holdmybeer</a> <a
													href="#">#igotthis</a>
											</p>
										</div>
										<hr class="my-0">
										<div class="card-footer small text-muted">
											<input type="hidden" name="product_id" id="product_id"
												value="<c:out value="${product.product_id}" />" />
											<button type="button" class="btn btn-success" disabled>
												in Stock =
												<c:out value="${product.stock}" />
											</button>
											<span class="pull-right"><button type="button"
													class="btn btn-outline-danger" disabled>
													$
													<c:out value="${product.price}" />
												</button></span>
										</div>
									</div>

									<!-- end -->
								</div>
							</div>
						</div>
						<!-- end of sm -->

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
						<div class="col-sm-4">

							<div class="card-header">Have you Logged in</div>
							<div class="card-body">

								<div class="form-group">
									<label for="user_name">Enter - User Name</label> <input
										class="form-control" id="user_name" type="text"
										name="user_name" aria-describedby="user_name"
										placeholder="cust=asd ven=qwe" required>
								</div>
								<div class="form-group">
									<label for="password">Enter - Password</label> <input
										class="form-control" id="password" type="password"
										name="password" placeholder="Password" required>
								</div>
								<div class="form-group">
									<label for="quantity">Enter - quantity</label> <input
										class="form-control" id="quantity" type="number"
										name="quantity" placeholder="quantity" required>
								</div>
								
								<div>
								<input type="hidden" value="<c:out value="${product.product_id}" />" name="prod_id">
								</div>
								<i class="fa fa-cart-plus" aria-hidden="true">
								<input type="submit" class="btn btn-primary btn-block"
									value="Add to Cart"></i>
							
								<div class="text-center">
									<a class="d-block small mt-3" href="register.html">Register
										an Account</a> <a class="d-block small"
										href="forgot-password.html">Forgot Password?</a>
								</div>
							</div>
						</div>
					</div>
				</form> <!-- form end --------------------------------------- -->
			</c:forEach> <!-- foreach end -------------------------------------- -->
			<hr>
			<br>
			<h3>Summary :</h3><br>
			<p>As an action-adventure game heavily influenced by Greek
				mythology, God of War was developed by Sony Computer Entertainment's
				Santa Monica division. It was very well received by critics and fans
				alike and was the recipient of many awards, including "Game of the
				Year" honors from the Academy of Interactive Arts & Sciences. IGN
				even named God of War the best PlayStation two game ever. The game
				is now available in the PlayStation 2's lineup of Greatest Hits.
				Thanks in part to the critical and commercial success of the
				original, a sequel titled God of War II was released March 13, 2007.
				In 2007, IGN named God of War as the greatest PlayStation 2 game of
				all time, on their Top 25 PS2 Games list. God of War focuses heavily
				on bloody combat and puzzle-solving, much like Prince of Persia:
				Warrior Within. Kratos, the main character in the God of War series,
				uses an array of both weapons and magic powers to fight many
				different types of enemies, most of them based on creatures of Greek
				mythology. For the majority of enemies, Kratos can also initiate a
				minigame that involves precise button presses, analog spins, or
				button mashing, to finish off enemies with a bloody special kill.

				Spread all through the game, and obtainable in various ways, are red
				experience orbs, which allow him to level up his weapons and magic
				powers. He can find Gorgon Eyes and Phoenix Feathers as well,
				allowing him to increase his overall health and magic respectively.

				Throughout the story, Kratos obtains numerous weapons and powers
				from the various Gods of Olympus, many pertaining to classic Greek
				myths, such as spells like Medusa's Gaze, or weapons like the Blade
				of Artemis. God of War is notable for its movie-like presentation.
				While most epic games suffer from immersion-breaking loading
				screens, God of War's story mode switches seamlessly from the title
				screen, to FMV sequences, to gameplay, and back, with very little
				load time. The load times are masked by prefetching the next area as
				the player traverses a long, relatively featureless area.</p>
			<!-- end divs container -->
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>