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

	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>

</head>

<div id="app">
	<jsp:include page="header.jsp"/>
	<div class="container mt-5">
		<div class="col-12 col-md-10 offset-md-1 col-lg-10 offset-lg-1">

			<!-- Breadcrumb-->
			<nav aria-label="breadcrumb mt-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="<c:url value="/opening" />">Opening</a></li>
					<li class="breadcrumb-item"><a href="<c:url value="/vote-detail" />">Blockchain E-Voting System 1</a></li>
					<li class="breadcrumb-item active" aria-current="page">Result</li>
				</ol>
			</nav>

			<section class="section">
				<div class="row section-header">
					<div class="section-header-back">
						<a href="<c:url value="/vote-detail" />" class="btn btn-icon"><i class="fas fa-arrow-left"></i></a>
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

			<!-- Chart -->
			<div class="card">
				<div class="card-header">
					<h4>Pie Chart</h4>
				</div>
				<div class="card-body">
					<canvas id="pieChart"></canvas>
				</div>
			</div>

			<div class="card">
				<div class="card-header">
					<h4>Bar Chart</h4>
				</div>
				<div class="card-body">
					<canvas id="barChart"></canvas>
				</div>
			</div>

			<!--- Vote table -->
			<%-- <div class="card mt-5">
				<div class="card-header">
					<h4>Voting History</h4>
				</div>
				<div class="card-body p-0">
					<div class="table-responsive">
						<table class="table table-striped table-md">
						<thead>
							<tr>
								<th>#</th>
								<th>Public Key</th>
								<th>Time</th>
								<th>Candidate</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>abcngjurojvowodoWQR2Vgqe2$dvwefas</td>
								<td>10:05 AM 4/6/2020</td>
								<td class="row">
									<img alt="image" src="https://image.flaticon.com/icons/svg/2919/2919600.svg"
										class="rounded-circle" width="35" data-toggle="tooltip" title="Gorden Ramsay">
									<a class="nav-link" href="#">Gorden Ramsay</a>
								</td>
							</tr>
						</tbody>
							<tr>
								<td>1</td>
								<td>abcngjurojvowodoWQR2Vgqe2$dvwefas</td>
								<td>10:05 AM 4/6/2020</td>
								<td class="row">
									<img alt="image" src="https://image.flaticon.com/icons/svg/2919/2919600.svg"
										class="rounded-circle" width="35" data-toggle="tooltip" title="Gorden Ramsay">
									<a class="nav-link" href="#">Gorden Ramsay</a>
								</td>
							</tr>
							<tr>
								<td>2</td>
								<td>vqq5nio#$brSvokowqxcadsavry5GBSDV</td>
								<td>10:05 AM 4/6/2020</td>
								<td class="row">
									<img alt="image" src="https://image.flaticon.com/icons/svg/2919/2919600.svg"
										class="rounded-circle" width="35" data-toggle="tooltip" title="Gorden Ramsay">
									<a class="nav-link" href="#">Gorden Ramsay</a>
								</td>
							</tr>
							<tr>
								<td>3</td>
								<td>vqqasdv#$brSvokowqxcadsavry5GBSDV</td>
								<td>10:05 AM 4/6/2020</td>
								<td class="row">
									<img alt="image" src="https://image.flaticon.com/icons/svg/2919/2919600.svg"
										class="rounded-circle" width="35" data-toggle="tooltip" title="Gorden Ramsay">
									<a class="nav-link" href="#">Gorden Ramsay</a>
								</td>
							</tr>
							<tr>
								<td>4</td>
								<td>vqq5nio#$brSvokowqxcadsavry5GBSDV</td>
								<td>10:05 AM 4/6/2020</td>
								<td class="row">
									<img alt="image" src="https://image.flaticon.com/icons/svg/2919/2919600.svg"
										class="rounded-circle" width="35" data-toggle="tooltip" title="Gorden Ramsay">
									<a class="nav-link" href="#">Gorden Ramsay</a>
								</td>
							</tr>
							<tr>
								<td>5</td>
								<td>abcngjurojvowodoWQR2Vgqe2$dvwefas</td>
								<td>10:05 AM 4/6/2020</td>
								<td class="row">
									<img alt="image" src="https://image.flaticon.com/icons/svg/2919/2919600.svg"
										class="rounded-circle" width="35" data-toggle="tooltip" title="Gorden Ramsay">
									<a class="nav-link" href="#">Gorden Ramsay</a>
								</td>
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
							<li class="page-item active"><a class="page-link" href="#">1 <span
										class="sr-only">(current)</span></a>
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
			</div> --%>

			<footer class="footer mt-5">
				<div class="container">
					<span class="text-muted">Copyright &copy; Blockvotes</span>
				</div>
			</footer>
		</div>
	</div>
</div>

<script type="text/javascript">
var listResults = '${voteResults}';
var listResultsTemp = listResults.substr(1, listResults.length-2);
var arrlistResults= listResultsTemp.split(", ");
var listNames = [];
var listVotes = [];
arrlistResults.forEach(item =>{listNames.push(item.split(":")[0]);listVotes.push(item.split(":")[1])});

</script>

<script>
	var ctx = document.getElementById("pieChart").getContext('2d');
	var randomScalingFactor = function (number) {
		return Math.round(number * 1);
	};
	var myChart = new Chart(ctx, {
		type: 'pie',
		data: {
			labels: listNames,
			datasets: [{
				label: '# of Votes',
				data: listVotes,
				backgroundColor: [
					'rgba(255,99,132,1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)'
				],
			}]
		},
		options: {
			responsive: true
		}
	});
</script>

<script>
	var ctx = document.getElementById("barChart").getContext('2d');
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: listNames,
			datasets: [{
				label: '# of Votes',
				data: listVotes,
				backgroundColor: [
					'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(255, 159, 64, 0.2)'
				],
				borderColor: [
					'rgba(255,99,132,1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)'
				],
				borderWidth: 1
			}]
		},
		options: {
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			}
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