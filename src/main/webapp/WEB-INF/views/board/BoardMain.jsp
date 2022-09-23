<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/boardmianheader.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<link rel="stylesheet" href="/css/index.css">

<style>
	img{
		width: 300px;
		height: 300px;
	}
	button{
		background: none;
		outline: none;
	}

	.selectbox1{
		width: 200px;
		height: 60px;
		border: 1px solid;
		border-color: #ffffff #ffffff #777575 #ffffff;
		background: none;
		outline: none;
		text-align: center;
	}

	.selectbox1:hover{
		width: 200px;
		border: 2px solid;
		border-color: #ffffff #ffffff #777575 #ffffff;
		background: none;
		outline: none;
		text-align: center;
	}


	.backgroundcolor3{
		background-color: #777575;
	}
	.bordercolor3{
		border: 1px solid;
		border-color: #ffffff #ffffff #777575 #ffffff;
	}

	.bordercolor3:focus {
		border: 2px solid;
		border-color: #ffffff #ffffff #777575 #ffffff;
	}

	.color3{
		color : #777575;
	}

	.noblue {
		background: none;
		outline: none;
		border: none;
	}

	.noblue:focus {
		outline: none;
	}

	.divTable{
		display: table;
		width: 100%;
	}
	.divTableRow {
		display: table-row;
		font-size:12px;
	}
	.divTableHeading {
		background-color: #EEE;
		display: table-header-group;
	}
	.divTableCell {
		border: 1px solid;
		border-color: #FFFFFF #FFFFFF #1a1a1a #FFFFFF;
		display: table-cell;
		padding: 5px 5px;

	}
	.divTableCell > a > p > img{
		width: 0px!important;
		height: 0px!important;
	}
	.card > dd > p > img{
		width: 0px!important;
		height: 0px!important;
	}


	.divTableCell2 {
		border: 1px solid;
		border-color: #FFFFFF #FFFFFF #1a1a1a #FFFFFF;
		padding: 5px 5px;

	}

	.divTableHead {
		border: 1px solid;
		display: table-cell;
		padding: 3px 14px;
		color:white;
		border-radius: 3px;
		font-family: 'Hind Siliguri', sans-serif;
	}
	.divTableHeading {
		background-color: #EEE;
		display: table-header-group;
		font-weight: bold;
	}
	.divTableFoot {
		background-color: #EEE;
		display: table-footer-group;
		font-weight: bold;
	}
	.divTableBody {
		display: table-row-group;
	}

	.input1 {
		width: 800px;
		height: 60px;
		outline: 1px solid #FFFFFF;
	}


	.noutline {
		outline: 0;
	}


	.scroll1 {
		width: 100%;
		height: 190px;
		overflow: auto;
	}
	.scroll1::-webkit-scrollbar {
		width: 9px;
	}
	.scroll1::-webkit-scrollbar-thumb {
		background-color: orangered;
		border-radius: 10px;
		background-clip: padding-box;
		border: 2px solid transparent;
	}
	.scroll1::-webkit-scrollbar-track {
		border-radius: 10px;
	}

	*{ padding: 0; margin: 0; }
	li{ list-style: none; }

	.gallery{
		width: 300px; margin: 0 auto;
		overflow: hidden;
	}
	.gallery h3{
		width: 100%; height: 50px;
		line-height: 50px; text-align: center;
	}
	.gallery li{
		float: left;
		width: 300px; height: 310px;
		margin-right: 20px;
	}
	.gallery li:last-child{ margin-right: 0; }

	.gallery a{
		display: block; /* 영역적용위해 사용 */
		width: 100%; height: 100%;

		overflow: hidden;

		position: relative; /* absolute의 기본기준은 body로 처리 - 현재 요소로 기준변경 */
	}

	.gallery figure{
		width: 100%; height: 100%;
	}
	.gallery figcaption{
		width: 100%; height: 100%;
		background-color: rgba(0,0,0,0.7);

		position: absolute; /* 이미지와 겹치게 처리 */
		top: 0; left: 0;

		color: #fff; text-align: center;
		line-height: 200px;

		opacity: 0; /* 처음엔 안보이고 */

		transition: 0.3s;
	}

	.gallery a:hover figcaption, .gallery a:focus figcaption{
		/* 마우스를 올리면 보이게 처리 */
		opacity: 1;
	}

	.cellhover:hover{
		background-color: rgba(255, 255, 255, 0.21);
	}

	input::placeholder {
		color: #1a1a1a;
		font-family: 'Montserrat', sans-serif;
		font-size: 10px;
	}

</style>





<div class="container mt-4">
	<div class="ml-4">
	<svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-filter" viewBox="0 0 16 16">
		<path d="M6 10.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5zm-2-3a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-2-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z"/>
	</svg>
	<span class="linkc2">&nbsp;FILTER</span>
	<div class="row mb-3 linkc2" style="width: 100%; border:1px solid; border-color:#000 white white white;">
		<form method="get" action="/board">
			<input style="width: 50px;" type="hidden" name="field" value="${param.field}" />
			<input style="width: 50px;" type="hidden" name="word" value="${param.word}" />
			<input style="width: 50px;" type="hidden" name="style" value="${param.style}" />
			<input style="width: 50px;" type="hidden" name="page" value="${param.page}" />

			<c:set var = "tcount" value = "0" />
			<c:set var = "tcount2" value = "0" />
			<c:forEach var="boards2" items="${boards2}">
				<c:if test="${boards2.BOARDCOUNT != 0}">
				<c:set var="tcount" value="${tcount + 1}" />
				<c:set var="tcount2" value="${tcount2 + boards2.BOARDCOUNT}" />
				</c:if>
			</c:forEach>
