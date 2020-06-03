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

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
		integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
		integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

	<script src="<c:url value='/asset/js/jquery.min.js' />" type="text/javascript"></script>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>

</head>

<div id="app">
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="opening.html">
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
					<a class="nav-link" href="opening.html">Opening<span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="history.html">History</a>
				</li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<div class="dropdown">
					<a href="#" data-toggle="dropdown"
						class="nav-link dropdown-toggle nav-link-lg nav-link-user text-white">
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
						<a href="#" class="dropdown-item has-icon text-danger">
							<i class="fas fa-sign-out-alt"></i> Logout
						</a>
					</div>
				</div>
			</form>
		</div>
	</nav>

	<div class="container mt-5">
		<div class="col-12 col-md-10 offset-md-1 col-lg-10 offset-lg-1">

			<nav aria-label="breadcrumb mt-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="opening.html">Opening</a></li>
					<li class="breadcrumb-item"><a href="vote-detail.html">Blockchain E-Voting System 1</a></li>
					<li class="breadcrumb-item active" aria-current="page">Result</li>
				</ol>
			</nav>

			<section class="section">
				<div class="row section-header">
					<div class="section-header-back">
						<a href="vote-detail.html" class="btn btn-icon"><i class="fas fa-arrow-left"></i></a>
					</div>
					<h3>Blockchain E-Voting System 1</h3>
				</div>

				<p class="my-3 text-justify">Ambitioni dedisse scripsisse iudicaretur. Cras mattis iudicium purus sit
					amet
					fermentum.
					Donec sed odio operae, eu vulputate felis rhoncus. Praeterea iter est quasdam res quas ex communi.
					At nos hinc
					posthac, sitientis piros Afros. Petierunt uti sibi concilium totius Galliae in diem certam indicere.
					Cras
					mattis iudicium purus sit amet fermentum.</p>
			</section>


			<div class="card">
				<div class="card-header">
					<h4>Pie Chart</h4>
				</div>
				<div class="card-body">
					<canvas id="myChart"></canvas>
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

<script>
	var ctx = document.getElementById("myChart").getContext('2d');
	var randomScalingFactor = function () {
		return Math.round(Math.random() * 100);
	};
	var myChart = new Chart(ctx, {
		type: 'pie',
		data: {
			labels: ["Candidate 1", "Candidate 2", "Candidate 3", "Candidate 4", "Candidate 5", "Candidate 6"],
			datasets: [{
				label: '# of Votes',
				data: [
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
				],
				backgroundColor: [
					'rgba(213, 0, 0, 1)',
					'rgba(41, 98, 255, 1)',
					'rgba(255, 234, 0, 1)',
					'rgba(56, 142, 60, 1)',
					'rgba(170, 0, 255, 1)',
					'rgba(255, 109, 0, 1)'
				],
			}]
		},
		options: {
			responsive: true
		}
	});
</script>

<script type="text/javascript">
	$(document).ready(function () {
		$('#vote').click(function () {
			//todo
		})
	});

</script>
<html>