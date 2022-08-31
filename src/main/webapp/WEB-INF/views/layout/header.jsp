<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<META HTTP-EQUIV="EXPIRES" CONTENT="Mon, 22 Jul 2002 11:12:01 GMT">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
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
	<link href="https://fonts.googleapis.com/css2?family=Readex+Pro:wght@300&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Baloo+Da+2&display=swap" rel="stylesheet">


</head>

<style>

	img {
		width:250px !important;
		height: 250px !important;
	}

	@keyframes disappear {
		from{
			opacity: 0.1;
		}
		to{
			opacity: 1;
		}
	}

	@keyframes disappear2 {
		from{
			opacity: 1;
		}
		to{
			opacity: 0.1;
		}
	}

	.animation1{
		opacity: 0;
	}
	.animation2{
		opacity: 0;
	}
	.animation3{
		opacity: 0;
	}
	.animation4{
		opacity: 0;
	}
	.card{
		height:300px;
	}

	body {
		background-color: rgba(242, 242, 242, 1);
		/*background-size: 100%;*/
		background-position: center top;
		background-attachment:fixed;
		top: 10px;


		/*	transform: rotateX(360deg);*/
		/*	transition-property: all;*/
		/*	transition-duration: 1s;*/
		/*	transition-timing-function: ease;*/
		/*	transition-delay: 1s;*/
	}

	/*slider*/
	*:focus, *:active, *:visited {
		outline: none; }

	.tarkikComandSlider {
		width: 1300px;
		height: 380px;
		background-color: #ffffff;
		position: relative;
		display: flex;
		justify-content:center;

	}

	.comandSlider__item {
		margin: 0 5px;
		padding: 0px;
	}

	.slick-dots {
		position: absolute;
		bottom: -45px;
		display: block;
		width: 100%;
		padding: 0;
		list-style: none;
		text-align: center; }
	.slick-dots li {
		position: relative;
		display: inline-block;
		width: 6px;
		height: 6px;
		margin: 0 5px;
		padding: 0;
		cursor: pointer; }
	.slick-dots li button {
		display: none; }
	.slick-dots li:before {
		top: 1px;
		transition: all .5s;
		content: '';
		width: 6px;
		height: 6px;
		background-color: #ffffff;
		position: absolute; }
	.slick-dots li.slick-active:before {
		top: 0;
		width: 8px;
		height: 8px;
		margin-left: -2px;
		background-color: #964848; }

	.slick-prev {
		left: 0;
		transform: rotate(180deg); }

	.slick-next {
		right: 0; }

	.slick-arrow {
		top: 50%;
		height: 26px;
		width: 14px;
		margin-top: -13px;
		padding: 20px;
		position: absolute;
		font-size: 0;
		cursor: pointer;
		background-color: transparent;
		border: none;
		background-image: url(https://i.ibb.co/wyRK0cn/baseline-arrow-forward-ios-black-24dp.png);
		background-repeat: no-repeat;
		outline: none!important;
	}




	/*https://codepen.io/search/pens?q=slider&cursor=ZD0xJm89MCZwPTI= 타이머*/
	.wrap-time {
		padding-top: 20px;
		width: 300px;
		height: 300px;
		/*background: #BDBDBD;*/
		/*!* Old browsers *!*/
		/*background: -moz-linear-gradient(top, #BDBDBD 23%, #979797 100%);*/
		/*!* FF3.6-15 *!*/
		/*background: -webkit-linear-gradient(top, #BDBDBD 23%, #979797 100%);*/
		/*!* Chrome10-25,Safari5.1-6 *!*/
		/*background: linear-gradient(to bottom, #BDBDBD 23%, #979797 100%);*/
		border-radius: 5px;
		/*-webkit-box-shadow: 6px 6px 22px -9px rgba(0, 0, 0, 0.68);*/
		/*-moz-box-shadow: 6px 6px 22px -9px rgba(0, 0, 0, 0.68);*/
		/*box-shadow: 6px 6px 22px -9px rgba(0, 0, 0, 0.68);*/
		text-align: center;
		color: #FFFFFF;
	}
	.wrap-time .row {
		margin: 0 auto 0;
		padding: 11px 10px 11px;
	}

	.col-span {
		cursor: pointer;
		heigth: 100%;
	}

	.timer {
		font-size: 3.5em;
		color: #FFFFFF;
		cursor: pointer;
	}

	.start-btn,
	.reset-btn {
		margin: 0px auto 20px;
		cursor: pointer;
		padding: 5px 15px;
		border-radius: 5px;
	}
	.start-btn:hover,
	.reset-btn:hover {
		color: #ffb76b;
	}

	.copy {
		color: #ff8505;
		font-size: 0.8em;
	}
	.copy a {
		color: #9e5100;
	}
	/*	END TIMER STYLE*/


	#timedate {
		font: small-caps lighter 38px/120% "Segoe UI", Frutiger, "Frutiger Linotype", "Dejavu Sans", "Helvetica Neue", Arial, sans-serif;
		text-align:left;
		width: 70%;
		color:#FFFFFF;
		padding: 25px;
	}

	:root{
		--text-light: rgba(255,255,255,0.6);
		--text-lighter: rgba(255,255,255,0.9);
		--spacing-s: 8px;
		--spacing-m: 16px;
		--spacing-l: 24px;
		--spacing-xl: 32px;
		--spacing-xxl: 64px;
		--width-container: 1200px;
	}

	@keyframes opacity3 {
		from{
			opacity: 0.1;
		}
		to{
			opacity: 1;
		}
	}

	.nava {
		color: floralwhite !important;
		font-family: 'Jua', sans-serif;
	}

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

	.hero-section{
		margin-right: auto;
		margin-left: auto;
		background-color: rgba(242, 242, 242, 1);

	}

	.card-grid{
		display: grid;
		background-color: rgba(242, 242, 242, 1);
		grid-template-columns: repeat(1, 1fr);
		grid-column-gap: var(--spacing-l);
		grid-row-gap: var(--spacing-l);
		max-width: var(--width-container);
		width: 100%;
	}

	@media(min-width: 540px){
		.card-grid{
			grid-template-columns: repeat(2, 1fr);
		}
	}

	@media(min-width: 960px){
		.card-grid{
			grid-template-columns: repeat(4, 1fr);
		}
	}

	.card{
		background-color: rgba(242, 242, 242, 1);
		list-style: none;
		position: relative;
	}

	.card:before{
		content: '';
		display: block;
		padding-bottom: 150%;
		width: 100%;
	}

	.card__background{
		background-size: cover;
		background-position: center;
		border-radius: var(--spacing-l);
		bottom: 0;
		filter: brightness(0.75) saturate(1.2) contrast(0.85);
		left: 0;
		position: absolute;
		right: 0;
		top: 0;
		transform-origin: center;
		trsnsform: scale(1) translateZ(0);
		transition:
				filter 200ms linear,
				transform 200ms linear;
	}

	.card:hover .card__background{
		transform: scale(1.05) translateZ(0);
	}

	.card-grid:hover > .card:not(:hover) .card__background{
		filter: brightness(0.5) saturate(0) contrast(1.2) blur(10px);
	}

	.card__content{
		left: 0;
		padding: var(--spacing-l);
		position: absolute;
		top: 0;
	}

	.card__category{
		color: var(--text-light);
		font-size: 0.9rem;
		margin-bottom: var(--spacing-s);
		text-transform: uppercase;
	}

	.card__heading{
		color: var(--text-lighter);
		font-size: 1.9rem;
		text-shadow: 2px 2px 20px rgba(0,0,0,0.2);
		line-height: 1.4;
		word-spacing: 100vw;
	}


	.select-hidden {
		display: none;
		visibility: hidden;
		padding-right: 10px;
	}

	.select {
		cursor: pointer;
		display: inline-block;
		position: relative;
		font-size: 16px;
		color: #1a1a1a;
		width: 220px;
		height: 41px;
	}

	.select-styled {
		background-color: azure;
		border-radius: 3px;
		padding: 8px 15px;
		-webkit-transition: all 0.2s ease-in;
		-moz-transition: all 0.2s ease-in;
		-o-transition: all 0.2s ease-in;
		transition: all 0.2s ease-in;

	}
	.select-styled:after {
		content: "";
		width: 0;
		height: 0;
		border: 1px solid transparent;
		border-color: azure transparent transparent transparent;
		position: absolute;
		top: 16px;
		right: 10px;
	}
	.select-styled:hover {
		background-color: #f74e3b;
	}
	.select-styled:active, .select-styled.active {
		background-color: #f74e3b;
	}
	.select-styled:active:after, .select-styled.active:after {
		top: 9px;
		border-color: transparent transparent #fff transparent;
	}

	.select-options {
		display: none;
		position: absolute;
		top: 100%;
		right: 0;
		left: 0;
		z-index: 999;
		margin: 0;
		padding: 0;
		list-style: none;
		background-color: #f74e3b;
	}
	.select-options li {
		margin: 0;
		padding: 12px 0;
		text-indent: 15px;
		border-top: 1px solid #f74e3b;
		-webkit-transition: all 0.15s ease-in;
		-moz-transition: all 0.15s ease-in;
		-o-transition: all 0.15s ease-in;
		transition: all 0.15s ease-in;
	}
	.select-options li:hover, .select-options li.is-selected {
		color: #c0392b;
		background: #fff;
	}
	.select-options li[rel=hide] {
		display: none;
	}

	.input2{
		background-color: azure;
		width: 600px;
		height: 41px;
		color: rgba(17, 23, 24, 0.7);
		border-radius: 3px;
		border:1px solid rgba(247, 78, 59, 0);
	}

	.input2:hover{
		background-color: rgba(247, 78, 59, 0.8);
		color: azure;
		transition-property: background-color;
		transition-duration: .5s;
	}

	.input2:focus{
		background-color: rgba(247, 78, 59, 0.8);
		color: whitesmoke;
		transition-property: background-color;
		transition-duration: .5s;

	}


	.sbutton{
		border: none;
		color: rgba(17, 23, 24, 0.7);
		outline: none;
		border-radius: 3px;
		margin-left: 1px;
		width: 80px;
		height: 41px;
		background-color: azure;
	}

	.sbutton:hover{
		background-color: rgba(247, 78, 59, 0.8);
		color: azure;
		transition-property: background-color;
		transition-duration: .5s;
	}

	@font-face {
		font-family: 'BMHANNAAir';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}

	/*animation*/
	@import url('https://fonts.googleapis.com/css?family=Exo:400,700');

	*{
		margin: 0px;
		padding: 0px;
	}



	.context {
		width: 100%;
		position: absolute;
		top:50vh;

	}

	.context h1{
		text-align: center;
		color: #fff;
		font-size: 50px;
	}


	.area{
		background: #252b37;
		background: -webkit-linear-gradient(to left, #8f94fb, #4e54c8);
		width: 100%;
		height:100vh;


	}

	.circles{
		position: absolute;
		top: 0px;
		margin-top: 20px;
		left: 0;
		width: 100%;
		height: 100%;
		overflow: hidden;
	}

	.circles li{
		position: absolute;
		display: block;
		list-style: none;
		width: 20px;
		height: 20px;
		background: rgba(255, 255, 255, 0.2);
		animation: animate 25s linear infinite;
		bottom: -150px;

	}

	.circles li:nth-child(1){
		left: 25%;
		width: 80px;
		height: 80px;
		animation-delay: 0s;
	}


	.circles li:nth-child(2){
		left: 10%;
		width: 20px;
		height: 20px;
		animation-delay: 2s;
		animation-duration: 12s;
	}

	.circles li:nth-child(3){
		left: 70%;
		width: 20px;
		height: 20px;
		animation-delay: 4s;
	}

	.circles li:nth-child(4){
		left: 40%;
		width: 60px;
		height: 60px;
		animation-delay: 0s;
		animation-duration: 18s;
	}

	.circles li:nth-child(5){
		left: 65%;
		width: 20px;
		height: 20px;
		animation-delay: 0s;
	}

	.circles li:nth-child(6){
		left: 75%;
		width: 110px;
		height: 110px;
		animation-delay: 3s;
	}

	.circles li:nth-child(7){
		left: 35%;
		width: 150px;
		height: 150px;
		animation-delay: 7s;
	}

	.circles li:nth-child(8){
		left: 50%;
		width: 25px;
		height: 25px;
		animation-delay: 15s;
		animation-duration: 45s;
	}

	.circles li:nth-child(9){
		left: 20%;
		width: 15px;
		height: 15px;
		animation-delay: 2s;
		animation-duration: 35s;
	}

	.circles li:nth-child(10){
		left: 85%;
		width: 150px;
		height: 150px;
		animation-delay: 0s;
		animation-duration: 11s;
	}



	@keyframes animate {

		0%{
			transform: translateY(0) rotate(0deg);
			opacity: 1;
			border-radius: 0;
		}

		100%{
			transform: translateY(-1000px) rotate(720deg);
			opacity: 0;
			border-radius: 50%;
		}

	}

	#calendar{
		width: 320px;
		margin-left: 56px;
		font-family: 'Lato', sans-serif;
	}
	#calendar_weekdays div{
		display:inline-block;
		vertical-align:top;
	}
	#calendar_content, #calendar_weekdays, #calendar_header{
		position: relative;
		width: 320px;
		overflow: hidden;
		float: left;
		z-index: 10;
	}
	#calendar_weekdays div, #calendar_content div{
		width:40px;
		height: 40px;
		overflow: hidden;
		text-align: center;
		color: #FFFFFF;
	}
	#calendar_content{
		-webkit-border-radius: 0px 0px 12px 12px;
		-moz-border-radius: 0px 0px 12px 12px;
		border-radius: 0px 0px 12px 12px;
	}
	#calendar_content div{
		float: left;
	}
	#calendar_content div:hover{
	}
	#calendar_content div.blank{
	}
	#calendar_header, #calendar_content div.today{
		zoom: 1;
		filter: alpha(opacity=70);
		opacity: 0.7;
	}
	#calendar_content div.today{
		color: #FFFFFF;
	}
	#calendar_header{
		width: 100%;
		height: 37px;
		text-align: center;
		padding: 18px 0;
		-webkit-border-radius: 12px 12px 0px 0px;
		-moz-border-radius: 12px 12px 0px 0px;
		border-radius: 12px 12px 0px 0px;
	}
	#calendar_header h1{
		font-size: 1.5em;
		color: #FFFFFF;
		float:left;
		width:70%;
	}
	i[class^=icon-chevron]{
		color: #FFFFFF;
		float: left;
		width:15%;
		border-radius: 50%;
	}

