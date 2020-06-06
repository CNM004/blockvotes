<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" type="text/css" href="<c:url value='/asset/css/bootstrap.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/asset/fonts/font-awesome/css/font-awesome.min.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/asset/css/bootstrap-extended.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/asset/css/app.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/asset/css/colors.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/asset/css/core/menu/menu-types/vertical-menu.css' />">
	<link rel="stylesheet" type="text/css"
		href="<c:url value='/asset/css/core/menu/menu-types/vertical-overlay-menu.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/asset/css/style.css' />">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
		integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
		integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

	<script src="<c:url value='/asset/js/jquery.min.js' />" type="text/javascript"></script>
	<script src="https://www.google.com/recaptcha/api.js?render=${siteKey}"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>

</head>

<div class="container mt-5">
	<div class="row">
		<div class="col-12 col-sm-10 offset-sm-1 col-md-8 offset-md-2 col-lg-8 offset-lg-2 col-xl-8 offset-xl-2">

			<div class="card card-primary">
				<div class="card-header">
					<h4>Register</h4>
				</div>

				<div class="card-body">
					<form:form method="POST" action="register" modelAttribute="user">
								<div class="row">
									<div class="form-group col-6">
										<label for="fullname">Full Name</label> <input id="fullname"
											type="text" class="form-control" name="fullname" autofocus>
									</div>
									<div class="form-group col-6">
										<label for="identity">Identity card number</label> <input
											id="identity" type="text" class="form-control"
											name="identity">
									</div>
								</div>

								<div class="form-group">
									<label for="email">Email</label> <input id="email" type="email"
										class="form-control" name="email">
									<div class="invalid-feedback"></div>
								</div>

								<div class="row">
									<div class="form-group col-6">
										<label for="password" class="d-block">Password</label> <input
											id="password" type="password" class="form-control pwstrength"
											data-indicator="pwindicator" name="password">
										<div id="pwindicator" class="pwindicator">
											<div class="bar"></div>
											<div class="label"></div>
										</div>
									</div>
									<div class="form-group col-6">
										<label for="password2" class="d-block">Password
											Confirmation</label> <input id="password2" type="password"
											class="form-control">
									</div>
								</div>

								<%-- <div class="row">
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
								</div> --%>

								<!-- <div class="form-group">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" name="agree" class="custom-control-input" id="agree">
										<label class="custom-control-label" for="agree">I agree with the terms and
											conditions</label>
									</div>
								</div> -->
								<input type="hidden" id="token" name="token" value="" />
								<div class="form-group">
									<button type="submit" class="btn btn-primary btn-lg btn-block">
										Register</button>
								</div>
							</form:form>
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
		$('form').submit(function (event) {
			search(event);
		});
	});

	function search(event) {
		event.preventDefault();
		if (typeof grecaptcha !== 'undefined') {
			var siteKey = '${siteKey}';
			grecaptcha.execute(siteKey, { action: 'search' }).then(function (response) {
				$('#token').val(response);
				var formData = $('form').serialize();
				var ctx = "<%=request.getContextPath()%>";
				$.post(ctx + "/register/search", formData, function (data) {
					if (data.success == "true") {
						var formData = $('form').serialize();
						$.post(ctx + "/register/save", formData, function (data) {
							alert(data);
							window.location.href = '/blockvotes/login';
						})
							.fail(function (data) {
							});
					}
				})
					.fail(function (data) {
					});
			});
		}
	}

</script>
<html>