<%--			-${tcount}---%>
<%--			-${tcount2}---%>
<%--			-${tcount2/tcount}---%>
<%--			<fmt:formatNumber value="${tcount2/tcount}" pattern="0"/>--%>
			<c:set var = "tcount3" value = "0" />
			<c:set var = "tcount4" value = "0" />
			<c:forEach var="rboards2" items="${rboards2}">
				<c:if test="${rboards2.RBOARDCOUNT != 0}">
					<c:set var="tcount3" value="${tcount3 + 1}" />
					<c:set var="tcount4" value="${tcount4 + rboards2.RBOARDCOUNT}" />
				</c:if>
			</c:forEach>
			<c:if test="${'searchr' ne param.field}">
				&nbsp;&nbsp;
				<button class="m-1 linkc2"
						style="border: none; background: none; outline: none; margin-left: -3px; background-color: #FFFFFF;"
						name="NOTICE" type="submit" value="1">
					NOTICE
				</button>
			</c:if>
			<c:if test="${'searchr' eq param.field}">
				&nbsp;
			<button class="m-1 linkc2"
					style="border: none; background: none; outline: none; margin-left: -3px; background-color: #FFFFFF;"
					name="CF" type="submit" value="밥">
				Rice
			</button>
			<button class="m-1 linkc2"
					style="border: none; background: none; outline: none; margin-left: -3px; background-color: #FFFFFF;"
					name="CF" type="submit" value="후식">
				Dessert
			</button>
			<button class="m-1 linkc2"
					style="border: none; background: none; outline: none; margin-left: -3px; background-color: #FFFFFF;"
					name="CF" type="submit" value="국">
				Soup
			</button>
			<button class="m-1 linkc2"
					style="border: none; background: none; outline: none; margin-left: -3px; background-color: #FFFFFF;"
					name="CF" type="submit" value="과일">
				Fruit
			</button>
			<button class="m-1 linkc2"
					style="border: none; background: none; outline: none; margin-left: -3px; background-color: #FFFFFF;"
					name="CF" type="submit" value="빵">
				Bread
			</button>
			<button class="m-1 linkc2"
					style="border: none; background: none; outline: none; margin-left: -3px; background-color: #FFFFFF;"
					name="CF" type="submit" value="과자">
				Pastry
			</button>
			<button class="m-1 linkc2"
					style="border: none; background: none; outline: none; margin-left: -3px; background-color: #FFFFFF;"
					name="CF" type="submit" value="조림">
				Stewed
			</button>
			<button class="m-1 linkc2"
					style="border: none; background: none; outline: none; margin-left: -3px; background-color: #FFFFFF;"
					name="CF" type="submit" value="찜">
				Steamed
			</button>
			<button class="m-1 linkc2"
						style="border: none; background: none; outline: none; margin-left: -3px; background-color: #FFFFFF;"
						name="CF" type="submit" value="무침">
				Seasonned
			</button>
			<button class="m-1 linkc2"
					style="border: none; background: none; outline: none; margin-left: -3px; background-color: #FFFFFF;"
					name="CF" type="submit" value="해물">
				Seafood
			</button>
			<button class="m-1 linkc2"
					style="border: none; background: none; outline: none; margin-left: -3px; background-color: #FFFFFF;"
					name="CF" type="submit" value="볶음">
				Stir-fry
			</button>
			</c:if>

			<c:if test="${'searchf' eq param.field}">
			<button class="m-1 linkc2"
					style="border: none; background: none; outline: none; margin-left: -3px; background-color: #FFFFFF;"
					name="count" type="submit" value="<fmt:formatNumber value="${tcount2/tcount}" pattern="0"/>">
				HOT
			</button>
			<a class="m-1 linkc2"
				style="border: none; background: none; outline: none; margin-left: -3px; background-color: #FFFFFF;"
			    href="/board?ROLE=&field=searchf">
				ALL
			</a>
			</c:if>

			<c:if test="${'searchr' eq param.field}">
				<button class="m-1 linkc2"
						style="border: none; background: none; outline: none; margin-left: -3px; background-color: #FFFFFF;"
						name="count" type="submit" value="<fmt:formatNumber value="${tcount4/tcount3}" pattern="0"/>">
					HOT
				</button>
				<a class="m-1 linkc2"
				   style="border: none; background: none; outline: none; margin-left: -3px; background-color: #FFFFFF;"
				   href="/board?ROLE=&field=searchr">
					ALL
				</a>
			</c:if>
		</form>
	</div>
	</div>

	<div class="" style="max-width:1200px; margin-top: 50px;">
		<form method="get" action="/board">

			<h3 class="text-center color3">SEARCH BAR</h3>

<%--			<select class="selectbox1" name="board2">--%>
<%--				<option value="1">자유 게시판</option>--%>
<%--				<option value="0">레시피 게시판</option>--%>
<%--			</select>--%>

			<select name="field" id="field" class="selectbox1">
				<option value="searchr">레시피 게시판</option>
				<option value="searchf">자유 게시판</option>
			</select>