</style>

<body>
<div class="d-flex justify-content-between p-1" style="background-color:#252b37;">
	<div class="ml-2">
	<c:if test="${'ADMIN' eq principal.user.USER_ROLE}">
		<a class="mr-3" style="color: azure; font-size: 18px; position:relative; " href="/user/Admin">
			ADMIN
		</a>
	</c:if>


	<a class="mr-3" style="color: azure; font-size: 18px; position:relative; " href="/">
		MAIN
	</a>

	</div>

	<div class="">

		<c:choose>
			<c:when test="${empty principal}">
				<a class="nava mr-3" style="margin-right:31px!important; color: azure; font-size: 14px;" href="/auth/loginForm">로그인</a>
				<a class="nava mr-3" style="color: azure; font-size: 14px;" href="/auth/joinForm">회원가입</a>

			</c:when>
			<c:otherwise>
				<a class="nava mr-3" style="color: azure; font-size: 14px;" href="/auth/joinForm">회원가입</a>
				<a class="nava mr-3" style="color: azure; font-size: 14px;" href="/logout">로그아웃</a>

				<button type="button" class="btn nava" style="color: azure; font-size: 14px;" data-toggle="modal" data-target="#exampleModal2" data-whatever="@mdo">신고하기</button>
				<button type="button" class="btn nava" style="color: azure; font-size: 14px;" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">문의하기</button>


				<div class="modal" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
					 aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content bg-dark">
							<div class="modal-header text-danger bg-dark">
								<h5 class="modal-title " id="exampleModalLabel">Report</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body bg-white">
								<form action="" method="post">
									<div class="form-group">
										<label class="col-form-label">Recipient:</label>
										<textarea class="form-control" rows="5" id="TITLE"></textarea>
									</div>
									<div class="form-group">
										<label for="message-text" class="col-form-label">Message:</label>
										<textarea class="form-control" rows="5" id="CONTENTS"></textarea>
									</div>
									<div class="form-group">
										<input type="hidden" class="form-control" value="1" id="HVAL">
									</div>
									<div class="form-group">
										<input type="hidden" class="form-control" value="1" id="TYPE">
									</div>
									<div class="form-group">
										<label for="message-text" class="col-form-label">user:</label>
										<input type="text" class="form-control" value="${principal.user.username}" id="username" readonly/>
									</div>
								</form>
							</div>
							<div class="modal-footer bg-white">
								<button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button>
								<button id="btn-declaration" class="btn btn-outline-primary">Send message</button>
							</div>
						</div>
					</div>
				</div>


				<div class="modal" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
					 aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content bg-warning">
							<div class="modal-header bg-warning text-light">
								<h5 class="modal-title" id="exampleModalLabel">Inquiry</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body bg-white">
								<form action="" method="post">
									<div class="form-group">
										<label class="col-form-label">Recipient:</label>
										<textarea class="form-control" rows="5" id="TITLE2"></textarea>
									</div>
									<div class="form-group">
										<label  class="col-form-label">Message:</label>
										<textarea class="form-control" rows="5" id="CONTENTS2"></textarea>
									</div>
									<div class="form-group">
										<input type="hidden" class="form-control" value="1" id="HVAL2">
									</div>
									<div class="form-group">
										<input type="hidden" class="form-control" value="2" id="TYPE2">
									</div>
									<div class="form-group">
										<label class="col-form-label">user:</label>
										<input type="text" class="form-control" value="${principal.user.username}" id="username2" readonly/>
									</div>
								</form>
							</div>
							<div class="modal-footer bg-white">
								<button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button>
								<button id="btn-declaration2" type="btn-declaration" class="btn btn-outline-warning">Send message</button>
							</div>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>

