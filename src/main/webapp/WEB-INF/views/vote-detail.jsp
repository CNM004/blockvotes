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
	<%-- <meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/> --%>
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

			<nav aria-label="breadcrumb mt-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="opening.jsp">Opening</a></li>
					<li class="breadcrumb-item active" aria-current="page">Blockchain E-Voting System 1</li>
				</ol>
			</nav>

			<section class="section">
				<div class="row section-header">
					<div class="section-header-back">
						<a href="opening.jsp" class="btn btn-icon"><i class="fas fa-arrow-left"></i></a>
					</div>
					<h3>Blockchain E-Voting System 1
						<span class="badge badge-success mt-2">Opening</span>
						<span class="badge badge-success mt-2">End in 00:10:00</span>
					</h3>
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

			<div class="row row-cols-1 row-cols-md-3">
			<c:forEach items="${candidates}" var="item">
				<div class="col mb-4">
					<div class="card h-100">
						<img alt="image" src="https://image.flaticon.com/icons/svg/2919/2919600.svg"
							class="rounded-circle card-img-top mt-3" width="70" height="70" data-toggle="tooltip"
							title="Gordon Ramsay">
						<div class="card-body">
							<h5 class="card-title">${item.name}</h5>
							<p class="card-text">${item.publicKey }</p>
							<p class="card-text">Please vote me.</p>
						</div>
						<div class="card-footer">
							<div class="row justify-content-around">
								<button type="button" class="btn btn-primary" data-toggle="modal"
									data-target="#infoModal">
									Infomation
								</button>
								<button type="button" value="${item.publicKey }" class="btn btn-danger abc" data-toggle="modal"
									data-target="#confirmModal">
									Vote
								</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			</div>


			<footer class="footer mt-5">
				<div class="container">
					<span class="text-muted">Copyright &copy; Blockvotes</span>
				</div>
			</footer>
		</div>
	</div>

	<!-- Info Modal -->
	<div class="modal fade" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Candidate Information</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<img alt="image" src="https://image.flaticon.com/icons/svg/2919/2919600.svg"
						class="rounded-circle card-img-top mb-3" width="100" height="100" data-toggle="tooltip"
						title="Maroon 5">
					<h5>Gordon Ramsay</h5>
					<p class="text-justify">Gordon James Ramsay OBE (born 8 November 1966) is a British chef,
						restaurateur, writer
						and television personality. He was born in Johnstone, Scotland, and raised in
						Stratford-upon-Avon, England.
					</p>
					<hr>
					<h5>Television appearances</h5>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">2004 - 2005: Cras justo odio</li>
						<li class="list-group-item">2005 - 2009: Dapibus ac facilisis in</li>
						<li class="list-group-item">2009 - 2015: Morbi leo risus</li>
						<li class="list-group-item">2015 - 2018: Porta ac consectetur ac</li>
						<li class="list-group-item">2018 - present: Vestibulum at eros</li>
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Confirm Modal -->
	<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Confirm?</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<img alt="image" src="https://image.flaticon.com/icons/svg/1828/1828833.svg"
						class="rounded-circle card-img-top mb-3" width="100" height="100" data-toggle="tooltip"
						title="Maroon 5">
					<div class="row justify-content-center">
						<h3>Are you sure?</h3>
					</div>
					<div class="row justify-content-center">
						<form method="POST" action="<c:url value="/vote" />">
						<button type="button" class="btn btn-secondary m-3" data-dismiss="modal">No</button>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="hidden" name="to" value="" id="to"/>
						<button type="submit" class="btn btn-primary m-3 yesVote" data-toggle="modal"
							data-target="#yesModal">Yes</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Yes Modal -->
	<div class="modal fade" id="yesModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body">
					<img alt="image" src="https://image.flaticon.com/icons/svg/845/845646.svg"
						class="rounded-circle card-img-top mb-3" width="100" height="100" data-toggle="tooltip"
						title="Maroon 5">
					<div class="row justify-content-center">
						<h3>Thank you!</h3>
					</div>
					<div class="row justify-content-center">
						<a href="<c:url value="/vote-result" />" class="btn btn-success">Detail</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(function() {
	  $('#confirmModal').bind('show',function(){
	      alert('howdy');
	      $("#to").val('bosta');
	  });
	});
$(".abc").on("click", function() {
			var value = $(this).val();
			$("#to").val(value);
		});
<%-- var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$('.yesVote').click(function(){
	var ctx = "<%=request.getContextPath()%>";
	var xmlhttp = new XMLHttpRequest(); 
	var url = ctx+"/vote";
	
	xmlhttp.open("POST", url);
	xmlhttp.setRequestHeader(header, token);
	xmlhttp.onreadystatechange = function () {
         var data = xmlhttp.responseText;
         $("#result").empty();
			$("#result").append(data);
    };
	xmlhttp.send(value);
}); --%>

</script>
<html>