<%--			<input type="hidden" id="word" name="board" value="1">--%>
			<input type="text" id="word" name="word" class="input1 bordercolor3">

			<button class="p-1" style="border: none; background: none; outline: none; margin-left: -3px; width: 65px; background-color: #FFFFFF;"
					name="style" type="submit" value="1">
				<svg style="margin-left:20px; border-radius:3px; color:white; padding: 10px;" xmlns="http://www.w3.org/2000/svg" width="70" height="40" fill="currentColor" class="bi bi-search backgroundcolor3"
					 viewBox="0 0 16 16">
					<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
				</svg>
			</button>

		</form>
	</div>


	<h3 class="text-center mt-5 color3" style="margin-bottom: -35px;">LIST</h3>
	<div class="well well-sm mt-5 backgroundcolor3" style="max-width:1200px; margin-left: -45px; margin-right: -50px; border-radius: 2px;">
		<div class="btn-group">
			<div class="row d-flex justify-content-center align-items-center ml-1" style="height: 36px;">
				<form method="get" action="/board">
					<button class="p-1 cellhover" style="outline: 0; border: none; width: 65px; color:#FFFFFF" name="style" type="submit" value="1">
						<svg style="color:#FFFFFF;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-ul" viewBox="0 0 16 16">
							<path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm-3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm0 4a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm0 4a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
						</svg>
						<a>List</a>
					</button>

					<input style="width: 50px;" type="hidden" name="page" value="${boards.number}" />
					<input style="width: 50px;" type="hidden" name="board" value="${param.board}" />
					<input style="width: 50px;" type="hidden" name="board2" value="${param.board2}" />
					<input style="width: 50px;" type="hidden" name="search" value="${param.search}" />
					<input style="width: 50px;" type="hidden" name="ROLE" value="${param.ROLE}" />
					<input style="width: 50px;" type="hidden" name="field" value="${param.field}" />
					<input style="width: 50px;" type="hidden" name="CF" value="${param.CF}" />
					<input style="width: 50px;" type="hidden" name="count" value="${param.count}" />
					<button class="p-1 cellhover" style="outline: 0; color:#FFFFFF; border: none; margin-left: -3px; width: 65px;" name="style" type="submit" value="2">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-grid-3x3-gap-fill" viewBox="0 0 16 16">
							<path d="M1 2a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V2zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V2zM1 7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V7zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V7zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1V7zM1 12a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-2zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1v-2zm5 0a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1v-2z"/>
						</svg>
						<a>Grid</a>
					</button>
				</form>

				<form method="get" action="/board">
					<input style="width: 50px;" type="hidden" name="ROLE" value="${param.ROLE}" />

					<button class="p-1 cellhover" style="outline: 0; border: none; width: 85px; color:#FFFFFF" name="field" type="submit" value="searchf">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
							<path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
							<path fill-rule="evenodd" d="M5.216 14A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216z"/>
							<path d="M4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z"/>
						</svg>
						<a>Board</a>
					</button>

					<button class="p-1 cellhover" style="outline: 0; color:#FFFFFF; border: none; margin-left: -3px; width: 85px;" name="field" type="submit" value="searchr">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-text-fill" viewBox="0 0 16 16">
							<path d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0zM9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1zM4.5 9a.5.5 0 0 1 0-1h7a.5.5 0 0 1 0 1h-7zM4 10.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 1 0-1h4a.5.5 0 0 1 0 1h-4z"/>
						</svg>
						<a>Rboard</a>
					</button>
				</form>

				<c:if test="${'ADMIN' eq principal.user.USER_ROLE}">

					<form method="get" action="/board">
						<button class="p-1 cellhover" id="remoteb"
								style="border: none; outline: 0; width: 90px; color:white;" name="ROLE" type="submit"
								value="ADMIN">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
								 class="bi bi-tools" viewBox="0 0 16 16">
								<path d="M1 0 0 1l2.2 3.081a1 1 0 0 0 .815.419h.07a1 1 0 0 1 .708.293l2.675 2.675-2.617 2.654A3.003 3.003 0 0 0 0 13a3 3 0 1 0 5.878-.851l2.654-2.617.968.968-.305.914a1 1 0 0 0 .242 1.023l3.27 3.27a.997.997 0 0 0 1.414 0l1.586-1.586a.997.997 0 0 0 0-1.414l-3.27-3.27a1 1 0 0 0-1.023-.242L10.5 9.5l-.96-.96 2.68-2.643A3.005 3.005 0 0 0 16 3c0-.269-.035-.53-.102-.777l-2.14 2.141L12 4l-.364-1.757L13.777.102a3 3 0 0 0-3.675 3.68L7.462 6.46 4.793 3.793a1 1 0 0 1-.293-.707v-.071a1 1 0 0 0-.419-.814L1 0Zm9.646 10.646a.5.5 0 0 1 .708 0l2.914 2.915a.5.5 0 0 1-.707.707l-2.915-2.914a.5.5 0 0 1 0-.708ZM3 11l.471.242.529.026.287.445.445.287.026.529L5 13l-.242.471-.026.529-.445.287-.287.445-.529.026L3 15l-.471-.242L2 14.732l-.287-.445L1.268 14l-.026-.529L1 13l.242-.471.026-.529.445-.287.287-.445.529-.026L3 11Z"/>
							</svg>
							<a>Admin</a>
						</button>
						<c:if test="${param.page ne null}">
							<input style="width: 50px;" type="hidden" name="page" value="${param.page}"/>
						</c:if>
						<c:if test="${param.board ne null}">
							<input style="width: 50px;" type="hidden" name="board" value="${param.board}"/>
						</c:if>
						<c:if test="${param.style ne null}">
							<input style="width: 50px;" type="hidden" name="style" value="${param.style}"/>
						</c:if>
						<c:if test="${param.board2 ne null}">
							<input style="width: 50px;" type="hidden" name="board2" value="${param.board2}"/>
						</c:if>
						<c:if test="${param.search ne null}">
							<input style="width: 50px;" type="hidden" name="search" value="${param.search}"/>
						</c:if>
						<input style="width: 50px;" type="hidden" name="page" value="${boards.number}" />
						<input style="width: 50px;" type="hidden" name="ROLE" value="${param.ROLE}" />
						<input style="width: 50px;" type="hidden" name="field" value="${param.field}" />
						<input style="width: 50px;" type="hidden" name="CF" value="${param.CF}" />
						<input style="width: 50px;" type="hidden" name="count" value="${param.count}" />
					</form>
				</c:if>

			</div>
		</div>
	</div>