<div class="container-fluid bgBlur area d-flex justify-content-cetner" style="height: 880px;  background-size: cover; background-repeat: no-repeat; background-position: center; background-color:#252b37; background-attachment:fixed; transition: all .1s ease 0s;">

		<ul class="circles">
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>

	<section class="hero-section align-self-end" style="background-color: rgba(51,51,51,0); width: 1200px;">

<%--		<div id="calendar">--%>
<%--			<div id="calendar_header">--%>
<%--				<i style="cursor: pointer;" class="icon-chevron-left">--%>
<%--					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-arrow-left-square" viewBox="0 0 16 16">--%>
<%--						<path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm11.5 5.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>--%>
<%--					</svg>--%>
<%--				</i>--%>

<%--				<h1></h1>--%>
<%--				<i style="cursor: pointer;" class="icon-chevron-right">--%>
<%--					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-arrow-right-square" viewBox="0 0 16 16">--%>
<%--						<path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm4.5 5.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>--%>
<%--					</svg>--%>
<%--				</i>--%>
<%--			</div>--%>
<%--			<div id="calendar_weekdays"></div>--%>
<%--			<div id="calendar_content"></div>--%>
<%--		</div>--%>

	<div class="container d-flex justify-content-center" style="margin-bottom: 75px;">





		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 322.74 78.25">
			<defs>
				<style>
					.cls-1 {
						fill: none;
						stroke: none;
						stroke-miterlimit: 3;
						stroke-width: 34px;
					}

					.cls-2 {
						stroke: #f74e3b;
						animation: path var(--duration) ease forwards;
						animation-delay: var(--delay);
						stroke-width: 2.5px;
					}

					.cls-3 {
					}
					svg {
						fill: none;
						height: 100px;
						stroke-width: 53px;
					}

					path {
						stroke-dasharray: var(--length);
						stroke-dashoffset: var(--length);
					}

					.svg-bg > path {
						animation: path var(--duration) ease forwards;
						animation-delay: var(--delay);
					}

					.svg-main > path {
						stroke: #ffffff;
						animation: path var(--duration) ease-in forwards;
						animation-delay: var(--delay);
						stroke-width: 3px;
					}

					@keyframes path {
						100% { stroke-dashoffset: 0; }
					}
				</style>
			</defs>
				<text/>
				<g class="svg-bg">
					<path class="cls-2" d="M9.13,7.2c-.54,.32-7.65,4.75-7.02,12.29,.58,6.95,7.2,10.21,7.9,10.54,6.89,3.25,13.47-.69,14.49-1.32,1.43-.89,6.76-4.2,7.02-10.1,.26-5.67-4.37-9.38-5.27-10.1-4.51-3.62-11.55-4.66-17.12-1.32Z"/>
					<path class="cls-2" d="M42.06,36.32c.2-10.24,.39-20.49,.59-30.73"/>
					<path class="cls-2" d="M42.35,20.83c3.02,0,6.05-.01,9.07-.02"/>
					<path class="cls-2" d="M25.08,36.32c1.17,4.98,2.34,9.95,3.51,14.93"/>
					<path class="cls-2" d="M28.59,51.25c7.41-1.17,14.83-2.34,22.24-3.51"/>
					<path class="cls-2" d="M66.93,8.22c1.07,7.12,2.15,14.24,3.22,21.37"/>
					<path class="cls-2" d="M70.15,29.59c9.56-1.17,19.12-2.34,28.68-3.51"/>
					<path class="cls-2" d="M88.88,9.1c6.34,.39,12.68,.78,19.02,1.17"/>
					<path class="cls-2" d="M90.35,19.05l15.8,.59"/>
					<path class="cls-2" d="M108.2,5.3c-.88,10.05-1.76,20.1-2.63,30.15"/>
					<path class="cls-2" d="M105.57,35.44c1.53,.52,4.48,1.51,5.85,4.39,1.57,3.29-.03,6.72-.59,7.9-1.8,3.84-5.19,5.44-6.15,5.85-.97,.41-5.78,2.48-10.24-.29-.4-.25-4.32-2.78-4.68-7.61-.35-4.68,2.92-7.73,3.8-8.49,4.75-4.07,10.99-2.1,12-1.76Z"/>
					<path class="cls-2" d="M141.86,7.05c2.34,2.63,4.68,5.27,7.02,7.9"/>
					<path class="cls-2" d="M128.98,13.49c7.51,.29,15.02,.59,22.54,.88"/>
					<path class="cls-2" d="M146.54,17.3c2.47,.22,5.49,.5,7.9,2.93,3.52,3.55,2.71,8.64,2.63,9.07-.82,4.65-4.53,7.05-5.85,7.9-.61,.39-8.3,5.19-14.63,.88-3.07-2.09-5.16-5.87-4.98-9.95,.22-4.73,3.4-7.6,4.1-8.2,3.82-3.27,8.46-2.85,10.83-2.63Z"/>
					<path class="cls-2" d="M168.79,9.98c-.39,10.54-.78,21.07-1.17,31.61"/>
					<path class="cls-2" d="M168.21,25.53c2.92,.09,5.85,.17,8.77,.26"/>
					<path class="cls-2" d="M201.86,10.57l-9.66,28.98"/>
					<path class="cls-2" d="M197.65,23.21c6.28,4.37,12.57,8.74,18.85,13.11"/>
					<path class="cls-2" d="M215.62,23.15l14.05,.29"/>
					<path class="cls-2" d="M229.37,10.27v31.61"/>
					<path class="cls-2" d="M239.62,11.15c-.49,9.66-.98,19.32-1.46,28.98"/>
					<path class="cls-2" d="M277.66,2.96c-1.04,.07-7.5,.54-11.12,6.15-2.49,3.86-3.06,9.26-.59,13.46,1.84,3.13,4.71,4.46,5.85,4.98,4.91,2.2,9.6,.8,12.29,0,3.15-.94,6.07-1.81,8.2-4.68,2.43-3.28,2.92-7.98,1.17-11.71-1.61-3.43-4.61-4.93-7.02-6.15-1.59-.8-4.67-2.34-8.78-2.05Z"/>
					<path class="cls-2" d="M270.24,26.74c.04,5.14,.07,10.29,.11,15.43"/>
					<path class="cls-2" d="M286.4,26.82c.21,4.73,.42,9.46,.63,14.18"/>
					<path class="cls-2" d="M255.71,42.18c15.32-.39,30.63-.78,45.95-1.17"/>
					<path class="cls-2" d="M318.64,45.4c-.9,.01-1.59,.75-1.57,1.57,.03,.78,.71,1.38,1.43,1.43,.91,.06,1.79-.77,1.68-1.68-.08-.69-.73-1.28-1.54-1.32Z"/>

				</g>
			<g class="svg-main" data-name="svg-bg">
				<path class="cls-1" d="M9.13,7.2c-.54,.32-7.65,4.75-7.02,12.29,.58,6.95,7.2,10.21,7.9,10.54,6.89,3.25,13.47-.69,14.49-1.32,1.43-.89,6.76-4.2,7.02-10.1,.26-5.67-4.37-9.38-5.27-10.1-4.51-3.62-11.55-4.66-17.12-1.32Z"/>
				<path class="cls-1" d="M42.06,36.32c.2-10.24,.39-20.49,.59-30.73"/>
				<path class="cls-1" d="M42.35,20.83c3.02,0,6.05-.01,9.07-.02"/>
				<path class="cls-1" d="M25.08,36.32c1.17,4.98,2.34,9.95,3.51,14.93"/>
				<path class="cls-1" d="M28.59,51.25c7.41-1.17,14.83-2.34,22.24-3.51"/>
				<path class="cls-1" d="M66.93,8.22c1.07,7.12,2.15,14.24,3.22,21.37"/>
				<path class="cls-1" d="M70.15,29.59c9.56-1.17,19.12-2.34,28.68-3.51"/>
				<path class="cls-1" d="M88.88,9.1c6.34,.39,12.68,.78,19.02,1.17"/>
				<path class="cls-1" d="M90.35,19.05l15.8,.59"/>
				<path class="cls-1" d="M108.2,5.3c-.88,10.05-1.76,20.1-2.63,30.15"/>
				<path class="cls-1" d="M105.57,35.44c1.53,.52,4.48,1.51,5.85,4.39,1.57,3.29-.03,6.72-.59,7.9-1.8,3.84-5.19,5.44-6.15,5.85-.97,.41-5.78,2.48-10.24-.29-.4-.25-4.32-2.78-4.68-7.61-.35-4.68,2.92-7.73,3.8-8.49,4.75-4.07,10.99-2.1,12-1.76Z"/>
				<path class="cls-1" d="M141.86,7.05c2.34,2.63,4.68,5.27,7.02,7.9"/>
				<path class="cls-1" d="M128.98,13.49c7.51,.29,15.02,.59,22.54,.88"/>
				<path class="cls-1" d="M146.54,17.3c2.47,.22,5.49,.5,7.9,2.93,3.52,3.55,2.71,8.64,2.63,9.07-.82,4.65-4.53,7.05-5.85,7.9-.61,.39-8.3,5.19-14.63,.88-3.07-2.09-5.16-5.87-4.98-9.95,.22-4.73,3.4-7.6,4.1-8.2,3.82-3.27,8.46-2.85,10.83-2.63Z"/>
				<path class="cls-1" d="M168.79,9.98c-.39,10.54-.78,21.07-1.17,31.61"/>
				<path class="cls-1" d="M168.21,25.53c2.92,.09,5.85,.17,8.77,.26"/>
				<path class="cls-1" d="M201.86,10.57l-9.66,28.98"/>
				<path class="cls-1" d="M197.65,23.21c6.28,4.37,12.57,8.74,18.85,13.11"/>
				<path class="cls-1" d="M215.62,23.15l14.05,.29"/>
				<path class="cls-1" d="M229.37,10.27v31.61"/>
				<path class="cls-1" d="M239.62,11.15c-.49,9.66-.98,19.32-1.46,28.98"/>
				<path class="cls-1" d="M277.66,2.96c-1.04,.07-7.5,.54-11.12,6.15-2.49,3.86-3.06,9.26-.59,13.46,1.84,3.13,4.71,4.46,5.85,4.98,4.91,2.2,9.6,.8,12.29,0,3.15-.94,6.07-1.81,8.2-4.68,2.43-3.28,2.92-7.98,1.17-11.71-1.61-3.43-4.61-4.93-7.02-6.15-1.59-.8-4.67-2.34-8.78-2.05Z"/>
				<path class="cls-1" d="M270.24,26.74c.04,5.14,.07,10.29,.11,15.43"/>
				<path class="cls-1" d="M286.4,26.82c.21,4.73,.42,9.46,.63,14.18"/>
				<path class="cls-1" d="M255.71,42.18c15.32-.39,30.63-.78,45.95-1.17"/>
				<path class="cls-1" d="M318.64,45.4c-.9,.01-1.59,.75-1.57,1.57,.03,.78,.71,1.38,1.43,1.43,.91,.06,1.79-.77,1.68-1.68-.08-.69-.73-1.28-1.54-1.32Z"/>
			</g>
		</svg>



	</div>


		<div class="d-flex justify-content-center">

				<div id="timedate" style="height:200px; width:330px; margin-top: 50px;">
					<a id="mon">January</a>
					<a id="d">1</a>,
					<a id="y">0</a><br/>
					<a id="h">12</a> :
					<a id="m">00</a>:
					<a id="s">00</a>:
					<a id="mi">000</a>
				</div>

				<div class="wrap-time text-center" style="margin-left: 100px;">
					<div class="timer">
						<span class="minutes">20</span>:<span class="seconds">00</span>
					</div>
					<div class="row">
						<div class="col col-xs-4">
							<span class="col-span">BREAK:</span><br/>
							<span class="col-span operatorB">+</span><br/>
							<span class="col-span breakT">5</span><br/>
							<span class="col-span operatorB">-</span>
						</div>
						<div class="col col-xs-4"><div class="start-btn">START</div><div class="reset-btn">RESET</div></div>
						<div class="col col-xs-4">
							<span class="col-span">WORK:</span><br/>
							<span class="col-span operatorW">+</span><br/>
							<span class="col-span workT">20</span><br/>
							<span class="col-span operatorW">-</span>
						</div>
					</div>
				</div>
		</div>

		<div class="card-grid mb-1" style="background-color: rgba(51,51,51,0)">
			<a class="card" style="border: none; background-color: rgba(51,51,51,0)" href="/user/My">
				<div class="card__background" style="background-color: rgba(51,51,51,0.7)"></div>
				<div class="card__content">
					<p class="card__category">My Page</p>
					<h3 class="card__heading">MyPage!</h3>
				</div>
			</a>
			<a class="card" style="border: none; background-color: rgba(51,51,51,0)" href="/board">
				<div class="card__background" style="background-color: rgba(81,31,1,0.7)"></div>
				<div class="card__content">
					<p class="card__category">Gallery</p>
					<h3 class="card__heading">Gallery!</h3>
				</div>
			</a>
			<a class="card" style="border: none; background-color: rgba(51,51,51,0)" href="/board/APIForm?style=2">
				<div class="card__background" style="background-color: rgba(185, 199, 187, 0.5)"></div>
				<div class="card__content">
					<p class="card__category">Recipe</p>
					<h3 class="card__heading">Recipe!</h3>
				</div>
			</a>
			<a class="card" style="border: none; background-color: rgba(51,51,51,0)" href="/user/updateForm">
				<div class="card__background" style="background-color: rgba(185, 51, 29, 0.6)"></div>
				<div class="card__content">
					<p class="card__category">Profile</p>
					<h3 class="card__heading">Profile!</h3>
				</div>
			</a>
			<div>
	</section>





