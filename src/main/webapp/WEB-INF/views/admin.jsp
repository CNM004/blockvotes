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
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i"
	rel="stylesheet">
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
<jsp:include page="header.jsp"/>
<div class="container">
<div class="content-header row">
	<div class="content-header-left col-md-6 col-xs-12 mb-1">
		<h2 class="content-header-title">Setup Block</h2>
	</div>
</div>

<div class="row">
	<div class="col-xs-12">
		<div class="input-group">
			<button type="button" id="create">Create Block for Candidates</button>
			<button type="button" onclick="window.location.href = '<%=request.getContextPath()%>'">Return home page</button>
		</div>
	</div>
</div>
<br>
<div class="row">
	<div class="col-xs-12">
		<div class="input-group" id="result">
				
		</div>
	</div>
</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	function setXhr() {
		var xhr = new XMLHttpRequest(); 
		xhr.setRequestHeader(header, token);
		return xhr;
	}
    $('#create').click(function(){
    	var ctx = "<%=request.getContextPath()%>";
    	var xmlhttp = new XMLHttpRequest(); 
    	var url = ctx+"/admin/setting";
		
    	xmlhttp.open("POST", url);
    	xmlhttp.setRequestHeader(header, token);
    	xmlhttp.onreadystatechange = function () {
             var data = xmlhttp.responseText;
             $("#result").empty();
   			$("#result").append(data);
        };
    	xmlhttp.send();
    });
});

</script>
<html>