</div>
<%--..자유게시판--%>
<c:if test="${'searchf' eq param.field && null eq param.NOTICE}">
<%--style = 1 이나 null 은 기본형--%>


		<c:if test="${param.style == 1 || param.style eq null || param.style eq ''}">

			<div class="d-flex justify-content-center">
				<div class="table-users mt-3" style="width:1200px; z-index: 1; background: #FFFFFF; padding: 45px; text-align: center; box-shadow: 0 0 11px rgba(33,33,33,.2); ">
					<div class="divTable">
						<div class="divTableBody">
							<div class="divTableRow">
								<div class="divTableHead backgroundcolor3">ID</div>
								<div class="divTableHead backgroundcolor3">Score</div>
								<div class="divTableHead backgroundcolor3">Title</div>
								<div class="divTableHead backgroundcolor3" style="max-width:400px;">Content</div>
								<div class="divTableHead backgroundcolor3">Count</div>
								<div class="divTableHead backgroundcolor3">Favorite</div>
								<c:if test="${'ADMIN' eq principal.user.USER_ROLE && param.ROLE eq principal.user.USER_ROLE}">
									<div class="divTableHead backgroundcolor3">admin</div>
								</c:if>
							</div>

							<c:forEach var="notice" items="${notice}">
									<c:set var="totalstar1" value="0" />
									<c:set var="totalstar2" value="0" />
									<c:forEach var="reply1" items="${reply}" varStatus="status">
										<c:if test="${null ne reply1.REPLY_NUM1 && reply1.REPLY_TYPE2 == notice.ID}">
											<c:set var="totalstar1" value="${totalstar1 + 1}" />
											<c:set var="totalstar2" value="${totalstar2 + reply1.REPLY_NUM1/2}" />
										</c:if>
									</c:forEach>
									<div class="divTableRow">
										<div class="divTableCell align-middle">${notice.ID}</div>
										<div class="divTableCell align-middle"><c:if test="${0 != totalstar2}"><fmt:formatNumber value="${(totalstar2/totalstar1)}" pattern=".00"/></c:if>
											<small style="color: red">
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-megaphone-fill" viewBox="0 0 16 16">
													<path d="M13 2.5a1.5 1.5 0 0 1 3 0v11a1.5 1.5 0 0 1-3 0v-11zm-1 .724c-2.067.95-4.539 1.481-7 1.656v6.237a25.222 25.222 0 0 1 1.088.085c2.053.204 4.038.668 5.912 1.56V3.224zm-8 7.841V4.934c-.68.027-1.399.043-2.008.053A2.02 2.02 0 0 0 0 7v2c0 1.106.896 1.996 1.994 2.009a68.14 68.14 0 0 1 .496.008 64 64 0 0 1 1.51.048zm1.39 1.081c.285.021.569.047.85.078l.253 1.69a1 1 0 0 1-.983 1.187h-.548a1 1 0 0 1-.916-.599l-1.314-2.48a65.81 65.81 0 0 1 1.692.064c.327.017.65.037.966.06z"/>
												</svg>
											</small>
										</div>
										<div class="divTableCell align-middle"> <a style="color: black;" href="/board/${notice.ID}"> ${notice.BOARDTITLE}</a> </div>
										<div class="divTableCell align-middle" style="width:800px; word-break: break-all; vertical-align: middle;"> <a style="color: black;" href="/board/${notice.ID}">${notice.BOARDCONTENT} </a> </div>
										<div class="divTableCell align-middle">${notice.BOARDCOUNT}</div>


										<div class="divTableCell align-middle">
											<button class="noblue"
													onClick="index.favorites(${notice.ID+1}, ${notice.ID}, '${principal.user.username}', '${notice.BOARDTITLE}')"
													class="btn"
													style="height: 18px; margin-bottom: 10px; margin-top: -10px; color:white; margin-right: -11px;">
												<lord-icon
														src="https://cdn.lordicon.com/mdgrhyca.json"
														trigger="click"
														colors="primary:#777575,secondary:#ffffff"
														stroke="75"
														style="width:100%;height:200%;margin-left: -10px;">
												</lord-icon>
											</button>
										</div>

										<c:if test="${'ADMIN' eq principal.user.USER_ROLE && param.ROLE eq principal.user.USER_ROLE}">
											<div class="divTableCell align-middle">
												<div class="row d-flex justify-content-center">
													<button onClick="index.Delete(${notice.ID}, ${1})"
															class="align-middle"
															style="color:#777575; border:none; width:25px; font-size:15px; margin-top: -2px; margin-left: -5px; hegiht: 50px;">
														<svg xmlns="http://www.w3.org/2000/svg" width="17" height="17"
															 fill="currentColor" class="bi bi-trash-fill"
															 viewBox="0 0 16 16">
															<path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
														</svg>
													</button>
													<a href="/board/${notice.ID}/updateForm"
													   style="color:#777575; hegiht: 50px;" class="align-middle">
														<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
															 fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 16 16">
															<path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001z"/>
														</svg>
													</a>
												</div>
											</div>
										</c:if>
									</div>
							</c:forEach>


							<c:forEach var="i" begin="0" end="11">
								<c:if test="${boards.content[i].BOARDTITLE ne null}">
								<c:set var="totalstar1" value="0" />
								<c:set var="totalstar2" value="0" />
								<c:forEach var="reply1" items="${reply}" varStatus="status">
									<c:if test="${null ne reply1.REPLY_NUM1 && reply1.REPLY_TYPE2 == boards.content[i].ID}">
										<c:set var="totalstar1" value="${totalstar1 + 1}" />
										<c:set var="totalstar2" value="${totalstar2 + reply1.REPLY_NUM1/2}" />
									</c:if>
								</c:forEach>



								<div class="divTableRow">
									<div class="divTableCell align-middle">${boards.content[i].ID}</div>
									<div class="divTableCell align-middle"><c:if test="${0 != totalstar2}"><fmt:formatNumber value="${(totalstar2/totalstar1)}" pattern=".00"/></c:if></div>
									<div class="divTableCell align-middle">
										<a style="color: black;" href="/board/${boards.content[i].ID}">
												${boards.content[i].BOARDTITLE}
													<c:forEach var="favorties" items="${favorite}">
														<c:if test="${favorties.FAVORTIE_TITLE eq (boards.content[i].BOARDTITLE+=''+=boards.content[i].ID+=''+=principal.user.username)}">
															<br/><small style="color:red;">즐겨찾기 완료</small>
														</c:if>
													</c:forEach>
										</a>
									</div>
									<div class="divTableCell align-middle" style="width:800px; word-break: break-all; vertical-align: middle;"> <a style="color: black;" href="/board/${boards.content[i].ID}">${boards.content[i].BOARDCONTENT} </a> </div>
									<div class="divTableCell align-middle">${boards.content[i].BOARDCOUNT}</div>


									<div class="divTableCell align-middle">
										<button class="noblue"
												onClick="index.favorites(${boards.content[i].ID+1}, ${boards.content[i].ID}, '${principal.user.username}', '${boards.content[i].BOARDTITLE}')"
												class="btn"
												style="height: 18px; margin-bottom: 10px; margin-top: -10px; color:white; margin-right: -11px;">
											<lord-icon
													src="https://cdn.lordicon.com/mdgrhyca.json"
													trigger="click"
													colors="primary:#777575,secondary:#ffffff"
													stroke="75"
													style="width:100%;height:200%;margin-left: -10px;">
											</lord-icon>
										</button>
									</div>


									<c:if test="${'ADMIN' eq principal.user.USER_ROLE && param.ROLE eq principal.user.USER_ROLE}">
										<div class="divTableCell align-middle">
											<div class="row d-flex justify-content-center">
												<button onClick="index.Delete(${boards.content[i].ID}, ${1})"
														class="align-middle"
														style="color:#777575; border:none; width:25px; font-size:15px; margin-top: -2px; margin-left: -5px; hegiht: 50px;">
													<svg xmlns="http://www.w3.org/2000/svg" width="17" height="17"
														 fill="currentColor" class="bi bi-trash-fill"
														 viewBox="0 0 16 16">
														<path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
													</svg>
												</button>
												<a href="/board/${boards.content[i].ID}/updateForm"
												   style="color:#777575; hegiht: 50px;" class="align-middle">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
														 fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 16 16">
														<path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001z"/>
													</svg>
												</a>
											</div>
										</div>
									</c:if>
								</div>
								</c:if>
							</c:forEach>

						</div>
					</div>
				</div>
			</div>
		</c:if>

		<%--    style = 2 는 갤러리형--%>
		<c:if test="${param.style == 2}">
			<div class="d-flex justify-content-center">
				<div class="row d-flex justify-content-center pt-5 mt-2" style="max-width:1200px; position: relative; z-index: 1;background: whitesmoke; padding: 45px; text-align: center; box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);">

						<%--				<c:forEach var="board" items="${api.content}">--%>
					<c:forEach var="i" begin="0" end="11">
						<c:set var="totalstar1" value="0" />
						<c:set var="totalstar2" value="0" />
						<c:forEach var="reply1" items="${reply}" varStatus="status">
							<c:if test="${null ne reply1.REPLY_NUM1 && reply1.REPLY_TYPE2 == boards.content[i].ID}">
								<c:set var="totalstar1" value="${totalstar1 + 1}" />
								<c:set var="totalstar2" value="${totalstar2 + reply1.REPLY_NUM1/2}" />
							</c:if>
						</c:forEach>

						<c:if test="${null ne boards.content[i].BOARDTITLE}">
						<div class="card ml-3 mr-3 mt-4 mb-4" style="width:300px; height: 410px; border:none;">
							<span class="p-1 backgroundcolor3" style="text-align:center !important; color:#FFFFFF; border-radius: 4px 4px 0px 0px; font-size:14px;"><c:if test="${null eq boards.content[i].BOARDTITLE}">NULL</c:if>${boards.content[i].BOARDTITLE} <c:if test="${0 != totalstar2}"><fmt:formatNumber value="${(totalstar2/totalstar1)}" pattern=".00"/></c:if></span>
							<div class="gallery">
								<ul>
									<li>
										<a href="/board/${boards.content[i].ID}">

											<figure style="">
												<img height="300px" src="https://m.media-amazon.com/images/I/71LnAqQh4fL._AC_SX679_.jpg" alt="이미지01">

												<figcaption style="padding-top: 30px; word-break:break-all !important; font-size: 14px;">
													자세히 보기
												</figcaption>
											</figure>
										</a>
									</li>
								</ul>
							</div>

							<dd class="p-1 scroll1 backgroundcolor3" style="font-size: 11px; height: 80px; margin-bottom: -3px; color: #FFFFFF;">
								<c:forEach var="favorties" items="${favorite}">
									<c:if test="${favorties.FAVORTIE_TITLE eq (boards.content[i].BOARDTITLE+=''+=boards.content[i].ID+=''+=principal.user.username)}">
										<br/><small style="color:red;">즐겨찾기 완료</small>
									</c:if>
								</c:forEach>
									${boards.content[i].BOARDCONTENT}
							</dd>

							<span class="p-1 d-flex justify-content-between backgroundcolor3" style="text-align:center !important; color:#FFFFFF; border-radius: 0px 0px 4px 4px; font-size:12px;">


						    	<a style="margin-left: 5px; font-size: 14px;">조회수 : ${boards.content[i].BOARDCOUNT} </a>

								<c:if test="${'ADMIN' eq principal.user.USER_ROLE && param.ROLE eq principal.user.USER_ROLE}">
									<div class="align-middle">
											<div class="row d-flex justify-content-center">
												<button onClick="index.Delete(${boards.content[i].ID}, ${1})"
														class="align-middle"
														style="color:white; border:none; width:50px; font-size:15px; hegiht: 50px;">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
														 fill="currentColor" class="bi bi-trash-fill"
														 viewBox="0 0 16 16">
														<path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
													</svg>
												</button>
												<a href="/board/${boards.content[i].ID}/updateForm"
												   style="color:white; hegiht: 50px; margin-top: 1px;" class="align-middle">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
														 fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 16 16">
														<path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001z"/>
													</svg>
												</a>
											</div>
									</div>
								</c:if>

						    	<button onClick="index.favorites(${boards.content[i].ID+1}, ${boards.content[i].ID}, '${principal.user.username}', '${boards.content[i].BOARDTITLE}')"  class="btn" style="height: 22px; margin-bottom: 10px; margin-top: -10px; color:white; margin-right: -10px;">
									<span style="font-size:13px">즐겨찾기</span>
								   <svg style="color:white;" xmlns="http://www.w3.org/2000/svg" width="20" height="20"
										fill="currentColor" class="bi bi-plus-square-fill" viewBox="0 0 16 16">
								     <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm6.5 4.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3a.5.5 0 0 1 1 0z"/>
								   </svg>
							    </button>


						</span>


						</div>
						</c:if>

					</c:forEach>
				</div>
			</div>
		</c:if>