</div>

<div style="background-color:#252b37; height: 45px; color:azure;" class="p-2 d-flex justify-content-end">
	<svg style="margin-top: 3px;" xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-chat-right-dots-fill" viewBox="0 0 16 16">
		<path d="M16 2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h9.586a1 1 0 0 1 .707.293l2.853 2.853a.5.5 0 0 0 .854-.353V2zM5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
	</svg>
<c:choose>
	<c:when test="${empty principal}">
		&nbsp;&nbsp;로그인을 해주세요
	</c:when>
	<c:otherwise>
	    &nbsp;&nbsp;안녕하세요<c:if test="${principal.user.USER_ROLE eq 'ADMIN'}">&nbsp;관리자&nbsp;</c:if> ${principal.user.username}님&nbsp;
	</c:otherwise>
</c:choose>
</div>

<div style="background-size: cover; background-repeat: no-repeat; background-position: center; background-image: url('https://images.wallpaperscraft.com/image/single/sand_traces_veins_177453_3000x4000.jpg');">

</div>

<nav style="top:-1px!important; width:100%; height:50px; background-color: #252b37; opacity: 0;" class="navbar navbar-expand-sm navbar-dark sticky-top">
	<ul class="navbar-nav">
		<c:choose>
			<c:when test="${empty principal}">
				<li class="nav-item"><a class="nava nav-link" href="/">공지사항</a></li>
				<li class="nav-item"><a class="nava nav-link" href="/auth/loginForm">로그인</a></li>
				<li class="nav-item"><a class="nava nav-link" href="/auth/joinForm">회원가입</a></li>
				<li class="nav-item" style="margin-top: 1px;">
					<button type="button" class="btn nava" style="color: azure; width:80px; margin-left: -5px;" data-toggle="modal" data-target="#exampleModal2" data-whatever="@mdo">신고하기</button>
					<button type="button" class="btn nava" style="color: azure; width:80px; margin-left: -9px;" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">문의하기</button>
				</li>
			</c:when>

			<c:otherwise>
				<li class="nav-item"><a class="nava nav-link"></a></li>
				<li class="nav-item"><a class="nava nav-link" href="/">메인</a></li>
				<li class="nav-item"><a class="nava nav-link active" href="/board/APIForm?style=2">API</a></li>
				<li class="nav-item"><a class="nava nav-link" href="/user/updateForm">회원정보</a></li>
				<li class="nav-item"><a class="nava nav-link" href="/user/My">내정보</a></li>
				<li class="nav-item"><a class="nava nav-link" href="/logout">로그아웃</a></li>
				<li class="nav-item"><a class="nava nav-link" href="/board">사용자 게시판</a></li>
				<li class="nav-item dropdown">
					<a class="nava nav-link dropdown-toggle" data-toggle="dropdown" href="#">글쓰기</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="/board/saveForm">글쓰기</a>
						<a class="dropdown-item" href="/board/RsaveForm">레시피 글쓰기</a>
						<c:if test="${pricipal.user.USER_ROLE eq 'ADMIN'}">
							<a style="color: blue; " class="dropdown-item linkc" href="/board/AsaveForm">공지 글쓰기</a>
						</c:if>
					</div>
				</li>

			</c:otherwise>
		</c:choose>
	</ul>
