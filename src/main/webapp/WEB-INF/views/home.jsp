<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Welcome to Users Page</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<link
	href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/bootstrap/css/theme.css" />"
	rel="stylesheet">
<script
	src="<c:url value="/resources/bootstrap/scripts/jquery.min.js" />"></script>

<script
	src="<c:url value="/resources/bootstrap/scripts/popper.min.js" />"></script>
<script
	src="<c:url value="/resources/bootstrap/scripts/bootstrap.min.js" />"></script>

<script type="text/javascript">
	$(document).ready(function() {
		
		$('a').on('click', function(e) {
			e.preventDefault();
			var pageRef = $(this).attr('href');
			//if (!$(this).hasClass("navbar-brand")){
				callPage(pageRef);
			//}
			

		});

		function callPage(page) {
			$.ajax({
				url : page,
				type : "GET",
				dataType : "text",
				success : function(response) {
					console.log("page loaded", response);
					$('.content').html(response);
				},
				error : function(error) {
					console.log("page not loaded", error);
				},
				complete : function(xhr, status) {
					console.log("The request is complete");
				}
			});
		}
	});
</script>
</head>
<body class="bg-dark ">


	<div class="container-fluid">

		<br>
		<div class="row">

			<div class=" col-sm-9 col-lg-2">
				<nav
					class="form-control  text-white bg-dark navbar navbar-default navbar-fixed-side navbar-dark">

					<!-- normal collapsible navbar markup -->

					<a class="navbar-brand lemonText" href="home/menu1">Menu 1</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav mr-auto">
							
							<li class="nav-item"><a class="nav-link text-success"
								href="asp">Asp</a></li>
							<li class="nav-item"><a class="nav-link text-success"
								href="users">Users</a></li>

						</ul>
						<!-- <form class="form-inline my-2 my-lg-0">
							<input class="form-control mr-sm-2" type="search"
								placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-success my-2 my-sm-0"
								type="submit">Search</button>
						</form> -->
					</div>
				</nav>
				<br>
				<nav
					class="form-control  text-white bg-dark navbar navbar-default navbar-fixed-side navbar-dark">

					<!-- normal collapsible navbar markup -->


					<a class="navbar-brand lemonText" href="home/menu2">Admin Menu</a>

					

					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent2"
						aria-controls="navbarSupportedContent2" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent2">
						<ul class="navbar-nav mr-auto">
							<li class="nav-item active"><a class="nav-link text-success"
								href="functions">Save/Update functions <span class="sr-only">(current)</span>
							</a></li>
							<li class="nav-item"><a class="nav-link text-success"
								href="#">Link</a></li>
							<li class="nav-item"><a class="nav-link text-success"
								href="#">Link</a></li>
							<li class="nav-item"><a class="nav-link text-success"
								href="#">Link</a></li>
							<li class="nav-item"><a class="nav-link text-success"
								href="#">Link</a></li>

						</ul>
						<!-- <form class="form-inline my-2 my-lg-0">
							<input class="form-control mr-sm-2" type="search"
								placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-success my-2 my-sm-0"
								type="submit">Search</button>
						</form> -->
					</div>
				</nav>
			</div>
			
			<div class="form-control  text-white bg-dark col-sm-9 col-lg-9 content">
				<p>test</p>
			</div>
		</div>
	</div>
</body>
</html>