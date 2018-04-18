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
<link
	href="<c:url value="/resources/bootstrap/css/theme.css" />"
	rel="stylesheet">
<script
	src="<c:url value="/resources/bootstrap/scripts/jquery.min.js" />"></script>

<script
	src="<c:url value="/resources/bootstrap/scripts/popper.min.js" />"></script>
<script
	src="<c:url value="/resources/bootstrap/scripts/bootstrap.min.js" />"></script>

<style>

</style>
</head>
<body onload="load();" class="bg-dark ">


	<div class="container-fluid">

		<br>
		<div class="row">

			<div class=" col-sm-9 col-lg-2">
				<nav
					class="form-control  text-white bg-dark navbar navbar-default navbar-fixed-side navbar-dark">

					<!-- normal collapsible navbar markup -->

					<a class="navbar-brand lemonText" href="#">Menu 1</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav mr-auto">
							<li class="nav-item active"><a class="nav-link text-success" href="#">Home
									<span class="sr-only">(current)</span>
							</a></li>
							<li class="nav-item"><a class="nav-link text-success" href="#">Link</a></li>
							<li class="nav-item"><a class="nav-link text-success" href="#">Link</a></li>
							<li class="nav-item"><a class="nav-link text-success" href="#">Link</a></li>
							<li class="nav-item"><a class="nav-link text-success" href="#">Link</a></li>
							
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

					<a class="navbar-brand lemonText" href="#">Menu 2</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent2"
						aria-controls="navbarSupportedContent2" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent2">
						<ul class="navbar-nav mr-auto">
							<li class="nav-item active"><a class="nav-link text-success" href="#">Home
									<span class="sr-only">(current)</span>
							</a></li>
							<li class="nav-item"><a class="nav-link text-success" href="#">Link</a></li>
							<li class="nav-item"><a class="nav-link text-success" href="#">Link</a></li>
							<li class="nav-item"><a class="nav-link text-success" href="#">Link</a></li>
							<li class="nav-item"><a class="nav-link text-success" href="#">Link</a></li>
							
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
			<br>
			<div class="form-control  text-white bg-dark col-sm-9 col-lg-9 ">

				<div class="form-group">
					<input type="hidden" id="user_id"> <label for="name"
						class="text-success">Name </label> <input type="text" id="name"
						required="required" name="user_name"
						class="form-control text-white bg-dark">
				</div>
				<div class="form-group">
					<label for="email" class="text-success">Email </label> <input
						type="email" id="email" required="required" name="email"
						class="form-control  text-white bg-dark">
				</div>
				<div class="form-group">
					<button class="btn btn-outline-warning my-2 my-sm-0 lemonText"
						onclick="submit();">Save/Update</button>
				</div>
				<br>
				<table class="table" id="table">
					<thead class="bg-dark text-success">
						<tr>
							<th scope="col">#</th>
							<th scope="col">Name</th>
							<th scope="col">Email</th>
							<th scope="col">Edit</th>
							<th scope="col">Delete</th>
						</tr>
					</thead>
				</table>


			</div>

		</div>
		<br>
		<!-- <div class="row">
			<div class="form-control  text-white bg-dark col-sm-2 offset-sm-1">test</div>

			<div class="form-control  text-white bg-dark col-sm-7 offset-sm-1">test
			</div> 
		</div>-->
	</div>
	<script type="text/javascript">
		data = "";
		submit = function() {

			$.ajax({
				url : 'saveOrUpdate',
				type : 'POST',
				data : {
					user_id : $("#user_id").val(),
					user_name : $('#name').val(),
					email : $('#email').val()
				},
				success : function(response) {
					//alert(response.message);
					load();
				}
			});
			$("#user_id").val("");
		}

		delete_ = function(id) {
			$.ajax({
				url : 'delete',
				type : 'POST',
				data : {
					user_id : id
				},
				success : function(response) {
					//alert(response.message);
					load();
				}
			});
		}

		edit = function(index) {
			$("#user_id").val(data[index].user_id);
			$("#name").val(data[index].user_name);
			$("#email").val(data[index].email);

		}

		load = function() {
			$
					.ajax({
						url : 'list',
						type : 'POST',
						success : function(response) {
							data = response.data;
							$('.tr').remove();
							for (i = 0; i < response.data.length; i++) {
								$("#table")
										.append(
												"<tr class='tr'> <td> "
														+ response.data[i].user_id
														+ " </td> <td> "
														+ response.data[i].user_name
														+ " </td> <td> "
														+ response.data[i].email
														+ " </td> <td> <a href='#' onclick= edit("
														+ i
														+ ");> Edit </a>  </td> </td> <td> <a href='#' onclick='delete_("
														+ response.data[i].user_id
														+ ");'> Delete </a>  </td> </tr>");
							}
						}
					});

		}
	</script>
</body>
</html>