</nav>






	</div>

</body>

<body onLoad="initClock()">
</body>

<script>
	let navopacity = document.querySelector(".navbar");

	window.addEventListener('scroll',function (){
		let value = window.scrollY
		console.log("scrollY", value);



		if (value>880) {
			navopacity.style.animation='opacity3 .5s ease-out forwards';
		} else {
			navopacity.style.animation='slide 1.5s ease-out'
		}




	});
</script>
<%--select--%>
<script>
	/*
Reference: http://jsfiddle.net/BB3JK/47/
*/

	$('select').each(function(){
		var $this = $(this), numberOfOptions = $(this).children('option').length;

		$this.addClass('select-hidden');
		$this.wrap('<div class="select"></div>');
		$this.after('<div class="select-styled"></div>');

		var $styledSelect = $this.next('div.select-styled');
		$styledSelect.text($this.children('option').eq(0).text());

		var $list = $('<ul />', {
			'class': 'select-options'
		}).insertAfter($styledSelect);

		for (var i = 0; i < numberOfOptions; i++) {
			$('<li />', {
				text: $this.children('option').eq(i).text(),
				rel: $this.children('option').eq(i).val()
			}).appendTo($list);
			//if ($this.children('option').eq(i).is(':selected')){
			//  $('li[rel="' + $this.children('option').eq(i).val() + '"]').addClass('is-selected')
			//}
		}

		var $listItems = $list.children('li');

		$styledSelect.click(function(e) {
			e.stopPropagation();
			$('div.select-styled.active').not(this).each(function(){
				$(this).removeClass('active').next('ul.select-options').hide();
			});
			$(this).toggleClass('active').next('ul.select-options').toggle();
		});

		$listItems.click(function(e) {
			e.stopPropagation();
			$styledSelect.text($(this).text()).removeClass('active');
			$this.val($(this).attr('rel'));
			$list.hide();
			//console.log($this.val());
		});

		$(document).click(function() {
			$styledSelect.removeClass('active');
			$list.hide();
		});

	});
