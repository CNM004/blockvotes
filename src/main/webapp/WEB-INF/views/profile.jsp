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
	<link
		href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i"
		rel="stylesheet">
	<%-- <link rel="stylesheet" type="text/css" href="<c:url value='/asset/css/bootstrap.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/asset/fonts/font-awesome/css/font-awesome.min.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/asset/css/bootstrap-extended.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/asset/css/app.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/asset/css/colors.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/asset/css/core/menu/menu-types/vertical-menu.css' />">
	<link rel="stylesheet" type="text/css"
		href="<c:url value='/asset/css/core/menu/menu-types/vertical-overlay-menu.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/asset/css/style.css' />">
 --%>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
		integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
		integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

	<script src="<c:url value='/asset/js/jquery.min.js' />" type="text/javascript"></script>

	<%-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script> --%>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>

</head>

<div id="app">
	<!-- Header -->
	<jsp:include page="header.jsp"/>

	<div class="container mt-5">
		<div class="col-12 col-md-10 offset-md-1 col-lg-10 offset-lg-1">

			<div class="card card-primary">
				<div class="card-header">
					<h4>Edit Profile</h4>
				</div>

				<div class="card-body">
					<form method="POST">
						<div class="row">
							<div class="form-group col-6">
								<label for="frist_name">First Name</label>
								<input id="frist_name" type="text" class="form-control" name="frist_name" autofocus
									placeholder="Block">
							</div>
							<div class="form-group col-6">
								<label for="last_name">Last Name</label>
								<input id="last_name" type="text" class="form-control" name="last_name"
									placeholder="Votes">
							</div>
						</div>

						<div class="form-group">
							<label for="email">Email</label>
							<input id="email" type="email" class="form-control" name="email"
								placeholder="blockvotes@cnm.com">
							<div class="invalid-feedback">
							</div>
						</div>

						<div class="row">
							<div class="form-group col-6">
								<label for="last_name">Identity Card Number</label>
								<input id="last_name" type="number" class="form-control" name="last_name"
									placeholder="123456789" readonly>
							</div>
							<div class="form-group col-2">
								<label for="inputZip">Day of birth</label>
								<input id="inputState" type="number" class="form-control" placeholder="01" readonly>
							</div>
							<div class="form-group col-2">
								<label for="inputZip">Month</label>
								<input id="inputState" type="number" class="form-control" placeholder="01" readonly>
							</div>
							<div class="form-group col-2">
								<label for="inputZip">Year</label>
								<input id="inputState" type="number" class="form-control" placeholder="1998" readonly>
							</div>
						</div>

						<div class="row">
							<div class="form-group col-12">
								<label>Country</label>
								<select class="form-control selectric">
									<option>Vietnam</option>
									<option>United States</option>
									<option>United Kingdom</option>
									<option>Malaysia</option>
									<option>Thailand</option>
								</select>
							</div>
						</div>

						<button type="button" class="btn btn-link" data-toggle="modal"
							data-target="#changePasswordModal">
							Change password
						</button>
					</form>
				</div>
				<div class="card-footer text-right">
					<button class="btn btn-primary">Save Changes</button>
				</div>
			</div>

			<footer class="footer mt-5">
				<div class="container">
					<span class="text-muted">Copyright &copy; Blockvotes</span>
				</div>
			</footer>
		</div>
	</div>

	<!-- Change password Modal -->
	<div class="modal fade" id="changePasswordModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Change password</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="old-password" class="col-form-label">Old password</label>
							<input type="password" class="form-control" id="old-password">
						</div>
						<div class="form-group">
							<label for="new-password" class="col-form-label">New password</label>
							<input type="password" class="form-control" id="new-password">
						</div>
						<div class="form-group">
							<label for="confirm-password" class="col-form-label">Confirm new password</label>
							<input type="password" class="form-control" id="confirm-password">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#successModal">Change
						password</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Success Modal -->
	<div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body">
					<img alt="image" src="https://image.flaticon.com/icons/svg/845/845646.svg"
						class="rounded-circle card-img-top mb-3" width="100" height="100" data-toggle="tooltip"
						title="Maroon 5">
					<div class="row justify-content-center">
						<h3>Change password successfully</h3>
					</div>
					<div class="row justify-content-center">
						<button type="button" class="btn btn-success" data-dismiss="modal">OK</button>
					</div>
				</div>
			</div>
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