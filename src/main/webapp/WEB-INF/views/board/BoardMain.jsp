<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header2.jsp"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<link rel="stylesheet" href="/css/index.css">

<style>
@import url("https://fonts.googleapis.com/css?family=Roboto+Mono");


.flip>.front p, .flip>.back p {
	font-size: 0.9125rem;
	line-height: 160%;
	color: #999;
}

/* ================================ HEADER ============================= */

button, button::after {
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	-o-transition: all 0.3s;
	transition: all 0.3s;
}

button {
	width: 180px;
	height: 44px;
	background: none;
	border: 2px solid #1c3b58;
	border-radius: 5px;
	color: rgb(32, 32, 32, 0.7);
	display: block;
	font-size: 0.9em;
	font-weight: bold;
	padding: 0.5em 1em;
	position: relative;
	text-transform: uppercase;
	font-family: 'Nanum Gothic', sans-serif;
}

button::before, button::after {
	background: #1c3b58;
	border-radius: 5px;
	content: '';
	position: absolute;
	z-index: -1;
}

button:hover {
	color: #FFFFFF;
}

</style>

<div class="container mt-4 mb-5" style="text-align: center;">
	<div class="row d-flex justify-content-center" style="margin-bottom:-10px;">
	<form class="mr-5">
		<input type="hidden" name="board" size=20 value='1'>
		<input class="btn" type="submit" value="사용자 게시판">
	</form>
	<form>
		<input type="hidden" name="board" size=20 value='0'>
		<input class="btn" type="submit" value="R 게시판">
	</form>
	</div>
	<hr/>
</div>

<c:if test="${boards.totalPages<=boards.number}">
	<span class="d-flex justify-content-center mt-1"> <a style="color: red; font-size: 14px;" href="?page=${boards.totalPages-1}">(누르면 마지막 페이지로 돌아갑니다)</a>
	</span>
</c:if>
<!-- justify-content-center 부트스트랩 flex 정렬할때 문법 -->


<ul class="pagination justify-content-center mt-5">

	<c:choose>
		<c:when test="${boards.first}">
			<li class="page-item disabled"><a class="page-link" href="?page=${boards.number-1}">Previous</a></li>
		</c:when>
		<c:otherwise>
			<li class="page-item"><a style="color: #FE7348" class="page-link" href="?page=${boards.number-1}">Previous</a></li>
		</c:otherwise>
	</c:choose>

	<c:if test="${boards.number<9}">
		<c:forEach var="i" begin="0" end="9">


			<c:if test="${null ne param.stype }">
				<li class="page-item"><a style="color: #F79E5F" id="moveMove" class="page-link" href="?page=${i}&stype=${param.stype}"> ${i+1}</a></li>
			</c:if>
			<c:if test="${null eq param.stype }">
				<li class="page-item"><a style="color: #F79E5F" id="moveMove" class="page-link" href="?page=${i}"> ${i+1}</a></li>
			</c:if>
		</c:forEach>
	</c:if>

	<c:if test="${boards.number>=9}">
		<c:forEach var="i" begin="${boards.number-5}" end="${(boards.number+5)}">
			<li class="page-item"><a style="color: #F79E5F" class="page-link" href="?page=${i}"> ${i+1} </a></li>
		</c:forEach>
	</c:if>




	<c:choose>
		<c:when test="${boards.last}">
			<li class="page-item disabled"><a class="page-link" href="?page=${boards.number+1}">Next</a></li>
		</c:when>

		<c:otherwise>
			<li class="page-item"><a style="color: #FE7348" class="page-link" href="?page=${boards.number+1}">Next</a></li>
		</c:otherwise>
	</c:choose>

</ul>
<div style="padding-bottom: 300px;"></div>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://use.fontawesome.com/releases/v5.9.0/js/all.js"></script>
