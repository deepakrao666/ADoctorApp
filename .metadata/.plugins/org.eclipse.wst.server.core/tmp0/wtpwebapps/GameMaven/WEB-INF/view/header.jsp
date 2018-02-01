<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>AGameShop</title>

<!-- Bootstrap core JavaScript-->
<spring:url value="/resources/vendor/jquery/jquery.min.js" var="jquery" />
<spring:url
	value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"
	var="bootStrap" />
<!-- Core plugin JavaScript-->
<spring:url value="/resources/vendor/jquery-easing/jquery.easing.min.js"
	var="jqueryEasing" />
<!-- Page level plugin JavaScript-->
<spring:url value="/resources/vendor/chart.js/Chart.min.js" var="chart" />
<spring:url value="/resources/vendor/datatables/jquery.dataTables.js"
	var="jqueryDataTables" />
<spring:url
	value="/resources/vendor/datatables/dataTables.bootstrap4.js"
	var="dataTablesBootStrap" />
<!-- Custom scripts for all pages-->
<spring:url value="/resources/js/sb-admin.min.js" var="sbAdminJs" />
<!-- Custom scripts for this page-->
<spring:url value="/resources/js/sb-admin-datatables.min.js"
	var="sbAdminDataTables" />
<spring:url value="/resources/js/sb-admin-charts.min.js"
	var="sbAdminCharts" />
<spring:url value="/resources/gulpfile.js" var="gulp" />

<script src="${gulp}"></script>
<script src="${jquery}"></script>
<script src="${bootStrap}"></script>
<script src="${jqueryEasing}"></script>
<script src="${jqueryDataTables}"></script>
<script src="${dataTablesBootStrap}"></script>
<script src="${sbAdminJs}"></script>
<script src="${sbAdminDataTables}"></script>
<script src="${sbAdminCharts}"></script>

<spring:url value="/resources/js/main.js" var="mainJs" />
<spring:url value="/resources/js/jquery.validate.js"
	var="jqueryValidateJs" />
<script src="${mainJs}"></script>
<script src="${jqueryValidateJs}"></script>

<!-- Bootstrap core JavaScript-->
<spring:url value="/resources/vendor/jquery/jquery.min.js" var="jqMinJs" />
<spring:url
	value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"
	var="bootBundleMinJs" />
<spring:url value="/resources/vendor/jquery-easing/jquery.easing.min.js"
	var="jqEasingMinJs" />
<spring:url value="/resources/vendor/chart.js/Chart.min.js"
	var="chartMinJs" />
<spring:url value="/resources/js/sb-admin.min.js" var="sbAdminMinJs" />
<spring:url value="/resources/js/sb-admin-charts.min.js"
	var="sbAdminChartsMinJs" />

<script src="${jqMinJs}"></script>
<script src="${bootBundleMinJs}"></script>
<script src="${jqEasingMinJs}"></script>
<script src="${chartMinJs}"></script>
<script src="${sbAdminMinJs}"></script>
<script src="${sbAdminChartsMinJs}"></script>


<spring:url value="/resources/vendor/bootstrap/css/bootstrap.min.css"
	var="bootStrapCss" />
<spring:url
	value="/resources/vendor/font-awesome/css/font-awesome.min.css"
	var="fontAwesomeCss" />
<spring:url
	value="/resources/vendor/datatables/dataTables.bootstrap4.css"
	var="dataTablesCss" />
<spring:url value="/resources/css/sb-admin.css" var="sbAdminCss" />

<link href="${bootStrapCss}" rel="stylesheet" />
<link href="${fontAwesomeCss}" rel="stylesheet" />
<link href="${dataTablesCss}" rel="stylesheet" />
<link href="${sbAdminCss}" rel="stylesheet" />