</c:if>



<%--..레시피게시판--%>
<c:if test="${'searchr' eq param.field}">
	<%--style = 1 이나 null 은 기본형--%>
		<c:if test="${param.style == 1 || param.style eq null || param.style eq ''}">
			<div class="d-flex justify-content-center">
				<div class="table-users mt-3" style="width:1200px; z-index: 1; background: #FFFFFF; padding: 45px; text-align: center; box-shadow: 0 0 11px rgba(33,33,33,.2); ">
					<div class="divTable">
						<div class="divTableBody">
							<div class="divTableRow backgroundcolor3">
								<div class="divTableHead">ID</div>
								<div class="divTableHead">Score</div>
								<div class="divTableHead">Title</div>
								<div class="divTableHead">Content</div>
								<div class="divTableHead">Count</div>
								<div class="divTableHead">Type</div>
								<div class="divTableHead">Favorite</div>

			                    <c:if test="${'ADMIN' eq principal.user.USER_ROLE && param.ROLE eq principal.user.USER_ROLE}">
								<div class="divTableHead backgroundcolor3">admin</div>
			                    </c:if>

							</div>

							<c:forEach var="i" begin="0" end="11">
								<c:if test="${rboards3.content[i].RBOARDTITLE ne null}">

								<c:set var="totalstar1" value="0" />
								<c:set var="totalstar2" value="0" />
								<c:forEach var="reply1" items="${reply}" varStatus="status">
									<c:if test="${null ne reply1.REPLY_NUM1 && reply1.REPLY_TYPE2 == rboards3.content[i].ID}">
										<c:set var="totalstar1" value="${totalstar1 + 1}" />
										<c:set var="totalstar2" value="${totalstar2 + reply1.REPLY_NUM1/2}" />
									</c:if>
								</c:forEach>



								<div class="divTableRow">
									<div class="divTableCell align-middle">${rboards3.content[i].ID}</div>
									<div class="divTableCell align-middle"><c:if test="${0 != totalstar2}"><fmt:formatNumber value="${(totalstar2/totalstar1)}" pattern=".00"/></c:if></div>
									<div class="divTableCell align-middle">
										<a style="color: black;" href="/Rboard/${rboards3.content[i].ID}">
												${rboards3.content[i].RBOARDTITLE}
													<c:forEach var="favorties" items="${favorite}">
														<c:if test="${favorties.FAVORTIE_TITLE eq (rboards3.content[i].RBOARDTITLE+=''+=rboards3.content[i].ID+=''+=principal.user.username)}">
															<br/><small style="color:red;">즐겨찾기 완료</small>
														</c:if>
													</c:forEach>
										</a>
									</div>
									<div class="divTableCell align-middle" style="width:800px; word-break: break-all;"> <a style="color: black;" href="/Rboard/${rboards3.content[i].ID}">${rboards3.content[i].RBOARDCONTENT} </a> </div>
									<div class="divTableCell align-middle">${rboards3.content[i].RBOARDCOUNT}</div>
									<div class="divTableCell align-middle">${rboards3.content[i].RBOARDFTYPE}</div>

									<div class="divTableCell align-middle" style="height:50px;">
										<button class="noblue"
												onClick="index.favorites(${rboards3.content[i].ID+1}, ${rboards3.content[i].ID}, '${principal.user.username}', '${rboards3.content[i].RBOARDTITLE}')"
												class="btn"
												style="height: 22px; margin-bottom: 10px; margin-top: -10px; color:white; margin-right: -10px;">
											<lord-icon
													src="https://cdn.lordicon.com/mdgrhyca.json"
													trigger="click"
													colors="primary:#1a1a1a,secondary:#ffffff"
													stroke="75"
													style="width:100%;height:200%;margin-left: -10px;">
											</lord-icon>
										</button>
									</div>




									<c:if test="${'ADMIN' eq principal.user.USER_ROLE && param.ROLE eq principal.user.USER_ROLE}">
										<div class="divTableCell align-middle">
											<div class="row d-flex justify-content-center">

												<button onClick="index.Delete(${rboards3.content[i].ID}, ${0})"
														class="align-middle"
														style="color:#777575; border:none; width:25px; font-size:15px; margin-top: -2px; margin-left: -5px; hegiht: 50px;">
													<svg xmlns="http://www.w3.org/2000/svg" width="17" height="17"
														 fill="currentColor" class="bi bi-trash-fill"
														 viewBox="0 0 16 16">
														<path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
													</svg>
												</button>
												<a href="/rboard/${rboards3.content[i].ID}/RupdateForm"
												   style="color:#777575; hegiht: 50px;" class="align-middle">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
														 fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 16 16">
														<path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001z"/>
													</svg>
												</a>
											</div>
										</div>
									</c:if>

								</div>

								</c:if>
							</c:forEach>

						</div>
					</div>
				</div>
			</div>
		</c:if>

		<%--    style = 2 는 갤러리형--%>
		<c:if test="${param.style == 2}">
			<div class="d-flex justify-content-center">


				<div class="row d-flex justify-content-center pt-5 mt-2" style="max-width:1200px; position: relative; z-index: 1;background: whitesmoke; padding: 45px; text-align: center; box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);">

						<%--				<c:forEach var="board" items="${api.content}">--%>
					<c:forEach var="i" begin="0" end="11">
						<c:set var="totalstar1" value="0" />
						<c:set var="totalstar2" value="0" />
						<c:forEach var="reply1" items="${reply}" varStatus="status">
							<c:if test="${null ne reply1.REPLY_NUM1 && reply1.REPLY_TYPE2 == rboards3.content[i].ID}">
								<c:set var="totalstar1" value="${totalstar1 + 1}" />
								<c:set var="totalstar2" value="${totalstar2 + reply1.REPLY_NUM1/2}" />
							</c:if>
						</c:forEach>


						<c:if test="${null ne rboards3.content[i].RBOARDTITLE}">
						<div class="card ml-3 mr-3 mt-4 mb-4" style="width:300px; height: 410px; border:none;">
							<span class="p-1 backgroundcolor3" style="text-align:center !important; color:#FFFFFF; border-radius: 4px 4px 0px 0px; font-size:14px;">${rboards3.content[i].RBOARDTITLE}<c:if test="${0 != totalstar2}"><fmt:formatNumber value="${(totalstar2/totalstar1)}" pattern=".00"/></c:if></span>
							<div class="gallery">
								<ul>
									<li>
										<a href="/Rboard/${rboards3.content[i].ID}">
											${rboards3.content[i].RBOARDIMG01}

											<figure style="">

												<figcaption style="padding-top: 30px; word-break:break-all !important; font-size: 14px;">
													자세히 보기
												</figcaption>
											</figure>
										</a>
									</li>
								</ul>
							</div>

							<dd class="p-1 scroll1 backgroundcolor3" style="font-size: 11px; height: 80px; margin-bottom: -3px; color: #FFFFFF;">

								<c:forEach var="favorties" items="${favorite}">
									<c:if test="${favorties.FAVORTIE_TITLE eq (rboards3.content[i].RBOARDTITLE+=''+=rboards3.content[i].ID+=''+=principal.user.username)}">
										<br/><small style="color:red;">즐겨찾기 완료</small>
									</c:if>
								</c:forEach>
									${rboards3.content[i].RBOARDCONTENT}
							</dd>

							<span class="p-1 d-flex justify-content-between backgroundcolor3" style="text-align:center !important; color:#FFFFFF; border-radius: 0px 0px 4px 4px; font-size:12px;">


						    	<a style="margin-left: 5px; font-size: 14px;">조회수 : ${rboards3.content[i].RBOARDCOUNT} 분류: ${rboards3.content[i].RBOARDFTYPE}</a>

								<c:if test="${'ADMIN' eq principal.user.USER_ROLE && param.ROLE eq principal.user.USER_ROLE}">
									<div class="align-middle">
											<div class="row d-flex justify-content-center">
												<button onClick="index.Delete(${rboards3.content[i].ID}, ${0})"
														class="align-middle"
														style="color:white; border:none; width:50px; font-size:15px; hegiht: 50px;">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
														 fill="currentColor" class="bi bi-trash-fill"
														 viewBox="0 0 16 16">
														<path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
													</svg>
												</button>
												<a href="/rboard/${rboards3.content[i].ID}/RupdateForm"
												   style="color:white; hegiht: 50px; margin-top: 1px;" class="align-middle">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
														 fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 16 16">
														<path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001z"/>
													</svg>
												</a>
											</div>
									</div>
								</c:if>

						    	<button onClick="index.favorites(${rboards3.content[i].ID+1}, ${rboards3.content[i].ID}, '${principal.user.username}', '${rboards3.content[i].RBOARDTITLE}')"  class="btn" style="height: 22px; margin-bottom: 10px; margin-top: -10px; color:white; margin-right: -10px;">
									<span style="font-size:13px">즐겨찾기</span>
								   <svg style="color:white;" xmlns="http://www.w3.org/2000/svg" width="20" height="20"
										fill="currentColor" class="bi bi-plus-square-fill" viewBox="0 0 16 16">
								     <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm6.5 4.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3a.5.5 0 0 1 1 0z"/>
								   </svg>
							    </button>


						</span>


						</div>
						</c:if>


					</c:forEach>
				</div>
			</div>
		</c:if>