</script>
<%--달력--%>
<script>
	$(function(){function c(){p();var e=h();var r=0;var u=false;l.empty();while(!u){if(s[r]==e[0].weekday){u=true}else{l.append('<div class="blank"></div>');r++}}for(var c=0;c<42-r;c++){if(c>=e.length){l.append('<div class="blank"></div>')}else{var v=e[c].day;var m=g(new Date(t,n-1,v))?'<div class="today">':"<div>";l.append(m+""+v+"</div>")}}var y=o[n-1];a.css("background-color",y).find("h1").text(i[n-1]+" "+t);f.find("div").css("color",y);l.find(".today").css("background-color",y);d()}function h(){var e=[];for(var r=1;r<v(t,n)+1;r++){e.push({day:r,weekday:s[m(t,n,r)]})}return e}function p(){f.empty();for(var e=0;e<7;e++){f.append("<div>"+s[e].substring(0,3)+"</div>")}}function d(){var t;var n=$("#calendar").css("width",e+"px");n.find(t="#calendar_weekdays, #calendar_content").css("width",e+"px").find("div").css({width:e/7+"px",height:e/7+"px","line-height":e/7+"px"});n.find("#calendar_header").css({height:e*(1/7)+"px"}).find('i[class^="icon-chevron"]').css("line-height",e*(1/7)+"px")}function v(e,t){return(new Date(e,t,0)).getDate()}function m(e,t,n){return(new Date(e,t-1,n)).getDay()}function g(e){return y(new Date)==y(e)}function y(e){return e.getFullYear()+"/"+(e.getMonth()+1)+"/"+e.getDate()}function b(){var e=new Date;t=e.getFullYear();n=e.getMonth()+1}var e=480;var t=2013;var n=9;var r=[];var i=["JANUARY","FEBRUARY","MARCH","APRIL","MAY","JUNE","JULY","AUGUST","SEPTEMBER","OCTOBER","NOVEMBER","DECEMBER"];var s=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];var o=["rgba(0,0,0,0)","#rgba(0,0,0,0)","#rgba(0,0,0,0)","#rgba(0,0,0,0)","#rgba(0,0,0,0)","#rgba(0,0,0,0)","#rgba(0,0,0,0)","#rgba(0,0,0,0)","#rgba(0,0,0,0)","#rgba(0,0,0,0)","#rgba(0,0,0,0)","#rgba(0,0,0,0)"];var u=$("#calendar");var a=u.find("#calendar_header");var f=u.find("#calendar_weekdays");var l=u.find("#calendar_content");b();c();a.find('i[class^="icon-chevron"]').on("click",function(){var e=$(this);var r=function(e){n=e=="next"?n+1:n-1;if(n<1){n=12;t--}else if(n>12){n=1;t++}c()};if(e.attr("class").indexOf("left")!=-1){r("previous")}else{r("next")}})})
