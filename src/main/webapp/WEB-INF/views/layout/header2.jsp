<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3/dist/chart.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Armata&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Baloo+Da+2&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Hind+Siliguri:wght@400&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">

</head>

<style>

input::placeholder {
  color: white;
  width:100%;
}

select {
	width: 200px; /* 원하는 너비설정 */
	padding: .8em .5em; /* 여백으로 높이 설정 */
	font-family: inherit; /* 폰트 상속 */
	background:
		url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
		no-repeat 95% 50%; /* 네이티브 화살표 대체 */
	border: 1px solid #999;
	border-radius: 4px;
	/* iOS 둥근모서리 제거 */
	-webkit-appearance: none;
	/* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}

.backgroundnav{
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
	background-image: url("https://i.ibb.co/1KWmbFy/blur4.png");
	background-attachment: fixed

}
/*#2c2d2a*/
.linkc {
	color: #FFFFFF!important;
	text-decoration: none;
	font-family: 'Montserrat', sans-serif;
	font-size: 18px;
}
.linkc:hover{
	color: #EF3B3A!important;
}

.linkc2 {
	color: #2c2d2a!important;
	text-decoration: none;
	font-family: 'Montserrat', sans-serif;
	font-size: 18px;
}
.linkc2:hover{
	color: #EF3B3A!important;
}

.navbar{
	/*border: 1px solid;*/
	/*border-color:white white #363435 white;*/
	margin-left: 10%;
	margin-right: 10%;
}

.jumbotron{
	background: url("https://picsum.photos/1600/?random") center no-repeat;
	background-color: #0005;
	background-blend-mode: darken;
}

li{ list-style: none; }
</style>

<body>

<div class="jumbotron text-center" style="margin-bottom:0; color:white;">
	<nav style="margin-top: -48px;" class="navbar navbar-expand-sm navbar-dark d-flex justify-content-between mb-4">
		<a class="navbar-brand linkc" href="/">
			<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-egg-fill" viewBox="0 0 16 16">
				<path d="M14 10a6 6 0 0 1-12 0C2 5.686 5 0 8 0s6 5.686 6 10z"/>
			</svg>
			Recipe
		</a>

		<c:choose>
			<c:when test="${empty principal}">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link linkc" href="/">Home</a></li>
					<li class="nav-item"><a class="nav-link linkc" href="/auth/loginForm">Login</a></li>
					<li class="nav-item">
						<a class="nav-link linkc" href="/auth/joinForm">
							Sign in
						</a>
					</li>
				</ul>
			</c:when>


			<c:otherwise>
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link linkc" href="/">Home</a></li>
					<li class="nav-item"><a class="nav-link linkc" href="/search/Naver">Search</a></li>

					<li class="nav-item">
						<a style="color: blue;" class="nav-link linkc" href="/board/APIForm?style=2">API</a>
					</li>
					<li class="nav-item">
						<a class="nav-link linkc" href="/user/My">
							My Page
						</a>
					</li>
					<li class="nav-item"><a class="nav-link linkc" href="/board">Gallery</a></li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle linkc" data-toggle="dropdown" href="#">Write</a>
						<div class="dropdown-menu">
							<a style="color: blue; " class="dropdown-item linkc2" href="/board/saveForm">Board</a>
							<a style="color: blue; " class="dropdown-item linkc2" href="/board/RsaveForm">Recipe</a>
							<c:if test="${principal.user.USER_ROLE eq 'ADMIN'}">
								<a style="color: blue; " class="dropdown-item linkc2" href="/board/AsaveForm">Notice</a>
							</c:if>

						</div>
					</li>
				</ul>

				<ul class="row" style="margin-bottom: 0px;">
					<li class="nav-item">
						<a class="nav-link linkc" href="/">
							<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
								<path fill-rule="evenodd" d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
								<path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
							</svg>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link linkc" href="/user/updateForm">
							<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-credit-card-2-front-fill" viewBox="0 0 16 16">
								<path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2.5 1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h2a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-2zm0 3a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm3 0a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm3 0a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm3 0a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1z"/>
							</svg>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link linkc" href="/logout">
							<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-person-x-fill" viewBox="0 0 16 16">
								<path fill-rule="evenodd" d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6.146-2.854a.5.5 0 0 1 .708 0L14 6.293l1.146-1.147a.5.5 0 0 1 .708.708L14.707 7l1.147 1.146a.5.5 0 0 1-.708.708L14 7.707l-1.146 1.147a.5.5 0 0 1-.708-.708L13.293 7l-1.147-1.146a.5.5 0 0 1 0-.708z"/>
							</svg>
						</a>
					</li>
				</ul>

			</c:otherwise>
		</c:choose>
	</nav>

	<h1>Admin page</h1>
	<p>Resize this responsive page to see the effect!</p>
</div>

<br/>
</body>

</html>