</c:if>








<c:if test="${null ne param.NOTICE}">
	<div class="d-flex justify-content-center">
		<div class="table-users mt-3" style="min-width:1200px; z-index: 1; background: #FFFFFF; padding: 45px; text-align: center; box-shadow: 0 0 11px rgba(33,33,33,.2); ">
			<div class="divTable">
				<div class="divTableBody">
					<div class="divTableRow">
						<div class="divTableHead backgroundcolor3">ID</div>
						<div class="divTableHead backgroundcolor3">Score</div>
						<div class="divTableHead backgroundcolor3">Title</div>
						<div class="divTableHead backgroundcolor3" style="max-width:400px;">Content</div>
						<div class="divTableHead backgroundcolor3">Count</div>
						<div class="divTableHead backgroundcolor3">Favorite</div>
						<c:if test="${'ADMIN' eq principal.user.USER_ROLE && param.ROLE eq principal.user.USER_ROLE}">
							<div class="divTableHead backgroundcolor3">Admin</div>
						</c:if>
					</div>

					<c:forEach var="notice" items="${notice}">
						<c:set var="totalstar1" value="0" />
						<c:set var="totalstar2" value="0" />
						<c:forEach var="reply1" items="${reply}" varStatus="status">
							<c:if test="${null ne reply1.REPLY_NUM1 && reply1.REPLY_TYPE2 == notice.ID}">
								<c:set var="totalstar1" value="${totalstar1 + 1}" />
								<c:set var="totalstar2" value="${totalstar2 + reply1.REPLY_NUM1/2}" />
							</c:if>
						</c:forEach>
						<div class="divTableRow">
							<div class="divTableCell align-middle">${notice.ID}</div>
							<div class="divTableCell align-middle"><c:if test="${0 != totalstar2}"><fmt:formatNumber value="${(totalstar2/totalstar1)}" pattern=".00"/></c:if>
								<small style="color: red">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-megaphone-fill" viewBox="0 0 16 16">
										<path d="M13 2.5a1.5 1.5 0 0 1 3 0v11a1.5 1.5 0 0 1-3 0v-11zm-1 .724c-2.067.95-4.539 1.481-7 1.656v6.237a25.222 25.222 0 0 1 1.088.085c2.053.204 4.038.668 5.912 1.56V3.224zm-8 7.841V4.934c-.68.027-1.399.043-2.008.053A2.02 2.02 0 0 0 0 7v2c0 1.106.896 1.996 1.994 2.009a68.14 68.14 0 0 1 .496.008 64 64 0 0 1 1.51.048zm1.39 1.081c.285.021.569.047.85.078l.253 1.69a1 1 0 0 1-.983 1.187h-.548a1 1 0 0 1-.916-.599l-1.314-2.48a65.81 65.81 0 0 1 1.692.064c.327.017.65.037.966.06z"/>
									</svg>
								</small>
							</div>
							<div class="divTableCell align-middle"> <a style="color: black;" href="/board/${notice.ID}"> ${notice.BOARDTITLE}</a> </div>
							<div class="divTableCell align-middle" style="width:800px; word-break: break-all; vertical-align: middle;"> <a style="color: black;" href="/board/${notice.ID}">${notice.BOARDCONTENT} </a> </div>
							<div class="divTableCell align-middle">${notice.BOARDCOUNT}</div>

							<div class="divTableCell align-middle">
								<button class="noblue"
										onClick="index.favorites(${notice.ID+1}, ${notice.ID}, '${principal.user.username}', '${notice.BOARDTITLE}')"
										class="btn"
										style="height: 18px; margin-bottom: 10px; margin-top: -10px; color:white; margin-right: -11px;">
									<lord-icon
											src="https://cdn.lordicon.com/mdgrhyca.json"
											trigger="click"
											colors="primary:#777575,secondary:#ffffff"
											stroke="75"
											style="width:100%;height:200%;margin-left: -10px;">
									</lord-icon>
								</button>
							</div>

							<c:if test="${'ADMIN' eq principal.user.USER_ROLE && param.ROLE eq principal.user.USER_ROLE}">
								<div class="divTableCell align-middle">
									<div class="row d-flex justify-content-center">
										<button onClick="index.Delete(${notice.ID}, ${param.board})"
												class="align-middle"
												style="color:#777575; border:none; width:25px; font-size:15px; margin-top: -2px; margin-left: -5px; hegiht: 50px;">
											<svg xmlns="http://www.w3.org/2000/svg" width="17" height="17"
												 fill="currentColor" class="bi bi-trash-fill"
												 viewBox="0 0 16 16">
												<path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
											</svg>
										</button>
										<a href="/board/${notice.ID}/updateForm"
										   style="color:#777575; hegiht: 50px;" class="align-middle">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
												 fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 16 16">
												<path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001z"/>
											</svg>
										</a>
									</div>
								</div>
							</c:if>
						</div>
					</c:forEach>


				</div>
			</div>
		</div>
	</div>
