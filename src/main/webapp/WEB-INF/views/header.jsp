<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<a class="navbar-brand" href="<c:url value="/" />">
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
				<%-- <li class="nav-item active">
					<a class="nav-link" href="<c:url value="/opening" />">Opening<span class="sr-only">(current)</span></a>
				</li> --%>
				<li class="nav-item active">
					<a class="nav-link" href="<c:url value="/candidates" />">Candidate</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="<c:url value="/histories" />">History</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="<c:url value="/vote-detail" />">Vote</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="<c:url value="/vote-result" />">Vote Result</a>
				</li>
			</ul>
		<form class="form-inline my-2 my-lg-0" action="j_spring_security_logout" method="post">
				<div class="dropdown">
					<a href="#" data-toggle="dropdown"
						class="nav-link dropdown-toggle nav-link-lg nav-link-user text-white">
						<img alt="image"
							src="https://i.pinimg.com/originals/37/8c/4b/378c4ba6ce42d11d5b3023b5e63134f4.jpg"
							class="rounded-circle mr-1" width="50" height="50">
						<div class="d-sm-none d-lg-inline-block">Hi, ${pageContext.request.userPrincipal.name}!</div>
					</a>
					<div class="dropdown-menu dropdown-menu-right">
						<a href="<c:url value="/profile" />" class="dropdown-item has-icon">
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