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
	<link rel="stylesheet" type="text/css" href="<c:url value='/asset/css/bootstrap.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/asset/fonts/font-awesome/css/font-awesome.min.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/asset/css/bootstrap-extended.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/asset/css/app.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/asset/css/colors.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/asset/css/core/menu/menu-types/vertical-menu.css' />">
	<link rel="stylesheet" type="text/css"
		href="<c:url value='/asset/css/core/menu/menu-types/vertical-overlay-menu.css' />">
	<link rel="stylesheet" type="text/css" href="<c:url value='/asset/css/style.css' />">
	<script src="<c:url value='/asset/js/jquery.min.js' />" type="text/javascript"></script>

</head>

<div id="app">
	<section class="section">
		<div class="container mt-5">
			<div class="row">
				<div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">

					<div class="card card-primary">
						<div class="card-header">
							<h4>Login</h4>
						</div>

						<div class="card-body">
							<form method="POST" action="#" class="needs-validation" novalidate="">
								<div class="form-group">
									<label for="email">Email</label>
									<input id="email" type="email" class="form-control" name="email" tabindex="1"
										required autofocus>
									<div class="invalid-feedback">
										Please fill in your email
									</div>
								</div>

								<div class="form-group">
									<div class="d-block">
										<label for="password" class="control-label">Password</label>
										<div class="float-right">
											<a href="auth-forgot-password.html" class="text-small">
												Forgot Password?
											</a>
										</div>
									</div>
									<input id="password" type="password" class="form-control" name="password"
										tabindex="2" required>
									<div class="invalid-feedback">
										please fill in your password
									</div>
								</div>

								<div class="form-group">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" name="remember" class="custom-control-input" tabindex="3"
											id="remember-me">
										<label class="custom-control-label" for="remember-me">Remember Me</label>
									</div>
								</div>

								<div class="form-group">
									<button type="submit" class="btn btn-primary btn-lg btn-block" tabindex="4">
										Login
									</button>
								</div>
							</form>

						</div>
					</div>
					<div class="mt-5 text-muted text-center">
						Don't have an account? <a href="auth-register.html">Create One</a>
					</div>
					<div class="simple-footer mt-5">
						Copyright &copy; Blockvotes
					</div>
				</div>
			</div>
		</div>
	</section>
</div>

<script type="text/javascript">
	$(document).ready(function () {
		$('#vote').click(function () {
			//todo
		})
	});

</script>
<html>