</head>
<body>
	<div>
		<!-- Navigation-->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
			id="mainNav"> <a class="navbar-brand" href="home">AGameShop</a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Dashboard"><a class="nav-link" href="adminLogin"> <i
						class="fa fa-fw fa-dashboard"></i> <span class="nav-link-text">Admin
							Dashboard</span>
				</a></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Example Pages"><a
					class="nav-link nav-link-collapse collapsed" data-toggle="collapse"
					href="#collapseExamplePages" data-parent="#exampleAccordion"> <i
						class="fa fa-fw fa-key"></i> <span class="nav-link-text">Site
							Access</span>
				</a>
					<ul class="sidenav-second-level collapse" id="collapseExamplePages">
						<li><a href="login">Login Page</a></li>
						<li><a href="register">Registration Page</a></li>
					</ul></li>

				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Games"><a class="nav-link nav-link-collapse collapsed"
					data-toggle="collapse" href="#collapseMulti"
					data-parent="#exampleAccordion"> <i
						class="fa fa-fw fa fa-gamepad"></i> <span class="nav-link-text">Games</span>
				</a>
					<ul class="sidenav-second-level collapse" id="collapseMulti">
						<li><a class="nav-link-collapse collapsed"
							data-toggle="collapse" href="#collapseMulti2"><i
								class="fa fa-desktop" aria-hidden="true"></i> <span
								class="nav-link-text">Games Desktop</span></a>
							<ul class="sidenav-third-level collapse" id="collapseMulti2">
								<li><a href="gamesAction">Games Action</a></li>
								<li><a href="gamesAdventure">Games Adventure</a></li>
							</ul>
						</li>
							
						<li><a href="#"> <i class="fa fa-desktop"
								aria-hidden="true"></i> <span class="nav-link-text">Games
									X-Box 360</span>
						</a></li>

						<li><a href="#"><i
								class="fa fa-desktop" aria-hidden="true"></i> <span
								class="nav-link-text">Games Playstation</span></a></li>

					</ul></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Link"><a class="nav-link" href="contact"> <i
						class="fa fa-fw fa-phone"></i> <span class="nav-link-text">Contact Us</span>
				</a></li>
			</ul>
			<ul class="navbar-nav sidenav-toggler">
				<li class="nav-item"><a class="nav-link text-center"
					id="sidenavToggler"> <i class="fa fa-fw fa-angle-left"></i>
				</a></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle mr-lg-2" id="messagesDropdown"
					href="#" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="fa fa-fw fa-envelope"></i> <span
						class="d-lg-none">Messages <span
							class="badge badge-pill badge-primary">12 New</span>
					</span> <span class="indicator text-primary d-none d-lg-block"> <i
							class="fa fa-fw fa-circle"></i>
					</span>
				</a>
					<div class="dropdown-menu" aria-labelledby="messagesDropdown">
						<h6 class="dropdown-header">New Messages:</h6>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <strong>David
								Miller</strong> <span class="small float-right text-muted">11:21
								AM</span>
							<div class="dropdown-message small">Hey there! This new
								version of SB Admin is pretty awesome! These messages clip off
								when they reach the end of the box so they don't overflow over
								to the sides!</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <strong>Jane Smith</strong>
							<span class="small float-right text-muted">11:21 AM</span>
							<div class="dropdown-message small">I was wondering if you
								could meet for an appointment at 3:00 instead of 4:00. Thanks!</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <strong>John Doe</strong> <span
							class="small float-right text-muted">11:21 AM</span>
							<div class="dropdown-message small">I've sent the final
								files over to you for review. When you're able to sign off of
								them let me know and we can discuss distribution.</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item small" href="#">View all messages</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle mr-lg-2" id="alertsDropdown"
					href="#" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="fa fa-fw fa-bell"></i> <span
						class="d-lg-none">Alerts <span
							class="badge badge-pill badge-warning">6 New</span>
					</span> <span class="indicator text-warning d-none d-lg-block"> <i
							class="fa fa-fw fa-circle"></i>
					</span>
				</a>
					<div class="dropdown-menu" aria-labelledby="alertsDropdown">
						<h6 class="dropdown-header">New Alerts:</h6>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <span class="text-success">
								<strong> <i class="fa fa-long-arrow-up fa-fw"></i>Status
									Update
							</strong>
						</span> <span class="small float-right text-muted">11:21 AM</span>
							<div class="dropdown-message small">This is an automated
								server response message. All systems are online.</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <span class="text-danger">
								<strong> <i class="fa fa-long-arrow-down fa-fw"></i>Status
									Update
							</strong>
						</span> <span class="small float-right text-muted">11:21 AM</span>
							<div class="dropdown-message small">This is an automated
								server response message. All systems are online.</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <span class="text-success">
								<strong> <i class="fa fa-long-arrow-up fa-fw"></i>Status
									Update
							</strong>
						</span> <span class="small float-right text-muted">11:21 AM</span>
							<div class="dropdown-message small">This is an automated
								server response message. All systems are online.</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item small" href="#">View all alerts</a>
					</div></li>
				<li class="nav-item">
					<form class="form-inline my-2 my-lg-0 mr-lg-2">
						<div class="input-group">
							<input class="form-control" type="text"
								placeholder="Search for..."> <span
								class="input-group-btn">
								<button class="btn btn-primary" type="button">
									<i class="fa fa-search"></i>
								</button>
							</span>
						</div>
					</form>
				</li>
				<li class="nav-item"><a class="nav-link" data-toggle="modal"
					data-target="#exampleModal"> <i class="fa fa-fw fa-sign-out"></i>Logout
				</a></li>
			</ul>
		</div>
		</nav>
	</div>
</body>
</html>