</c:if>







<c:if test="${null ne param.page}">
	<div class="container d-flex justify-content-center">
       -${param.page+1}-
	</div>
</c:if>
<c:if test="${'searchr' eq param.field && '' ne rboards3.totalPages}">

	<c:if test="${rboards3.totalPages<=rboards3.number}">
	<span class="d-flex justify-content-center mt-1"> <a style="color: red; font-size: 14px;" href="?page=${rboards3.totalPages-1}&field=${param.field}&word=${param.word}&board=${param.board}&style=${param.style}&title=${param.title}&count=${param.count}&CF=${param.CF}&ROLE=${param.ROLE}">없는 페이지 입니다(누르면 마지막 페이지로 돌아갑니다)</a>
	</span>
	</c:if>

	<ul class="pagination justify-content-center mt-5">

		<c:choose>
			<c:when test="${rboards3.first}">
				<li class="page-item disabled"><a style="color: #363435; border: 1px #FFFFFF;" class="page-link" href="?page=${rboards3.number-1}&field=${param.field}&word=${param.word}&board=${param.board}&style=${param.style}&title=${param.title}&count=${param.count}&CF=${param.CF}&ROLE=${param.ROLE}">Previous</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a style="color: #363435; border: 1px #FFFFFF;" class="page-link" href="?page=${rboards3.number-1}&field=${param.field}&word=${param.word}&board=${param.board}&style=${param.style}&title=${param.title}&count=${param.count}&CF=${param.CF}&ROLE=${param.ROLE}">Previous</a></li>
			</c:otherwise>
		</c:choose>

		<c:set var="pageend" value="${rboards3.totalPages}"/>
		<c:if test="${rboards3.totalPages>10}">
			<c:set var="pageend" value="10"/>
		</c:if>

	    <c:if test="${rboards3.number<9}">
			<c:forEach var="i" begin="0" end="${pageend-1}">

				<c:if test="${null ne param.stype }">
					<li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}&field=${param.field}&word=${param.word}&board=${param.board}&style=${param.style}&title=${param.title}&count=${param.count}&CF=${param.CF}&ROLE=${param.ROLE}"> ${i+1}</a></li>
				</c:if>
				<c:if test="${null eq param.stype }">
					<li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}&field=${param.field}&word=${param.word}&board=${param.board}&style=${param.style}&title=${param.title}&count=${param.count}&CF=${param.CF}&ROLE=${param.ROLE}"> ${i+1}</a></li>
				</c:if>

			</c:forEach>
     	</c:if>

		<c:if test="${rboards3.number>=9}">
			<c:if test="${(rboards3.totalPages-1)-param.page>5}">
				<c:forEach var="i" begin="${param.page-5}" end="${param.page+5}">
					<c:if test="${null ne param.stype }">
						<li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}&field=${param.field}&word=${param.word}&board=${param.board}&style=${param.style}&title=${param.title}&count=${param.count}&CF=${param.CF}&ROLE=${param.ROLE}"> ${i+1}</a></li>
					</c:if>
					<c:if test="${null eq param.stype }">
						<li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}&field=${param.field}&word=${param.word}&board=${param.board}&style=${param.style}&title=${param.title}&count=${param.count}&CF=${param.CF}&ROLE=${param.ROLE}"> ${i+1}</a></li>
					</c:if>
				</c:forEach>
			</c:if>
			<c:if test="${(rboards3.totalPages-1)-param.page<=5}">
				<c:forEach var="i" begin="${param.page-5}" end="${rboards3.totalPages-1}">
					<c:if test="${null ne param.stype }">
						<li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}&field=${param.field}&word=${param.word}&board=${param.board}&style=${param.style}&title=${param.title}&count=${param.count}&CF=${param.CF}&ROLE=${param.ROLE}"> ${i+1}</a></li>
					</c:if>
					<c:if test="${null eq param.stype }">
						<li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}&field=${param.field}&word=${param.word}&board=${param.board}&style=${param.style}&title=${param.title}&count=${param.count}&CF=${param.CF}&ROLE=${param.ROLE}"> ${i+1}</a></li>
					</c:if>
				</c:forEach>
			</c:if>
		</c:if>

		<c:choose>
			<c:when test="${rboards3.last}">
				<li class="page-item disabled"><a style="color: #363435; border: 1px #FFFFFF;" class="page-link" href="?page=${rboards3.number+1}&field=${param.field}&word=${param.word}&board=${param.board}&style=${param.style}&title=${param.title}&count=${param.count}&CF=${param.CF}&ROLE=${param.ROLE}">Next</a></li>
			</c:when>

			<c:otherwise>
				<li class="page-item"><a style="color: #363435; border: 1px #FFFFFF;" class="page-link" href="?page=${rboards3.number+1}&field=${param.field}&word=${param.word}&board=${param.board}&style=${param.style}&title=${param.title}&count=${param.count}&CF=${param.CF}&ROLE=${param.ROLE}">Next</a></li>
			</c:otherwise>
		</c:choose>

	</ul>
