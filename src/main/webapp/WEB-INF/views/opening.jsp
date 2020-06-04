<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<br>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8'">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
		integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
		integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

	<script src="<c:url value='/asset/js/jquery.min.js' />" type="text/javascript"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>

</head>

<div id="app">
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">
			<img src="https://image.flaticon.com/icons/svg/893/893071.svg" width="30" height="30"
				class="d-inline-block align-top" alt="">
			Blockvotes
		</a>

		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="#">Opening<span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="history.jps">History</a>
				</li>
			</ul>
			<form class="form-inline my-2 my-lg-0" action="<c:url value="/j_spring_security_logout" />" method="post">
				<div class="dropdown">
					<a href="#" data-toggle="dropdown" class="nav-link dropdown-toggle nav-link-lg nav-link-user text-white">
						<img alt="image"
							src="https://i.pinimg.com/originals/37/8c/4b/378c4ba6ce42d11d5b3023b5e63134f4.jpg"
							class="rounded-circle mr-1" width="50" height="50">
						<div class="d-sm-none d-lg-inline-block">Hi, BlockVotes!</div>
					</a>
					<div class="dropdown-menu dropdown-menu-right">
						<a href="features-profile.html" class="dropdown-item has-icon">
							<i class="far fa-user"></i> Profile
						</a>
						<div class="dropdown-divider"></div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<a href="#" class="dropdown-item has-icon text-danger">
							<i class="fas fa-sign-out-alt"></i> 
							<input type="submit" value="Logout" />
						</a>
					</div>
				</div>
			</form>
		</div>
	</nav>


	<div class="container mt-5">
		<div class="col-12 col-md-10 offset-md-1 col-lg-10 offset-lg-1">
	
		  <div class="card">
			<div class="card-header">
			  <h4>Opening</h4>
			</div>
			<div class="card-body p-0">
			  <div class="table-responsive">
				<table class="table table-striped table-md">
				  <tr>
					<th>#</th>
					<th>Name</th>
					<th>End in</th>
					<th>Status</th>
					<th>Action</th>
				  </tr>
				  <tr>
					<td>1</td>
					<td> Blockchain E-Voting System 1</td>
					<td>05:30:30</td>
					<td>
					  <div class="badge badge-secondary">Voted</div>
					</td>
					<td><a href="#" class="btn btn-primary">Detail</a></td>
				  </tr>
				  <tr>
					<td>2</td>
					<td>Blockchain E-Voting System 2</td>
					<td>10:40:10</td>
					<td>
					  <div class="badge badge-warning">Pending</div>
					</td>
					<td><a href="#" class="btn btn-primary">Detail</a></td>
				  </tr>
				  <tr>
					<td>3</td>
					<td>Blockchain E-Voting System 3</td>
					<td>08:00:00</td>
					<td>
					  <div class="badge badge-danger">Denied</div>
					</td>
					<td><a href="#" class="btn btn-primary">Detail</a></td>
				  </tr>
				  <tr>
					<td>4</td>
					<td>Blockchain E-Voting System 4</td>
					<td>20:20:20</td>
					<td>
					  <div class="badge badge-success">Opening</div>
					</td>
					<td><a href="#" class="btn btn-primary">Detail</a></td>
				  </tr>
				  <tr>
					<td>5</td>
					<td>Blockchain E-Voting System 5</td>
					<td>00:50:04</td>
					<td>
					  <div class="badge badge-success">Opening</div>
					</td>
					<td><a href="#" class="btn btn-primary">Detail</a></td>
				  </tr>
				</table>
			  </div>
			</div>
			<div class="card-footer text-right">
			  <nav class="d-inline-block">
				<ul class="pagination mb-0">
				  <li class="page-item disabled">
					<a class="page-link" href="#" tabindex="-1"><i class="fas fa-chevron-left"></i></a>
				  </li>
				  <li class="page-item active"><a class="page-link" href="#">1 <span class="sr-only">(current)</span></a>
				  </li>
				  <li class="page-item">
					<a class="page-link" href="#">2</a>
				  </li>
				  <li class="page-item"><a class="page-link" href="#">3</a></li>
				  <li class="page-item">
					<a class="page-link" href="#"><i class="fas fa-chevron-right"></i></a>
				  </li>
				</ul>
			  </nav>
			</div>
		  </div>
	
		  <footer class="footer mt-5">
			<div class="container">
			  <span class="text-muted">Copyright &copy; Blockvotes</span>
			</div>
		  </footer>
		</div>
	  </div>
</div>

<script type="text/javascript">
	$(document).ready(function () {
		$('#vote').click(function () {
			//todo
		})
	});

</script>
<html>