</script>

<script>
	Number.prototype.pad = function(n) {
		for (var r = this.toString(); r.length < n; r = 0 + r);
		return r;
	};

	function updateClock() {
		var now = new Date();
		var milli = now.getMilliseconds(),
				sec = now.getSeconds(),
				min = now.getMinutes(),
				hou = now.getHours(),
				mo = now.getMonth(),
				dy = now.getDate(),
				yr = now.getFullYear();
		var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
		var tags = ["mon", "d", "y", "h", "m", "s", "mi"],
				corr = [months[mo], dy, yr, hou.pad(2), min.pad(2), sec.pad(2), milli];
		for (var i = 0; i < tags.length; i++)
			document.getElementById(tags[i]).firstChild.nodeValue = corr[i];
	}

	function initClock() {
		updateClock();
		window.setInterval("updateClock()", 1);
	}

	// END CLOCK SCRIPT

</script>

<%-- 시계 타이머--%>
<script>

	$(document).ready(function() {

		let selectedOpBreak="",
				selectedOpWork="",
				breakTime="",
				workTime="",
				timer="",
				countTime="",
				minutes="",
				seconds="",
				minutesB="",
				secondsB="",
				intervalId =false,
				intervalIdBreak=false;

		breakTime += $('.breakT').html();
		workTime += $('.workT').html();
		minutes += $('.minutes').html();
		seconds += $('.seconds').html();
//BREAK OPERATORS

		$('.operatorB').click(function(){
			selectedOpBreak = $(this).html();
			if(selectedOpBreak === "+") {
				breakTime ++;
				$('.breakT').html(breakTime);
				minutesB = breakTime;
			} else if (selectedOpBreak === "-") {
				if(breakTime >0){
					breakTime --;
					$('.breakT').html(breakTime);
					minutesB = breakTime;
				}
			}
		});
// WORK OPERATOR
		$('.operatorW').click(function(){
			selectedOpWork = $(this).html();
			if(selectedOpWork === "+") {
				workTime ++;
				$('.workT').html(workTime);
				minutes = workTime;
				$('.minutes').html(workTime);
			}
			else if (selectedOpWork === "-") {
				if(workTime >0)
					workTime --;
				$('.workT').html(workTime);
				minutes = workTime;
				$('.minutes').html(workTime);
			}
		});

		function startTimer(){
			$(".msg").html("Work time!");
			$(".minutes").text(--minutes);
			seconds=59;
			updateTime();
			intervalId = setInterval(updateTime,1000);
		}

		function updateTime(){
			$(".seconds").text(seconds);
			--seconds;
			if(minutes>0 && seconds<0){
				--minutes;
			}
			else if(minutes <= 0 && seconds < 0) {
				breakTimer();
			}
		}


		function breakTimer(){
			if(breakTime>0){
				$(".msg").html("Break Time!");
				clearInterval(intervalId);
				$(".minutes").text(--breakTime);
				seconds=59;
				setBreakTime();
				intervalId =          setInterval(setBreakTime,1000);
			}
			else{
				$(".msg").html("The End.");
				stopTimer();
			}
		}
		function setBreakTime(){
			$(".seconds").text(seconds);
			--seconds;
			if(minutes>0 && seconds<0){
				--minutes;
			}
			else if(minutes <= 0 && seconds < 0) {
				$(".msg").html("The End.");
				stopTimer();
			}
		}

		function stopTimer(){
			clearInterval(intervalId);
			minutes+=$(".minutes").html("25");
			seconds+=$(".seconds").html("00");
			$(".breakT").html("5");
			$(".workT").html("25");
		}
		$(".start-btn").click(startTimer);
		$(".reset-btn").click(stopTimer);
	});
</script>

<script>
	// inspired by https://annajona.is/

	const bgGroup = document.querySelector('.svg-bg')
	const bgPaths = bgGroup.querySelectorAll('path')
	bgPaths.forEach((path, i) => {
		const length = path.getTotalLength()
		path.style.setProperty('--length', length)
		path.style.setProperty('--duration', length + 'ms')
		path.style.setProperty('--delay', i * 65 + 'ms')
	})

	const mainGroup = document.querySelector('.svg-main')
	const mainPaths = mainGroup.querySelectorAll('path')
	mainPaths.forEach((path, i) => {
		const length = path.getTotalLength()
		path.style.setProperty('--length', length)
		path.style.setProperty('--duration', length + 'ms')
		path.style.setProperty('--duration', length + 'ms')
		path.style.setProperty('--delay', i * 100 + 'ms')
	})
</script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://use.fontawesome.com/releases/v5.9.0/js/all.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="/js/board2.js"></script>

</html>