</c:if>



<c:if test="${'searchf' eq param.field && null eq param.NOTICE && '' ne boards3.totalPages}">

	<c:if test="${boards.totalPages<=boards.number}">
	<span class="d-flex justify-content-center mt-1"> <a style="color: red; font-size: 14px;" href="?page=${boards.totalPages-1}&field=${param.field}&word=${param.word}&board=${param.board}&style=${param.style}&title=${param.title}&count=${param.count}&CF=${param.CF}&ROLE=${param.ROLE}">없는 페이지 입니다(누르면 마지막 페이지로 돌아갑니다)</a>
	</span>
	</c:if>

	<ul class="pagination justify-content-center mt-5">

		<c:choose>
			<c:when test="${boards.first}">
				<li class="page-item disabled"><a style="color: #363435; border: 1px #FFFFFF;" class="page-link" href="?page=${boards.number-1}&field=${param.field}&word=${param.word}&board=${param.board}&style=${param.style}&title=${param.title}&count=${param.count}&CF=${param.CF}&ROLE=${param.ROLE}">Previous</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a style="color: #363435; border: 1px #FFFFFF;" class="page-link" href="?page=${boards.number-1}&field=${param.field}&word=${param.word}&board=${param.board}&style=${param.style}&title=${param.title}&count=${param.count}&CF=${param.CF}&ROLE=${param.ROLE}">Previous</a></li>
			</c:otherwise>
		</c:choose>

		<c:set var="pageend" value="${boards.totalPages}"/>
		<c:if test="${boards.totalPages>10}">
			<c:set var="pageend" value="10"/>
		</c:if>

		<c:if test="${boards.number<9}">
			<c:forEach var="i" begin="0" end="${pageend-1}">

				<c:if test="${null ne param.stype }">
					<li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}&field=${param.field}&word=${param.word}&board=${param.board}&style=${param.style}&title=${param.title}&count=${param.count}&CF=${param.CF}&ROLE=${param.ROLE}"> ${i+1}</a></li>
				</c:if>
				<c:if test="${null eq param.stype }">
					<li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}&field=${param.field}&word=${param.word}&board=${param.board}&style=${param.style}&title=${param.title}&count=${param.count}&CF=${param.CF}&ROLE=${param.ROLE}"> ${i+1}</a></li>
				</c:if>

			</c:forEach>
		</c:if>
		<c:if test="${boards.number>=9}">
			<c:if test="${(boards.totalPages-1)-param.page>5}">
				<c:forEach var="i" begin="${param.page-5}" end="${param.page+5}">
					<c:if test="${null ne param.stype }">
						<li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}&field=${param.field}&word=${param.word}&board=${param.board}&style=${param.style}&title=${param.title}&count=${param.count}&CF=${param.CF}&ROLE=${param.ROLE}"> ${i+1}</a></li>
					</c:if>
					<c:if test="${null eq param.stype }">
						<li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}&field=${param.field}&word=${param.word}&board=${param.board}&style=${param.style}&title=${param.title}&count=${param.count}&CF=${param.CF}&ROLE=${param.ROLE}"> ${i+1}</a></li>
					</c:if>
				</c:forEach>
			</c:if>
			<c:if test="${(boards.totalPages-1)-param.page<=5}">
				<c:forEach var="i" begin="${param.page-5}" end="${boards.totalPages-1}">
					<c:if test="${null ne param.stype }">
						<li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}&field=${param.field}&word=${param.word}&board=${param.board}&style=${param.style}&title=${param.title}&count=${param.count}&CF=${param.CF}&ROLE=${param.ROLE}"> ${i+1}</a></li>
					</c:if>
					<c:if test="${null eq param.stype }">
						<li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}&field=${param.field}&word=${param.word}&board=${param.board}&style=${param.style}&title=${param.title}&count=${param.count}&CF=${param.CF}&ROLE=${param.ROLE}"> ${i+1}</a></li>
					</c:if>
				</c:forEach>
			</c:if>
		</c:if>

		<c:choose>
			<c:when test="${boards.last}">
				<li class="page-item disabled"><a style="color: #363435; border: 1px #FFFFFF;" class="page-link" href="?page=${boards.number+1}&field=${param.field}&word=${param.word}&board=${param.board}&style=${param.style}&title=${param.title}&count=${param.count}&CF=${param.CF}&ROLE=${param.ROLE}">Next</a></li>
			</c:when>

			<c:otherwise>
				<li class="page-item"><a style="color: #363435; border: 1px #FFFFFF;" class="page-link" href="?page=${boards.number+1}&field=${param.field}&word=${param.word}&board=${param.board}&style=${param.style}&title=${param.title}&count=${param.count}&CF=${param.CF}&ROLE=${param.ROLE}">Next</a></li>
			</c:otherwise>
		</c:choose>

	</ul>
</c:if>










<%--------------------------------------%>













<div style="padding-bottom: 300px;"></div>
<script src="https://cdn.lordicon.com/xdjxvujz.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://use.fontawesome.com/releases/v5.9.0/js/all.js"></script>
<script src="/js/board.js"></script>
