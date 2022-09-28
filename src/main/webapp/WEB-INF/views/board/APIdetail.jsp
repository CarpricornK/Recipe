<%@page import="com.cos.blog.model.User"%>
<%@page import="com.cos.blog.config.auth.PrincipalDetail"%>
<%@page import="com.cos.blog.model.Board"%>
<%@page import="org.springframework.security.oauth2.core.user.OAuth2User"%>
<%@page import="org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header2.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>


<style>
	/*운동상자*/
	@import url(https://fonts.googleapis.com/css?family=Droid+Sans);
	@import url(http://weloveiconfonts.com/api/?family=fontawesome);
	/* fontawesome */
	[class*="fontawesome-"]:before {
		font-family: 'FontAwesome', sans-serif;
	}
	* {
		margin: 0;
		padding: 0;
		border: 0;
		font-size: 100%;
		font: inherit;
		vertical-align: baseline;
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		box-sizing: border-box;
	}
	/*------ utiltity classes -----*/
	.fl{ float:left; }
	.fr{ float: right; }
	/*its also known as clearfix*/
	.group:before,
	.group:after {
		content: "";
		display: table;
	}
	.group:after {
		clear: both;
	}
	.group {
		zoom: 1;  /*For IE 6/7 (trigger hasLayout) */
	}

	body {
		font-family: 'Droid Sans', sans-serif;
		line-height: 1;
	}
	.wrapper {
	}
	.pricing-table {
		width: 100%;
		text-align: center;
		padding: 10px;
		padding-right: 0;
	}
	.pricing-table .heading{
		color: #9C9E9F;
		text-transform: uppercase;
		font-size: 1.3rem;
		margin-bottom: 4rem;
	}
	.block{
		width: 30%;
		margin: 0 15px;
		overflow: hidden;
		-webkit-border-radius: 5px;
		-moz-border-radius: 5px;
		border-radius: 5px;
		/*    border: 1px solid red;*/
	}
	/*Shared properties*/
	.title{
		color: #FEFEFE;
		text-transform: capitalize;
		line-height: 2.5;
		position: relative;
	}
	.content{
		position: relative;
		color: #FEFEFE;
		padding: 20px 0 10px 0;
	}
	/*arrow creation*/
	.content:after, .content:before{
		top: 100%;
		left: 50%;
		border: solid transparent;
		content: " ";
		height: 0;
		width: 0;
		position: absolute;
		pointer-events: none;
	}

	.content:after{
		border-color: rgba(136, 183, 213, 0);
		border-width: 5px;
		margin-left: -5px;
	}
	/*/arrow creation*/
	.price{
		position: relative;
		display: inline-block;
		margin-bottom: 0.625rem;
	}
	.price span{
		font-size: 6rem;
		letter-spacing: 8px;
		font-weight: bold;
	}
	.price sup{
		font-size: 1.5rem;
		position: absolute;
		top: 12px;
		left: -12px;
	}
	.hint{
		font-style: italic;
		font-size: 0.9rem;
	}
	.features{
		list-style-type: none;
		background: #FFFFFF;
		text-align: left;
		color: #9C9C9C;
		padding:30px 22%;
		font-size: 0.9rem;
	}
	.features li{
		padding:15px 0;
		width: 100%;
	}
	.features li span{
		padding-right: 0.4rem;
	}

	/*PERSONAL*/
	.personal .title{
		background: #78CFBF;
	}
	.personal .content,.personal{
		background: #82DACA;
	}
	.personal .content:after{
		border-top-color: #82DACA;
	}
	.personal{
		border-top-color: #FFFFFF;
	}
	/*PROFESSIONAL*/
	.professional .title{
		background: #3EC6E0;
	}
	.professional .content,.professional{
		background: #53CFE9;
	}

	/*BUSINESS*/
	.business .title{
		background: #E3536C;
	}
	.business .content,.business{
		background: #EB6379;
	}
	.business .content:after{
		border-top-color: #EB6379;
	}
	/*운동상자*/
	img {
		width: 392px !important;
		height: 260px;
	}

	.bnon{
		color:cornflowerblue;
		border:none!important;
		outline: none!important;
		background-color: #FFFFFF;
		margin-right: 10px;
	}

	.tt {
		position: relative;
		display: inline-block;
		background-color: yellow;
	}

	.tt .tt-text {
		visibility: hidden;
		width: 500px;
		background-color: #252b37;
		color: #777575;
		text-align: center;
		border-radius: 6px;
		padding: 20px 20px 20px 20px;
		position: absolute;
		z-index: 1;
		top: 200%;
		right: 30%;
		margin-left: -105px;
	}

	.tt .tt-text::after {
		content: "";
		position: absolute;
		bottom: 100%;
		right: 1%;
		margin-left: -10px;
		border-width: 13px;
		border-style: solid;
		border-color: transparent #252b37 #252b37 transparent;
	}

	.tt:hover .tt-text {
		visibility: visible;
	}


	.api-tip {
		text-align: center;
		border-radius: 50%;
		width: 24px;
		height: 24px;
		font-size: 12px;
		line-height: 26px;
		cursor: default;
	}


	.api-tip:hover p {
		display: block;
		position: absolute;
		transform-origin: 100% 0%;
		-webkit-animation: fadeIn 0.3s ease-in-out;
		animation: fadeIn 0.3s ease-in-out;
	}

	.api-tip p {
		display: none;
		text-align: center;
		background-color: #1E2021;
		border: 1px solid #777575;
		padding: 20px;
		width: 350px;
		border-radius: 3px;
		box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);
		right: 50%;
		color: #FFFFFF;
		font-size: 13px;
		line-height: 1.4;
		padding: 20px;
	}

	.api-tip p:before {
		content: '';
		width: 0;
		height: 0;
		border: 6px solid transparent;
		border-bottom-color: #1E2021;
		right: 10px;
		top: -12px;
	}

	.api-tip p:after {
		width: 100%;
		height: 40px;
		content: '';
		top: -40px;
		left: 0;
	}

	.pixelated {
	}

	.slick-slider .slick-arrow {
		position: absolute;
		top: 40%;
		transform: translateY(-50%);
		z-index: 1;
		border: 0;
		height: 40px;
		width: 40px;
		background: #FFFFFF;
		font-size: 0;
		margin-left: -10px;
		margin-top: -15px; }
	.slick-slider .slick-arrow.slick-prev {
		left: 0; }
	.slick-slider .slick-arrow.slick-prev:after {
		position: absolute;
		content: '';
		border: solid #EF8719;
		border-width: 0 3px 3px 0;
		display: inline-block;
		padding: 3px;
		font-size: 20px;
		font-weight: bold;
		transform: rotate(135deg);
		-webkit-transform: rotate(135deg);
		position: absolute;
		left: 17px;
		top: 15px; }
	.slick-slider .slick-arrow.slick-next {
		right: 0;
		margin-right: -10px; }
	.slick-slider .slick-arrow.slick-next:after {
		position: absolute;
		content: '';
		border: solid #EF8719;
		border-width: 0 3px 3px 0;
		display: inline-block;
		padding: 3px;
		font-size: 20px;
		font-weight: bold;
		transform: rotate(-45deg);
		-webkit-transform: rotate(-45deg);
		position: absolute;
		left: 17px;
		top: 15px; }
	.slick-slider .slick-dots {
		position: absolute;
		bottom: 5px;
		margin-right: 27px;
		text-align: center; }
	.slick-slider .slick-dots li {
		display: inline-block;
	}
	.slick-slider .slick-dots ul {
		display: inline-block;
	}
	.slick-slider .slick-dots li.slick-active button {
		background: coral;
		width: 50px;
		border-radius: 10px; }
	.slick-slider .slick-dots li button {
		transition: all .5s;
		font-size: 0;
		height: 12px;
		width: 10px;
		border-radius: 50%;
		background: dimgray;
		border: 0;
		margin: 3px;
		cursor: pointer; }


	.slick-sample {
		width: 800px;
		height: 50%;
	}


	.slick-sample .slick-list {
		height: 100%;
	}

	.custom-review-badge-2 {
		background: #2B99F8;
		display: inline-block;
		padding: 2px 5px;
		color: white;
		border-radius: 2px;
		font-size: small;
	}

	.custom-review-badge {
		display: inline-block;
	}

	.custom-review-badge .star-ratings-css {
		unicode-bidi: bidi-override;
		color: #c5c5c5;
		font-size: 20px;
		height: 20px;
		width: 83px;
		margin: 0 auto;
		position: relative;
		padding: 0;
	}

	.custom-review-badge .star-ratings-css-top {
		color: red;
		padding: 0;
		position: absolute;
		z-index: 1;
		display: block;
		top: 0;
		left: 0;
		overflow: hidden;
	}

	.custom-review-badge .star-ratings-css-bottom {
		padding: 0;
		display: block;
		z-index: 0;
	}

	.custom-review-badge-1 {
		background: #ed556f;
		display: inline-block;
		padding: 2px 5px;
		color: white;
		border-radius: 2px;
		font-size: small;
	}

	.custom-review-badge-1 .review-star-symbol {
		vertical-align: middle;
	}

	.custom-review-badge-1 .review-label {
		vertical-align: middle;
	}
	/* =============== 별찍기 ===============	 */
	.starpoint_wrap {
		display: inline-block;
	}

	.starpoint_box {
		position: relative;
		background: url(https://i.ibb.co/dPGRQzn/new-star.png) 0 0 no-repeat;
		font-size: 0;
	}

	.starpoint_box .starpoint_bg {
		display: block;
		position: absolute;
		top: 0;
		left: 0;
		height: 18px;
		background: url(https://i.ibb.co/dPGRQzn/new-star.png) 0 -20px no-repeat;
		pointer-events: none;
	}

	.starpoint_box .label_star {
		display: inline-block;
		width: 10px;
		height: 16px;
		box-sizing: border-box;
	}

	.starpoint_box .star_radio {
		opacity: 0;
		width: 0;
		height: 0;
		position: absolute;
	}

	.starpoint_box .star_radio:nth-of-type(1):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(1):checked ~ .starpoint_bg {
		width: 10%;
	}

	.starpoint_box .star_radio:nth-of-type(2):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(2):checked ~ .starpoint_bg {
		width: 20%;
	}

	.starpoint_box .star_radio:nth-of-type(3):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(3):checked ~ .starpoint_bg {
		width: 30%;
	}

	.starpoint_box .star_radio:nth-of-type(4):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(4):checked ~ .starpoint_bg {
		width: 40%;
	}

	.starpoint_box .star_radio:nth-of-type(5):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(5):checked ~ .starpoint_bg {
		width: 50%;
	}

	.starpoint_box .star_radio:nth-of-type(6):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(6):checked ~ .starpoint_bg {
		width: 60%;
	}

	.starpoint_box .star_radio:nth-of-type(7):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(7):checked ~ .starpoint_bg {
		width: 70%;
	}

	.starpoint_box .star_radio:nth-of-type(8):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(8):checked ~ .starpoint_bg {
		width: 80%;
	}

	.starpoint_box .star_radio:nth-of-type(9):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(9):checked ~ .starpoint_bg {
		width: 90%;
	}

	.starpoint_box .star_radio:nth-of-type(10):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(10):checked ~ .starpoint_bg {
		width: 100%;
	}

	.blind {
		position: absolute;
		clip: rect(0, 0, 0, 0);
		margin: -1px;
		width: 1px;
		height: 1px;
		overflow: hidden;
	}

	.container {
	}
	.container::-webkit-scrollbar {
		width: 10px;
	}
	.container::-webkit-scrollbar-thumb {
		background-color: #2f3542;
	}
	.container::-webkit-scrollbar-track {
		background-color: grey;
	}

	.collapsed{
		color:black;
	}
	.collapsed:hover{
		color:#302F2F;
	}

	.bnon{
		color:#1a1a1a;
		border:none!important;
		outline: none!important;
		background-color: #FFFFFF;
		margin-right: 10px;
	}
	.bnon:hover{
		color:#6cc0e5;
	}

	/* =============== 별찍기 =============== */
</style>





<div class="container">


	<c:set var="totalstar1" value="0" />
	<c:set var="totalstar2" value="0" />
	<c:forEach var="reply1" items="${reply}" varStatus="status">
		<c:if test="${null ne reply1.REPLY_NUM1 && reply1.REPLY_TYPE2 == api3.id2}">
			<c:set var="totalstar1" value="${totalstar1 + 1}" />
			<c:set var="totalstar2" value="${totalstar2 + reply1.REPLY_NUM1/2}" />
		</c:if>
	</c:forEach>


	<br />



	<div class="row">
		<div style="margin-top:3px;">
			<h4>${api3.rcp_NM}</h4>
		</div>
		<div class="custom-review-badge ml-3">
			<div class="star-ratings-css">
				<div class="star-ratings-css-top"
					 style="width: <fmt:formatNumber value="${(totalstar2/totalstar1)*23}" pattern="0"/>%">
					<span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9733;</span>
				</div>
				<div class="star-ratings-css-bottom">
					<span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9733;</span>
				</div>
			</div>
		</div>

		<div class="custom-review-badge-1 ml-4 mt-1" style="height:30px; text-align-all:center;">
			<span class=review-label><fmt:formatNumber value="${(totalstar2/totalstar1)}" pattern=".00"/></span> <span class=review-star-symbol>&#9733;</span>
		</div>

	</div>

	<hr/>

	<div class="d-flex justify-content-between">
		<dd class="row">
			글 번호 : <span id="id"><i>&nbsp;${api3.id2} </i></span><br/> &nbsp; <span>조회수 : ${api3.api_COUNT}</span>
		</dd>


		<form>
			<input id="title" type="hidden" value="${api3.rcp_NM}${api3.id2}${principal.user.username}"/>
			<input id="name" type="hidden" class="form-control" value="${principal.user.username}">
			<input id="BID" type="hidden" class="form-control" value="${api3.id2}">

			<button id="btn-favorite" class="bnon">
					<svg xmlns="http://www.w3.org/2000/svg" width="38" height="38" fill="currentColor" class="bi bi-markdown-fill" viewBox="0 0 16 16">
						<path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm11.5 1a.5.5 0 0 0-.5.5v3.793L9.854 8.146a.5.5 0 1 0-.708.708l2 2a.5.5 0 0 0 .708 0l2-2a.5.5 0 0 0-.708-.708L12 9.293V5.5a.5.5 0 0 0-.5-.5zM3.56 7.01h.056l1.428 3.239h.774l1.42-3.24h.056V11h1.073V5.001h-1.2l-1.71 3.894h-.039l-1.71-3.894H2.5V11h1.06V7.01z"/>
					</svg>
			</button>
			<a class="bnon" href="/board/APIForm">
				<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-left-square-fill" viewBox="0 0 16 16">
					<path d="M16 14a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12zm-4.5-6.5H5.707l2.147-2.146a.5.5 0 1 0-.708-.708l-3 3a.5.5 0 0 0 0 .708l3 3a.5.5 0 0 0 .708-.708L5.707 8.5H11.5a.5.5 0 0 0 0-1z"/>
				</svg>
			</a>
		</form>
	</div>

	<hr/>


<%--	이미지 품질 비교     --%>
<%--	<img class="image pixelated" src="${api3.manual_IMG03}" alt="이미지 없음"/>--%>
<%--	<img class="image" src="${api3.manual_IMG03}" alt="이미지 없음"/>--%>


	<div class="d-flex justify-content-center">
		<div class="slick-sample d-flex justify-content-center mt-4" style="text-align: center;">

			<div class="col mb-5">
				<div class="card-title d-flex justify-content-center" style="margin-bottom: -130px;">
					<img class="pixelated" src="${api3.att_FILE_NO_MAIN}" style="width:320px; height:320px;"/>
				</div>
				<div style="margin-top: 150px;" class="card-body">
					${api3.rcp_NM}
				</div>
			</div>
			<div class="col mb-5">
				<div class="card-title d-flex justify-content-center" style="margin-bottom: -130px;">
					<img class="pixelated" src="${api3.manual_IMG01}" />
				</div>
				<div style="margin-top: 150px;" class="card-body">
					${api3.manual01}
				</div>
			</div>
			<div class="col mb-5">
				<div class="card-title d-flex justify-content-center" style="margin-bottom: -130px;">
					<img class="pixelated" src="${api3.manual_IMG02}" alt=""/>
				</div>
				<div style="margin-top: 150px;" class="card-body">
					${api3.manual02}
				</div>
			</div>
			<div class="col mb-5">
				<div class="card-title d-flex justify-content-center" style="margin-bottom: -130px;">
					<img class="pixelated" src="${api3.manual_IMG03}" alt=""/>
				</div>
				<div style="margin-top: 150px;" class="card-body">
					${api3.manual03}
				</div>
			</div>
			<div class="col mb-5">
				<div class="card-title d-flex justify-content-center" style="margin-bottom: -130px;">
					<img class="pixelated" src="${api3.manual_IMG04}" alt=""/>
				</div>
				<div style="margin-top: 150px;" class="card-body">
					${api3.manual04}
				</div>
			</div>
			<div class="col mb-5">
				<div class="card-title d-flex justify-content-center" style="margin-bottom: -130px;">
					<img class="pixelated" src="${api3.manual_IMG05}" alt=""/>
				</div>
				<div style="margin-top: 150px;" class="card-body">
					${api3.manual05}
				</div>
			</div>
			<div class="col mb-5">
				<div class="card-title d-flex justify-content-center" style="margin-bottom: -130px;">
					<img class="pixelated" src="${api3.manual_IMG06}" alt=""/>
				</div>
				<div style="margin-top: 150px;" class="card-body">
					${api3.manual06}
				</div>
			</div>
			<div class="col mb-5">
				<div class="card-title d-flex justify-content-center" style="margin-bottom: -130px;">
					<img class="pixelated" src="${api3.manual_IMG07}"/>
				</div>
				<div style="margin-top: 150px;" class="card-body">
					${api3.manual07}
				</div>
			</div>
			<div class="col mb-5">
				<div class="card-title d-flex justify-content-center" style="margin-bottom: -130px;">
					<img class="pixelated" src="${api3.manual_IMG08}"/>
				</div>
				<div style="margin-top: 150px;" class="card-body">
					${api3.manual08}
				</div>
			</div>
			<div class="col mb-5">
				<div class="card-title d-flex justify-content-center" style="margin-bottom: -130px;">
					<img class="pixelated" src="${api3.manual_IMG09}"/>
				</div>
				<div style="margin-top: 150px;" class="card-body">
					${api3.manual09}
				</div>
			</div>
			<div class="col mb-5">
				<div class="card-title d-flex justify-content-center" style="margin-bottom: -130px;">
					<img class="pixelated" src="${api3.manual_IMG10}"/>
				</div>
				<div style="margin-top: 150px;" class="card-body">
					${api3.manual10}
				</div>
			</div>
			<div class="col mb-5">
				<div class="card-title d-flex justify-content-center" style="margin-bottom: -130px;">
					<img class="pixelated" src="${api3.manual_IMG10}"/>
				</div>
				<div style="margin-top: 150px;" class="card-body">
					${api3.manual11}
				</div>
			</div>
			<div class="col mb-5">
				<div class="card-title d-flex justify-content-center" style="margin-bottom: -130px;">
					<img class="pixelated" src="${api3.manual_IMG10}"/>
				</div>
				<div style="margin-top: 150px;" class="card-body">
					${api3.manual12}
				</div>
			</div>



		</div>
	</div>
	<hr/>


	<div class="d-flex justify-content-between">
		<div>
			<canvas id="myChart" width="590" height="330"></canvas>
		</div>
		<div class="p-3" style="border-radius: 5px;">
			<div class="mt-3 mb-3"><p style="color:#1a1a1a; font-size: 20px; font-family: 'Gothic A1'">조리법 : ${api3.rcp_WAY2}</p></div>
			<a class="mr-1 mt-1" style="font-size: 24px; background: white; color:#1a1a1a; border-radius: 2px; padding:1px;">재료</a>
			<br/>
			<c:set var="text" value="${api3.rcp_PARTS_DTLS}"/>

			<c:set var="teltt" value="0"/>
			<c:forEach var="xx" begin="0" end="30">
				<c:set var="tel" value="${fn:split(text, ',')[xx]}"/>
				<c:forEach var="telNum" items="${tel}" varStatus="g">
					<c:set var="teltt" value="${teltt + g.count}"/>
				</c:forEach>
			</c:forEach>
            <%--teltt은 재료 묶음 개수--%>
            <%-- 말풍선과 split한 재료창 --%>
			<c:forEach var="x" begin="0" end="${teltt-1}">


				<c:set var = "testStr" value = "${fn:split(text, ',')[x]}"/>

				<a class="tt" style="font-family: 'Gothic A1', sans-serif; font-size: 11px; background: #252b37; color: white; border-radius: 5px; padding:5px; margin-bottom: 5px; margin-top: 5px;">
					<c:if test="${fn:split(text, ',')[x] ne null}">
						${fn:split(text, ',')[x]}&nbsp;
					</c:if>

				  <span class="tt-text">

	                	<div>
							<c:forEach var="i" begin="0" end="100">
								<c:if test="${fn:contains(fn:split(text, ',')[x], api5[i].item_name)}">
<%--									${x}+${i} id비교--%>
<%--									${fn:split(text, ',')[x]} == ${api5[i].item_name} : ${fn:contains(fn:split(text, ',')[x], api5[i].item_name)}--%>
									<canvas id="myChart${x-5}${i}" width="480" height="250"></canvas>
								</c:if>
								<c:if test="${fn:contains(fn:split(text, ',')[x], food[i].FOOD_NM)}">
									   ${food[i].FOOD_NM} <br/>
									   ${food[i].FOOD_CONTENT2} <br/>
								</c:if>
							</c:forEach>
	                	</div>
				  </span>

				</a>

			</c:forEach>

		</div>

	</div>
<hr/>
<%--운동상자--%>
	<div class="wrapper d-flex justify-content-center animate__animated animate__fadeIn">
		<!-- PRICING-TABLE CONTAINER -->
		<div class="pricing-table group">
			<h4 style="color: #1a1a1a">
				소모활동 (${api3.info_ENG}<span style="font-family: 'Berlin Sans FB Demi';">Kcal</span>)
			</h4>
			<br/>
			<!-- PERSONAL -->
			<div class="block personal fl">
				<h2 class="title">걷기</h2>
				<!-- CONTENT -->
				<div class="content">
					<p class="price">
						<sup style="font-size: 20px; width: 100%; text-align: center">50~90m/<small style="font-size: 13px">Minute</small></sup>
						<br/>
			     		<br/>
						<span style="font-size: 80px;"><fmt:formatNumber value="${api3.info_ENG/1}" maxFractionDigits="0" pattern=""/></span>
						<sub>/Minute.</sub>
					</p>
					<p class="hint">Walking</p>
				</div>
				<!-- /CONTENT -->
				<!-- FEATURES -->

				<!-- /FEATURES -->

			</div>
			<!-- /PERSONAL -->
			<!-- PROFESSIONAL -->
			<div class="block professional fl">
				<h2 class="title">조깅</h2>
				<!-- CONTENT -->
				<div class="content">
					<p class="price">
						<sup style="font-size: 20px; width: 100%; text-align: center">120~140m/<small style="font-size: 13px">Minute</small></sup>
						<br/>
						<br/>
						<span style="font-size: 80px;"><fmt:formatNumber value="${api3.info_ENG/1.8}" maxFractionDigits="0" pattern=""/></span>
						<sub>/Minute.</sub>
					</p>
					<p class="hint">Jogging</p>
				</div>
				<!-- /CONTENT -->


			</div>
			<!-- /PROFESSIONAL -->
			<!-- BUSINESS -->
			<div class="block business fl">
				<h2 class="title">달리기</h2>
				<!-- CONTENT -->
				<div class="content">
					<p class="price">
						<sup style="font-size: 20px; width: 100%; text-align: center">180~220m/<small style="font-size: 13px">Minute</small></sup>
						<br/>
						<br/>
						<span style="font-size: 80px;"><fmt:formatNumber value="${api3.info_ENG/7.3}" maxFractionDigits="0" pattern=""/></span>
						<sub>/Minute.</sub>
					</p>
					<p class="hint">Running</p>
				</div>
				<!-- /CONTENT -->



			</div>
			<!-- /BUSINESS -->
		</div>
		<!-- /PRICING-TABLE -->
	</div>

<hr/>
	<div class="container p-2" style="min-width:1000px; background-color:rgba(231, 233, 235, 1); border-radius:5px; word-break: break-all; min-height: 300px; max-height: 500px; overflow: auto">
		<div id="accordion">
			<div class="card">
				<div class="card-header">
					<a class="collapsed card-link" style=""data-toggle="collapse" href="#collapseOne">
						계량법 & 단위 안내
					</a>
				</div>
				<div id="collapseOne" class="collapse" data-parent="#accordion">
					<div class="card-body">
						<p>
							1큰술(1T, 1Ts) = 1숟가락	15ml = 3t
							(계량스푼이 없는 경우 밥숟가락으로 볼록하게 가득 담으면 1큰술)<br/>
							1작은술(1t, 1ts)	5ml (티스푼으로는 2스푼이 1작은술)<br/>
							1컵(1Cup, 1C)	200ml = 16T(한국,중국,일본)
							(미국 및 서양의 경우 1C가 240~250ml이므로 계량컵 구매 사용시 주의)<br/>
							1종이컵	180ml<br/>
							1oz	28.3g<br/>
							1파운드(lb)	약 0.453 킬로그램(kg)<br/>
							1갤런(gallon)	약 3.78 리터(ℓ)<br/>
							1꼬집	약 2g 정도이며 '약간'이라고 표현하기도 함
							조금	약간의 2~3배
							적당량	기호에 따라 마음대로 조절해서 넣으란 표현<br/>
							1줌	한손 가득 넘치게 쥐어진 정도
							(예시 : 멸치 1줌 = 국멸치인 경우 12~15마리, 나물 1줌은 50g)
							크게 1줌 = 2줌	1줌의 두배<br/>
							1주먹	여자 어른의 주먹크기, 고기로는 100g<br/>
							1토막	2~3cm두께 정도의 분량<br/>
							마늘 1톨	깐 마늘 한쪽<br/>
							생강 1쪽	마늘 1톨의 크기와 비슷<br/>
							생강 1톨	아기 손바닥만한 크기의 통생강 1개<br/>
							고기 1근	600g<br/>
							채소 1근	400g<br/>
							채소 1봉지 200g 정도<br/>
						</p>
					</div>
				</div>
			</div>

			<div class="card">
				<div class="card-header">
					<a class="collapsed card-link" style=""data-toggle="collapse" href="#collapseTwo">
						재료 정보
					</a>
				</div>
				<div id="collapseTwo" class="collapse" data-parent="#accordion">
					<div class="card-body">
						<p>
							귤껍질 :	깨끗이 씻어서 생으로 먹는 것이 좋다	감기, 고혈압, 암 </br>
							식초와계란  :	계란을 껍질째 식초에 넣어 1주일 동안 넣어 저장 후 2~3회 나누어 마신다	기미,주근깨,사마귀 </br>
							콩 즙 :	생 콩을 씹어서 먹거나 콩 즙을 내어서 마신다	당뇨병</br>
							미꾸라지 : 여러 가지 조리법에 따른다	정력</br>
							참기름 :	티스푼 하나정도 아침저녁으로 상복한다	정혈,정력,고혈압</br>
							다시마 :	손으로 잘게 찢어 물에 담가 뒀다가 상복한다	니코틴,해독,고혈압</br>
							감 : 감을 그대로 먹거나 감 잎으로 차를 만들어 마신다 숙취,설사,동맥경화예방</br>
							매실 : 말린 매실을 으깨어 뜨거운 물에 타서 마신다	기침,해소천식</br>
							시금치 :	살짝 데쳐서 그대로 씹어 먹거나 생즙을 환부에 바른다	대머리,음부습진,빈혈</br>
							무와꿀 :	잘게 썬 무를 물에 재어 3일 저장 후 더운 물에 타서 마신다	감기,해독,각종부인병</br>
							당근 : 당근을 갈아서 즙을 만들어 마신다	눈의 피로</br>
							호박 : 늙다리 호박을 잘게 썰어서 꿀에 절어 먹는다	빈혈,전립선 비대</br>
							옥수수 :	수염	옥수수 수염을 끓여 그 물을 마신다	신장병,당뇨병,심장병</br>
							잉어의 팥 : 싱싱한 잉어를 물에 불린 팥(콩)과 함께 넣어 고아서 먹는다	간장,신장,강정제</br>
							감자 : 감자 즙.감자국을 만들어 먹는다	부기,신장,위궤양</br>
							샐러리 :	생으로 씹어 먹거나 즙을 만들어 먹는다	혈압강화,정혈작용</br>
							감식 : 초	감을 잘게 썰어 식초에 담가 뒀다가 상복한다	장수,중풍예방</br>
							오징어 : 뼈	말린 뼈를 가루 내어 5일정도 나누어 먹는다	위궤양,토혈</br>
							우영 : 생으로 먹거나 ,삶거나 ,고아서 먹는다	천식,폐암예방</br>
							잡곡밥 :	보리.콩.조.수수등으로 밥을 지어 먹는다	당뇨,류마티스,만성병</br>
							계란술 :	계란 10개에 같은 량의 흑설탕,꿀을 섞어 소주 5홉을 넣고 10일 정도 재운 후 복용한다	강정제,신경안정</br>
							칡 : 말린 칡의 뿌리나 덩굴을 달여서 마신다	심장병,이뇨</br>
							치자열매 : 말린 치자 열매를 달여 물을 마신다	편도선염</br>
							연 : 씨는 끓여서 물을 마시고 꽃잎,줄기,뿌리 등은 날로 먹고 고은 물로 환부를 씻는다	부인병,치질,냉증</br>
							콩기름 :	참기름과 섞어서 아침에 한잔씩 마신다	고혈압,동맥경화예방</br>
							묵즙 : 묵을 갈아서 즙을 내어 마신다	뇌일혈,고혈압</br>
							자두 : 하루 10개 정도씩 상복한다	간염,숙취</br>
							거북이살 : 거북이살을 흑설탕과간장을 넣고 끓여서 살과 국물을 장복한다	신경통</br>
							토란줄기 : 말린 토란줄기를 가루내어 소금으로 간을 맞춘 후 매일 복용	심장두근거림</br>
							매실밥 :	껍질을 벗긴 매실을 밥쌀에 섞어 밥을 짓는다	피로,식용부진</br>
							닭벼슬주 : 말린 닭 벼슬을 마늘과 함께 술에 담근 후 복용	강정제,아뇨증</br>
							질경이 :	나물로도 먹고 말려서 차를 만들어 마시면 좋다	변비,해열,기침</br>
							효모 : 건조시킨 효모를 매일 복용(시중에 나와 있다)	위장,신장기능강화</br>
							결명자차 : 볶은 결명자씨를 물에 진하게 달여 물 대신 마신다	만성 장질환</br>
							알로에 :	껍질을 벗기고 날로 먹거나 환부에 바른다	암,피부병,화상</br>
							서양자두 : 생으로 먹거나 말린 것으로 밥을 지어 먹는다	변비</br>
							식초 : 천연식초를 만들어 아침,저녁으로 20cc씩 먹는다	체질개선,비만예방</br>
							소맥 : 배아유	소맥의 배꼽에서 나오는 기름으로 시장에서 쉽게 구할 수 있다	노인성질환예방</br>
							유산균 :	유산균을 직접 구해서 우유에 넣고 하루쯤 재운 후 채로 쳐서 마시고 유산균은 다시 새 우유에 넣어 둔다	비만,장기능강화,장수</br>
							골수 : 육류,생선류의 골수로 수프를 만들어 먹는다	성인병,노화방지</br>
							미역 : 날로 먹거나 말린 미역가루로 국수,떡,빵 등을 만들어 먹는다	정혈,강한골격,지구력</br>
							파국 : 뜨거운 멸치물(고기물)에 파 하나를 썰어 넣고 마신다	숙취,두통</br>
							모자반 :	국을 끓어 먹거나 된장찌개에 넣어서 먹는다	고혈압 임</br>
						</p>
					</div>
				</div>
			</div>

			<div class="card">
				<div class="card-header">
					<a class="collapsed card-link" style=""data-toggle="collapse" href="#collapseThree">
						음식보감정보
					</a>
				</div>
				<div id="collapseThree" class="collapse" data-parent="#accordion">
					<div class="card-body">
						<p style="font-size:14px;">
							음식보감번호 l 음식보감이름 l 영양성분 l 약성 l 독성 l 민간요법 l 참고문헌 l 내용
							<br/><br/>1 l 현미 : 현미에는 백미의 3∼4배에 달하는 섬유질이 포함되어 있고 양질의 식물성 단백질을 비롯해 지방과 칼슘 l  인 l  나트륨 l  철 등의 무기질 l  비타민 A · B1· B2 · B6 · E · 니코틴산 · 판토텐산 · 엽산 등이 함유되어 있다. 또한 셀레늄 l  페놀 l  스테롤 등의 항산화 성분도 많이 포함되어 있다. 비타민과 지방은 쌀의 배아에 많으며 특히 비타민 E는 배아에만 함유되어 있고 쌀겨부분에는 감마오리자놀이 들어 있다. 쌀겨와 배아에 많은 B1은 아주 중요하다. 이것은 당질대사에 빠트릴 수 없는 물질로서 현대인처럼 백미와 빵 등 당질이 많은 식사를 하는 경우 반드시 필요한 영양소이다 l 가. 대장암을 예방한다. 나. 각종 성인병 예방과 면역력 강화에 효과가 있다.  다. 피부미용 개선작용을 한다. 라. 해독작용을 한다. l  l 선천적인 알레르기성 체질로 어려서부터 허약한 아이에게는 현미를 볶아서 5배의 물을 붓고 끓여 채에 거른 현미스프를 3∼4일 먹이면 좋아진다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :현미는 벼의 껍질인 왕겨를 벗겨낸 쌀알로 l  과피 l  종피 l  호분층 l  배유 l  배아로 이루어져 있어 배유부분만 남아있는 백미에 비해 현미는 여러 가지 영양소와 기능성 성분이 풍부하다
							<br/><br/>2 l 메밀 : 메밀은 탄수화물이 73% l  단백질이 10% 이상 들어있는 식품인데 특히 곡류에 부족 되기 쉬운 라이신 l  트립토판 등 필수아미노산을 많이 함유하고 있으며 그 외 비타민 B1 l  B2 l  D l  P 및 인이 많아 쌀이나 보리 l  밀 등의 영양적 결함을 보충하는 데 좋은 곡물이다. 메밀은 18종의 지방산으로 구성되어 있으며 지방 함량은 약 2%이다. 그 중 팔미트산 l  올레인산 l  리놀산 l  리놀렌산 등이 대부분이며 리놀레산을 소량 함유하고 있다. 또한 루틴의 함유량도 많은데 이 루틴은 메밀국수를 삶을 때 삶은 물에 상당량이 녹아 나오기 때문에 메밀국수의 국수물을 마시는 것은 건강에 좋다. 그러나 메밀에는 효소(전분분해효소 l  지방분해효소 l  산화효소)가 많아 소화가 잘 되는 반면 l  저장하기 어려운 단점도 있다. 이러한 단점으로 인해 제분하여 냉면 l  묵의 재료로 주로 이용한다 :가. 혈관을 강하게 한다. 나. 소화가 잘 되게 한다.  다. 변비 l  치질 l  대장암 예방에 도움을 준다.  라. 동맥경화 l  고혈압에 효과가 있다 l  l 가. 메밀껍질을 넣은 베개를 베고 자면 중풍이 예방된다.  나. 메밀가루를 날 것으로 계속 먹으면 체내의 기생충을 몰아내는 효과가 있다.  다. 설사가 있을 때 냉을 치료하기 위해 메밀국수를 먹는다.  라. 메밀잎을 나물로 하여 먹으면 귀나 눈을 이롭게 한다.  마. 메밀가루에 끓는 물을 천천히 부어 잘 갠 다음 꿀을 넣어 마시면 고혈압환자에게 좋다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :메밀은 마디풀과에 속하는 한해살이풀로 원산지는 야생종이 발견된 지역인 아무르강 l  중국북동부 l  바이칼 호에 걸친 동부 아시아의 북부 및 중앙아시아 일대로 추정되고 있다. 우리나라에는 기원전 8세기경 중국으로부터 들어왔으며 현재는 각지에서 많이 재배한다. 메밀은 추운 곳이나 척박한 땅에서도 싹이 잘 트고 생육기간이 짧기 때문에 옛날부터 구황작물로 이용해 왔으며 l  우리나라에서는 강원도산 메밀과 평안도 l  함경도의 냉면이 맛과 질이 제일 우수하다는 정평이 나 있다
							<br/><br/>3 l 보리 :보리는 수분이 11~15% l  당질이 약 75% l  단백질이 약 10% 정도 l  지방 1.8~2% 정도이다. 주요 단백질은 호르다인(hordein)이며 글루텐이 없다. 또한 섬유소 l  회분 l  인 l  철분 l  비타민 B1 l  나이아신 등을 함유되어 있다. 곡립의 세포를 구성하는 수용성 식이섬유인 β-glucan이 다량 함유( 3∼7%) 되어있다. 이 물질은 간 및 혈장의 콜레스테롤을 저하시키는 효과가 있어 보리가 동맥경화 l  고혈압 l  당뇨병 등의 성인병 예방에 좋은 식품으로 인식되고 있다.  또한 보리의 비타민류는 배유의 내피에 들어 있어 정미하더라도 손실이 비교적 적으며 보리는 도정의 정도가 낮을수록 건강에 도움을 준다 :가. 혈중 콜레스테롤 수치를 낮춘다. 나. 설사 l  변비의 개선이나 대장암 등에 효과가 있다.  다. 소화기계의 이상에 치유효과가 있다 l  :가. 로마의 검투사들은 체력을 높이기 위해 보리를 먹었다.  나. 중동에서는 보리를 기본 식품으로 섭취하여 심장병에 의한 사망률이 낮았다.  다. 파키스탄에서는 보리를 ‘심장의 약’으로 기록하고 있다.  라. 종자를 발아시킨 것을 건조한 맥아는 소화불량 l  식욕감퇴 등에 쓰인다.  마. 중국에서는 보리가 심신을 길러 허한과 종독을 없앤다고 한다. 정신안정제 역할과 독을 제거하는 기능이 있다고 한다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :보리는 볏과에 속하는 두해살이풀로 쌀 다음 가는 주식곡물이다. 원산지는 서남아시아 l  이집트이며 보리는 인류가 재배한 가장 오래된 작물의 하나로 알려져 있다. 우리나라에는 고대 중국으로부터 전파된 것으로 보이며 현재는 온대지방에서 널리 재배되고 있다. 보리는 봄보리와 가을보리가 있는데 우리나라는 주로 가을보리를 재배한다. 보리의 성질은 온화하고 맛은 짭짤하며 독이 없다
							<br/><br/>4 l 옥수수 : 옥수수의 성분은 종류에 따라 다르지만 주로 수분이 10% l  단백질이 약 12% l  지방이 약 4% l  당질이 약 70%를 차지하고 있다. 이 당질의 주성분은 녹말로써 식용 외에도 널리 이용한다. 옥수수의 배아에는 지방이 30~40% 함유되어 있어 옥수수기름의 원료가 된다. 옥수수의 단백질은 라이신 l  트립토판 등 필수아미노산의 함량이 극히 적어 영양적 가치가 최저이다. 또한 비타민이나 무기질의 함량은 쌀 l  보리와 거의 유사하므로 우유 l  생선 l  야채 등의 혼식으로 아미노산 l  칼슘 l  비타민류 등을 보충해야 한다 :가. 암을 예방한다.나. 심장병 l  충치의 위험을 낮추어 준다. 다. 옥수수기름은 혈중 콜레스테롤치를 낮추어 준다.라. 신장병과 수종에 효과가 있다. 마. 피부의 건조와 노화예방 l  피부 습진 등에 효과가 있다 l  l 가. 하루 한 끼 정도 옥수수죽을 삶아 섭취하면 신장을 보하는 데 좋다. 옥수수수염은 예부터 이뇨제로 유명하며 부종에 달여 마시면 특효가 있고 신장병에 효과가 있다.  나. 옥수수에는 신경을 진정시키는 작용도 있어 패주와 함께 조리해서 먹으면 눈의 피로를 없애고 초조함을 진정시킬 수 있다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :옥수수는 볏과에 속하는 한해살이풀로 현재 밀 l  쌀과 함께 세계 3대 주요 농산물 중의 하나이다. 원산지는 미국으로 우리나라에는 포르투갈인에 의해 들어왔으며 l  지금은 세계 각지에서 재배되고 있다. 옥수수는 마치종 l  경립종 l  연립종 l  감미종 l  폭렬종 l  나종 l  유부종 l  연감종 등의 여러 품종이 있으며 높은 위도의 토지나 고지대에서 주로 여름에 재배된다. 미국의 북부지방에는 『콘벨트』라는 옥수수 지대가 널리 퍼져 있으며 우리나라에서는 강원도지방이 특산지이다
							<br/><br/>5 l 감자 :영양성분은 기후 l  재배조건 l  토질 l  품종에 따라 차이가 있으나 섭취량에 비해 열량이 적은 저열량식이다. 감자는 수분량이 약 75%로 대부분이며 녹말의 함량이 11~15%이다. 이밖에 탄수화물에는 설탕 l  포도당 l  과당을 소량 함유하고 있다. 감자는 살색이 노란 것일수록 단백질이 많은 경향이 있으며 단백질이 많은 감자는 녹말함량이 적고 무기질이 많기 때문에 그 맛이 진하다. 감자의 무기질 함량은 약 1%이며 특히 칼륨과 인이 많이 들어 있다. 무기질은 칼륨의 함량이 많아서 소금과 같이 섭취하는 것이 좋으며 알칼리성 식품으로 육류 l  곡류 등의 산성식품과 함께 먹으면 좋다. 비타민은 C가 가장 많고 B1도 많은 편이나 A는 거의 없다 :가. 대장암 l  대장게실의 예방에 효과가 있다.  나. 충치예방에 효과적이다.  다. 항암 l  항바이러스에 효과가 있다.  라. 빈혈의 예방과 치료에 효과가 있다 l  :가. 감자를 껍질째 된장국이나 수프로 만들어 매일 마시면 신장병에 탁월한 효과가 있다. 나. 위궤양에는 감자 생즙을 15ml씩 하루에 두세 번 마신다. 1주일 정도 마시면 효과가 있다. 감자 생즙을 꾸준히 마시면 위염 l  위경련 l  위통 l  위하수에도 효과가 있다. 다. 가벼운 화상이나 타박상 l  통풍으로 부은 데는 눈을 도려내고 껍질째 간 감자를 가제에 발라 환부에 붙인다. 감자에는 열을 내리게 하고 피부의 막을 보호하는 작용이 있어 l  습포제로도 훌륭한 효능을 발휘한다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :감자는 가지과의 여러해살이풀로 원산지는 페루 l  칠레 등의 안데스 산맥 주변 지역이다. 우리나라는 중국으로부터 전래되어 1698년부터 재배되기 시작하였다. 현재 감자는 세계적으로 가장 광범위하게 대량 생산되고 있으며 l  종류는 흰감자 l  자주감자 l  아리토스감자 l  긴흰감자 l  농림1호감자 l  호이가감자 등 여러 가지가 있다
							<br/><br/>6 l 고구마 :품종 l  기후 l  토양 l  수확시기 l  저장기간 등에 따라 영양성분의 차이가 있으나 주로 수분양은 65~75%로 감자류 중에서 적은 편이며 당질이 약 30%를 차지하고 있다. 그 중에서 녹말이 20% l  그밖에 설탕 l  포도당 l  과당의 함유량이 많아 단맛을 띠고 있다. 단백질은 감자보다 적은 1.4%이며 영양적인 면에서는 좋지 않다. 고구마는 알칼리성 식품으로 특히 칼륨 성분이 많아 소금기가 많은 김치를 곁들여 먹는 것이 좋다. 성분 중 비타민 A의 함량 차이가 심한데 누런 것일수록 그 함량이 많다. 또한 고구마는 B1과 C를 많이 함유하고 있는데 비타민 C는 조리과정을 거쳐도 70~80%가 남는 장점이 있다 l 가. 통변을 원활하게 한다.  나. 암 특히 폐암을 예방한다.다. 혈중 콜레스테롤 수치를 낮추어 준다.  l  l 가. 소화불량에 생고구마를 먹으면 효과가 있다. 나. 동상에 걸렸을 때 고구마의 앞뒤를 잘라서 삶아 환부를 찜질하면 효과가 있다. 다. 경증 고혈압에는 고구마를 삶아서 껍질 벗겨 식힌 뒤 우유와 함께 믹서로 갈아 볶은 소금으로 약간 간하여 먹으면 좋다.  라. 기미가 있을 때 적당히 자른 고구마 줄기를 넣고 달인 물을 기미가 생긴 곳에 1주일 정도 바르면 효과가 나타난다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 l 고구마는 메꽃과의 여러해살이풀로 원산지는 중남미이다. 지금은 세계 각지 온대지방에서 많이 재배되고 있다. 고구마는 재배상 가뭄이나 장마에 구애받지 않고 비옥한 땅이 아니더라도 잘 재배되는 식품이기 때문에 예로부터 우리나라에서는 구황작물의 일종으로 재배되어 왔다. 적색계통의 고구마가 식용으로서 기호성이 높은 종이다.
							<br/><br/>7 l 대두 :콩의 영양분은 주로 떡잎에 함유되어 있다. 영양소의 구성비는 단백질 20~45% l  지방 18~22% l  당질 22~29% l  무기질 4.5~5%이다. 콩의 아미노산 조성은 농작물 중에서 최고이며 구성 아미노산의 종류도 육류에 비해 뒤지지 않는다. 특히 곡류에 부족한 라이신 l  시스테인 l  트립토판 등이 많으며 알기닌 l  글루타민산 등의 아미노산을 풍부하게 함유하고 있어 스테미나식으로 이용한다. 콩의 지방은 필수지방산인 리놀산과 리놀렌산이 들어 있어 동맥경화와 고혈압에 효과가 있다. 무기질로는 칼륨이 가장 많고 그 다음으로 인 l  나트륨 l  칼슘 l  마그네슘이 들어 있다. 비타민은 아주 적으며 비타민 C는 거의 없다. 그러나 콩기름 중에는 비타민 E가 100mg 가량 들어 있어 미용 l  노화방지에 효과가 있다. 콩의 헤미셀룰로오즈 성분은 소화흡수를 저해하며 영양적으로 효과는 없으나 최근에는 식이성 섬유로 주목받고 있다. 또한 콩에는 사포닌과 트립신의 활성을 저해하는 물질이 있지만 이들 유해물질은 가열에 의해 대부분 파괴된다 :가. 혈액속의 인슐린 양 l  혈당치를 조정한다.  나. 기분을 온화하게 한다.  다. 폐암 등 암을 예방한다.  라. 혈중 콜레스테롤 수치를 낮추어 준다.  마. 결석을 예방하고 용해한다.  바. 정장 l  변비를 부드럽게 하며 변통을 조정해 준다.  사. 여성호르몬을 보충한다.  아. 종기를 없애고 해독하는 기능을 한다 l  :가. 콩 1되를 노랗게 볶아 계내금(닭 모래주머니의 내피) 300g을 노랗게 볶은 것과 함께 가루로 만들어 매일 식후에 온수로 한 숟가락씩 먹으면 소화불량에 좋다. 나. 밤에 머리를 잘 감고 콩기름을 솜에 묻혀 머리 피부에 3~5차례 문지르면 머리의 비듬이 치료된다. 다. 입이 마르고 혀가 탈 때 l  목구멍이 아플 때 l  정신 불안과 초조할 때 콩나물 1.8~2.4Kg l  진피 300g을 같이 삶은 물을 수시로 마시면 된다.  라. 대두를 물에 불려 가지고 으깨서 발라 주면 독창이나 타박상에 매우 효력이 있다. 또 대두 삶은 물로 자주 씻어도 좋다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :콩은 콩과에 속하는 한해살이 식물로 원산지는 아시아이며 우리나라를 비롯하여 중국 l  일본 등지에서는 상고시대부터 재배되어 왔다. 우리나라에서 콩은 쌀 l  보리와 함께 중요한 식량이며 특히 단백질의 중요한 공급원이기도 하다. 우리나라의 콩 주산지는 황해도 l  평안도이다. 품종은 수백 종이 있으나 모양은 평두와 환두의 2종으로 대별되며 색은 황 l  녹 l  흑 l  백 l  적 l  혼합색 등 다양하다. 또한 생육일수에 따라 조생의 여름대두 l  중간종 l  만생의 가을대두로 크게 나누어진다
							<br/><br/>8 l 땅콩 :땅콩은 품종에 따라 성분함량이 차이가 있으나 대체로 대두와 흡사하다. 단백질은 비교적 적고 l  지질함량은 45~50%로 많으며 당질은 두류 중에서 가장 적다. 즉 l  단백질의 구성 아미노산 조성은 라이신 l  트립토판 l  S-함유 아미노산 등이 적고 대두에 비해 낮은 편이다. 지방은 대부분 중성지방이고 불포화지방산 중 리놀산 같은 필수지방산이 많이 들어 있다. 당질은 대부분 전분이고 이외 갈락토오스도 들어 있다. 무기질에는 칼륨과 인산이 가장 많은데 칼슘이 인산에 비해 훨씬 적어 산성식품이다. 비타민도 B1 l  B2 l  E 등이 많이 들어 있으며 특히 B1과 나이아신이 많다 l  가. 암을 예방한다. 나. 땅콩기름은 혈중 콜레스테롤치를 낮춘다.  다. 혈당치를 조절한다.  l  :가. 볶은 소금 적당량을 헝겊으로 싸서 배꼽 바로 밑에 감아 하복부를 따뜻하게 한 후 l  볶은 땅콩을 껍질 채 씹어 먹으면 설사나 복통이 낫는다. 10개쯤 먹으면 충분하다. 나. 산후 체력이 약해진 사람이나 식욕이 없고 위장이 약한 사람에게 땅콩으로 두유를 만들어 매일 마시게 하면 체력을 회복하는 데 크게 도움이 된다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :땅콩은 콩과에 속하는 한해살이 식물로서 원산지는 브라질인데 현재 주산지는 인도 l  중국 l  미국 l  인도네시아 등지이다. 우리나라에는 정조 무술년(1778)에 중국에서 전해진 것으로 추정된다
							<br/><br/>9 l 청완두 :  청완두는 단백질과 당이 많으며 익은 것에는 전분 l  섬유 그 밖의 다당류가 많다. 구성 아미노산으로는 일반 곡류에 부족한 라이신과 트립토판이 함유되어 있다. 또한 무기질로는 칼륨과 인이 함유되어 있다. 비타민은 비타민 C가 20~40mg으로 비교적 많이 함유되어 있으며 비타민 A의 전구체인 베타카로틴도 340㎍ 들어 있다 l 가. 맹장염을 예방한다.  나. 청완두에 함유되어 있는 화합물이 성호르몬의 생성에 관여한다. 다. 감염이나 암의 예방을 도와준다. 라. 전립선암에 의한 사망률을 낮춰준다.  마. 혈중 콜레스테롤 수치를 낮춰준다.  l  l 가. 완두를 삶은 물로 목욕을 하면 피부병이 낫는다고 한다.  나. 어린아이와 노인의 습관성 설사에 완두를 삶아 죽을 쑤어 식전에 한 잔씩 복용하면 효과를 볼 수 있다. 다. 폐병과 토혈에는 완두와 잠두의 꽃을 같은 양으로 삶아 차 마시듯 수시로 마시면 좋다.  l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 l 청완두는 완두의 미숙한 입자를 일컫는다. 완두는 콩과에 속하는 한해살이 또는 두해살이풀로서 원산지는 중앙아시아에서 지중해 연안에 걸친 지역이다. 우리나라에서의 재배 역사는 그리 오래되지 않은 편이며 현재는 세계 각지에서 생산되는 주요한 두류의 하나이다.
							<br/><br/>10 l 들깨 :들깨는 일반적으로 수분 38% l  당질 16.7g l  섬유질 8.8g l  l  단백질 16.4g l  지방 51.0g l  무기질 3.3g l  칼슘 282mg l  인 618mg l  철분 7.0mg l  비타민 B1 0.14mg l  비타민 B2 0.32mg l  나이아신 49mg을 함유하고 있다. 주성분은 지질로 불포화지방산 중의 필수지방산인 리놀렌산을 60% 함유하고 있다. 잎은 채소로서 쌈 l  장아찌 l  튀김 등의 조리에 이용되고 있다. 특유의 향이 있으며 비타민이 골고루 함유된 우수한 식품이다. 특히 비타민 E와 F가 함유되어 있다. 들깨잎의 비타민 중 베타카로틴은 상추의 4배 이상 l  비타민 C는 상추의 약 3배 포함되어 있다 l 가. 콜레스테롤치를 낮게 하며 혈관의 노화를 방지하고 동맥경화를 예방한다. 나. 피부를 윤택하게 하고 머리카락에 영양을 준다.  다. 변비와 중풍을 치료하는 데 효과가 있다. l  :가. 벌레나 독충에 물렸을 때 즉시 들깨를 씹어 물린 부위에 발라주면 효과가 있다.  나. 머리가 빠지거나 흰 머리카락이 생기면 l  들기름 600g과 마른 뽕잎 300g을 같이 달인 후 찌꺼기는 버리고 즙을 아침 l  저녁으로 두피에 발라주면 효과가 있다.  다. 여자들의 하혈이나 대소변 하혈에 들깨 싹 한 줌을 찧어 즙을 내고 이것을 하루 3회씩 식전에 찻숟갈로 하나씩 복용하면 효과가 있다. 라. 산모의 젖이 모자랄 경우 들깨를 볶아 잘 으깨서 매일 3회씩 식후에 소금과 함께 뜨거운 물에 타서 장기간 복용하면 효과가 있다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :깨는 꿀풀과에 속하는 한해살이풀로 원산지는 인도 l  말레이시아 l  이집트 지방이다. 우리나라 l  중국 l  일본 l  이집트 등지에 분포하며 l  흰깨 l  검은깨 l  들깨의 세 종류로 분류된다. 옛날에는 구황식품으로 쓰였으며 세사민 등의 물질을 포함하고 있어 일반 식물유에 비해 광회전성이 있는 것이 특징이다
							<br/><br/>11 l 밤 :밤은 일반적으로 수분 59.8% l  당질 33.6g l  단백질 3.5g l  지방 0.8g l  무기질 1.2g l  칼슘 35mg l  인 93mg l  철분 2.1mg l  비타민 A 74I.U l  비타민 B1 0.45mg l  비타민 B2 0.23mg l  나이아신 0.7mg l  비타민 C 28mg을 함유하고 있다. 밤은 5대 영양소가 비교적 골고루 들어 있는 영양식품이다. 주성분은 당질이며 유리의 당조성은 설탕이 많고 포도당과 과당은 소량 함유하고 있다. 또한 0.3%의 펙틴이 들어 있다. 회분은 종실류 중에서 적은 편이고 비타민 C는 비교적 많다. 밤알의 황색 색소는 카로티노이드로서 과육 표층부에 많이 포함되어 있다. 그러나 프로비타민 A로서의 베타카로틴이 75%를 차지한다 :가. 암을 예방하고 노화를 방지한다.  나. 위장 기능을 강화하고 배탈 l  설사에 효과가 있다.  다. 피부가 고와지고 윤이난다.  라. 신장 l  종기 l  어혈에 좋다 l  :가. 배탈이 나거나 설사가 심할 때 군밤을 잘 씹어 먹으면 효과적이다.  나. 밤의 내피를 율부라 하여 가루로 만들어 꿀에 개어 바르면 주름이 펴지고 얼굴에 광택이 생긴다고 한다.  다. [명의별록]에 밤은 기를 늘리고 대장과 위장을 도우며 신기를 보한다고 기록되어 있다. 라. [당본초]에 근골이 상한 데 l  종기통 l  어혈 등에 생밤을 씹어 바르면 효과가 있다고 기록되어 있다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :밤은 참나뭇과에 속하는 밤나무의 열매로 주로 산과 들에 자생한다. 원산지는 중국과 유럽으로 추정되며 중국 l  일본 l  유럽 l  미국 등 여러 지역에서 재배되고 있다. 밤나무는 북반구에만 있고 세계적으로 13종의 품종이 있는데 우리나라에서 재배되는 재래종은 우리나라밤 중 벌레에 저항성이 있는 우량종과 일본의 개량종이다. 밤은 음력 9월에 따서 말려 쓰는 것이 보통인데 모래 속에 묻어 두면 한 해가 지나도 갓 딴 밤과 같다
							<br/><br/>12 l 호두 :호두는 일반적으로 수분 4.5% l  당질 14.5g l  섬유질 1.2g l  단백질 18.6g l  지방 59.4g l  무기질 1.8g l  칼슘 120mg l  인 199mg l  철분 3.0mg l  비타민 A 40I.U l  비타민 B1 0.55mg l  비타민 B2 0.11mg l  나이아신 0.8mg l  비타민 C 6mg을 함유하고 있다. 호두의 주성분은 지질인데 l  이 지질은 녹는점이 낮고 불포화지방산이 많은 양질의 건성유이고 그 조성은 리놀레산 l  올레산 l  아라키돈산 l  팔미트산 l  스테아르산이다. 주요단백질은 글루텔린이며 아미노산으로는 트립토판이 많이 함유되어 있다. 무기질 중 칼슘과 인이 많고 비타민 B1 l  베타카로틴 l  비타민 E도 비교적 많다 :가. 세포노화억제 효과가 있다. 나. 탈모를 막아준다.  다. 두뇌를 발달시킨다.  라. 동맥경화 l  고혈압 l  정장작용의 효과가 있다.  마. 자양강장제로 쓰인다 l  l 가. 중병을 앓고 난 회복기 환자가 호두를 먹으면 회복이 빠를 뿐만 아니라 모발이나 피부가 윤택해지는 효과가 있다.  나. 청호두의 껍질을 짓찧어 나온 물을 들기름에 섞거나 그대로 머리에 바르기도 하며 흑발 염색 재료로 쓴다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :호두는 호두나무과에 속하는 호두나무의 열매로 식용이 되는 것은 속의 인이다. 원산지는 중앙아시아이며 우리나라의 중부지방의 산과 들에서 자생 또는 재배되고 있다. 밤 l  잣 l  은행 l  땅콩과 더불어 상원날 아침 일찍 자기 나이 수대로 깨물어 먹는 부럼과실로 유명하다. 호두에는 핵이 단단하고 쪼개지기 어려우며 겉면에 주름이 적은 야생종인 호두 l  핵이 얇고 손으로 쪼갤 수 있는 서양 호두의 변종인 호두가 있다
							<br/><br/>13 l 벌꿀 :꿀의 빛깔 l  향기 l  맛성분은 벌이나 꽃의 종류에 따라 다르지만 일반적으로 수분 17 % l  비중 1.41이다. 꿀의 고형물의 대부분은 당질이며 l  당질의 대부분을 이루는 것은 과당과 포도당이다. 또한 꿀은 비타민 B군과 개미산 l  젖산 l  사과산 l  색소 l  방향물질 l  고무질 l  왁스 등 성분이 다양하고 여러 가지 효소도 가진 알칼리성 식품이다 : 가. 천식 l  설사를 완화시킨다. 나. 피부의 거칠음을 방지하여 미용에 효과가 있다.  다. 신경을 진정시켜 잠이 오도록 한다.  라. 세균을 소멸하고 상처나 궤양의 감염을 막으며 통각을 약하게 한다 l  l 가. 이질에는 진하게 탄 꿀을 한 사발 단번에 먹으면 효과가 있다. 또는 생강즙과 꿀을 같은 양으로 배합하여 물에 타서 마시면 효과가 있다.  나. 벌꿀 50g에 중간 크기의 무 1개를 썬 뒤 이것이 무르도록 오랫동안 고아서 세 번에 걸쳐 먹으면 위염에 효과가 있다. 다. 꿀에 사과식초를 약간 넣어 마시면 피로회복에 도움이 된다. 라. 숙취에 시달릴 때는 꿀에 칡뿌리 가루를 섞어 먹으면 좋다. 또는 꿀을 한 숟가락 먹거나 미지근한 물에 타서 마시면 숙취 제거가 되거나 입에서 나는 술 냄새가 없어진다.  마. 생수 한 컵에 사과식초 한 숟가락과 꿀 한 숟가락을 넣어 마시면 사과식초에 함유되어 있는 유기산과 벌꿀 속의 미네랄과 비타민이 만나 세포의 노폐물을 배설하므로 기미와 잡티의 멜라닌 색소를 엷게 해주어 피부미용 효과가 있다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :꿀은 꿀벌이 겨울철을 위해 꽃의 밀선에서 빨아내어 축적한 것으로 처음 꽃의 설탕성분이 벌의 소화효소에 의해 모양이 바뀐 감미료이다. 꿀의 원산지는 인도로 추정되며 우리나라에는 옛날부터 꿀벌을 기른 기록이 있지만 개량종을 기르기 시작한 것은 조선말 고종 때부터라 한다. 꿀의 품종은 채취한 꽃의 종류에 따라 싸리꿀 l  밤꿀 l  유채꿀 l  메밀꿀 등 다양하다
							<br/><br/>14 l 가지 :가지는 채소 중에서 영양가가 가장 낮은 식품이다. 탄수화물로는 당류가 가장 많고 그 밖에 소량의 전분 l  펙틴이 함유되어 있다. 단백질 1.1% l  지질 0.3% l  당질 3.8% l  섬유질 0.9% l  회분 0.4% 등 모두 소량의 영양성분이 함유되어 있다. 칼륨은 많으며 l  칼슘과 인은 적은 편이다. 각 비타민 함량도 적고 특히 비타민 C는 채소류 중에서는 가장 적은 편이다. 가지의 수분함량은 약 94%이지만 토마토나 오이와는 달리 과즙이 유리되기 어려운 특징이 있다. 그러나 가열하면 조직이 연화됨과 동시에 과즙이 유리되기 쉽다. 어린 열매에는 유기산 l  탄닌질이 있으나 성숙하면서 감소하고 반대로 수용성 당은 증가한다. 한편 l  가지의 쓴맛성분으로 솔라닌과 비슷한 결정성물질(솔라닌 M)이 있다 l 가. 동맥경화를 예방한다.  나. 신경통의 자극을 완화시키는 진정작용을 한다.  다. 프로테아제 저해물질(도리푸신)이 있어 함암효과가 있다.  l  l 가. 노인이나 고혈압 증세가 있는 사람은 가지 삶은 물을 자주 마시고 가지로 만든 음식을 자주 먹으면 좋다.  나. 편도선염에는 가지를 검게 구워서 뜨거운 물에 넣어 차로 마시면 효과가 있다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :가지는 가지과의 한해살이풀로 원산지는 인도이며 우리나라에는 중국을 거쳐 전파되어 왔다. 현재 가지는 열대&#8228;온대지방에 걸쳐 재배하며 열대에서는 여러해살이풀이다. 숙기에 따라서 초생 l  중생 l  만생으로 나뉘며 l  과실의 모양에 따라 원형 l  달걀형 l  대장형 l  중장형 l  장형 등으로 분류된다. 열매의 색도 흑자색 l  자갈색 l  청백색 l  자주색 l  흰색 l  노란색 l  녹색 줄무늬로 되어 있는 것 등 다양한데 우리나라에서는 주로 진한 흰자색 l  긴 장형인 가지가 재배되고 있다
							<br/><br/>15 l 고사리 :  고사리는 100g당 수분 90.3% l  당질 2.9g l  섬유질 3.3g l  단백질 2.1g l  지방 0.4g l  무기질 1.0g l  칼슘 11mg l  인 53mg l  철분 1.2mg l  비타민 A 185 I.U l  비타민 B2 0.3mg이 함유되어 있다. 또한 고사리에는 비타민 B1을 분해시키는 아뉴리나아제라는 효소가 들어 있어 비타민 B1의 결핍을 일으킨다. 이러한 효소로 인해 오랫동안 고사리만 먹게 되면 양기를 잃게 되며 눈이 쉽게 어두워지고 다리의 힘이 약해져 오랫동안 걷지 못한다고 알려져 있다.  " :가. 위와 장에 있는 열독을 풀어 주고 가벼운 이뇨 작용을 한다. 나. 이질 l  설사에 효과가 있다.  다. 혈액순환을 촉진하여 중풍과 동맥경화를 예방한다.  라. 자양 강장제의 효과가 있다 l  :가. 뿌리줄기를 말려 달여 마시면 설사 l  이뇨 l  관절통 등에 두루 효험을 보인다. 나. 어린 순을 나물로 하여 먹으면 머리가 좋아지고 뇌의 혈액순환을 도와서 중풍과 동맥경화에 좋다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :고사리는 고사릿과의 여러해살이풀로 산과 들의 양지바른 곳에서 자라며 l  북반구의 온대지방과 한대 지방에 2 l 800여 종이 널리 분포되어 있다. 봄에 잎이 아직 피지 않은 것을 삶아서 나물로 먹거나 국의 재료로 쓰고 뿌리에서 녹말을 채취하여 고사리 가루분을 만든다. 이 고사리 가루는 칡가루보다 더 찰기가 있어 떡이나 전을 부쳐 먹으며 풀 l  과자의 원료로 쓴다. 옛날에는 흉년 시에 비상식량으로 이용하기도 하였다
							<br/><br/>16 l 냉이 : 냉이는 100g당 수분 81.5% l  당질 5.6g l  섬유질 2.0g l  단백질 7.3g l  지방 0.9g l  무기질 2.7g l  칼슘 116mg l  인 104mg l  철분 2.2mg l  비타민 A 2 l 315 I.U l  비타민 B1 0.51mg l  비타민 B2 0.06mg l  나이아신 0.5mg l  비타민 C 36mg이 함유되어 있다. 냉이는 단백질 함량이 일반 엽채류 중에서 높으며 시니그린 l  솔비톨 l  콜린 l  아세틸콜린 l  아도니톨 등의 약리적인 성분과 당류가 포함되어 있다. 이것은 부교감 신경을 자극하여 소화관의 운동을 촉진하고 혈압을 내리게 하는 작용을 한다. 칼슘은 시금치의 3배가 넘으며 철 l  인 l  회분 함량도 높은 알칼리성 식품이다. 그 밖에 요오드 l  망간 l  칼륨 등도 있다. 이 무기질은 국으로 끓여도 파괴되지 않으며 일부 성분이 물에 녹아 나오더라도 국물째 먹으면 손실을 줄일 수 있다. 비타민 중에는 비타민 A와 C가 특이 많아 냉이 100g만 먹으면 성인 일일 요구량을 1/3을 섭취할 수 있다 :가. 이질 l  복통 l  설사에 효과가 있다.  나. 눈의 건강에 좋다. 다. 혈압을 내리게 하는 작용이 있어 고혈압에 효과가 있다.  라. 비장을 실하게 하며 이뇨 l  지혈 l  해독의 효능이 있다 l  :가. 한의학에서는 냉이의 뿌리를 포함한 모든 부분을 제채(齊寀)라 하여 약재로 쓰는데 l  꽃이 필 때 채취하여 햇볕에 말리거나 생풀로 쓴다. 말린 것은 쓰기에 앞서서 잘게 썬다. 약효는 지라(비장)를 실하게 하며 l  이뇨 l  지혈 l  해독 등의 효능이 있어 비위허약 l  당뇨병 l  소변불리 l  토혈 l  코피 l  월경과다 l  산후출혈 l  안질 등에 처방한다. 나. 옛말에 냉이꽃을 따 잠자리 밑에 넣고 자면 그 해 벼룩이 없어진다는 말이 있으며 l  삼월 삼짇날에 냉이를 캐다가 마루 밑에 두면 구더기가 생기지 않는다고 한다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :냉이는 겨자과의 두해살이풀로 나생이 l  나상구 l  나숭게라고도 하며 들이나 밭에서 자생한다. 원산지는 인도이고 우리나라를 비롯한 일본 l  북반구의 온대지방에 걸쳐 분포한다. 예부터 구황작물로 이용되어 왔으며 l  어린 순과 잎은 뿌리와 더불어 이른 봄을 장식하는 나물로 알려져 있다. 냉이국은 뿌리도 함께 넣어야 참다운 맛이 나며 데워서 우려낸 것을 잘게 썰어 나물죽을 끓여 먹기도 한다
							<br/><br/>17 l 달래 : 달래는 100g당 수분 87.9% l  당질 5.9g l  섬유질 1.6g l  단백질 3.3g l  지방 0.4g l  무기질 0.9g l  칼슘 169mg l  인 64mg l  철분 2.2mg l  비타민 A 810 I.U l  비타민 B1 0.06mg l  비타민 B2 0.1mg l  나이아신 5.6mg l  비타민 C 11mg이 함유되어 있다. 이처럼 달래는 특히 칼슘 l  철 등 무기질을 많이 함유하고 있으며 칼슘이 인보다 훨씬 많이 함유되어 있는 알칼리성 식품이다. 달래에는 비타민 C가 풍부하여 미용식으로 적합하다. 그러나 달래의 비타민 C는 열에 약해 삶으면 60~70% 정도 파괴되므로 날로 먹거나 식초를 곁들여 먹으면 좋다 :가. 자궁출혈 l  월경불순에 좋다. 나. 보혈 l  신경안정 l  살균 l  빈혈 l  위염 l  장염에 좋다. 다. 위장을 튼튼하게 하고 소화를 돕는다.  라. 불면증에 효과가 있다.  마. 정력증강제 l  강장제로 이용하기도 한다 l  :가. 한방에서 달래의 비늘줄기를 소산(小蒜)이라는 약재로 쓰는데 l  여름철 토사곽란과 복통을 치료하고 l  종기와 벌레에 물렸을 때 쓰며 l  협심통에 식초를 넣고 끓여서 복용한다.  나. 잠이 안 올 때 달래의 전초를 달여서 마시면 효과가 있다.  다. 편도선이 부었을 때 달래의 생잎이나 뿌리 간 것을 붙이면 효과가 있다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :달래는 백합과의 알뿌리를 가진 여러해살이풀로 소산(小蒜) l  야산(野蒜) l  산산(山蒜) 등이라고도 하며 산과 들에서 자란다. 한국(충남·강원·경기·황해·함남) l  일본 l  중국 동북부 l  우수리강(江) 유역에 분포한다. 파 l  마늘과 같은 독특한 향미를 지니고 있어 자극적인 맛을 좋아하는 우리나라 사람들이 선호하는 야채이다. 달래는 모든 부위를 다 식용하며 봄에 채취한 것이 가장 부드럽다
							<br/><br/>18 l 토란 :토란은 수분이 75~80%이고 고형물 중에는 당질이 대부분을 차지한다. 그 중 대부분이 녹말이며 녹말 이외에 갈락탄 l  펜토산 l  덱스트린 l  설탕 등을 함유하고 있다. 또한 토란의 미끈미끈한 성분은 갈락탄으로 이것은 소화성이 좋지 않다. 단백질은 다른 서류에 비해 적은 편이고 아미노산 조성은 쌀과 유사하여 비교적 양질이다. 무기질은 칼륨이 전 회분의 70%를 차지하고 있는 알칼리성 식품이며 비타민은 적으나 비타민 C는 포함되어 있다. 이밖에 미량의 수산이 들어 있어 아린 맛이 난다 :가. 관절염 l  타박상 l  관절 삔 데에 찜질약으로 효과가 있다.  나. 소화를 돕고 변비를 다스려 준다.  다. 천식 l  해열 l  진통작용을 한다.  라. 혈당치나 혈중 콜레스테롤 수치를 낮추어 준다 l  l 가. 종기가 났을 때 먹으면 잘 낫지 않고 자국이 남는다. 나. 독충에 쏘였을 때 토란줄기 즙을 바르면 낫는다. 다. 치통에 토란과 생강을 간 것을 바르면 효과적이다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :토란의 원산지는 인도 l  네팔 l  말레이시아반도 부근의 열대지방이다. 유럽에서는 별로 재배되고 있지 않으나 동양의 열대 l  온대지방에서 널리 재배되고 있다. 우리나라에서는 향약구급방에 기록된 것으로 보아 오래 전에 도입되었으며 전국 각지에서 재배되며 특히 남부지방에서 많이 재배된다. 토란은 고온다습 지방이 최적지이며 일년생 초본으로 저온에서는 약하다. 토란줄기와 토란은 식용으로 쓰이며 품종 l  산지 l  재배조건에 따라 품질에 차이가 많다
							<br/><br/>19 l 당근 : 당근은 100g당 수분 89.3% l  당질 7.6g l  섬유질 0.9g l  단백질 1.1g l  지방 0.3g l  무기질 0.8g l  칼슘 42mg l  인 37mg l  철분 1.3mg l  비타민 A 11 l 750 I.U l  비타민 B1 0.06mg l  비타민 B2 0.05mg l  나이아신 0.9mg l  비타민 C 10mg이 함유되어 있다. 이처럼 당근은 칼슘 l  비타민 B1 l  B2 등이 풍부하게 들어 있으며 l  양질의 섬유질과 무기질로는 인 l  철 l  마그네슘 l  칼륨 등이 풍부하게 들어있는 알칼리성 식품이다. 또한 단백질을 구성하는 아미노산은 라이신과 트레오닌으로 곡류단백질의 결점을 보완해 주고 있어 식용으로 우수하다. 당근의 붉은색은 카로틴에 의한 것으로 체내에서 비타민 A로 전환되므로 프로비타민 A라 부르기도 한다. 당근에는 다양한 카로티노이드가 함유되어 있는데 그 중 비타민 A의 전구체인 베타카로틴이 특히 주목받고 있다. 당근의 단맛은 자당 l  녹말 l  펜토산 때문이며 l  날것으로 먹을때 느껴지는 냄새는 독특한 향기 성분으로 익혀서 먹어야 좋다 : 가. 담배와 관련된 암 예방에 효과가 있다.  나. 성인병 예방에 효과가 있다.  다. 소화불량 l  변비의 예방과 치료에 효과적이다.  라. 심장 l  간장을 보호하고 허약체질에 효과가 있다.  마. 식욕을 증진시키고 미용에도 효과가 있다 l  :가. 한방에서는 뿌리를 학풍(鶴風)이라는 약재로 쓰는데 l  이질 l  백일해 l  해수 l  복부팽만에 효과가 있고 구충제로도 사용한다.  나. 홍역 초기에 당근과 올방개 뿌리의 삶은 물을 계속 먹이면 회복된다.  다. 씨앗을 달여서 먹으면 신장병 l  이뇨 l  수종 l  구충제 등에 좋다.  라. 심장이 약하거나 심장병이 있는 사람은 하루에 세 번 당근 한 뿌리씩을 계속 먹으면 효과가 있다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :당근은 미나리과의 두해살이풀로 홍당무라고도 하며 정력제에 좋은 식품으로 알려져 있다. 원산지는 아프가니스탄으로 우리나라는 16세기부터 재배하기 시작했으며 유럽 l  북아프리카 l  아시아 등지에 분포하고 있다. 뿌리는 채소로 식용하는데 l  비타민 A와 비타민 C가 많고 l  맛이 달아 나물 l  김치 l  샐러드 및 서양 요리에 많이 이용한다. 수확 시기는 여름과 가을로 1년에 2번이며 가을 당근이 연하고 수분이 많고 맛이 좋다. 당근은 당근 효소의 영향으로 다른 채소와의 저장은 피하는 것이 좋다
							<br/><br/>20 l 더덕 : 더덕은 100g당 수분 82.2% l  당질 4.5g l  섬유질 6.4g l  단백질 2.3g l  지방 3.5g l  무기질 1.1g l  칼슘 90mg l  인 12mg l  철분 2.1mg l  비타민 B1 0.12mg l  비타민 B2 0.22mg l  나이아신 0.8mg이 함유되어 있다. 말린 더덕에는 수분이 22.4% l  단백질이 8.2% l  지방이 5.4% l  당질 55.7%가 함유되어 있다. 잎에는 플라보노이드 성분을 함유하고 있으며 l  뿌리에는 인삼의 약 성분인 사포닌이 함유되어 있다. 이 사포닌은 쓴 맛을 내는 것이 특징이며 물에 잘 녹고 거품이 일어나는 물질이다. 더덕을 식용으로 할 때 물에 불리는 것은 사포닌을 우려내기 위한 것이다. 이 사포닌은 거담 l  항염증 l  항궤양 l  부신피질호르몬 분비촉진 l  기도점액 l  타액분비 촉진작용 등의 약리작용을 한다 :가. 비장 l  폐 l  간 l  신장을 튼튼하게 한다. 나. 추위 l  탈장증 l  만성소모성열 l  변비 l  입이 자주 마를 때 l  가슴이 답답할 때 l  물에 체했을 때 효과적이다.  다. 건위 l  강장식품으로 쓰인다.  라. 피부염이나 종기 l  독충에 쏘였을 때 외과용으로 쓰인다. 마. 항암 항콜레스테롤 효과가 있다 l  :가. 물에 체했을 때 더덕을 먹으며 l  탈장증이 있을 때 10g 정도 달여 마신다.  나. 젖이 많이 나오도록 하기 위해 산모가 하루에 8~10g씩 달여 마시기도 한다.  다. 변비가 심할 때 매일 15~20g 삶아 먹거나 반찬으로 먹으면 효과가 있다.  라. 입이 자주 마르는 사람이나 폐결핵 환자의 경우 차대용으로 달여 마시면 효과적이다.  마. 더덕가루를 음부가 가려울 때 바르면 잘 낫는다.  바. 더덕술은 정장제 l  강장제로 좋고 가래가 많은 사람은 잠자기 전에 마시면 효과가 있다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :더덕은 초롱꽃과의 여러해살이 덩굴식물로 사삼 l  백삼이라고도 부른다. 산과 들에 자생하며 우리나라를 비롯한 만주 l  대만 l  일본 등지에 널리 분포되어 있다. 봄에 어린잎을 l  가을에 뿌리를 식용한다. 식용섬유질이 풍부하고 l  씹히는 탄탄한 줄기 맛과 양념 맛으로 인해 ‘산에서 나는 고기’로 비유된다. 더덕은 자연산과 오래된 것일수록 향이 강하고 약효가 높으며 l  재배 더덕은 단백질과 지방이 많고 담백한 맛을 낸다. 또한 더덕은 재배년도에 따라 그 종류에 차이가 있으며 l  더덕뿌리는 매끈하고 쭉 빠진 수컷과 통통하면서 수염이 많이 달린 암컷이 있는데 요즘에는 암컷을 선호한다
							<br/><br/>21 l 도라지 :도라지에는 100g당 수분 85.0% l  당질 10.4g l  섬유질 2.4g l  단백질 1.8g l  지방 0.2g l  무기질 0.5g l  칼슘 45mg l  인 34mg l  철분 1.5mg l  비타민 A 217 I.U l  비타민 B1 0.08mg l  비타민 B2 0.13mg l  나이아신 0.6mg l  비타민 C 4mg이 함유되어 있다. 말린 도라지에는 수분 24.2% l  당질 62.9g l  섬유질 8.9g l  단백질 2.4g l  지방 0.1g l  무기질 1.5g l  칼슘 232mg l  인 189mg l  철분 6.2mg l  비타민 B1 0.1mg l  비타민 B2 0.36mg l  나이아신 7.8mg이 함유되어 있다. 도라지는 당질과 섬유질이 많으며 칼슘과 철분 등의 무기질이 많은 우수한 알칼리성 식품이다. 도라지는 사포닌 l  프라티코디닌 등을 함유하고 있는데 l  이는 거담 및 진해작용을 한다 :가. 진해 l  거담작용 등 호흡기 질환에 효과가 있다. 나. 심장쇠약 l  설사 l  주독 등에 효과가 있다. 다. 강장제로서 작용한다. 라. 배농제의 역할을 한다 l  :가. 생약의 길경(桔梗)은 뿌리의 껍질을 벗기거나 그대로 말린 것이며 l  한방에서는 치열(治熱) l  폐열 l  편도염 l  설사에 사용한다. 나. 감기 기침과 열이 있을 때 귤껍질 10g과 도라지 10g을 달여서 세 번 나누어 마시면 효과가 있다. 다. 감기로 코가 막혔을 때 도라지 20g에 물 세 홉을 붓고 물이 절반이 되도록 달여서 마시면 좋다. 라. 도라지 뿌리는 작은 상처로도 곪기 쉬운 체질을 개선해 주므로 도라지를 상식하면 여드름에 효과적이다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :도라지는 초롱꽃과의 여러해살이풀로 길경 l  도랏 l  길경채 l  백약 l  질경 l  산도라지라고도 한다. 원산지는 동아시아 지역이며 현재는 우리나라를 비롯한 중국 l  일본 등지에 분포되어 있다. 주로 산과 들에서 자생하며 식용 l  약용 등으로 널리 쓰이고 있다. 봄·가을에 뿌리를 채취하여 날것으로 먹거나 나물로 먹으며 어린잎과 줄기도 데쳐서 먹거나 기름에 튀겨 먹기도 한다. 도라지는 꽃의 모양에 따라 백도라지 l  겹도라지 l  흰겹도라지 등이 있다
							<br/><br/>22 l 두릅 :두릅에는 100g당 수분 85.9% l  당질 3.4g l  섬유질 2.5g l  단백질 5.6g l  지방 1.2g l  무기질 1.5g l  칼슘 50mg l  인 150mg l  철분 5.2mg l  비타민 A 1 l 080 I.U l  비타민 B1 0.09mg l  비타민 B2 0.42mg l  나이아신 0.8mg l  비타민 C 5mg이 함유되어 있다. 이처럼 두릅은 단백질이 많고 지방 l  당질 l  섬유질 l  인 l  칼슘 l  철분 l  비타민(B1·B2·C)과 사포닌 등이 들어 있어 혈당을 내리고 혈중지질을 낮추어 주므로 당뇨병 l  신장병 l  위장병에 좋다. 단백질을 구성하는 아미노산의 조성이 우수하기 때문에 영양적으로 좋은 식품이다. 그 밖에 소량의 탄닌 l  정유 l  효소 등도 함유되어 있다 :가. 두릅은 아침에 잘 일어나지 못하고 활력이 없는 사람에게 좋다. 나. 혈당치를 낮추어 주므로 당뇨병 환자에게 좋다. 특히 뿌리와 줄기의 약효가 뛰어나다.다. 두릅나무의 껍질은 풍을 제거하고 통증을 진정시키는 작용이 뛰어나다.라. 건위작용이 높아 위경련 l  위궤양을 낫게 하고 꾸준히 먹으면 위암을 예방하는 효능이 있다.마. 두릅에는 비타민C와 B1 이외에 신경을 안정시키는 칼슘도 많이 들어 있어 마음을 편하게 해주고 불안 l  초조감을 없애주는 데 많은 도움이 된다.바. 식욕촉진 l  발한 l  이뇨작용을 한다 l  l 가. 두릅의 뿌리줄기 50g을 물 3~5컵을 부어 20분 정도 달인 후 하루에 여러 차례 나눠 마시면 당뇨에 효과가 있다.나. 주머니에 말린 두릅을 넣어 목욕하면 몸이 따뜻해져서 보온 효과를 본다.  l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :두릅은 두릅나무의 새순으로 목말채 l  모두채라고도 한다. 독특한 향이 있어서 산나물로 먹으며 땅두릅과 나무두릅이 있다. 땅두릅은 4∼5월에 돋아나는 새순을 땅을 파서 잘라낸 것이고 l  나무두릅은 나무에 달리는 새순을 말한다. 자연산 나무두릅의 채취량이 적어 가지를 잘라다가 하우스 온상에 꽂아 재배하기도 한다. 나무두릅은 강원도에서 주로 재배하며 땅두릅은 강원도와 충청북도 지방에서 많이 재배한다. 데친 나물을 쇠고기와 함께 꿰어 두릅적을 만들거나 김치 l  튀김 l  샐러드로 만들어 먹는다. 오래 보관하기 위해 소금에 절이거나 얼리기도 한다
							<br/><br/>23 l 마 :재배종은 100g당 수분 74.4% l  당질 20.3g l  섬유질 0.6g l  단백질 2.9g l  지방 0.2g l  무기질 1.6g l  칼슘 33mg l  인 55mg l  철분 0.5mg l  비타민 B1 0.12mg l  비타민 B2 0.09mg l  나이아신 0.4mg l  비타민 C 12mg이 함유되어 있다. 야생종은 수분 84.2% l  당질 11.5g l  섬유질 0.5g l  단백질 2.5g l  지방 0.2g l  무기질 1.1g l  칼슘 27mg l  인 43mg l  철분 0.7mg l  비타민 B1 0.11mg l  비타민 B2 0.04mg l  나이아신 0.21mg l  비타민 C 10mg이 함유되어 있다. 이처럼 재래종의 마는 야생종보다 철분을 제외한 모든 영양면에서 우수하다. 마에는 전분 l  단백질 및 비타민 C가 풍부하게 들어 있다. 무기질로는 칼륨 l  나트륨 l  마그네슘 l  칼슘 등이 함유되어 있어 알칼리성 식품이다. 괴경류 중에는 단백질이 가장 많은데 약효성분인 사포닌 l  디오스신 l  뮤신 l  알란토인 l  콜린 l  바타타신이 함유되어 있다. 또한 전분의 분해효소인 디아스타제나 당질 분해효소인 아밀라제 l  산화환원효소인 카탈라제가 들어 있어 소화가 잘 된다" :가. 자양강장제로서 전신쇠약 l  병후쇠약에 효과가 있다. 나. 혈당강하제로서 당뇨에 효과가 있다. 다. 설사를 멎게 하고 이질에 효과적이다. 라. 소화불량 l  위장장애 l  기침 l  폐질환 등에 효과가 있다. 마. 부스럼 l  종기 등의 외용제로 쓰인다 l  :가. 마를 말린 것은 건위 소화제와 자양강장제 역할을 한다.나. 귀가 울리며 머리가 아프고 잘 때 식은 땀을 흘린다든지 하는 심장이상에 의한 여러 증세에는 마를 찧어서 삶은 것이나 마를 넣고 죽을 끓여 먹으면 효과가 있다.다. 야뇨 등에는 하루에 마를 15g 정도 달여 마시면 효과가 있다. 라. 부스럼 l  동상 l  화상 l  뜸자리가 헌데 l  유종 등에는 생즙에 밀가루를 반죽하여 국소에 붙이면 효과가 있다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :마는 맛과의 덩굴성 여러해살이풀로 산우(山芋) l  서여(薯囊)라고도 한다. 원산지는 중국이며 우리나라를 비롯한 중국 l  대만 l  일본 등지에 분포되어 있다. 마는 우리나라의 전국 산지에서 자생하는데 오래전부터 한약재와 민간약 l  식용으로 폭넓게 애용되었다. 품종은 긴 것 l  손바닥처럼 생긴 것 l  덩어리 같은 것 등 여러 가지이다. 한방에서는 건조시킨 뿌리를 산약(山藥)이라고 하는데 가을에 캐어 물에 씻어서 겉껍질을 벗기고 적당한 길이로 잘라서 햇볕에 말려 제조한다
							<br/><br/>24 l 마늘 :마늘에는 100g당 수분 60.4% l  당질 34g l  섬유질 0.8g l  단백질 3.0g l  지방 0.5g l  무기질 1.3g l  칼슘 32mg l  인 50mg l  철분 1.6mg l  비타민 B1 0.33mg l  비타민 B2 0.53mg l  나이아신 0.1mg l  비타민 C 7mg이 함유되어 있다. 마늘의 뿌리와 잎에는 글루코미날이라는 배당체가 들어 있는데 이것이 가수분해되면 특유한 자극취를 가진 정유 디아릴설파이드를 생성한다. 정유 성분 중 알리신이 비타민 B1과 결합하여 비타민 B1보다 훨씬 효력이 강한 알리티아민을 생성하며 이는 비타민 B1의 흡수가 잘 되게 하며 오랫동안 혈액 속에서 남아 있어 이용이 잘 되게 한다 :가. 강한 살균 l  항균작용을 한다.나. 소화를 촉진시킨다.다. 혈액의 점도를 내려 혈전증을 예방한다.  라. 피로 회복 l  허약체질에 좋다.마. 심장 발작 l  뇌졸중을 예방한다.바. 만성기관지염을 예방하거나 완화시키며 l  거담제 l  충혈 제거제 역할을 한다.사. 암을 예방한다 l  :가. 인경은 건위 l  이뇨 l  설사 l  구충제 등에 쓰인다. 마늘은 장내 기생충 구제에 효과가 있고 폐결핵 l  늑막염 등에 특효약이다.나. 마늘술은 해열 l  감기 l  거담 l  연주창 l  기침 l  혈액순환촉진 l  불면증 l  위장병 l  천식 등에 효과가 있다. 다. 마늘생즙을 신경통 l  류머티즘 l  편도선염 l  구내염 l  인후염 l  무좀 l  버짐의 환부에 바르면 효과가 있다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :마늘은 백합과의 여러해살이풀로 산(蒜)이라고도 하며 중앙아시아가 원산지이다. 우리나라에는 중국을 통해 전파되었으며 현재는 각지에서 재배한다. 마늘의 식용부위는 땅 밑에 있는 비늘줄기 l  마늘의 속대 및 마늘 잎 등인데 l  독특한 냄새가 있어 양념과 반찬으로 널리 이용된다. 마늘의 종류에는 소마늘과 대마늘이 있는데 지방에 따라 명칭이 다르다
							<br/><br/>25 l 머위 :머위에는 100g당 수분 90.4% l  당질 0.2g l  섬유질 1.8g l  단백질 2.1g l  지방 4.4g l  무기질 1.8g l  칼슘 98mg l  인 38mg l  철분 0.2mg l  비타민 A 15 l 000I.U l  비타민 B1 0.19mg l  비타민 B2 0.18mg l  비타민 C 4mg이 함유되어 있다. 머위는 보통 채소와는 달리 당질의 함량이 적으나 비타민은 비교적 골고루 함유되어 있으며 특히 비타민 A가 풍부하다. 무기질로는 칼슘이 많이 함유되어 있는 알칼리성식품인데 영양면보다는 향채로서의 성격이 더 크다. 또한 테르펜류 등의 정유성분과 쓴맛을 주는 성분이 함유되어 있으며 머위가 쉽게 갈변하는 것은 클로로겐산과 폴리페놀이라는 성분이 들어 있기 때문이다 :가. 식욕 증진 l  시킨다.나. 소화를 촉진시킨다.다. 기침을 멈추게 하고 담을 없앤다.라. 당뇨와 항암예방 효과가 있다. 마. 간을 튼튼하게 하며 l  폐질환에 도움을 준다. 바. 해독 l  해열 l  이뇨 l  인후염 l  편도선염 l  종기에 효과가 있다 l  l 가. 머위꽃이 피기 전 꽃대를 말려 한약재로 만든 관동화는 기침에 좋다. 꽃봉오리를 달여 마시거나 술을 담가 먹어도 기침이 멈춘다. 나. 약재를 갈아 양치하면 편도선이 부었을 때 효과를 볼 수 있다. 다. 머위 뿌리나 줄기를 빻아서 환부에 붙이면 종창이나 부기가 가라앉는다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :머위는 국화과의 여러해살이풀로 산록의 다소 습기가 있는 곳에서 자생한다. 원산지는 일본이며 l  우리나라를 비롯한 중국 l  일본 등지에 분포되어 있다. 잎자루는 산채(山菜)로서 식용으로 하고 꽃이삭은 식용 또는 진해제(鎭咳劑)로 사용한다. 머위는 지방에 따라 머우 l  머구 등으로 불리며 그 독특한 향은 식욕을 증진시킨다
							<br/><br/>26 l 미나리 :미나리에는 100g당 수분 94.9% l  당질 0.8g l  섬유질 0.8g l  단백질 2.1g l  지방 0.9g l  무기질 0.6g l  칼슘 32mg l  인 18mg l  철분 4.1mg l  비타민 A 2 l 33I.U l  비타민 B1 0.34mg l  비타민 B2 0.07mg l  비타민 C 8mg이 함유되어 있다. 이처럼 미나리에는 비타민 A l  B1 l  B2 l  C가 고루 함유되어 있으며 특히 비타민 B군이 많아 춘곤증이나 봄철 식욕을 돋우는데 아주 좋다. 또한 칼슘 l  철 l  인 등이 많이 함유된 알칼리성 식품으로 쌀을 주식으로 하는 우리나라 사람들에게 일어날 수 있는 혈액의 산성화를 막아준다. 잎에는 향기가 좋은 페르시카린 l  이소람네틴 l  알파피넨 l  미르센 등의 정유성분을 함유하고 있는데 이 정유는 정신을 맑게 하고 혈액을 보호하는 작용을 한다. 또한 섬유질이 많은 밭미나리를 먹으면 변비를 예방할 수 있으며 대장 속의 유해균을 제거할 수 있다 :가. 피를 맑게 하는 식품으로 빈혈예방 l  고혈압 l  동맥경화 l  혈액순환에 좋다. 나. 발한 l  보온작용을 하므로 냉증이나 감기에 효과적이다. 다. 대장의 활동을 좋게 하여 변비를 없앤다. 라. 식욕을 촉진시켜 주고 해열 l  진정작용을 한다 l  :가. 한방에서는 잎과 줄기를 수근(水芹)이라는 약재로 쓰는데 l  고열로 가슴이 답답하고 갈증이 심한 증세에 효과가 있고 l  이뇨 작용이 있어 부기를 빼 주며 l  강장과 해독 효과가 있다. 나. 술 마신 위의 열독을 다스리는 작용이 있어 음주전 미나리 즙을 마시면 숙취예방에 효과가 있다. 다. 연탄가스 중독이나 이로 인한 후유증에 효과가 있다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :미나리는 미나리과의 여러해살이풀로 서식장소는 습지 l  도랑 l  물가 등 습기가 많은 곳이며 흔히 논에 재배한다. 원산지는 아시아이며 l  우리나라를 비롯한 일본 l  중국 l  타이완 l  말레이시아 l  인도 등지에서 재배되고 있다. 미나리는 전 세계에 2 l 600여종이 있으며 우리나라에는 강활 l  기름나물 l  미나리 l  바다나물 l  어수리 l  시호 l  전호 등 약 80여 종이 분호하고 있다. 독특한 풍미가 있는 알칼리성 식품으로 우리나라 사람들이 가장 좋아하는 대표적인 향채 중의 하나이다. 미나리의 종류로는 돌미나리 l  밭미나리 l  논미나리가 있으며 미나리의 연한 부분은 주로 채소로 이용한다"
							<br/><br/>27 l 부추 :부추에는 100g당 수분 89.8% l  당질 3.7g l  섬유질 1.2g l  단백질 4.3g l  지방 0.4g l  무기질 0.6g l  칼슘 34mg l  인 27mg l  철분 2.9mg l  비타민 A 7 l 286I.U l  비타민 B1 0.41mg l  비타민 B2 0.06mg l  비타민 C 40mg이 함유되어 있다. 당질의 대부분은 포도당과 과당이며 l  비타민 A를 파 l  마늘에 비해 많이 함유하고 있다. 부추의 특유의 냄새는 유황화합물인 황화아릴이 주체로서 그 성분의 하나로 알리신이 있다. 알리신은 비타민 B1의 흡수를 도와주는 역할을 하며 육류의 냄새를 제거하는 데 좋다 :가. 비뇨생식기 계통에 작용하여 몸을 따뜻하게 하고 기능을 항진시키는 작용을 한다.  나. 소화를 돕고 장을 튼튼하게 하며 강장제로서 작용한다. 다. 피를 맑게 하여 허약체질 개선 l  미용 l  성인병 예방에 효과가 있다.  라. 균을 억제하는 작용 l  토혈 l  비열의 지혈작용을 한다. 마. 발한 l  해열 l  감기 초기에 효과가 있다 l  :가. 부추를 달여 마시면 토혈이나 코피가 날 때 지혈작용을 한다.  나. 설사에는 줄기나 잎을 달여서 마시면 효과가 있다. 다. 부추의 생즙은 몸을 따뜻하게 하는 작용을 하여 냉병 l  부인병 l  기침 l  설사에 효과적이다.  라. 구토 l  이질 l  혈변에 부추즙을 만들어 생강을 첨가해 먹으면 잘 멎는다.  마. 부추를 짓찧어 얻은 생즙은 부스럼 l  치질 l  허리 아픈데 l  벌레 물린데 바르면 좋다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :부추는 백합과의 여러해살이풀로 원산지는 소아시아이며 동남아시아 l  중국서부 l  한국 l  일본 등지에 걸쳐 분포하고 있다. 주로 산과 들에서 자생하며 지방에 따라 부채 l  부초 l  솔 l  정구지 l  졸 l  구채 등으로 불린다. 재생력이 강하기 때문에 일년에 2~3회 수확할 수 있으며 잎은 짙은 녹색이고 부드러우며 특유의 냄새가 난다. 미나리의 종류는 잎의 모양에 따라 소엽과 대엽으로 나뉘는데 소엽은 잎이 둥글고 가늘며 추위와 더위에 잘 견디는 특징이 있다. 반면 대엽은 잎이 납작하고 더위와 건조에 매우 약한 특징이 있다. 비늘줄기는 건위(健胃) ·정장(整腸) ·화상(火傷)에 사용하고 연한 식물체는 식용하며 종자는 한방에서 구자(삘子)라 하여 비뇨(泌尿)의 약재로 사용한다
							<br/><br/>28 l 브로콜리 :브로콜리에는 100g당 수분 90.0% l  당질 2.3g l  섬유질 1.1g l  단백질 4.6g l  지방 1.0g l  무기질 1.1g l  칼슘 14mg l  인 108mg l  철분 0.1mg l  비타민 A 27I.U l  비타민 B1 0.01mg l  비타민 B2 0.64mg l  나이아신 0.9mg l  비타민 C 55mg이 함유되어 있다. 이처럼 브로콜리는 비타민C l  카로틴 l  칼륨 l  칼슘 등이 들어 있어 채소 가운데 영양가가 높은 편이다. 철분도 다른 채소에 비해 두 배나 더 많이 들어 있는 영양 식품이다 :가. 암을 예방한다. 특히 식도 l  위 l  결장 l  후두 l  전립선 l  구강 l  인후암의 위험을 줄여준다.  나. 면역능력을 향상시킨다.  다. 철분을 많이 함유하고 있어 빈혈 예방의 효과가 있으며 특히 여자 몸에 좋다. 라. 비타민 C가 풍부해 피곤을 푸는 데 효과적이다. 마. 비타민 E가 풍부해 매끈거리는 피부를 만들어 준다 l  l 하루 3쪽씩만 먹어도 암을 예방하고 피가 맑아져 각종 성인병을 예방해준다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :브로콜리는 겨자과의 한해살이풀로 양배추의 변종이며 온화한 기후 l  서늘한 기후 모두 잘 자라는 채소이다. 지중해 지방 또는 소아시아 지방이원산지이며 우리나라는 최근에 와서 재배하기 시작하였다. 식용으로 이용하는 부분은 녹색 또는 적색 l  백색 등을 띠는 꽃봉오리이다. 브로콜리는 날것으로 먹거나 요리해서 먹는다. 색은 짙은 녹색을 띠고 영양가가 높으며 맛이 좋다
							<br/><br/>29 l 생강 :생강에는 100g당 수분 81.7% l  당질 12.4g l  섬유질 1.9g l  단백질 2.2g l  지방 0.8g l  무기질 1.0g l  칼슘 20mg l  인 14mg l  철분 1.1mg l  비타민 A 30I.U l  비타민 B1 0.01mg l  비타민 B2 0.03mg l  나이아신 4.3mg이 함유되어 있다. 또한 생강은 매운 맛 성분인 진제론 l  진제롤과 쇼가올을 1~3% 함유하고 있으며 특유의 향기를 내는 시네올 l  시트로넬랄 l  진기베렌 등의 성분을 함유하고 있다 :가. 소화불량 l  구토 l  멀미 l  설사에 효과가 있다.  나. 혈액 순환을 촉진하며 l  항염증과 진통 효과가 있다.  다. 식욕 및 소화를 촉진하는 작용을 한다.  라. 이뇨작용과 혈중 콜레스테롤의 상승을 억제하는 작용을 한다.  마. 감기를 예방한다 l  :가. 춥고 l  코가 막히고 두통이 나며 열이 있을 때 생강을 먹으면 땀을 내고 가래를 삭히는 효과가 있다.  나. 생강차를 추운 밤이나 술 마신 다음 날 아침에 마시면 좋다.  다. 헛배 l  발열의 치료에 좋고 복통 l  요통 l  설사시에 오장육부의 찬 기운을 제거하고 보온하는 데 효과가 있다. 라. 류머티즘 l  신경통 l  좌상 l  냉증 등에 끓여서 마시거나 외용으로 쓰면 효과가 있다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :생강은 생강과의 여러해살이풀로 새앙·새양이라고도 한다. 인도 l  말레이시아 등 동남아시아가 원산지로 추정되며 우리나라에는《고려사》에 있는 생강에 대한 기록으로 보아 고려시대 이전부터 재배했으리라 추정된다. 뿌리줄기는 옆으로 자라고 다육질이며 덩어리 모양이고 황색이며 매운 맛과 향긋한 냄새가 있다. 뿌리줄기는 말려 갈아서 빵·과자·카레·소스·피클 등에 향신료로 사용하고 껍질을 벗기고 끊인 후 시럽에 넣어 절이기도 하며 생강차와 생강주 등을 만들기도 한다. 한방에서는 뿌리줄기 말린 것을 건강(乾薑)이라 하며 불에 태워 말린 것을 흑강이라 하여 약재로 쓴다
							<br/><br/>30 l 순무 :순무는 크기 l  모양 l  빛깔에 따라 여러 가지가 있으나 성분은 대체로 비슷하고 일반적인 성분은 무와 대동소이하다. 순무에는 100g당 수분 92.1% l  당질 4.3g l  섬유질 1.0g l  단백질 1.5g l  지방 0.1g l  무기질 1.0g l  칼슘 25mg l  인 30mg l  철분 0.3mg l  비타민 B1 0.03mg l  비타민 B2 0.03mg l  나이아신 0.6mg l  비타민 C 20mg이 함유되어 있다. 당질의 비율이 상대적으로 높은 데다 식이 섬유소도 풍부하다. 피부에 좋은 비타민C와 고혈압 예방에 도움이 되는 칼륨 l  뼈를 튼튼히 하는 칼슘과 피를 만드는데 필요한 철분도 풍부하다 :가. 간염이나 황달을 진정시키고 해독 l  소염작용이 있어 목의 염증을 가라앉히고 목이 쉰것을 낫게 한다. 나. 변비 치료에 효과가 있다. 다. 항암 효능이 있다 l  :가. 중국의 의서인 [본초]에 순무는 오장을 고르게 하고 소화제로 유용하며 또 기를 내리고 황달을 다스리며 몸을 경쾌하게 하고 기혈을 이롭게 한다 또한 순무씨는 눈을 밝게 하며 이뇨제로 사용되고 l  씨를 말려두고 오랫동안 먹으면 건강하게 장수한다고 기록되어 있다. 나. 순무잎즙에 당근과 민들레 채소를 혼합하면 신체의 골격계 및 치아를 강화시키는 데 좋다. 다. 순무는 여러 가지 피부병 l  폐나 뼈의 결핵에도 유용하며 혁을 깨끗하게 해주므로 좋다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :순무는 겨자과의 한해살이풀 또는 두해살이풀로 지중해 연안에서 서아시아가 원산지이며 우리나라에는 중국으로부터 전파되었다. 현재는 세계 각지에서 넓게 재배되고 있는데 이로 인해 많은 품종이 생겼으며 종류로는 재래품종군 l  유럽계품종군 l  잡종군 등이 있다. 뿌리의 크기나 모양은 품종에 따라 다르며 l  대형 품종은 가축 사료가 된다. 순무는 무를 재배하는 방법으로 재배하면 되지만 늦여름에 파종하고 늦가을에서 초겨울에 수확하는 것이 많다
							<br/><br/>31 l 쑥 :쑥에는 100g당 수분 81.4% l  당질 6.9g l  섬유질 3.7g l  단백질 5.2g l  지방 0.8g l  무기질 2.0g l  칼슘 93mg l  인 55mg l  철분 10.9mg l  비타민 A 7.94I.U l  비타민 B1 0.44mg l  비타민 B2 0.16mg l  나이아신 4.5mg l  비타민 C 75mg이 함유되어 있다. 이처럼 쑥은 무기질과 비타민의 함량이 많은 것이 특징이다. 특히 칼슘과 비타민 A l  C가 아주 많다. 또한 다량의 엽록소 l  베타카로틴이 풍부하여 신체의 저항력을 높여주고 항암효과가 있다. 또한 치네올이라는 정유가 함유되어 있어 독특한 향기를 갖고 있으며 소화액의 분비를 왕성하게 하여 소화력 향상에 좋다 :가. 강력한 항균작용을 한다.  나. 해열 l  해독 l  소염효과 l  구충작용을 한다. 다. 만성위장병 l  소화불량에 효과가 있다.  라. 간염과 간경화 예방 효과가 있다.  마. 여성의 대하증 치료에 효과가 있다.  바. 혈압강하 작용을 하여 고혈압에 좋다 l  :가. 복통·토사(吐瀉)·지혈제로 쓰고 l  냉(冷)으로 인한 생리불순이나 자궁출혈 등에 사용한다.  나. 여름에 모깃불을 피워 모기를 쫓는 재료로도 사용하였다.  다. 날잎을 베인 상처나 타박상 l  복통 l  백선 등에 외용하거나 내복하면 효과가 있다.  라. 선조들은 복통이 있을 때 말린 쑥을 넣은 복대를 만들어 배를 두드리기도 했다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :쑥은 국화과의 여러해살이풀로 약쑥 l  사재발쑥 l  모기태쑥이라고도 한다. 양지바른 풀밭에서 자라며 쑥은 쑥 종류 중 가장 흔하게 자라는 것을 가리킨다. 우리나라를 비롯한 중국 l  몽고 l  일본 등지에 널리 분포하며 약 250여 종이 생육한다. 우리나라에서는 예부터 강화도 쑥이 약용으로 유명하였으며 현재는 인천 앞바다에 있는 자월도 쑥이 약용으로 많이 쓰이고 있다. 어린순은 식용 l  잎은 뜸 l  줄기는 약용 l  흰털은 인주를 만드는데 쓴다. 약재로 쓰는 것은 예로부터 5월 단오에 채취하여 말린 것이 가장 효과가 크다고 한다
							<br/><br/>32 l 시금치 :시금치에는 100g당 수분 93.7% l  당질 1.2g l  섬유질 0.7g l  단백질 2.6g l  지방 0.7g l  무기질 1.1g l  칼슘 36mg l  인 32mg l  철분 4.2mg l  비타민 A 78 l 320I.U l  비타민 B1 0.12mg l  비타민 B2 0.38mg l  나이아신 0.7mg l  비타민 C 64mg이 함유되어 있다. 시금치는 사포닌과 질 좋은 섬유질을 가진 저칼로리 식품으로 특히 비타민 A가 많이 함유되어 있으며 l  칼슘 l  칼륨 l  철분 l  요오드 등이 많은 알칼리성 식품이다. 또한 유기산으로 수산 l  사과산 l  구연산 등이 있는데 수산은 0.2~0.3%가량 들어 있다. 단백질은 라이신 l  트립토판이 풍부하며 시스틴도 많이 함유되어 있다. 또 엽록소 이외 베타카로틴과 강한 항암성분인 클로로필과 비타민 C가 풍부하게 함유되어 있다. 시금치 뿌리에는 구리와 망간이 들어 있다 :가. 혈중 콜레스테롤치를 낮추어 준다.  나. 항암작용을 한다.  다. 위와 장을 활발하게 하는 성분이 있어 위장장애 l  변비 l  거친 피부 치료에 좋다.  라. 데친 시금치의 엽록소는 세포부활작용 l  지혈작용 l  강심작용 l  말초혈관확장작용 l  상처의 치유촉진 작용 l  항알레르기 작용 등으로 혈액을 맑게 한다 l  :가. 5~6월경에 시금치꽃에서 씨를 받아 바짝 말려 두었다가 기침이 심할 때 약으로 쓰면 효과가 있다. 나. 시금치잎에는 철분을 비롯한 비타민 A와 C가 풍부해 나물로 무쳐 먹거나 국을 끓여 먹으면 병중 영양공급에 효과적이다.  다. 시금치 뿌리의 즙과 액은 옴과 같은 피부병에 효과적이며 폐병에는 뿌리와 잎의 생즙이 좋다. 하루에 세 번 l  소주잔으로 한 잔씩 마시면 좋다.  라. 시금치는 인체에 유독한 요산을 분리 l  배설시키므로 류머티즘이나 통풍에 효과적이다.  마. 옛날부터 시금치는 위 l  십이지장 l  대장 l  결장 등의 소화기 계통에 활력을 주는 식품으로 인정되어 왔다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :시금치는 명아주과의 한해살이 또는 두해살이풀로 아르메니아 l  아프가니스탄 등 아시아 서남부가 원산지이다. 우리나라에는 조선 초기에 중국에서 전해진 것으로 보이며 흔히 채소로 가꾼다. 품종은 서양종과 동양종이 있는데 내한성이 강하여 전세계에서 널리 재배되고 있다. 시금치는 성질이 차고 매끄러우며 맛은 달고 독이 없다. 데쳐서 나물을 무쳐 먹거나 토장국을 끓여 먹는다
							<br/><br/>33 l 양배추 :양배추에는 100g당 수분 94.3% l  당질 4.4g l  섬유질 0.7g l  단백질 1.5g l  지방 0.6g l  무기질 0.5g l  칼슘 18mg l  인 31mg l  철분 0.7mg l  비타민 A 43I.U l  비타민 B1 0.12mg l  비타민 B2 0.43mg l  나이아신 0.2mg l  비타민 C 27mg이 함유되어 있다. 단백질을 구성하는 아미노산은 곡물에 부족한 필수아미노산인 라이신을 함유하고 있다. 지방성분은 리놀렌산을 함유하고 있으며 l  당질은 대부분 포도당이다. 특히 양배추의 녹색부분에는 비타민 A l  B l  U가 많이 함유되어 있다. 또한 양배추는 칼슘을 많이 함유한 알칼리성 식품으로 몸에 좋은 많은 종류의 효소를 가지고 있다. 양배추를 삶으면 무기질 l  단백질 l  탄수화물 등이 많이 소실되며 l  양배추를 끓이면 성분 중의 유황이 휘발유성으로 변해 맛이 나빠진다. 또한 양배추에 함유되어 있는 클로로필과 비타민류는 열에 약하므로 이들 성분을 효과적으로 섭취하려면 가능한 한 날것으로 먹는 것이 좋다 l 가. 위궤양과 십이지장궤양의 예방 및 치유에 효과가 있다. 나. 암을 예방하는 효과가 있다.  다. 면역기구를 자극하여 세균이나 바이러스를 죽인다.  라. 요산을 배설시키거나 통증을 약화시킨다. l  :가. 고대 로마의 문서에는 ‘양배추는 고름이 흐르는 상처를 치료해준다. 별다른 치료 방법이 없을 때 양배추를 이용하라.’고 기록되어 있다.  나. 피로 l  불면증 l  감기에 걸렸을 때 양배추를 섭취하는 것이 효과가 있고 감기 때문에 열이 나는 경우 양배추를 베개나 머리 l  목 l  가슴 등에 깔거나 얹고 자면 효과가 있다. 또 피곤할 때 발바닥에 양배추를 붙이고 자면 피로가 풀린다.  다. 고혈압이 있거나 초조하고 몸이 찬 사람은 양배추를 익혀서 먹으면 효과가 있다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :양배추는 겨자과의 한해살이 또는 두해살이풀로 지중해 연안과 소아시아가 원산지이다. 현재는 전 세계에 분포되어 각기 다른 환경 속에서 재배되어 품종이 다양하다. 양배추는 크게 보통 양배추와 붉은 양배추로 분류하고 결구의 모양 l  꽃눈이 분화할 때 낮은 온도에 대한 적응도 등으로 분류하며 수확 시기에 따라 조생종 l  중생종 l  만생종으로 분류하기도 한다. 우리나라에서는 주로 외국에서 육성된 품종을 수입하여 재배한다
							<br/><br/>34 l 양파 :양파에는 100g당 수분 84.9% l  당질 11.8g l  섬유질 0.3g l  단백질 1.9g l  지방 0.4g l  무기질 0.7g l  칼슘 20mg l  인 61mg l  철분 0.2mg l  비타민 B1 0.09mg l  비타민 B2 0.15mg l  비타민 C 3mg이 함유되어 있다. 당질은 포도당 l  서당 l  과당이 약 10%가량 들어 있어 단맛이 있다. 주요 아미노산은 아르기닌 l  글루타민으로 이밖에 20여 종의 아미노산을 소량 포함하고 있다. 비타민 C는 성숙함에 따라 감소되며 저장 중에도 줄어드는 경향이 있다. 양파의 특유의 향은 황화아릴이나 가열하면 기화하고 일부는 분해되어 감미가 강한 물질로 변하는데 조리시 단맛이 증가하는 것은 이 때문이다. 또한 양파에는 말산 l  시트르산 등 소량의 유기산을 함유하고 있다 :가. 혈전이 생기지 않도록 하고 심장을 튼튼하게 하는 등 순환계 건강에 좋다.  나. 혈중 콜레스테롤치를 낮추어 준다.  다. 혈당치를 조절하여 당뇨병을 치료한다.  라. 기관지의 충혈을 부드럽게 하고 암을 억제한다.  마. 양파의 껍질 부분에 있는 케르세틴 성분은 혈관을 강화하며 경화된 동맥을 부드럽게 하고 강압작용도 한다.  바. 양파의 특유의 향기는 소화액의 분비를 촉진시키고 불면증 l  대머리 예방에 좋다 l  l 가. 등산이나 근육운동을 할 때 양파를 섭취하면 피로가 덜하다. 나. 잠이 안 올 때는 직경 5cm 정도의 접시에 양파를 잘게 썰어서 베개 밑에 놓고 자면 좋다.  다. 원형탈모증과 무좀에 양파의 생즙을 발라서 마사지하면 효과가 있다.   라. 기침이 날 때 양파를 잘게 썰어서 거즈에 싸서 목에 냉찜질하거나 생즙을 5배 정도 희석한 것으로 하루에 여러 번 양치질하면 좋다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :양파는 백합과에 속하는 여러해살이풀로 인도 북서부 l  중앙아시아 남서부가 원산지이다. 우리나라에는 조선말기 미국과 일본으로부터 전파되었으며 현재는 전 세계 각지에서 재배되고 있다. 양파는 매운 맛의 유무에 따라 단맛을 띤 양파와 매운 맛을 띤 양파로 크게 분류된다. 또한 모양은 둥근 것이 많으며 품종에 따라 흰 것 l  노란 것 l  붉은 것 등이 있다
							<br/><br/>35 l 연 :연근은 100g당 수분 88.2% l  당질 7.8g l  섬유질 1.1g l  단백질 2.0g l  지방 0.1g l  무기질 0.8g l  칼슘 22mg l  인 66mg l  철분 0.4mg l  비타민 B1 0.05mg l  비타민 B2 0.03mg l  비타민 C 45mg이 함유되어 있다. 연근의 주성분은 당질이며 대부분이 녹말이다. 아미노산으로는 아스파라긴산 l  아르기닌 l  티로신이 함유되어 있으며 레시틴 l  펙틴도 많이 들어 있다. 또한 비타민 B12가 함유되어 있어 빈혈에 좋다. 그러나 크로로젠산과 폴리페놀 성분이 함유되어 있어 갈변의 원인이 된다. 따라서 변색을 막기 위해서 식초를 넣고 삶으면 나쁜 맛도 빠지고 색도 깨끗해진다 :가. 자양강장 l  피로회복 l  정신안정에 도움을 준다.  나. 지혈작용과 어혈을 풀어주는 작용을 한다.  다. 출혈성 위궤양과 위염에 효과가 있다.  라. 체내의 콜레스테롤치를 저하시키는 작용을 한다.  마. 폐렴 l  기관지 천식 l  임질 l  소화불량 뿐 아니라 독성물질에 대한 중화작용을 한다.  바. 니코틴을 제거시켜 주는 해독작용이 있다 l  :가. 칼에 베어 피가 나거나 코피가 날 때 연근즙을 탈지면에 적시어 막으면 지혈이 되고 연뿌리로 죽을 쑤어 먹으면 출혈성 위궤양이나 위염에 좋다. 나. 버섯독 l  지혈 l  치질출혈 l  설사 l  요통 l  야뇨증에는 연잎을 달여서 마시면 좋다.  다. 생연근의 즙은 폐결핵의 각혈 또는 하혈 l  빈혈에 좋다. 라. 연근으로 죽을 쑤어 장복하면 혈액순환이 안 되어 뭉쳐 생긴 피를 분산시켜 혈액순환을 도우며 소화력을 증진시키고 기분을 상쾌하게 한다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :연은 연꽃과의 여러해살이 수경식물로 주로 늪이나 수전에서 자라고 비교적 따뜻한 곳에서 잘 자란다. 인도와 이집트가 원산지이며 현재는 각지에서 재배하고 있다. 보통 식물의 종자로서 10년 이상의 수명을 지니기는 힘든데 연씨는 1 l 000년 이상의 수명을 지니고 있으며 발아율도 거의 100%이다. 연꽃은 분홍색과 흰색이 있는데 흰꽃의 연근은 날것으로 먹어도 맛이 있으며 분홍꽃의 연근은 일반조리용으로 쓰인다
							<br/><br/>36 l 우엉 :우엉은 100g당 수분 76.0% l  당질 18.6g l  섬유질 1.7g l  단백질 2.6g l  지방 0.3g l  무기질 0.8g l  칼슘 73mg l  인 78mg l  철분 1.5mg l  비타민 B1 0.04mg l  비타민 B2 0.15mg l  나이아신 4.8mg이 함유되어 있다. 우엉의 주성분은 당질이지만 대부분의 식품과 달리 녹말이 적고 이눌린 성분으로 구성되어 있다. 우엉의 뿌리에는 이눌린과 소량의 팔미틴산이 들어 있고 비타민류는 적고 열량은 거의 없는 편이다. 우엉의 단백질에는 아르기닌이란 필수아미노산이 많은 것이 특징이다. 우엉은 삶으면 칼륨 l  나트륨 l  칼슘 l  마그네슘 등의 무기질이 녹아나와 우엉의 안토시안 색소와 반응해 파랗게 변색이 되는데 인체에 해롭진 않다. 또한 우엉껍질을 벗겨서 채 썰어 놔두면 공기 중의 산소에 의해 갈변하는데 이는 우엉의 폴리페놀계 화합물 때문이다. 이를 방지하기 위해서는 식초 탄 물에 담가두면 된다 :가. 우엉의 알카로이드 성분은 종양세포의 발육을 억제하는 작용이 있다.  나. 우엉의 뿌리는 이뇨제의 효과가 있다. 다. 우엉의 잎은 피부 소양증에 효과가 있다.  라. 우엉에 함유되어 있는 이눌린은 가슴앓이 l  위장 l  피부병에 좋다.  마. 우엉의 씨는 악실이라는 약재라고 하는데 풍열을 훑어내고 해독 시키는 효과가 있다. 바. 위장이 튼튼해진다.  사. 맹장염에 좋다 l  :가. 옛날부터 종기가 곪았을 때 우엉 씨를 먹으면 빨리 터져 고름이 나온다고 하였다. 나. 우엉잎은 생인손 l  관절염 l  동통 l  종기 등에 잘 작용한다고 한다. 다. 우엉의 이눌린은 당뇨병 l  신장 l  가슴앓이 l  위장 l  피부병에 효과가 있다고 전해지고 있다. 라. [본초비요]에 뿌리즙을 꿀에 타서 마시면 중풍을 다스리는데 이 때 땀이 나오면 낫는다 하며 l  뿌리를 짓이겨 돼지기름에 개어 종기에 붙이면 낫는다고 한다. 마. 우엉씨는 종기나 사마귀가 났을 때 매일 3~4개씩 먹으면 잘 낫는다고 하며 눈을 맑게 하고 풍을 없앤다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :우엉은 국화과의 두해살이풀로 원산지는 지중해 연안에서 서부 아시아 일대이다. 야생종은 유럽 l  시베리아 l  만주 등지에 자생하며 l  유럽에서는 어린잎과 뿌리를 식용으로 하고 l  중국에서는 우방자라 하여 이뇨제로 쓰고 있다. 채소로서는 일본에서 발달되었으며 우리나라에서 전국적으로 많이 재배되고 있다. 우엉은 장근종과 단근종으로 나뉘며 우엉의 성질은 강건하여 병이 거의 없고 l  추위와 더위에 강한 편이다
							<br/><br/>37 l 토마토 :토마토는 100g당 수분 92.0% l  당질 3.6g l  섬유질 1.0g l  단백질 2.0g l  지방 0.3g l  무기질 1.1g l  칼슘 4mg l  인 70mg l  철분 0.6mg l  비타민 A 625I.U l  비타민 B1 0.1mg l  비타민 B2 0.03mg l  나이아신 0.2mg l  비타민 C 12mg이 함유되어 있다. 이처럼 토마토는 비타민 A l  B1 l  B2 l  C 등이 골고루 함유되어 있으며 l  유기 아미노산과 무기질 함량이 많은 알칼리성 건강식품이다. 산은 주로 구연산으로 0.5%내외 함유되어 있고 무기질로는 칼륨이 많으므로 소금을 같이 섭취하는 것이 좋다. 또한 토마토는 비타민 E가 있어 고혈압을 예방하는 효과가 있다. 토마토의 색 가운데 황적색은 카로틴 l  적색은 리코펜에 의한 것으로 적색 토마토보다 황색 토마토가 비타민 A가 풍부하다 :가. 토마토의 푸린 성분은 혈관을 튼튼하게 하고 혈압을 내리는 역할을 하므로 고혈압과 동맥경화에 좋다.  나. 토마토생즙은 미용제 역할을 한다. 다. 피로회복에 좋으며 변통을 조절해 준다.  라. 암의 위험을 낮추고 맹장염을 예방한다.  마. 폐암 l  심장병 l  신장병 l  위약자 l  빈혈 등에 이용된다 l  l 가. 토마토를 기름진 요리와 곁들여 먹으면 소화를 도와준다.  나. 생즙을 내어 얼굴을 씻으면 살결이 고와지며 부드러워진다.  다. 토마토를 먹는 사람은 별로 먹지 않는 사람에 비해 암 사망률이 1/2이라 한다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :토마토는 가짓과의 한해살이풀로 원산지는 남미의 안데스 산맥이다. 우리나라에는 1914년경에 들어왔다고 하지만 이보다 일찍 들어온 것으로 추정되며 처음에는 관상용이었고 식품용으로 한 것은 50여 년 전 일이다. 품종은 색에 따라 적색종 l  도색종 l  황색종으로 나뉘며 생식용은 도색종이 많고 가공용은 적색종이 많다. 토마토는 날 것으로 먹는 것 외에 주스 l  케첩 l  퓨레 l  소스 l  피클을 만들어 먹으며 l  고기나 생선 l  기름기 있는 음식을 먹을 때 곁들인다
							<br/><br/>38 l 호박 :호박은 품종과 성숙도에 따라 성분이 크게 달라진다. 잘 익을수록 단맛이 증가하는데 이는 당분이 늘어나기 때문이다. 호박의 일반성분은 100g당 수분 95.0% l  당질 1.5g l  섬유질 0.4g l  단백질 2.0g l  지방 0.6g l  무기질 0.5g l  칼슘 15mg l  인 23mg l  철분 0.7mg l  비타민 A 930I.U l  비타민 B1 0.06mg l  비타민 B2 0.15mg l  비타민 C 8mg이 함유되어 있다. 말린 호박씨의 일반성분은 100g당 수분 4.4% l  당질 13.1g l  섬유질 1.9g l  단백질 29g l  지방46.7g l  무기질 4.9g l  칼슘 51mg l  인 1.144mg l  철분 11.2mg l  비타민 A 70I.U l  비타민 B1 0.24mg l  비타민 B2 0.19mg l  나이아신 2.4mg이 함유되어 있다. 호박의 주성분은 당질로서 1/3이 서당이며 과육의 색은 황적색의 카로티노이드 색소에 의한 것이다. 비타민 C는 많은 편이나 동시에 비타민 C 산화효소가 있어 파괴되기 쉽다. 호박씨는 단백질과 지방이 풍부한데 l  단백질은 글로불린이 많아 질이 우수하며 l  지방은 필수지방산을 함유하고 있다. 또한 레시틴이 들어 있어 지능발달에 좋으며 혈압을 낮추는 작용을 한다 :가. 이뇨작용을 한다.  나. 암을 예방한다.  다. 위장계를 보호하고 l  기를 더해준다 l  :가. 호박은 산후부종과 당뇨병 l  이뇨제로 쓰이는 민간약으로 삶아서 섭취하면 효과가 있다. 나. 동지 때 수확한 호박을 상복하면 고혈압증과 당뇨병 l  중풍에 효과가 있다. 다. 호박씨는 기침이 심할 때 구워서 설탕이나 꿀과 섞어 섭취하면 효과가 있으며 l  젖이 부족한 산보가 섭취하면 젖이 많이 나온다고 한다.  라. 인후통 l  감기 l  구충에 호박씨를 20~30개 가량 달여서 하루 세 번 복용하면 효과가 있다.  마. 호박국이나 호박죽을 끓여 먹으면 불면증 l  뇌신경 불안증에 좋다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :호박은 박과의 한해살이 덩굴성 풀의 열매로 원산지는 인도 l  페루의 안데스 산맥 지역이다. 우리나라에는 임진왜란 이후 들어와 구황식품으로 자리 잡았으며 l  건조한 기후 어느 곳에서나 잘 자라 세계적으로 널리 분포하고 있다. 호박의 종류는 남멕시코산 l  남미산 l  페루산 l  볼리비아산 l  칠레산 l  북미산 등이 대표적이다. 우리나라는 재래종 호박과 당호박 l  개량종 l  서울 애호박 등이 재배되고 있다
							<br/><br/>39 l 민들레 :민들레는 대부분이 이눌린 성분이며 지방은 팔미틴산과 리놀산 등을 함유하고 있다. 또한 무기질로는 칼슘 l  칼륨 l  마그네슘 l  나트륨의 함량이 많으며 비타민은 A가 가장 많고 B1 l  E가 중간 l  B2 l  C가 소량 함유되어 있다 :가. 위궤양 l  만성위장염 l  위암 치료에 효과가 있다.  나. 피를 깨끗하게 하는 작용을 한다.  다. 간장병이나 변비 l  치질에 효과가 있다.  라. 진해 거담제로 효과가 있다 l  :가. 위궤양에 생잎을 씹어서 먹으면 효과가 있다.  나. 젖이 적은 산모에게 민들레가 효과적이다.  다. 만성화된 간장병에 민들레를 달여 먹으면 효과가 있으며 황색 담즙을 토한는 경우에는 녹즙으로 하여 먹으면 더 효과적이다.  라. 민들레잎을 혼합한 생즙을 복용하면 척추나 골절 치료 l  충치예방에 효과가 있다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 : 민들레는 국화과에 속하는 여러해살이풀로 주로 볕이 잘 드는 산과 들에 자생하며 병충해가 거의 없고 생명력이 질기다. 우리나라를 비롯하여 만주 l  중국 l  일본에 널리 분포되어 있으며 어린순과 잎 l  뿌리는 식용으로 전초는 약용으로 쓰인다. 민들레는 지방에 따라 둥글레 l  뫼올들레 l  문들레 l  미움들레 l  안질뱅이꽃 등으로 불린다
							<br/><br/>40 l 버섯 :버섯의 영양성분은 종류에 따라 약간의 차이가 있으나 일반적으로 수분 9.0% l  당질 60.1g l  단백질 18.7g l  지방 1.7g l  무기질 4.8g l  칼슘 19mg l  인 250mg l  철분 4.0mg l  비타민 B1 0.64mg l  비타민 B2 1.23mg l  나이아신 10.5g을 함유하고 있다. 마른 버섯에는 비타민 D의 모체인 에르고스테린과 비타민 B2가 풍부하여 비타민 D와 B2의 공급원이다. 무기질은 칼륨이 풍부하며 구리 l  망간이 소량 함유되어 있다. 또한 버섯에는 구아닐산이라는 성분이 들어 있어 버섯 특유의 독특한 맛이 난다. 이 구아닐산은 특히 표고버섯에 많이 함유되어 있다 :가. 목이버섯은 항응혈 l  항암작용이 있으며 l  심장병과 뇌졸증을 예방하는 효과가 있다.  나. 송이버섯은 당뇨병과 순환기 장애에 효과가 있으며 항암작용을 한다.  다. 영지버섯은 노화를 방지하고 정력을 높이며 고혈압 l  당뇨병 l  위궤양 l  간장병 l  항암에 효과가 있다.  라. 표고버섯은 항바이러스 l  항암효과가 있으며 l  혈중 콜레스테롤치를 낮추어 주는 작용을 한다 l  l 가. 탈항증이 있을 때는 송이버섯을 진하게 달여 수시로 씻으면 효과가 있다.  나. [본초]에는 나무버섯은 오장을 튼튼하게 하고 장과 위의 악기를 없애며 혈기를 돕고 몸을 가볍게 한다고 기록되어 있다.  다. 중국에서는 목이버섯을 두통치료와 심장발작의 예방에 써 오고 있다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 l 버섯은 균류 중 담자균류가 대부분이고 일부 자낭균류에 속하는 식물이 있다. 우리나라는 1905년 일본인들이 제주도에서 표고를 재배하면서부터 인공재배를 시작하였다. 버섯 종류는 수천 종이 있으나 우리나라에서는 10여 종을 식용하고 있다. 우리나라 사람들이 즐겨 먹는 것은 표고와 송이버섯이다.
							<br/><br/>41 l 컴프리 :컴프리는 일반적으로 수분 90% l  당질 3.4g l  단백질 2.6g l  지방 0.4g l  무기질 1.8g l  칼슘 208mg l  인 40mg l  철분 9mg l  비타민 A 9 l 800I.U l  비타민 B1 0.77mg l  비타민 B2 2.20mg l  나이아신 1.0mg l  비타민 C 60mg l  비타민 B12 8.92mg을 함유하고 있다. 이 외에 비타민 B6 l  B12 l  E l  콜린 l  엽산 l  판토텐산 l  비오틴 l  아란토인 l  엽록소 l  유기 게르마늄 등을 함유하고 있는데 B12와 유기 게르마늄이 약효성분이다. 컴프리의 잎털부분에 있는 비타민 B12는 조혈작용과 악성빈혈의 치료효과가 탁월하며 아란토인은 천식에 효과가 있다. 또한 유기 게르마늄은 체내에 산소를 각 기관에 공급하는 작용을 해 활력을 불어 넣어주는 효과가 있다 :가. 악성빈혈 치료에 효과가 있다.  나. 뿌리는 천식 l  잎은 위궤양에 효과가 있다.  다. 면역능력을 높여준다.  라. 변비와 세균성 질환을 억제해준다 l  :가. 컴프리 잎 큰 것 4~5장을 씻어 물을 섞어 갈아 마시면 빈혈 l  신경쇠약 l  당뇨병 l  냉병에 효과가 있다.  나. 컴프리순을 말려 가루로 하거나 달여 피부병에 쓴 효과가 있다. 뼈를 다쳤을 때에도 효능이 있다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 l 컴프리는 지칫과에 속하는 여러해살이풀로 척박한 땅에서도 잘 자라고 빨리 자라는 등 왕성한 성장력을 지니고 있다. 원산지는 코카서스 지방이며 우리나라는 일본을 통해 전파되었다.
							<br/><br/>42 l 칡 : 칡뿌리의 주성분은 전분이며 l  당질도 함유되어 있어 단맛이 난다. 또한 다이드제인 성분이 들어 있어 경련작용을 진정시키는 데 좋다 :가. 감기로 인한 발열 l  두통 l  목 뒷덜미의 뻣뻣한 증상 l  갈증을 해소시키는 작용을 한다.  나. 속이 답답하고 팔다리를 가만두지 못하는 증상 l  설사 l  고혈압 l  중이염에 효과가 있다.  다. 약물중독 l  숙취해소에 효과가 있다.  라. 정장작용을 한다.  마. 불면증에 효과가 있다 l  :가. 민간요법으로 칡을 위장약으로 쓰고 있으며 칡뿌리즙은 해열 l  발한 l  청량제 l  갈증해소 l  구토 l  신경통 l  두통 l  불면증에 쓰인다.  나. 민간약으로 뿌리와 꽃을 같이 달여 마시면 약물중독이나 술중독에 효과가 있다.  다. 미역을 먹고 체했을 때와 같은 모든 채독에는 칡뿌리를 진하게 달여 마시면 효과가 있다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :칡은 콩과에 속하는 낙엽활엽의 만목으로 산기슭의 양지에 자생한다. 원산지는 아시아로서 우리나라를 비롯한 일본 l  대만 l  중국에 분포하고 있다. 뿌리의 전분은 갈분이라 하여 식용으로 쓰이며 주피를 제거한 뿌리는 한방에서 갈근이라 하여 약용으로 이용한다
							<br/><br/>43 l 김 : 김은 일반적으로 수분 9.0% l  당질 50.4g l  단백질 30.1g l  지방 0.5g l  무기질 8.8g l  칼슘 218mg l  인 518mg l  철분 20.5mg l  비타민 A 9 l 819I.U l  비타민 B1 1.95mg l  비타민 B2 2.22mg l  나이아신 1.6mg l  비타민 C 12mg을 함유하고 있다. 이처럼 김의 주성분은 당질과 단백질이다. 당질의 주성분은 갈락탄이며 단백질은 대두나 쌀에 비하면 낮지만 비교적 양질이다. 김에는 약 1.0% 정도의 타우린이 들어 있는데 이것은 오징어 l  문어 l  굴 등의 몇몇 수산제품을 제외하고는 함량이 가장 높다. 무기질은 주요한 미량성분이 대부분 함유되어 있으며 비타민은 비타민 A가 달걀 두 개에 해당하며 비타민 B와 C도 풍부하다. 또한 식이섬유량이 많아 정장작용의 기능이 있다. 해초는 일반적으로 소화가 잘 안되나 김은 비교적 소화가 잘 되는 식품이다 l 가. 암을 예방한다.  나. 혈중 콜레스테롤치를 낮추어 준다.  다. 혈압을 내리게 한다. l  :가. 폐병 l  구취 증세에 김 20장을 삶아 마시면 효과가 있다. 만약 부작용이 생기면 끓인 물에 식초를 조금 타서 마신다.  나. 김 한 장을 불에 구워 부순 다음 끓인 물로 하루 3~6회 섭취하면 고혈압과 동맥경화에 효험이 있다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :김은 홍조류의 보라털과에 속하는 것으로서 해태 l  해의 l  감태 l  청태라고도 한다. 우리나라의 남해와 일본 연해에 염분 농도가 진한 곳에 분포되어 있다. 바다의 암초에 주로 자생한다. 김의 특유한 향기는 식욕을 증진시키는 것으로 김에 혼입되는 미생물에 의해 분해되어 생기는 것이다
							<br/><br/>44 l 미역 :미역은 일반적으로 수분 16% l  단백질 20.3% l  지방 1.3% l  당질 34.5% l  섬유소 4% l  회분 27.0% l  칼슘 720mg l  비타민 A 7 l 700I.U l  비타민 B1 0.05mg l  비타민 B2 0.37mg l  나이아신 1.2mg l  비타민 C 5mg이 함유하고 있다. 칼슘의 함량은 분유와 맞먹을 정도로 풍부하며 인과의 함량비가 매우 우수한 강알칼리성 식품이다. 특히 미역에는 요오드가 많이 함유되어 있어 심장 l  혈관 l  체온과 땀 조절 l  신진대사 증진에 매우 효과적으로 작용한다. 또한 알긴산 등 식이섬유를 포함하고 있어 건강에 좋은 식품이다 l 가. 피를 맑게 한다. 부인병과 풍에 좋다.  나. 암을 예방한다.  다. 정장작용과 변비를 예방한다. 라. 혈압을 낮추어 준다. l  l 가. 미역을 상식하면 심장병에 좋으며 혈압이 내려간다.  나. 버섯독에 미역을 달여 먹으면 버섯의 독이 중화된다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :미역은 갈조류 미역과에 속하는 식품으로 한해살이 바닷말로 우리나라를 비롯한 일본 등지에 분포한다. 미역은 맛이 짜고 비린내가 나며 l  우리나라는 예로부터 피가 맑아진다고 하여 해산 후 산모가 미역국을 먹는 풍습이 있다
							<br/><br/>45 l 다시마 :다시마는 종류에 따라 영양성분이 차이가 나지만 일반적으로 수분 16% l  단백질 7% l  지방 1.5% l  당질 49% l  회분 26.5%를 함유하고 있다. 당질의 20%는 섬유소이며 나머지는 알긴산과 라미나린 l  펜토산 등 다당류와 갈락토오스 등이다. 특히 다시마에는 요오드 l  칼슘 l  칼륨 등의 무기염류가 풍부하여 무기염류의 공급원이다. 다시마의 맛은 아미노산 중 글루탐산이라는 성분에 의한 것인데 일본의 아지노모도 회사가 다시마를 끓인 물에서 MSG를 제조하여 조미료로 개발하였다. 최근에는 발효에 의해 대량 생산되고 있다 :가. 갑상선 기능 이상에 효과가 있다.  나. 림프질염을 치료하고 간장염과 고환에 생긴 염증을 제거한다.  다. 정장작용 및 대장암의 예방 효과가 있다. 라. 동맥경화 l  수종 l  신경통 l  피부병 등에 효과가 있다 l  l 가. 다시마는 자양식품으로 동맥경화 예방에 좋은 식품으로 알려져 있다.  나. 요독증이 있을 때 다시마를 2~3푼을 물에 달여 복용하면 효과가 있다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :다시마는 갈조류 다시마과에 속하는 바닷말의 총칭으로 우리나라의 북부 l  중부 l  남부의 바다 5m 깊이의 바위에 붙어 서식한다. 최근에는 양식이 발달하여 남해안에서도 생산된다. 다시마는 식용 외에 한방에서는 곤포라 하여 약용으로 쓰며 제약공업에서는 알긴산 l  만니트 l  요오드의 원료로 이용한다. 다시마는 2년생 엽상체부터 채취가 가능하며 그 종류가 매우 다양하다
							<br/><br/>46 l 귤 :귤은 100g당 수분 88.6% l  당질 9.0g l  섬유질 0.9g l  단백질 0.9g l  지방 0.2g l  무기질 0.4g l  칼슘 14mg l  인 2mg l  철분 0.2mg l  비타민 A 1 l 500I.U l  비타민 B1 0.1mg l  비타민 B2 0.05mg l  나이아신 0.6mg l  비타민 C 430mg이 함유되어 있다. 귤의 주성분은 당분으로 포도당 l  과당 l  서당이 대부분을 차지하고 있는데 귤은 성숙함에 따라 당분이 증가해서 겨울에 당분함량이 가장 많다. 유기산은 주로 구연산이며 무기질은 칼슘이 대부분이다. 비타민 C의 함량은 사과의 6~20배 l  포도의 10배로 많으며 l  귤껍질은 과육의 4배에 달하는 비타민 C를 함유하고 있다. 또한 귤껍질에는 향기 성분인 리모넨 l  시트랄 l  에스테르를 함유하고 있다. 비타민 A는 오렌지나 금감에 비해 많이 함유하고 있으며 특히 혈관에 저항력을 주는 헤스페리딘이라는 비타민 P를 함유하고 있어 동맥경화나 고혈압 예방에 좋다. 그밖에 비타민 E도 들어 있어 콜레스테롤의 수치를 낮추어 주는 데 효과가 있다 l 가. 암 특히 위암을 예방한다.  나. 혈중 콜레스테롤치를 낮추어 준다.  다. 감기 예방과 항바이러스 효과가 있다.  라. 소화를 돕는다. l  :가. 여름에 귤을 1~2개 섭취하면 피로회복에 좋다.  나. 매일 한 개 이상의 귤을 섭취하면 몸의 기능이 원활해지며 피가 깨끗해지고 체내의 방부제 l  강장제 l  보건제가 된다. 다. 진피는 감기나 인후병 l  지해 l  발한 l  건위 l  최유 등에 효과가 있다.  라. 귤씨는 태워 가루로 만들어 먹으면 기침 l  가래에 좋다.  마. 가래가 끓고 열이 있어 구토나 구역질이 있을 때 귤을 달여 마시면 효과가 있다.  바. 진피와 살구씨를 차 대용으로 하여 마시면 습관성 변비에 효과가 있다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :귤은 운향과에 속하는 귤나무의 열매로 인도 l  중국 l  동남아시아가 원산지이다. 우리나라는 약 570년 전부터 제주도에서 재배하기 시작했으며 현재는 따뜻한 지방에서 과수나 관상용으로 널리 재배하고 있다. 귤은 껍질을 벗겨 먹거나 주스 l  통조림 l  농축과즙 l  향료 등으로 만들어 먹으며 l  껍질은 건조시켜 약재로 쓴다
							<br/><br/>47 l 딸기 :딸기는 일반적으로 100g당 수분 92.2% l  당질 4.3g l  섬유질 1.9g l  단백질 0.9g l  지방 0.2g l  무기질 0.5g l  칼슘 13mg l  인 17mg l  철분 0.5mg l  비타민 A 16I.U l  비타민 B1 0.04mg l  비타민 B2 0.04mg l  나이아신 0.4mg l  비타민 C 99mg이 함유되어 있다. 딸기의 당분은 전화당과 서당이며 유기산이 1.1%가량 함유되어 있다. 또한 과일 중에서 비타민 C를 가장 많이 함유하고 있으며 일종의 배당체인 안토시안계 색소로 인해 빨간색을 띠고 있다 :가. 항바이러스 효과가 있다.  나. 암을 예방한다.  다. 피부가 고와진다.  라. 이뇨제 l  수축제로서 효과가 있다.  마. 혈중 콜레스테롤치를 낮추어 준다 l  :가. 초기 약국에서는 가벼운 설사 l  이뇨제 l  수렴제로 쓰였다.  나. [현대초본지]에서 류마티스성 통풍에 효과적이라고 기록되어 있다.  다. 유럽에서는 여드름 치료 l  회충 l  만성적 궤양 치료의 약으로 알려져 있다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :딸기는 장미과의 여러해살이풀로 원산지는 유럽과 미국이다. 딸기는 풀딸기 l  양딸기 l  나무딸기 l  산딸기 l  수리딸기 l  맥도딸기 l  곰딸기 l  멍석딸기 등 여러 종류가 있으며 추위에 강한 건강식품이다. 과육은 흰색 l  붉은색이 있는데 붉은 색이 맛이 좋다
							<br/><br/>48 l 레몬 :레몬은 일반적으로 100g당 수분 87.3% l  당질 9.6g l  섬유질 1.2g l  단백질 0.8g l  지방 0.6g l  무기질 0.5g l  칼슘 60mg l  인 13mg l  철분 0.2mg l  비타민 B1 0.06mg l  비타민 B2 0.03mg l  나이아신 0.2mg l  비타민 C 90mg이 함유되어 있다. 레몬의 과즙은 구연산과 비타민 C와 E가 풍부하며 칼슘함량이 많은 알칼리성 식품이다. 구연산은 레몬의 새큼한 맛의 주성분인데 산뜻한 맛을 가지고 있어 자주 식초 대용품으로 쓰인다. 또한 레몬의 비타민 C는 홍차에 전혀 없는 비타민 C를 보충시켜 주는 가장 좋은 재료이며 홍차의 고유한 풍미를 증진시켜 주기 때문에 홍차와 함께 곁들여 먹는다. 또한 레몬에는 에리오딕티올이라고 하는 비타민 P성분이 들어 있어 동맥경화 l  고혈압 예방에 효과가 있다 :가. 괴혈병 예방 및 치료에 효과가 있다. 나. 암을 예방한다.  다. 미용효과 있으며 l  감기 l  두통 l  모발의 성장 l  요도염에 효과가 있다.  라. 소화기계통을 튼튼히 하고 l  심장병 l  담에 효과가 있다 l  :가. 레몬 주스를 장기간 복용하면 이뇨 효과 l  발한 효과 l  수렴 효과 l  강장 효과가 있다. 나. 레몬즙은 햇빛 차단 로션의 역할을 한다고 널리 알려져 있다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :레몬은 운향과에 속하는 레몬나무의 열매로 하얀 오판화가 향기를 뿜으며 1년 내내 핀다. 원산지는 인도이며 지중해 연안 l  이탈리아 l  캘리포니아 등지에서 많이 재배되고 있다. 미국 캘리포니아와 이탈리아 시칠리섬이 특산지이다. 처음에는 겉껍질이 짙은 초록색인데 익으면 노란빛이 되며 향기가 좋아 여러 가지 음식에 향기를 돋구는 데 널리 쓰인다
							<br/><br/>49 l 매실 :매실은 일반적으로 100g당 수분 90.1% l  당질 7.6g l  섬유질 0.6g l  단백질 0.7g l  지방 0.5g l  무기질 0.5g l  칼슘 12mg l  인 14mg l  철분 0.6mg l  비타민 A 65I.U l  비타민 B1 0.03mg l  비타민 B2 0.05mg l  나이아신 0.4mg l  비타민 C 6mg l  베타카로틴 120㎍이 함유되어 있다. 매실은 과육이 85%를 차지하며 l  주성분은 유기산으로 구연산 l  사과산 l  호박산 l  주석산 등이 5%가량 함유되어 있는데 특히 구연산이 많아 신맛이 강하다. 이 신맛을 입맛을 돋우어 주고 l  피로회복 l  해독작용과 강한 살균효과를 지닌다. 또한 매실의 씨에는 아미그달린이라는 성분이 들어 있는데 l  효소에 의해 유독한 청산이 만들어지므로 청매를 생식하지 않아야 한다 :가. 오래된 기침과 가래를 멈추게 하고 갈증해소와 신경과민에 효과가 있다.  나. 피로회복 l  노화방지에 효과가 있다.  다. 해독작용과 강한 살균효과가 있다. 라. 식욕을 돋구어 주며 소화가 안될 때 효과가 있다.  마. 소화 l  이질에 효과가 있다 l  :가. 턱이 빠졌을 때 오매를 찧어 떡처럼 해서 턱 위에 붙이고 입을 벌리는 동작을 하면 턱이 제자리로 돌아간다.  나. 갈증이 날 때 오매 2~3개를 먹으면 효과가 있으며 l  소화가 안될 때 l  쓸개가 부어서 속이 메슥거릴 때에도 효과가 있다.  다. 매실주는 식욕증진 l  신경통 l  류머티즘 l  설사에 효과가 있다.  라. 매화차를 음용하면 얼굴빛이 윤택해지고 기미 l  주근깨 l  버짐 등이 없어진다.  마. 외용으로 사마귀나 티눈을 없애는 데도 쓴다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :매실은 장미과에 속하는 매화나무의 열매로서 식용이나 약용으로 쓰인다. 중국이나 일본이 원산지로 알려져 있으며 우리나라를 비롯한 일본 l  대만 l  중국에서 널리 재배되고 있다. 우리나라는 경남 창녕군과 전남 l  전북 l  충북 등지에서 재배하고 있다. 매실은 여름 장마철에 완숙되는데 가공 목적에 따라 수확시기가 다르다. 오매는 덜 익은 매실을 따서 껍질을 벗기고 짚불연기에 그을려 말린 것으로 한방에서 해열 l  수렴 l  지혈 l  진통 l  구충 l  갈증 예방의 약재로 쓴다. 또한 매실은 산과 유독성분이 있어 생식하지 않으며 l  매실주 l  매실잼 등에 이용한다
							<br/><br/>50 l 무화과 :  무화과는 일반적으로 100g당 수분 87.7% l  당질 10.4g l  섬유질 0.7g l  단백질 0.6g l  지방 0.1g l  무기질 0.5g l  칼슘 26mg l  인 16mg l  철분 0.3mg l  비타민 B1 0.03mg l  비타민 B2 0.03mg l  나이아신 0.2mg l  비타민 C 2mg l  베타카로틴 12㎍이 함유되어 있다. 무화과의 당분은 대부분 포도당과 과당으로 서당의 함량은 적은 편이다. 또한 단백질 분해효소인 ficin이 들어 있어 고기를 연하게 하는 연육제나 육식 후의 과일로 활용되고 있으며 소화촉진제로 유명하다. 유기산으로는 구연산 l  초산 l  사과산 등이 소량 함유되어 있다 l 가. 암을 예방하는 효과가 있다.  나. 세균과 회충등의 구제약으로 쓰이며 신경통에 효과가 있다. l  :가. 구약성서에 이스라엘 왕 히제기아가 암이라고 생각되는 혹 때문에 예언자인 이사야로 하여금 마른 무화과를 갖고 오도록 하여 회복되었다고 한다.  나. 로마의 박물학자 프리니우스는 무화과는 체력을 회복시키는 힘이 있어 장기간 몸이 약한 사람에게 좋다고 하였다. 다. 미국의 부통령 아-론 바라는 턱이 부으며 l  여드름이 악화되고 피부의 부스럼이 곪았을 때 무화과로 찜질을 했더니 다음날 증세가 완화되었다고 하였다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :무화과는 뽕나무과의 무화과나무 열매로 과실로서 가장 먼저 이용된 것 중의 하나이다. 원산지는 지중해 연안 l  소아시아 l  아라비아 l  팔레스타인이며 l  현재는 미국 l  지중해 연안 등에 걸쳐 재배되고 있다. 우리나라에서는 생식을 위해 남해안과 제주도의 일부 지역에서 재배되었다. 과일은 생식하나 말려서 먹기도 하며 술 l  양갱 l  잼 l  통조림으로 가공하기도 한다
							<br/><br/>51 l 배 :배는 일반적으로 100g당 수분 85.8% l  당질 12.3g l  섬유질 0.8g l  단백질 0.5g l  지방 0.2g l  무기질 0.4g l  칼슘 4mg l  인 35mg l  철분 0.2mg l  비타민 B1 0.04mg l  비타민 B2 0.03mg l  나이아신 0.3mg l  비타민 C 2mg이 함유되어 있다. 당질은 과당 l  포도당 l  서당인데 과당이 50%를 차지하고 있다. 배는 성숙함에 따라 섬유소가 감소되어 과육의 연화와 즙이 많아진다. 유기산은 구연산이 대부분이며 사과산 l  주석산이 소량 함유되어 있다. 배에는 페노산 l  리그닌이라는 성분으로 된 세포막이 두꺼워진 후막세포인 석세포가 있는데 이로 인해 먹을 때 까슬까슬하게 느껴진다. 주된 향기 성분은 아세트알데히드 이며 각종 알코올과 휘발산 등이 있다. 또한 효소를 많이 함유하고 있어 소화가 잘 되게 한다 :가. 소화촉진 l  이뇨 l  변비에 효과가 있다.  나. 기침과 담을 없앤다.  다. 고기요리의 자극을 완화한다.  라. 열을 다스린다.  마. 종기에 효과가 있다 l  l 가. 담이 나오는 기침에는 배즙을 내서 생강즙과 꿀을 타 먹으면 효과가 있다. 나. 심한 기침을 할 때에는 배 한 개를 썰어 양젖이나 우유를 섞어 달여 먹으면 효과가 있다.  다. 갈증이 심하거나 술 먹고 난 다음의 조갈증에 효과가 있다. 그렇지만 너무 많이 먹으면 속이 냉해져 소화력이 약한 사람은 설사를 일으키기 쉽다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :배는 능금나뭇과에 속하는 배나무의 열매로 유럽 및 서부아시아가 원산지인 서양종과 아시아 동부가 원산지인 동양종이 있다. 동양종은 한국고유종 l  일본종 l  중국종이 있는데 우리나라에서는 주로 일본에서 돌배를 기본종으로 하여 개량 육성된 일본배를 재배하고 있다. 서양종은 수분과 비타민 함량이 적으나 당분이 많아 생식보다는 가공식품으로 쓰인다
							<br/><br/>52 l 복숭아 : 백도는 일반적으로 100g당 수분 89.4% l  당질 8.9g l  섬유질 0.5g l  단백질 0.6g l  지방 0.1g l  무기질 0.5g l  칼슘 3mg l  인 13mg l  철분 0.3mg l  비타민 A 100I.U l  비타민 B1 0.03mg l  비타민 B2 0.04mg l  나이아신 0.5mg l  비타민 C 10mg이 함유되어 있다. 과육은 대부분이 수분과 당분으로 단맛이 강하지만 포도당 l  과당 l  서당이 8~10%로 레몬과 비슷한 정도이며 씨 주위가 달다. 복숭아의 새콤한 맛은 유기산이 사과산 l  구연산 l  주석산 때문이며 l  특히 황도에 많이 들어 있다. 또한 복숭아는 비타민 A와 펙틴질이 풍부한 알칼리성 식품이다. 과육에는 아스파라긴산 등 유리 아미노산이 풍부하고 에스테르와 알콜류 l  알데히드가 어울려 특유의 향기를 낸다 :가. 고혈압과 심장병에 효과가 있다.  나. 기침 l  천식 l  폐와 관련된 질환을 치료한다.  다. 혈액을 원활하게 순환시켜 어혈을 풀어준다. 월경불순이나 부인병에 좋다 l  l 가. 피부가 가렵고 건조하거나 기미나 주근깨 등에 바르면 효과가 있다. 나. 곱게 갈아 한 숟갈씩 먹으면 체내의 나쁜 피를 맑게 해주어 변비가 없어지고 대변이 윤활하게 된다.  다. 타박상으로 몸이 부었을 때나 손발이 튼 데 복숭아씨를 찧어 참기름에 개어 환부에 고약처럼 두껍게 바르면 효과가 있다. 라. 다랑어를 먹고 중독 되었을 때 싱싱한 복숭아를 껍질째 먹으면 중독 증세가 없어진다고한다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :복숭아는 장미과에 속하는 복숭아나무의 열매로 중국이 원산지인데 아시아와 유럽 l  아메리카에 전파되어 재배되고 있다. 씨는 약용으로 쓰이며 과육은 중요한 식용 과일로 쓰인다. 복숭아는 과육이 흰 백도와 노란색인 황도가 있는데 제철과일로 신선하게 먹기에는 수분이 많고 부드러운 백도가 좋으며 황도는 살이 단단하여 통조림으로 가공하는 데 좋다
							<br/><br/>53 l 사과 :사과는 일반적으로 100g당 수분 86.4% l  당질 10.3g l  섬유질 1.4g l  단백질 1.4g l  지방 0.3g l  무기질 0.2g l  칼슘 4mg l  인 9mg l  철분 1.2mg l  비타민 B1 0.02mg l  비타민 B2 0.01mg l  나이아신 2.8mg l  비타민 C 2mg이 함유되어 있다. 사과의 주성분은 당분 l  유기산 l  펙틴이다. 당분은 과당과 포도당이 대부분이며 l  유기산은 사과산이 90%이상 들어 있으며 구연산 l  주석산 등도 포함되어 있다. 또한 펙틴이 풍부하여 정장작용을 하고 장 안에서의 이상 발효도 방지하는 효과가 있다. 그 밖에 칼륨이 많은 알칼리성 식품으로 혈압을 낮추어 주는 작용을 한다. 사과껍질을 벗겨 공기 중에 두면 갈변 현상이 일어나는데 이는 클로로겐산과 폴리페놀류 성분 때문이다. 따라서 변색을 방지하려면 소금이나 비타민 C l  아황산염류 용액에 담가야 한다 :가. 피로회복 l  식욕 증진 l  정장 작용 l  설사를 멈추게 하는 효과가 있다.  나. 심장 등 순환계를 튼튼하게 한다.  다. 혈압을 내리고 혈당을 안정시킨다. 라. 감기를 치료한다.  마. 암을 예방한다 l  :가. 급성장염이나 변비 l  소화 불량 등에 사과를 날 것으로 먹으면 효과가 있다.  나. 덜 익은 사과를 따서 얇게 썰어 그늘에서 말린 다음 달여 마시면 신장병에 좋다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 l 사과는 장미과의 낙엽교목으로 원산지는 중앙아시아이다. 능금나무의 개량종으로 현재 재배되고 있는 품종은 유럽과 서부 아시아에 분포된 원생종 중에서 개량된 것이다. 한랭한 지방에서 잘 자라는데 우리나라에서는 황주와 대구가 유명하였으나 요즘은 충주와 예산 등지에서도 많이 재배하고 있다. 사과의 성질은 따뜻하며 맛은 시고 달다.
							<br/><br/>54 l 살구 : 살구는 일반적으로 100g당 수분 91.4% l  당질 6.0g l  섬유질 0.8g l  단백질 1.0g l  지방 0.2g l  무기질 0.6g l  칼슘 9mg l  인 23mg l  철분 0.9mg l  비타민 A 2 l 200I.U l  비타민 B1 0.02mg l  비타민 B2 0.04mg l  비타민 C 9mg이 함유되어 있다. 살구는 주성분이 당분으로 주로 서당이며 l  유기산은 구연산과 사과산을 함유하고 있어 산미가 강하다. 무기질은 칼륨이 대부분이며 비타민은 A와 다량의 카로틴 l  소량의 리코펜이 함유되어 있어 과실류 가운데 풍부한 편이나 비타민 C는 적다. 그리고 약재로 사용되는 살구씨에는 아미그달린 배당체와 지방유가 풍부하게 들어 있다. 살구씨에서 추출된 성분은 귀중한 약재와 화장품 l  비누 등의 원료로 이용되고 있다 :가. 장의 유동 작용을 촉진시켜 변비를 치료한다.  나. 진해 l  거담을 제거하는데 효과가 있다. 다. 담배와 관련된 암을 억제한다 l  :가. 민간에서 말린 살구는 통리성이 있어 설사제로 이용한다.  나. 한방에서 진해 l  거담제로 이용하는데 보통 기관지염 l  폐결핵 l  기침 l  진통에 효과가 있다.  다. 목에 가래가 있을 때 l  가슴이 답답할 때 l  몸이 붓고 숨이 찰 때 l  개고기를 먹고 체했을 때 효과가 있다.  라. 얼굴에 주근깨나 검버섯 l  기미가 나타나고 피부색이 나쁠 때 미용약으로 효과가 있다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :살구는 앵두과에 속하는 낙엽교목으로 맛은 시고 달다. 원산지는 중국이며 우리나라를 비롯한 일본 l  중국 l  및 유럽 등지에 널리 분포되어 있다. 살구의 과육은 식용으로 쓰고 씨는 행인이라 하여 약재로 쓰인다. 산미가 강하므로 날 것으로 먹기에는 좋지 않다
							<br/><br/>55 l 석류 :석류는 일반적으로 100g당 수분 81.1% l  당질 16.8g l  섬유질 0.8g l  단백질 0.6g l  지방 0.2g l  무기질 0.5g l  칼슘 8mg l  인 15mg l  철분 0.1mg l  비타민 B1 0.03mg l  비타민 B2 0.03mg l  나이아신 0.3mg l  비타민 C 10mg이 함유되어 있다. 석류의 과육의 주성분은 당질로 대부분이 전화당이며 유기산은 구연산이 1.5% 함유되어 있다. 비타민은 비교적 적은 편이고 줄기와 뿌리의 껍질에는 휘발성 알카로이드인 펠레티에린 l  슈우도펠레티에린 l  열매 껍질에는 탄닌 l  점액질 l  고미질 l  꽃에는 퓨니신이 l  씨에는 퓨니신산의 글리세라이드가 들어 있다 :가. 고혈압과 동맥경화를 예방한다. 나. 설사 l  이질 l  대하증에 효과가 있다.  다. 각종 기생충에 대해 조충구제약으로 쓰인다.  라. 위 속의 이상발효현상을 억제하는 효과와 정장효과가 있다 l  :가. 열매는 설사 l  부인들 냉병 l  피부 부스럼 l  촌백충이 있을 때 사용되고 l  껍질은 설사 l  이질 l  대하증 치료와 수렴제로 이용된다.  나. 코피가 날 때 석류의 꽃을 가루로 하여 콧 속에 불어 넣으면 지혈이 된다.  다. 석류를 달인 즙은 입 안의 냄새를 없애고 인후카타르 l  편도선염에 좋다.  라. 무좀이나 종기에 뿌리 껍질을 짓찧어 바르면 효과가 있다.  마. 잎이나 과실을 달여서 마시면 치통을 멈추게 한다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 l 석류는 석류나무과에 속하는 석류나무의 열매로 서부아시아와 인도 서북부지역이 원산지이다. 우리나라에서는 주로 정원목과 과수를 목적으로 중부와 남부지방에서 재배하고 있다. 석류는 감과와 산과로 나뉘는데 감과는 단맛이 있으며 산과는 신맛이 있다. 석류의 과육은 식용으로 쓰이며 뿌리와 과실껍질은 약재로 쓰인다.
							<br/><br/>56 l 오디 : 오디는 일반적으로 100g당 수분 82.5% l  당질 7.4g l  섬유질 5.7g l  단백질 2.1g l  지방 1.5g l  무기질 0.8g l  칼슘 4mg l  인 33mg l  철분 1.2mg l  비타민 A 82I.U l  비타민 B1 0.03mg l  비타민 B2 0.04mg l  나이아신 0.2mg l  비타민 C 2mg이 함유되어 있다. 오디의 당질은 대부분이 포도당과 서당이며 펜토산 l  갈락탄도 소량 들어 있다. 또한 비타민과 무기질은 고루 들어 있으며 유기산이 적어 신맛이 거의 없다. 그밖에 주요 지방산은 리놀레산과 팔미트산이다. 오디는 딸기나 포도에 비해 단백질 함량이 4~5배 많으며 산딸기에 비해 섬유소 l  철 비타민 B1이 풍부한 고영양 과실이다 :가. 간장과 신장기능을 향상시킨다.  나. 뇌의 혈액순환을 증진시켜 정신안정 l  피로회복 l  기억력 증강 등에 효과가 있다.  다. 귀와 눈을 밝게 해준다.  라. 기침 l  천식에 효가 있다 l  l 가. [동의보감]에 오디로 담근 술을 상심주라 하여 불로장수의 약주로 권하고 있다. 나. 장기 복용시 뼈가 튼튼해지고 머리카락이 검어진다고 한다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :오디는 뽕나무과에 속하는 뽕나무 중 암나무의 열매로 동부아시아가 원산지이다. 현재는 우리나라를 비롯한 중국 l  일본 등지에서 널리 분포되어 있다. 오디의 종류는 백상실과 흑상실이 있으며 식용이나 침출주 제조용으로 쓰인다. 그밖에 뽕나무의 뽕잎은 누이의 먹이로써 이용되고 뽕나무의 뿌리와 껍질은 이뇨제 등으로 이용된다
							<br/><br/>57 l 유자 :유자의 껍질인 과피는 일반적으로 수분 79% l  단백질 12% l  지질 0.2% l  당질 17% l  섬유질 1 l 8% l  무기질 0.5%를 함유하고 있으며 l  과육은 일반적으로 수분 84% l  단백질 1.4% l  지질 1% l  당질 12% l  섬유 0.06% l  무기질 0.6%를 함유하고 있다. 비타민 C와 비타민 B복합체 그리고 비타민 A의 모체인 카로틴도 풍부하며 칼슘이나 칼륨 등의 무기질도 풍부한 알칼리성 식품이다. 또한 구연산이 있어 새콤하고 신맛이 강하며 피로회복 l  소화와 식욕촉진의 효과가 있다. 배당체로서 헤스페리딘 성분이 있어 비타민 P로서 작용한다. 또한 유자의 쓴맛을 내는 리모노이드는 식품가공의 장애요인이 되고 있으며 의학적으로는 항암효과가 있다고 알려져 있다 :가. 콜레스테롤의 수치를 낮추어 준다.  나. 피부의 노화를 방지한다.  다. 암을 예방한다.  라. 감기 l  관절성 신경통 l  중풍에 좋다.  마. 간의 작용을 강하게 한다 l  :가. 유자 백 개 정도로 차를 만들어 먹으면 위와 장의 나쁜 기운이 빠져나간다고 하였다. 나. 동지에 유자를 달여서 목욕을 하면 감기에 걸리지 않는다고 하였다. 다. 민간에서 목구멍에 가시가 걸렸을 때나 류머티즘 신경통이 있을 때 유자를 달여서 복용하였다.  라. 태워서 짓이겨 티눈이나 사마귀에 붙이면 1주일 내에 효과가 있다.  마. 유산했을 때나 산후 복통에 유자껍질을 달여 마시면 효과가 있다. 바. 유자 껍질은 알코올의 주독을 풀어주며 머리가 아프거나 마른기침을 할 때 l  위산 결핍증에 효과가 있다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 l 유자는 감귤류의 일종이며 운향과에 속하는 유자나무의 열매로 티베트가 원산지로 알려져 잇다. 우리나라에는 중국을 통해 전파되었으며 현재 전라남도와 경상남도 지역에서 많이 재배되고 있다. 유자는 추운지방에서 잘 자라는 특성이 있으며 껍질이 많은 것이 특징이다.
							<br/><br/>58 l 자두 :자두는 일반적으로 100g당 수분 84.7% l  당질 12.6g l  섬유질 1.1g l  단백질 0.5g l  지방 0.9g l  무기질 0.2g l  칼슘 8mg l  인 11mg l  철분 1.3mg l  비타민 B1 0.02mg l  비타민 B2 0.03mg l  나이아신 0.8mg l  비타민 C 5mg이 함유되어 있다. 과육의 대부분은 당질로 주성분은 포도당 l  과당 l  서당이며 펙틴도 소량 들어 있다. 유기산으로 주로 사과산이며 비타민은 적은 편이다. 또한 자두는 떫은맛을 내는 탄닌을 함유하고 있으며 자두의 종자에는 인을 함유하고 있다 l 대장 기능을 완화하는 효과가 있다. l  l 가. 소량의 술에 숙취가 되거나 간이 답답해서 몸이 가려운 때 갑자기 발기력이 약해졌을 때 하루에 10개 정도의 자두를 먹으면 좋다.  나. 담배 연기로 나빠진 환경 속에 있으면 열이 나고 목이 아리는데 자두나 복숭아의 씨를 뺀 과육을 쿠킹 호일에 싸서 구워 먹으면 즉시 치료된다.  다. [동의보감]에서 자두 큰 것을 일주일 동안 소금에 절여 두었다가 햇볕에 말린 후 식사 때 1개씩 먹으면 위와 숙취해소에 좋다고 하였다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :자두는 장미과에 속하는 자두나무의 열매로 원산지는 중국이다. 현재는 유럽계 l  미국계 l  일본계 자두가 있으며 l  자두의 종류는 30여 종인데 이용되는 것은 18종이다. 자두의 과육은 핵과류 중에서 그 비율이 가장 높다
							<br/><br/>59 l 포도 : 포도의 성분은 품종과 성숙도에 따라 차이가 있다. 포도는 일반적으로 100g당 수분 86.4% l  당질 11.1g l  섬유질 0.4g l  단백질 1.0g l  지방 0.8g l  무기질 0.3g l  칼슘 12mg l  인 20mg l  철분 0.5mg l  비타민 B1 0.4mg l  비타민 B2 0.25mg l  나이아신 0.3mg l  비타민 C 4mg이 함유되어 있다. 포도의 당질은 주로 포도당과 과당으로 단맛의 원인이며 녹색일수록 포도당이 많다. 유기산은 사과산과 주석산이 들어 있으며 신맛이 나며 과피에는 펙틴 l  탄닌 등이 함유되어 있다. 이 탄닌은 적포도주의 떫은맛의 원인 성분이다. 또한 포도는 칼슘 l  칼륨 l  철 등이 많아 알칼리성 식품이나 과실 중에서 비타민의 함유량은 적은 편이다. 자주색의 과피 색소는 안토시안계로 청량음료와 당과류를 비롯한 여러 식품에 쓴다 :가. 항암 l  항바이러스 효과가 있다. 나. 충치를 예방한다.  다. 기혈을 보하고 위와 근육과 뼈를 튼튼히 한다. 라. 이뇨작용과 기침 l  건위 l  강장 지갈 등에 효과가 있다 l  :가. 포도의 뿌리와 잎을 하루에 20~40g 달여 먹으면 이뇨제가 되고 신경통 l  관절통에 좋다.  나. 포도 잎사귀 말린 것을 하루 12~20g 달여 먹으면 이뇨작용을 해 부기를 빼며 임신중 입덧으로 토하는데도 좋다. 다. 포도주는 알칼리성 식품으로 강장제 l  흥분제 l  식욕증진제가 된다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :포도는 포도과에 속하는 포도나무의 열매로서 원산지는 지중해와 소아시아이다. 비가 많고 습도 높은 곳에서 잘 자라지 않아 프랑스를 중심으로 한 남부 유럽이 적지이다. 포도의 품종은 전 세계적으로 약 15만 종이 있으며 우리나라에서는 캄벨어리 l  델라웨어마드캇 l  콩코드 l  거봉 등이 재배되고 있다. 포도의 성질은 따뜻하고 맛은 달며 떫고 시며 독이 없다
							<br/><br/>60 l 조개류 :조개류는 단백질의 아미노산 조성이 곡류에 부족한 라이신 l  히스티딘이 많이 함유되어 있어 소화흡수가 잘 된다. 또한 글리코겐이 많은 양 들어 있어 구수한 맛이 난다. 조개류에는 호박산이라는 특수 성분이 들어 있으며 특히 간질환과 담석증에 효과가 있는 식품이다. 조개류는 종류에 따라 영양성분의 차이가 조금 있으나 대표적인 굴과 바지락의 영양성분을 보면 l  굴은 비타민류가 풍부하고 철 l  구리 l  망간 l  요오드 l  칼슘 l  인 등 무기질이 많이 들어 있다. 간장을 비롯한 내장전체를 강화시켜주는 효과가 있는 영양적으로 매우 우수한 식품이다. 또한 굴에는 특수성분으로 타우린이 들어 있어 빈혈 l  당뇨병을 예방하는 효과가 있다. 굴에는 일반적으로 100g당 수분 84.7% l  당질 4.0g l  단백질 7.6g l  지방 1.6g l  무기질 1.6g l  칼슘 148mg l  인 113mg l  철분 6.1mg l  비타민 A 257I.U l  비타민 B1 0.51mg l  비타민 B2 0.4mg l  나이아신 3.7mg을 함유하고 있다. 바지락은 비타민류 l  나트륨 l  인 l  칼슘 l  미네랄이 풍부하게 함유하고 있어 소화 및 간장기능에 효과적이며 특히 바지락은 아연이 풍부하여 병이나 상처의 회복을 빠르게 하는 작용을 한다 :가. 혈중 콜레스테롤치를 낮추어 준다. 나. 강장 l  강정제로서 효과가 있다.   다. 간질환 l  담석증에 효과가 있다.  라. 소화흡수를 돕는다.  마. 암을 예방한다 l  :가. 바지락 국물을 계속 삶아 섭취하면 황달에 효험이 있다.  나. 식은 땀이 나는 사람은 굴을 2~3일간 계속 섭취하면 효과가 있다.  다. [본초]에서는 오장을 보하고 갈증을 없애고 소화불량 l  주독 l  부인의 혈전 등에 바지락을 끓여 먹으면 좋다고 기록되어 있다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :조개류에는 굴 l  바지락 l  피조개 l  대합 l  홍합 l  백합 l  가막조개 l  전복 l  소라 등 종류가 다양하다. 우리나라 사람들이 즐겨먹는 대표적인 조개류는 굴과 바지락이다. 굴은 굴과에 속하는 연체동물을 통틀어 일컫는 것으로 굴조개라고도 하며 한자어로 모려 l  석화라고도 부른다. 주로 조간대의 바위에 부착하여 서식하고 열대에서 한대에 걸쳐 널리 분포되어 있다. 바지락은 백합과의 연체동물로 조간대의 진흙이나 모래나 진흙이 섞인 곳 l  특히 물이 얕고 맑은 곳에서 서식하는데 어릴 때는 담황색을 띠며 성숙하면 검정색이 많아진다
							<br/><br/>61 l 게 :게는 일반적으로 수분 72.3% l  당질 2.9g l  단백질 22.0g l  지방 0.5g l  무기질 2.3g l  칼슘 60mg l  인 230mg l  철분 3.0mg l  비타민 B1 0.01mg l  비타민 B2 0.02mg을 함유하고 있다. 게는 필수아미노산이 풍부한 고단백식품이며 l  지방 함량이 적어 담백하고 소화도 잘 되는 저지방식품이다. 게에는 글루타민산을 중심으로 글리신 l  이르기닌 l  구아닌산 등의 감미성분이 함유되어 있다. 게에는 간장강화를 돕는 타우린이 100g 중 450mg까지 함유되어 있어 동맥경화 l  심장병 l  고혈압 l  간장병에 좋다. 게는 산성식품이므로 채소류 등과 함께 섭취해야 좋다 :가. 심장과 뇌에 좋다.나. 성인병과 비만 예방에 효과가 있다. 다. 류머티즘관절염 l  천식 l  알레르기 l  두통 l  마른버짐 l  암 등에 유익하다 l  l 가. [본초비요]에 게는 소화기능을 강화시켜 소화가 잘 되게 하고 나쁜 피를 흩어버리고 열을 없애는 한편 경맥을 통하게 하고 근육과 뼈를 도와준다고 기록되어 있다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 l 게는 갑각류 십각목의 단미류에 속하는 절족동물로 바닷게와 담수에서 자라는 민물게가 있다. 바닷게와 민물게 모두 식용이 가능하나 민물게는 폐디스토마의 중간숙주이므로 날로 먹거나 게장으로 해서 먹으면 폐디스토마에 걸릴 위험이 있으므로 주의해야 한다.
							<br/><br/>62 l 새우 :대하는 일반적으로 수분 80.4% l  단백질 17.8g l  지방 0.6g l  무기질 0.6g l  칼슘 234mg l  인 63mg l  철분 1.5mg l  비타민 A 50I.U l  비타민 B1 0.02mg l  비타민 B2 0.03mg l  나이아신 2.1mg을 함유하고 있다. 새우는 필수아미노산이 풍부한데 그 중 글리신과 베타인이 새우의 독특한 맛을 내는 성분이다. 단백질은 새우 머리 부분의 노란 뇌와 등에 있는 길고 노란 물질인 정소 l  찌면 붉어지는 액체인 간과 난자 등에 풍부하다. 또한 새우는 칼슘 l  무기질 l  비타민이 풍부하게 함유되어 있는 영양식품이다. 단백질이 풍부할수록 새우 맛이 좋다 l 가. 혈중 콜레스테롤 수치를 내린다. 나. 심장병 예방과 시력과 피로회복에 좋다.다. 뇌를 자극하여 기분 전환과 정신활동을 고양시켜준다. l  :가. [민간요법사전]에 회충 l  치통 l  얼굴에 생긴 부스럼 l  옴으로 가려운 데에 효과가 있으나 많이 섭취하면 오히려 혈액장애를 초래한다고 기록되어 있다.나. [식료본초]에 새우를 짓찧어 종기에 붙이면 효과가 있다고 기록되어 있다.다. [본초강목]에 새우국은 뭉친 피와 두창을 다스리고 기력을 돕는다고 기록되어 있다.라. [본초비요]에 새우 1근에 생강 l  파 l  된장을 넣고 끓이면 효과가 있다고 기록되어 있다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :새우는 갑각류 십각모과 장미류에 속하는 절족동물로서 참새우 l  대하 l  보리새우 등 종류가 많으며 전 세계에서 널리 애용되고 있다. 새우는 식용으로도 쓰이며 육식 물고기의 주요 먹이감이다. 그러나 새우는 한 번에 10만 이상을 산란하는 왕성한 번식력을 가지고 있어 멸종되지 않고 있다. 그 중 큰 새우를 대하 또는 해하라 한다. 중국의 의학서 [본초강목]에는 새우는 양기를 왕성하게 하는 식품으로 기록되어 있다
							<br/><br/>63 l 청어 :청어는 일반적으로 수분 72.0% l  당질 0.3g l  단백질 18.0g l  지방 8.5g l  무기질 1.2g l  칼슘 31mg l  인 163mg l  철분 3.0mg l  비타민 A 100I.U l  비타민 B1 0.01mg l  비타민 B2 0.2mg l  나이아신 50mg을 함유하고 있다. 청어는 소화흡수가 잘 되는 질 좋은 단백질을 풍부하게 함유하고 있으며 지방질도 많아 병후 회복기에 좋은 식품이다. 또한 곡류에 부족한 아미노산을 보충해 주기에 좋으며 청어의 간에는 비타민 B12가 들어 있어 빈혈이 있는 사람에게 좋다. 칼슘 l  철 l  비타민 B2가 풍부하고 맛이 좋아 많이 애용되고 있으나 불포화지방산 함량이 높아 빨리 신선도가 떨어지는 단점이 있다 :가. 심장병과 뇌졸중의 위험을 줄인다. 나. 항혈전작용을 하며 l  몸에 좋은 HDL콜레스테롤을 높인다.다. 뇌의 신경전달물질을 증가시켜 정신이 맑아지고 민첩한 행동을 하게 한다 l  l  l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :청어는 청어과에 속하며 바다에 사는 물고기로 빛깔이 청색이어서 청어라는 이름으로 불리게 되었다. 일본 l  중국 북부 l  북양 l  북아메리카의 태평양 연안에 걸쳐 분포하고 있으며 우리나라는 경상북도 이북의 동해안 특히 포항 영일만이 산란장이다. 최근에는 수온변화 등의 자연조건의 변화로 인해 감소 추세에 있다. 청어는 생것을 비웃 l  말린 것을 관모 l  한방에서는 연 또는 비어라고 하는데 바닷물고기 중에서 맛이 우수하다. 청어가 산란하기 전인 3~4월경에 가장 맛이 좋다. 소금구이 l  식초절임 l  찜 l  튀김 등의 요리와 염장품 l  건조품 l  훈제품 등으로 가공되어 애용되고 있다
							<br/><br/>64 l 우유 :우유는 일반적으로 수분 88.7% l  당질 4.5g l  단백질 2.9g l  지방 3.2g l  무기질 0.7g l  칼슘 100mg l  인 90mg l  철분 0.1mg l  비타민 A 110I.U l  비타민 B1 0.03mg l  비타민 B2 0.15mg l  나이아신 0.1mg l  레티놀 27㎍ l  베타카로틴 11㎍을 함유하고 있다. 우유에 들어 있는 단백질은 카제인이 78%로 사람에게 꼭 필요한 8가지의 필수아미노산을 모두 가지고 있어 매우 우수하다. 또한 3%이상 들어 있는 지질은 미립자의 형태로 잘 유화되어 있어 소화흡수가 잘 된다. 우유의 당질은 주로 유당으로 4~5% 들어 있는데 주로 포도당과 갈락토오즈로 뇌조직의 발육에 좋다. 비타민 역시 동물의 성장에 필요한 거의 모든 비타민을 골고루 함유하고 있다. 우유는 한 가지만으로도 거의 완전한 영양 가치를 갖는 이상적인 식품이다. 그러나 아연의 함량은 비교적 적다 :가. 암을 예방한다. 나. 만성기관지염의 걸릴 위험을 낮춘다.다. 충치와 골다공증 l  소화성궤양을 예방한다.라. 혈중 콜레스테롤 수치를 낮추어 준다.마. 감염과 설사를 완화시킨다. 바. 정신적 에너지를 높인다 l  l 가. [경험방]에는 구토에 우유 두 홉에 생강즙 반 홉을 타서 따끈하게 데워 마시면 효과가 있다고 기록되어 있다.나. [본초]에는 우유는 맛이 달고 독이 없어 허를 보하고 갈증을 멈추게 하며 피부를 윤택하게 하고 심장과 폐를 보하고 열독을 풀어준다고 기록되어 있다. 다. [명의 별록]에 우유는 허약한 몸을 보하고 갈증을 덜어준다고 기록되어 있다.라. [일화자본초]에 우유는 심폐를 기르고 열옥을 풀며 피부를 윤택하게 해준다고 기록되어 있다.마. [본초강목]에 우유는 구토와 구역질을 다스리고 위장을 좋게 하며 황달을 없앤다고 기록되어 있다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 l 우유는 젖소의 유선으로부터 분비되는 액체로 특유의 향기와 감미를 지니고 있다. 유즙에는 카제인이 콜로이드 상태로 분산되어 있으므로 우유는 백색의 불투명한 색을 띤다.
							<br/><br/>65 l 요구르트 :요구르트는 일반적으로 수분 80.0% l  당질 15.5g l  단백질 3.5g l  지방 0.1g l  무기질 0.9g l  칼슘 120mg l  인 100mg l  철분 0.1mg l  비타민 B1 0.03mg l  비타민 B2 0.15mg l  나이아신 0.1mg을 함유하고 있다. 요구르트는 유당이 1.7% 함유되어 있고 젖산이 0.6% 들어 있다. 또한 영양가가 높은 유단백질 l  무기질류 l  비타민류가 함유되어 있다. 우리가 마시는 요구르트는 젖산 발효를 시킨 것으로 유럽제품에 비해 신맛이 적고 단맛이 강하며 소화흡수율이 좋다. 또한 요구르트는 살아있는 젖산균으로 인해 장내 비피더스균의 증식을 활발히 하고 유해균을 감소시킴과 더불어 장염비브리오 등 병원체의 증식을 억제시킨다 l 가. 설사를 진정시키거나 변비를 완화시킨다.  나. 장내에서 자연적으로 항생물질을 방출한다.  다. 위를 보호한다.  라. 혈중 콜레스테롤치를 낮춘다.  마. 트리프트아민을 가지고 있어 뇌를 자극한다. l  l 가. 요구르트를 하루에 세 컵 마시면 혈중 콜레스테롤이 감소된다.  나. 매일 탈지유 요구르트를 1/3가량 유아에게 먹이면 설사가 치료된다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :요구르트는 터키명으로 탈지유 l  환원 우유 l  균질화 전유 등을 원료로 하여 살균한 다음 젖산균의 순수 배양을 첨가하여 일정 온도로 유지 l  발효 l  응고시킨 식품이다. 오래전부터 많은 지방에서 음용되어 왔으며 지역에 따라 발효유의 양식이 모두 다르며 이에 따라 이름도 다양하다
							<br/><br/>66 l 올리브기름 :올리브피클은 일반적으로 수분 73.1% l  당질 1.8g l  섬유질 5.0g l  단백질 0.1g l  지방 15.0g l  무기질 4.1g l  칼슘 60mg l  인 5mg l  철분 0.3mg l  비타민 A 170I.U l  비타민 B1 0.01mg l  비타민 B2 0.02mg l  나이아신 12mg l  비타민 C 310mg을 함유하고 있다. 지방산은 불포화지방산인 올레인산이 대부분이며 포화지방산과 필수지방산인 리놀렌산을 함유하고 있다 l 가. 심장병과 암의 위험을 낮추어 준다.  나. 혈압을 내리게 하는 효과가 있다.  다. 세포의 노화를 억제한다.  라. 가벼운 완화작용이 있다. l  l 하루에 4~5 숟가락 정도의 올리브기름을 먹으면 심장발작을 경험한 환자에게 좋다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :올리브는 물푸레나뭇과의 올리브나무의 열매로 올리브기름은 올리브 열매로부터 압착법에 의해 채취한 기름이다. 지중해 연안 l  미국 등지에서 주로 재배하고 있다
							<br/><br/>67 l 차 :일반적으로 차에는 커피보다 카페인과 탄닌 성분이 많이 함유되어 있다. 녹차는 단백질 함량이 많을수록 l  홍차는 단백질 함량이 적을수록 차의 제조에 적합하다.  차의 단백질은 알부민 l  글로불린 l  글루텔린이며 아미노산이 10여 종 들어 있고 테아닌이 60% 들어 있어 단맛이 난다. 탄수화물은 대부분 설탕 l  포도당 l  과당이며 덱스트린 l  펙틴 l  아라반 l  갈락탄 등도 소량 함유되어 있다. 유기산으로는 옥산산이 함유되어 있으며 l  비타민 A l  B1 l  B2 l  나이아신의 함량도 많다. 무기질은 칼륨이 대부분이며 인이 15%를 차지하고 있다. 녹차는 일반적으로 100g당 수분 7.7% l  당질 53.6g l  섬유질 9.6 l  단백질 28.3g l  지방 4.8g l  무기질 5.6g l  칼슘 245mg l  인 415mg l  철분 18.9mg l  비타민 A 14 l 000I.U l  비타민 B1 0.38mg l  비타민 B2 1.24mg l  나이아신 4.6mg l  비타민 C 2.3mg l  베타카로틴 8 l 400㎍을 함유하고 있다 :가. 피로회복에 좋다.  나. 항바이러스 l  항세균 작용이 있다. 다. 충치를 예방한다.  라. 암 l  노화 l  심장병을 예방한다.  마. 모세혈관을 튼튼하게 하고 동맥경화를 억제한다 l  :가. 중국에서는 차를 피로회복과 마음과 눈을 맑게 해주는 약으로 4 l 000년 동안 써왔다. 나. 불가에서는 오랜 시간 동안의 참선과 묵상을 하기 위해 차를 이용해 졸음을 쫓았다. 다. 고대 희랍에서는 신선한 잎으로 우려낸 차가 천식 l  감기 l  기관지염에 효과가 있다고 하였다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :차나무는 후피향 나무과에 속하는 상록활엽관목으로 어린 잎은 차의 원료로 쓰는데 차의 제법이나 차의 상태에 따라 불발효차 l  반발효차 l  발효차 l  가공차로 분류된다. 원산지는 동부아시아이며 우리나라를 비롯한 일본 l  중국 l  인도에서 재배되는데 우리나라는 전남 l  전북 l  경남지역이 특산지이다
							<br/><br/>68 l 커피 :커피는 일반적으로 수분 3.2% l  당질 67.2g l  단백질 19.6g l  지방 0.7g l  무기질 9.3g l  칼슘 220mg l  인 320mg l  철분 8.3mg을 함유하고 있다. 커피에는 특수성분인 카페인과 탄닌이 들어 있는데 탄닌의 주성분은 클로로겐산으로 볶거나 가열하면 감소된다. 커피에는 아미노산이 골고루 함유되어 있는데 그 중 글루탐산 l  아스파르트산 l  바린 등이 많으며 l  이들 아미노산은 볶는 동안 감소하며 갈변 반응를 일으키며 향기를 낸다. 지방은 팔미트산 l  리놀렌산이 대부분이며 스테아르산 l  올레산도 소량 함유되어 있다. 이밖에도 500여종 이상의 물질이 함유되어 있어 커피 특유의 향과 맛을 낸다 :가. 카페인은 흥분 l  강심 l  이뇨 l  교감신경 자극 l  피로회복 l  소화촉진 등의 작용을 한다.  나. 체중감소 l  지구력 향상 l  구취 l  충치예방 l  숙취 방지 및 해소 l  동맥경화 억제 등의 작용을 한다.  다. 천식 l  알레르기성 비염을 완화시킨다 l  l 가. 정신을 자극하는 작용과 호흡기질환의 치료제로 널리 알려졌다.  나. 1859년 에덴바라 의학 잡지에는 ‘천식에 가장 좋은 치료약의 하나는 짙은 커피이다. 오랫동안 알레르기성 기관지천식의 치료제로 선택된 것은 블랙 모카 커피다’라고 기록되어 있다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :커피는 꼭두서니과에 속하는 커피나무의 열매로서 이디오피아가 원산지이다. 브라질 l  자바 l  아프리카 등지에서 많이 재배되고 있는 열대작물이다. 커피는 많은 품종과 변종이 있는데 보통 재배종으로 아라비카 커피 l  리베리카 커피 l  로부스타 커피 등이 있으며 l  이 중 이디오피아산의 아라비카 커피가 가장 널리 재배되고 있다. 또한 커피는 입자의 크기에 따라 레귤러 l  드리프 l  파인으로 분류되는데 드립이 가장 많은 비중을 차지하고 있다. 인스턴트 커피는 커피의 추출액을 분무 건조 혹은 동결 건조한 것이다
							<br/><br/>69 l 포도주 : 포도주는 일반적으로 수분 86.8% l  당질 0.7g l  단백질 0.3g l  무기질 0.2g l  칼슘 15mg l  인 8mg l  철분 0.8mg을 함유하고 있다. 이처럼 포도주는 영양성분은 우수하지 않으나 포도주를 가리켜 생명의 물이라고 불어왔다. 적포도주는 백포도주보다 비타민과 칼슘의 함량이 많으며 당분의 함량이 3배 정도 적다. 포도주에는 알코올이 10%가량 들어 있어 혈액순환을 원활하게 하며 과실주이기 때문에 곡류나 육류와 곁들여 섭취하면 건강에 좋다 l 가. 강력한 살균 효과가 있다.  나. 심장병을 예방한다.  다. 암을 예방한다. l  :가. 고대 그리스에서는 상처를 치료하는 데 사용되었으며 l  이집트에서는 관장약으로 사용되었다.  나. 고대인들은 이뇨작용 l  혈액순환 l  조충구제 l  식욕부진 l  불면증 l  기침 등에 도움을 주기 위해 마셨으며 분만시 마취제로 이용하였다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :  포도주는 과실을 원료로 하여 제조한 술로 유럽계 민족이 즐겨왔으며 원래 요리에 곁들여 마시는 술인데 현재는 조미료 l  향신료로도 이용한다. 포도주용 포도는 당분이 많고 유기산이 적은 것이 좋다. 포도주의 종류는 크게 적포도주와 백포도주가 있으며 적포도주는 껍질과 함께 과즙을 발효시키기 때문에 압착을 하지 않으나 백포도주는 압착의 과정을 거친다. 음용시 적포도주는 15~18℃가 적정하며 백포도주는 5~10℃가 알맞다. 적포도주는 육류에 l  백포도주는 생선에 곁들여 먹으면 좋다
							<br/><br/>70 l 결명자 :결명자의 잎에는 캠페린 l  종자에는 베타-시토스테롤 l  올레산 l  리놀레산 l  에모딘 l  카로틴 등이 함유되어 있다 l 가. 간을 보호하고 눈을 밝게 한다.   나. 콜레스테롤 수치를 낮추어 준다.  다. 배변을 원활하게 한다. l  l 가. 말린 결명자의 잎을 삶아서 목욕할 때 넣으면 혈액순환이 잘 되고 정신이 맑아진다.  나. 입 안이 헐었을 때 결명자를 진하게 우려서 10분 이상에 입안에 물고 있다가 뱉어버리면 효과가 있다.  다. 베개나 이불 속에 결명자를 넣어 두면 두통이나 어지럼증에 좋다.  라. 벌레에 쏘였을 때 잎의 생즙을 바르면 낫는다.  마. 야외 천막 주위에 결명자 가루를 뿌려 두면 뱀이 침범하지 못한다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 : 결명자는 차풀과에 속하는 한해살이풀로 인가 근처나 산과 들에서 자란다. 원산지는 멕시코 등 북아메리카 지역이며 현재는 전 세계에서 재배되고 있다. 차 l  약용 l  나물 등으로 이용되며 특이한 냄새와 맛이 있다. 여름에 발육이 왕성하기 때문에 따뜻한 곳에서 자란 씨앗이 좋다
							<br/><br/>71 l 구기자 :구기자에는 수분 12.5% l  당질 47.0g l  단백질 14.6g l  지방 10.7g l  섬유질 10.2g l  회분 5.0g l  칼슘 49g l  인 259mg l  철 14.7mg l  나이아신 0.7mg l  비타민 C 11mg 이 함유되어 있으며 l  카로틴 l  베타인 등을 함유하고 있다 l 가. 자양강장제로서 작용한다.  나. 해열진통제로서 작용한다.  다. 동맥경화를 예방한다.  라. 간세포 생성을 촉진한다.  마. 병적인 갈증을 억제한다.  바. 폐를 강하게 하며 신장병에 좋다. l  :가. 구기열매로 술을 빚어 매일 한두 잔씩 마시면 혈색이 좋아지고 기력이 솟는다.  나. 강장제나 허리요통에 쓰이며 l  잎은 해열 l  갈증에 l  뿌리의 껍질은 해열에 쓰인다.  다. 구기자 뿌리를 진하게 달여 마시면 각혈에 유효하고 이가 쑤시는데 효과가 있다.  라. 눈이 벌겋고 눈물이 자주 흐르며 침침한 증상을 보일 때 구기자를 장기간 복용하면 시력이 좋아진다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :구기자는 가지과에 속하는 낙엽 활엽 관목인 구기자나무의 열매로 우리나라를 비롯한 일본 l  중국 등지에 분포되어 있다. 우리나라에서는 진도 l  청양의 품종이이 우수하며 구기자를 차나 약용으로 사용하고 있다. 중국의 진시황제가 불로장생의 약으로 구기자를 애용했다는 문헌이 내려오고 있어 강장강정식품으로 알려져 있다
							<br/><br/>72 l 당귀 :뿌리에는 데쿠신 l  데쿠시놀 l  노다케닌 MD의 콤마린 유도체와 α-피네네 l  리모네네 l  β-오데스몰 에레몰 등 정유 성분이 들어 있다. 열매에는 베르캅텐 l  정유가 약 2% 들어 있는데 대부분 n-부틸리덴프탈리드 l  도데카놀 l  테트라카놀의 발테로페놀카르복시산 에스테르 l  p-시멘이며 페트로셀린산 l  페트로셀리핀산 l  팔미트산 l  올레산 l  리놀레산도 함유되어 있다 :가. 조혈작용이 있어 빈혈에 좋다.  나. 어혈을 풀어주고 지혈에 효과가 있다.  다. 항염증 l  진통작용을 한다.  라. 항산화 작용 l  간 기능 보호 작용을 한다 l  :가. 얼굴에 핏기가 없고 현기증이 자주 나며 눈과 입술에 윤기가 없는 사람에게 효과가 있다.  나. 여성들의 월경불순 l  산전 산후 여러 질병 l  복통에 이용된다.  다. 부기를 빼주고 피부가 헐어 생긴 발진을 치료하는 외과용으로 활용된다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :당귀는 미나리과에 속하는 참당귀의 뿌리 또는 잎인데 참당귀와 왜당귀가 있다. 참당귀는 경남 l  경북 l  강원 l  경기 지방의 산속 습한 계곡에서 자생하며 왜당귀는 전국에서 재배되나 따뜻한 중부 l  남부지방에서 잘 자란다. 참당귀는 왜당귀보다 약효 면에서 우수하다. 뿌리와 잎은 식용으로 쓰이며 뿌리는 약용으로 쓰인다
							<br/><br/>73 l 파래 :파래에는 단백질 20~30% l  무기염류 10~15% l  비타민 500~1 l 000 IU를 포함하고 있을 뿐만 아니라 비타민 B1 l  리보플라빈 l  나이아신 등이 들어있다. 무기염류로는 칼슘과 철분이 함유되어 있고 특히 대장의 연동운동을 원활히 해주는 식물성 섬유질이 풍부하게 함유되어 있다. 또한 파래의 지방산 조성을 살펴보면 포화지방산보다 불포화 지방산의 함량이 많다 l 가. 변비에 효과가 있다.나. 대장암을 예방한다.다. 성인병 예방 효과가 있다. l  l  l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :파래는 녹조류에 속하는 해양식물로 우리나라와 일본 연안에 서식하며 독특한 맛과 향을 지녀 예부터 널리 식용되어왔다. 한국에는 창자파래 l  납작파래 l  잎파래 l  가시파래 등이 있으며 이들은 대부분 원통모양으로 엽상체가 분지한 형태로 단조로운 형태를 가진다. 바닷가의 민물이 들어오는 얕은 곳에서 잘 자라고 l  웅덩이 등 에서 군락 생활을 한다. 생육 시기는 보통 늦가을에서 초여름이며 l  양적으로 풍부하여 한여름의 사멸기에는 연안으로 밀려들어 녹조현상을 일으키는 주범이기도 하다
							<br/><br/>74 l 톳 :톳의 영양성분은 다른 갈조류인 미역과 다시마와 다르지 않다. 특히 톳에 들어있는 칼슘분은 어떤 해조류보다 많이 함유되어 있다. 톳의 구성 당을 살펴보면 프락토스 74.68% l  자일로스 12.79% l  갈락토스 11.29%이며 이외에 글루코스 만노스 등이 함유 되어 있다 l 가. 몸안의 노폐물의 원활한 배설을 돕는다.나. 비만 방지에  도움을 준다.다. 각종 성인병을 예방한다. l  l  l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :톳은 갈조류로 일반 녹조류 보다는 깊은 물속에서 자란다. 높이는 20㎝ ~1m정도이며 l  몸은 원기둥 모양이다. 늦가을에 새순이 자라고 겨울에서 봄에 걸쳐 번성하며 늦봄 이후 쇠퇴하는 한해살이 해초이다. 주로 조간대 하부의 암초 위에서 자라며 난해성 해조로 우리나라의 제주도와 남해안 일대에서 잘 자라며 일본 l  동중국해 등에 분포한다
							<br/><br/>75 l 전복 :조개류 중에서 수분 함량이 78.8~83.9%로 많고 단백질 l  지방의 함량은 각각 12.9%. 0.4%로 적은 편이다. 콜레스테롤이 70~100mg 들어 있으며 l  아미노산 중 알기닌이 1 l 100mg으로 다른 식품에 비해 풍부하게 함유되어 있으며 글루탐산과 라이신 등의 아미노산이 함유되어 전복의 독특한 단맛을 가진다. 또한 철 l  마그네슘 l  구리 등의 무기질과 비타민이 함유되어 있다. 전복은 예부터 쪄서 응달에 말려 저장하였는데 이는 이때 생성되는 타우린 성분이 담석을 녹여내고 콜레스테롤의 함량을 저하시키고 심장의 기능을 향상 시킨다 l 가. 자양강장나. 피부미용에 좋다.다. 허약체질의 보양에 좋다.라. 요오드 함량이 놓아 고혈압 치료에 효과가 있다. l  l 가. 산후 산모의 젖이 나오지 않을 때 전복을 고아 먹으면 효과가 있다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :전복은 연체동물 복족강 원시복족목 전복과에 속한다. 전복은 예로부터 맛과 영양이 좋아 궁중요리의 재료로 쓰였다. 전복은 발이 넓어 흡착력이 뛰어나며 아가미는 한쌍이고 자웅이체이며 외부생식기는 발달되지 않아 생식선의 색에 의해 암&#8228;수 구별을 한다. 대황 l  미역 l  감태 등을 먹이로 하며 수명은 10~12년 이다. 주로 열대 및 온대의 해역 연안 바다의 암초나 작은 바위에 붙어서 서식한다. 우리나라 등 세계적으로 100여종이 있고 l  우리나라에 서식하는 전복의 종류는 까막전복 l  말전복 l  오분자기 l  참전복 l  시볼트전복 등 5종이고 참전복은 대부분 양식이다
							<br/><br/>76 l 장어 :주요성분은 수분 64% l  단백질 16% l  지방 16% l  칼슘 26mg l  인 137mg l  비타민 A 4 l 000~10 l 000ⅠU l  비타민 B1 0.2mg l  니아신 29mg등이 함유되어 있다. 특히 비타민 A는 동물의 간에 약 2~4배 정도 함유량이 많다. 장어의 지방은 다중 불포화 지방산으로 ω-3지방산이 함유되어 있어 심혈관질환 l  동맥경화 등의 예방에 효과가 있다. 또한 고단백 식품으로 다양한 아미노산이 골고루 들어 있어 있다 :가. 식욕을 증진시키고 배탈 l  설사 l  소화불량에 좋다.나. 피부의 거칠음을 방지다. 노화방지에 효과가 있다.라. 동맥경화와 뇌졸중을 방지한다 l  l 가. 출혈이 있을 때 장어의 뼈를 고아 먹였다.나. 오랫동안 설사를 하는 사람에게 장어 죽을 끊여 먹였다.  l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :장어는 바닷물고기로 몸길이가 60cm~1.5m 가량이며 l  종류는 20여 종이 있다. 장어의 제맛은 가을에 나는 것이 제격인데 가을이 되면 강에서 3~4년 자란 장어가 산란을 위해 바다로 향한다. 이 시기는 장어의 영양이 풍부하게 저장되어 있어 장어가 정력과 에너지의 대명사로 불리어 졌다. 장어의 성질은 차가운 편이어서 몸에 허열이 있고 쉽게 피곤을 느끼는 사람 l  어린이의 영양실조 등에 좋은 약이 되는 식품이다. 반면에 민물장어의 기름기에는 약간의 독이 있으므로 달여 먹을 때 기름을 거두고 복용하는 것이 좋다
							<br/><br/>77 l 조기 :조기의 주요 성분은 수분 80% l  단백질 18% l  지방 0.8% l  회분 1.3% l  칼슘 26mg% l  철 1.5mg% 등이 함유되어 있으며 비타민 A l  B가 풍부하다. 조기의 기름은 인체의 세포 발육을 촉진시키는 성분이 들어 있어 성장기 어린이 발육에 도움이 되고 노인들의 원기회복에도 좋다 l 가. 소화를 돕는다.나. 발육과 원기회복에 좋다.다. 조기포는 급성 장염에 효과가 있다. l  l 가. 조기 머리에 두중석을 가루내 귀앓이 하는 귓속에 넣어 치료을 하였다.나. 조기 머리을 태워 가루내어 식사 후 매일 복용하면 축농증에 효과가 있다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :조기(助氣)는 글자에서 알수 있듯이 기운을 복돋워 주는 식품이다. 석수어 l  참조기 l  굴비 등으로 불리어 졌으며 조기는 노란색이 도는 참조기가 가장 맛이 좋다. 조기는 상해 앞 바다에서 군집을 이뤄 겨울을 나고 산란기인 3월에 북상하여 제주도 서쪽을 거쳐 흑산도에 이르러 알을 밴 채 4월 중순 영광 법성포를 지나 하순경에는 서산 앞의 목덕도에 이르고 5월에 연평도에 이른다. 참조기는 산란기 이전에 제 맛이 있고 l  조기를 소금절이하여 말린 것을 굴비라 하는데 영광 법성포의 굴비가 유명하다. 조기는 성질이 따뜻해 몸이 찬 사람들의 위 기능을 강화 하고 만성적인 설사와 식욕부진을 치료한다
							<br/><br/>78 l 미꾸라지 :미꾸라지의 영양성분은 수분 75~78% l  단백질 16% l  지질 1.9~2.4g l  칼슘 880~1 l 167mg l  회분 3.6g l  인 90~600mg l  철분 8.5mg l  나트륨85mg l  칼륨290mg l  비타민 A5601 I.U.이다. 미꾸라지의 영양성분은 뱀장어와 비교할 만큼 그 영양효과가 크지만 지질과 비타민 C는 뱀장어에 비해 부족한 편이다. 그러나 철분은 8배 l  칼슘은 4배 비타민 B1 l  B2는 뱀장어보다 함유량이 더 많다. 미꾸라지에는 비타민 B1 의 분해효소인 타미나아제가 들어 있어 날것으로 먹는 것을 피해야 한다 :가. 허약한 몸에 기력을 복돋아 주는 자양식품이다.나. 점액소 뮤신 성분이 있어 위궤양을 방지해 준다.다. 숙취제거와 과음으로 인한 속쓰림에 좋다.라. 빈혈 l  간장 질환 l  부종 등에 효과가 있다 l  l 가. 관절염에 미꾸라지로 찜질을 하였다.나. 부종이나 천식에 늙은 호박과 함께 사용하여 이뇨제와 거담제로 쓰였다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 l 미꾸라지는 기름종갯과의 민물고기로 비늘이 미끈미끈하여 붙여진 이름이다. 주로 도랑이나 웅덩이 속에서 살면서 수면위로 가끔 올라와 숨을 쉰다. 몸통의 길이는 10~15cm정도이며 성질은 따뜻한 편이다.
							<br/><br/>79 l 해삼 :해삼의 영양성분은 수분 91% l  단백질은 3.4% l  탄수화믈 3.7% l  회분 2.8% l  칼슘 119mg% l  인 24mg l  철분 2.2mg% l  요오드 등의 영양소가 함유되어 있고 그 외에 비타민 l  니아신등이 함유되어 있다. 해삼의 독특하게 씹히는 성분은 연골로 콘드로이틴이 함유되어 있어 피부노화 예방과 숙취해독에 좋다 l 가. 성장기 어린이의 치아와 뼈의 형성에 도움이 된다.나. 피부노화를 예방한다.다. 강장효과가 있다. 라. 과다 출혈에 의한 빈혈 등에 효과가 있다. l  l 가. 빈뇨증에 해삼을 먹었다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 l 해삼은 이름에서 알 수 있듯이 바다의 인삼이라고 불리었다. 몸은 원통형이고 배쪽이 납작하며 등쪽이 불룩한 것이 많다. 몸 앞 끝에 있는 입에는 끝이 가늘게 갈라진 촉수가 10~30개 있다. 몸 뒤끝에 항문이 있으며 피부 속에는 작은 골편이 수없이 많고 이 골편의 모양으로 해삼을 분류한다. 몸통은 점액으로 덮여 있어 미끈미끈하여 손에 잘 잡히지 않는다. 우리나라는 주로 회를 먹는 편이고 중국의 경우 말린 것을 요리에 이용한다. 또한 해삼은 식용 뿐 만 아니라 한방에서약재로도 쓰인다. 맛은 짜고 성질은 차가운 편이다.
							<br/><br/>80 l 우뭇가사리 :생 우뭇가사리의 영양성분을 살펴보면 100g 당 수분 70.3% l  단백질 4.2g l  탄수화물 18.5g l  회분 3.8g l  칼슘 183㎎ l  인 47.0㎎ l  철 3.9㎎ l  나트륨 160㎎ l  칼륨 980㎎ l  아연 12.21㎎ l  비타민 A 360 R.E 등이 함유되어 있다. 우뭇가사리의 주성분은 당질로서 갈락토오스로 구성되어 있는 갈락탄이다. 다당류인 아가로오스가 60~80%를 차지 l  아가로펙틴이 20~40%를 차지 한다 l 가. 몸이 찬 사람이 먹으면 혈액을 정화 시킨다.나. 저 칼로리 식품으로 비만방지에 효과가 있다. l  :가. 양갱 l  젤리 등을 만들 때 보조 재료로 쓰인다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :우뭇가사리는 홍조류에 속하는 것으로 우리나라 연해를 비롯한 일본 l  인도양 l  대서양 등에 분포하고 있다. 주로 조간대 중부 및 하부에서 바위에 서식하고 있으며 몸 길이는 20~30cm이다. 우무 · 한천의 주요한 원료로 4월부터 10월에 채쥐하여 건조하여 사용한다. 우리나라에는 우뭇가사리 외에 실우뭇가사리 l  애기우뭇가사리 l  개우뭇가사리 등이 있다. 우뭇가사리에 물을 가하여 가열한 다음 여과 냉각 하면 우무가 된다
							<br/><br/>81 l 청각 :말린 청각의 에너지는 9.0kcal l  수분 94.7% l  단백질 0.4g l  지질 0.2g l  회분 2.8g l  칼슘 71.0mg l  인 7.0mg l  철 6.6㎎ l  나트륨 538㎎ l  칼륨 69.0㎎ l  비타민 B1 l  B2 l  B6 가 각각 0.01mg 이며 비타민 C는 2.0㎎ l  엽산은 277.7㎍이 함유되어 있다. 건조된 청각의 식이섬유 함량은 22.33g 이다 l  l  l  l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :청각은 녹조류에 속하는 것으로 짙은 녹색을 띠고 모양은 수사슴의 뿔 모양이며 몸길이는 15~40cm이다. 주 서식장소는 수심 1~20m의 깊은 파도의 영향을 적게 받는 곳에서 잘 자란다. 몸체는 녹색을 띄며 부드럽고 내부는 무색투명한 사상조직을 이룬다. 청각은 우리나라에서 김치의 부재료로 이용해 왔으며 한 때 구충제의 원료로도 이용되었다. 청각의 종류는 떡청각 l  개청각 l  구슬청각 l  누운청각 l  밀청각 l  말청각 등이 있다
							<br/><br/>82 l 해파리 :해파리 생것 100g 중에는 수분 96.90% l  단백질 1.3g l  회분 1.7g l  칼슘 2.0㎎ l  인 8.0㎎ 등이 함유 되어 있으며 특히 미네랄 중에서 요오드의 함량이 상당히 많고 l  지질이나 조섬유은 포함되어 있지 않다 :가. 대장운동이 활발하게 함으로써 소화를 촉진시킴.나. 변비 예방다. 칼로리가 적어 비만 예방 효과라. 고혈압 l  당뇨병 등 성인병 예방과 치료식으로 이용" l  l 가. 몸속의 열이 많으면서 식욕이 왕성한 사람의 가래를 없애고 기침을 그치게 함. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :해파리는 다른 이름으로 한천어 라고도 불린다. 몸이 한천질로 헤엄치는 힘이 약해 수면에 떠돌며 생활하고 해류와 같이 이동 한다. 주로 바다에 살며 예외적으로 담수와 기수에 살기도 한다. 성질은 평이하다. 주로 해파리는 소금이나 명반액에 담가 탈수 l  방부 l  응고 시켰다가 다시 표백 탈수를 거쳐 시장에 출하된다. 우리가 시장에서 흔히 보는 해파리는 소금에 절여 진 것으로 색이 연노랑색을 띄는 것이 좋다
							<br/><br/>83 l 붕어 :잉어의 주요 성분은 수분 77.1% l  단백질 19.6g l  지질 1.7g l  회분 1.4g l  칼슘 79㎎ l  인 180㎎ l  철 1.8㎎ l  나트륨 35.0㎎ l  레티놀 15.0㎍ l  니아신 2.8㎎ l  엽산 15.0㎍ l  콜레스테롤 91.0㎎이 함유되어 있으며 l  다른 잉어류에 비해 지질의 함량이 적고 비타민류는 지용성 비타민류의 함량이 많다 l 가. 위장기능 강화나. 신장기능 개선다. 당뇨병에 효과가 있다. l  l 가. 부기가 있는 경우 팥과 함께 삶아 먹으면 부기가 내린다.나. 배에 물이 차는 복수증에 효과가 있다.다. 위장이 약한 사람은 순채와 같이 국을 끊여 먹으면 좋다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :잉어과에 속하는 민물고기로 몸길이는 10~15cm이고 드물게 40~50cm에 달하는 것도 있다. 우리나라의 여러 개울이나 못에 서식한다. 성질이 따뜻해 몸이 차고 소화기관이 약한 사람들에게 좋다. 붕어는 흰살 생선 이지만 담수어 특유의 흙탕 냄새가 있다. 조리시 마늘 l  고추 등의 양념과 같이 조리하여 식용하면 냄새를 제거할 수 있다. 붕어는 산란기 때가 가장 맛이 있고 찌개 l  구이 l  찜 l  튀김 l  탕 l  조림 등 다양한 조리법이 있다. 그러나 붕어에는 기생충 l  비타민 B1의 분해효소인 티미나아제가 있으므로 날것으로 먹지 말고 반드시 끊여 먹도록 해야 한다
							<br/><br/>84 l 갈치 :갈치의 영양성분은 수분이 적고 지질의 함량이 비교적 높다. 수분 72.2% l  단백질17% l  지방 8.2% l  당질 0.7% l  회분 1.4% l  칼슘 15㎎% l  인 163㎎% l  철분 1.6㎎% l  그 외 비타민 및 무기질 l  니아신 등이 함유되어 있다. 갈치에 함유한 단백질은 주로 필수 아미노산을 포함하고 있어 육식을 적게 하고 곡류 위주의 식생활을 하는 사람들에게 영양적으로 균형 잡힌 식품이라 할 수 있다 l 가. 성인병 예방에 효과적이다.나. 질병 치료 후 영양보충에 효과적이다.다. 성장기 어린이의 훌륭한 단백질 공급원이다. l  l 가. 기운을 보해 주고자 먹었다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :갈치는 칼처럼 생겼다고 해서 ""갈치""라는 이름이 붙었고 l  갈치과에 속하는 바닷물고기이다. 우리나라 전 연해에서 많이 서식하며 일본 중부 이남 그리고 각 해양의 열대부에 서식하기도 한다. 우리나라 근해에서 잡히는 갈치는 은백색의 아름다운 색을 띤다. 이 은백색의 가루에는 구아닌이라는 성분이 함유되어 있으며 이 성분은 인공 진주의 광택원료로 쓰이거나 화장품의 원료 등으로 쓰인다. 소화가 용이하지 않아 위장장애를 일으키므로 깨끗이 제거 후 조리한다
							<br/><br/>85 l 멸치 :생멸치의 조성은 수분 74.8% l  단백질 17.7g l  지질 4.1g l  회분 3.2g l  칼슘 509㎎ l  인 421㎎ l  철 2.9㎎ l  나트륨 240㎎ l  칼륨 370㎎ l  아연 1.63㎎ l  콜레스테롤 113.0㎎ l  비타민 B1 0.04㎎ l  B2 l  B6각각 0.26㎎ l  니아신 8.8㎎ l  엽산 2.1㎍ 등이 함유 되어 있다. 건조멸치의 경우 수분의 양이 26.0%로 줄어들고 단백질 52.7g l  칼슘 1 l 852㎎ l  인 1 l 478㎎ l  나트륨 2 l 350㎎ l  콜레스테롤 494㎎ 등의 함유량의 변화가 생긴다. 멸치는 예로부터 칼슘의 훌륭한 공급원이었다. 노화의 주요 현상인 주름살과 골다공증의 예방을 위하여 멸치의 칼슘을 많이 섭취하는 것이 도움이 된다. 그러나 신결석이나 담결석이 있는 사람은 너무 많이 먹는 것을 피해야 한다 l 가. 골다공증에 예방 효과가 있다.나. 건 멸치의 단백질 함량이 높아 좋은 단백질 공급원이다. l  l  l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 l 멸치는 청어목 멸치과에 속하는 바다 물고기이다. 표면 가까운 곳에서 떼를 이루며 살고 봄과 여름은 연안에서 생활 하다가 북쪽으로 이동한다. 주로 우리나라 연해 특히 남해에서 많이 서식하고 일본 연해에도 분포한다. 성질은 따뜻한 편이다. 감칠맛이 있어 국물을 낼 때 많이 이용된다. 통째로 말려 사용하기도 하고 소금으로 절여 젓갈을 만들기도 한다.
							<br/><br/>86 l 꽁치 :꽁치의 영양성분은 수분 59% l  단백질 20.2g l  지질 19.4g l  회분 1.3g l  칼슘 44.0㎎ l  인 208㎎ l  철 1.5㎎ l  나트륨 96㎎ l  칼륨 295.0㎎ l  아연 0.74㎎ l  콜레스테롤 64㎎ l  니아신 7.1㎎ l  비타민 A 40.0 R.E l  레티놀 40.0㎍ l  비타민 B1 0.03㎎ l  B2 0.30㎎ l  B6 0.45㎎ l  비타민 B12 4.7㎍ 등이 함유되어 있다. 꽁치는 단백질과 지질의 함유량이 많고 특히 지질은 불포화지방산(DHA l  EPA)함량이 높아 혈액의 흐름을 좋게 하고 혈전 생성을 억제한다 l 가. 동맥경화 예방 효과가 있다.나. 혈전생성을 억제하여 심혈관질환의 예방효과가 있다.다. 악성빈혈을 억제하는 작용이 있다.라. 성선을 자극하고 갑상선의 기능을 좋게 한다. l  l 가. 남자들의 양기부족 또는 피로회복에 꽁치를 먹었다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :꽁치는 동갈치목 꽁치과에 속하는 대표적인 바다물고기이다. 몸길이는 40cm정도이며 l  등 쪽은 짙은 푸른색을 띠며 중앙은 폭이 넓은 푸른색 은빛 띠고 배 쪽은 은백색을 띈다. 산란기는 5~8월이며 주로 바다에서 서식하고 미국과 아시아 사이의 북태평양 해역에 분포한다. 산란 회유하는 대표 어종으로 겨울에는 남부해역으로 산란 회유하여 우리나라 및 일본의 연해에 모여 특히 10월의 것이 맛이 좋다. 정어리 l  고등어와 함께 대표적인 붉은살 생선으로 우리나라 사람들이 즐겨 먹는 생선 중 하나이다. 신선한 꽁치의 선택법은 등푸른 색깔이 선명하고 복부가 통통하며 은백색의 빛을 내는 것이 신선하다
							<br/><br/>87 l 낙지 :주요 성분은 수분 83.7% l  단백질 12.1g l  지질 0.4g l  회분 1.1g l  칼슘 23㎎ l  인 308㎎ l  철 0.3㎎ l  나트륨 338㎎ l  칼륨 177.0㎎ l  콜레스테롤 104.0㎎ l  니아신 1.4㎎ 등이 함유되어 있다. 낙지에는 효과적으로 콜레스테롤을 낮추는 작용이 있는 타우린 성분을 함유 하고 있으며 신경을 안정하게 하는 아세틸콜린이 포함되어 있다 l 가. 간의 생성 작용을 돕는다.나. 신진대사를 왕성하게 한다.다. 혈액을 만들고 기운을 나게 한다. l  l  l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :낙지과에 속하는 연체동물로 몸길이는 60~75㎝ 이다. 해안의 바위 사이에 숨어 있다가 밤이 되면 새우 l  게 l  굴 l  조개 l  물고기 등을 포식한다. 우리나라 l  일본 l  연안 등에 분포한다. 낙지를 포함한 연체동물은 특유한 근육조직을 이루고 근섬유에는 방향성이 없고 전체가 탄력이 있으며 l  씹었을 때 쫄깃 거리며 한 덩어리처럼 되어 있는 특징이 있다. 낙지의 성질을 차고 맛이 달아 육체피로가 심할 때 낙지를 먹으면 좋다. 그러나 몸이 차고 소화기관이 약한 사람에게는 도움이 되지 않는다
							<br/><br/>88 l 고등어 :생 고등어의 영양성분은 수분 58.6% l  단백질 19.4g l  지질 20.8g l  회분 1.0g l  칼슘 24.0㎎ l  인 201㎎ l  철 1.20㎎ l  나트륨 64.0㎎ l  칼륨 259㎎ l  아연 0.75㎎ l  비타민 A 40.0 R.E l  콜레스테롤 82.0㎎ l  엽산 5.8㎍ l  니아신 7.5㎎ l  비타민 B12 4.7㎍ 등이 함유되어 있다. 등푸른 생선에는 뇌세포 활성 물질인 DHA가 들어 있어 자라나는 어린이 l  수험생 l  노약자에게 꼭 필요한 식품 중 하나이다. 불포화 지방산인 DHA l  EPA는 고지혈증 및 뇌경색의 예방에도 효과적이다 l 가. 항 혈전 효과가 있다.나. 두뇌발달에 효과가 있다. l  :가. 신경성 두통이 있는 사람이 먹으면 좋다.나. 변비가 심한 사람 l  소변 색이 진하고 밤중에 소변을 자주 보는 사람에게 효과가 있다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :농어목 고등어과의 바닷물고기로 계절 회유를 하는 어종이다. 최대 몸길이는 44㎝ l  무게는 1~1.5㎏정도 이며 서식장소는 수심 200m의 연안으로 우리나라 연해 l  일본 l  중국 연해에 널리 분포한다. 고등어는 전형적인 &#48381;은 살 생선으로 양질의 단백질과 지질을 포함하고 있으나 알레르기 체질인 사람은 알러지 증상을 유발하는 수가 있어 주의해야 한다. 이 증상은 생 고등어에 들어 있은 ‘히스타민’이라는 유해 물질에 의한 것이다
							<br/><br/>89 l 잉어 :잉어의 영양성분은 76.2% l  단백질 18.1g l  지질 4.3g l  회분 1.2g l  칼슘 40.0㎎ l  인 130㎎ l  철 1.2㎎ l  나트륨 47.0㎎ l  칼륨 374㎎ l  아연 1.1㎎ l  비타민A 10.0 R.E. 니아신 4.4㎎ l  콜레스테롤 73.0㎎ 비타민 B1 0.38㎎ l  엽산 15.0㎍등이 함유되어 있다. 비타민 A l D 등의 지용성 비타민 함량은 적은 편이다 그러나 비타민 B1은 생다랭이의 1.8배가 더 많이 함유되어 있다 l 가. 혈액순환을 촉진 한다.나. 이뇨 효과가 있다. l  :가. 산모의 젖이 부족할 때 잉어에 마늘 l  양념을 같이 끊여서 먹였다.나. 붓기가 있을 때 잉어의 내장을 제거 후 팥을 넣어 고아 먹는다.다. 심한 기침으로 숨이 가쁠 때 잉어회를 먹는다 l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :잉어는 잉어목 잉어과의 민물고기이다. 최대 몸길이는 보통 50~60㎝ 이지만 120㎝ 이상인 것도 있다. 외형은 누런빛을 띤 갈색이고 등쪽은 짙고 배쪽은 연한 색을 띈다. 5월 중순에 산란기를 거치며 큰 강이나 댐 l  저수지 등 바닥이 진흙인 곳에서 주로 서식한다. 잡식성으로 흙 속의 작은 동물이나 식물을 먹이로 한다. 잉어는 사후와 동시에 곧 신선도가 낮아지므로 살아있을 동안에 이용해야 한다. 또한 잉어는 미꾸라지처럼 비타민 B1의 분해효소가 있어 절대로 생식해서는 안된다
							<br/><br/>90 l 오징어  :수분 79% l  단백질 18.2g l  지질 1.0g l  회분 1.7g l  칼슘 17.0㎎ l  인 240㎎ l  나트륨 282㎎ l  칼륨 332㎎ l  아연 1.3㎎ l  비타민 B1 0.04㎎ l  비타민 B2 0.05㎎ l  B6 0.07㎎ l  니아신 2.7㎎ l  비타민 C 2.0㎎ l  엽산 12.5㎍ l  콜레스테롤 228㎎ l  비타민 B12 1.3㎍ 등이 함유 되어 있다. 오징어는 저지방 l  저에너지로 아미노산 조성이 우수한 단백질을 비교적 많이 포함하고 있고 l  콜레스테롤을 낮추는 타우린 성분이 포함 되어 있다. 오징어의 특유한 맛은 베타닌 l  산화트리메틸아민 등이고 유리 글구탐산이 약 100㎎ 포함되어 있다 :가. 타우린 성분으로 간 기능을 도와 준다.나. 피를 맑게 하고 생성하는 작용을 한다.다. 혈액순환을 좋게 하고 l  뼈와 근육을 튼튼하게 한다 l  l 가. 감기에 걸렸을때 구운 오징어을 먹인다.나. 홍역에 걸려 발진이 날 때 오징어 염분을 먹으면 얼굴 흉터가 남지 않는다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :오징어는 두족류 십완목에 속하는 연체동물의 총칭이다. 몸길이는 최소 2.5m ~ 최대 15.2m 도 있다. 몸은 머리 l  몸통 l  다리의 3부분으로 이루어지며 l  머리는 다리와 몸통사이에 있고 좌우 양쪽에 눈이 있다. 2개의 촉완 l  8개의 다리를 가지고 있다. 식도에는 모래주머니가 있으며 위는 근육이 발달되어 있고 간 췌장 등의 수관이 있다. 장은 짧은 편이고 항문부의 등면에 먹물주머니가 있어 위기 상황에 먹물을 분출하여 적의 눈을 피해 자신을 보호한다. 오징어는 육식성으로 작은 물고기 l  새우 l  게 등을 먹이로 한다. 우리나라의 서해 l  남해 l  일본의 규수 등에 분포한다
							<br/><br/>91 l 아귀 :아귀의 육질의 성분치는 심해성의 흰살 생선의 특징을 가진다. 수분 함량이 많아 85.8% l  단백질 12.9g l  지질 0.5g l  회분 0.6g l  칼슘 19.0㎎ l  인 134 ㎎ l  철 0.9㎎ l  나트륨 155.0㎎ l  칼륨 210㎎ l  아연 0.50㎎ l  니아신 1.3㎎ l  엽산 0.5㎎ l  콜레스테롤 54㎎ l  비타민 B1 0.05㎎ l  B2 0.07㎎ 비타민 E 1.0㎎ 등이 함유되어 있다. 또한 DHA l  EPA 등의 고도불포화지방산이 함유되어 있다 l 가. 노화 예방에 도움이 된다.나. 심혈관질환등 성인병 예방 효과가 있다.다. 병약자의 회복에 도움이 된다. l  l  l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :아귀목 아귀과에 속하는 바닷물고기이다. 몸길이는 1~1.5m이고 두께가 얇고 폭이 넓으며 l  머리폭도 넓고 입이 크다. 색깔은 등쪽에 흑갈색을 띠고 바탕에 드물게 검은색 얼룩 무늬가 있고 배쪽은 흰색을 띤다. 산란기는 4~8월이며 서식장소는 수온 17~20℃가 생활 적수온대이며 l  수심 70~250m에서 주로 서식한다. 어류와 오징어류를 먹이로 한다
							<br/><br/>92 l 명태 :생명태의 성분을 살펴보면 수분 77.3% l  단백질 15.6g l  지질 4.2g l  회분 1.4g l  칼슘 38㎎ l  인 210.0㎎ l  철 0.50㎎ l  나트륨 160㎎ l  칼륨 308㎎ l  아연 0.30㎎ l  니아신 1.6㎎ l  비타민 C 1.0㎎ l  엽산 3.3㎎ l  콜레스테롤 88.0㎎ l  비타민 B1 0.13㎎ l  B2 0.14㎎ l  B6 0.06㎎등이 함유되어 있다 l 가. 간을 보호해 주는 효과가 있다.나. 간유 성분이 있어 안질로 인해 눈이 침침하고 안 보일때 효과가 있다. l  l 가. 대변에 피가 날 때 명태을 매일 3마리씩 3일 동안 먹으면 된다.나. 생인손 통증에 명태 껍질을 붙이면 통증이 그친다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :지방양이 극히 적고 담백한 맛을 가진 명태는 대구목 대구과에 속하는 바닷물고기이다. 몸체는 등 쪽이 연한 갈색 또는 푸른색 바탕에 암갈색 세로띠가 있고 배는 흰색을 띈다. 최대 몸길이 91㎝ l  최대 몸무게 1.4㎏에 이른다. 산란 시기는 12~4월이며 l  주로 대륙붕과 대륙사면에 서식한다. 먹이는 주로 작은 새우류 l  요각류 l  와 작은 어류인 치어 l  치어알 등을 먹이로 한다. 우리나라 동해 l  일본 북부 l  오오츠크해 l  베링해 l  케리포니아 등의 북태평양 해역에 분포한다. 명태는 성질이 평이하고 맛이 짜며 독이 없다
							<br/><br/>93 l 돔 (도미류) :각각의 돔에 따라 약간의 영양성분의 차이가 있다. 아래의 성분은 옥돔의 영양성분을 표시한 것이다. 옥돔의 성분조성을 살펴보면 수분 76.2% l  단백질 16.3g l  지질 3.1g l  회분 2.6g l  칼슘 93.0㎎ l  인 177.0㎎ l  철 0.4㎎ l  나트륨 631㎎ l  칼륨 210㎎ l  아연 0.89㎎ l  콜레스테롤 69.0㎎ l  비타민 B1 0.03㎎ l  B2 0.02㎎ l  B6 0.46㎎ l  비타민 C 1.0㎎ 등이 함유되어 있다 l 가. 타우린 성분이 함유되어 있어 콜레스테롤 수치를 낮추는 효과가 있다.나. 간장의 기능을 좋게 한다.다. 혈압을 조절해 준다. l  l  l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :돔은 감성돔과에 속하는 바닷물고기를 모두 가리켜 도미(류)라 한다. 그 종류에는 감성돔 l  실붉돔 l  옥돔 l  자리돔 l  황돔 등이 있다. 몸길이는 40~80cm 둥글고 납작하다. 우리나라 남해 l  일본 전역 등의 바다 밑에서 서식한다. 도미의 비늘은 비교적 크고 단단하므로 남아있지 않도록 깨끗이 없앤 다음 조리하는 것이 중요하다
							<br/><br/>94 l 굴 :굴의 성분 조성을 살펴보면 자연산인 경우 수분 77.3% l  단백질 10.0g l  지질 2.2g l  당질 8.3g l  회분 2.2g l  칼슘 95.0㎎ l  인 156㎎ l  철 5.3㎎ l  나트륨 347㎎ l  칼륨 201㎎ l  아연 90.81㎎ l  비타민 A 56 R.E l  레티놀 54.0㎍ l  비타민 B1 0.19㎎ l  B2 0.28㎎ l  B6 0.06㎎ l  비타민 C 3.0㎎ l  니아신 2.4㎎ l  엽산 9.6㎍ l  콜레스테롤 50.0㎎ 등이 함유되어 있다. 굴은 단백질 함량이 비교적 적지만 지질의 함량은 비교적 많은 편이다. 그리고 당질 중 약 3%은 글리코겐을 함유하고 있다. 구리 l  철 l  마그네슘 l  아연 등 각종 미네랄 등을 풍부히 함유하고 있어 굴은 바다의 우유라 할 수 있다 l 가. 칼슘의 함량이 높아 골다공증 예방 효과가 있다.나. 간 기능을 개선 시켜 준다.다. 빈혈 환자에게 좋은 공급원이다.라. 허약체질인 사람에게 영양을 보충해 준다. l  l 가. 음식을 먹고 자주 토하는 사람에게 위장기능을 활발하게 도와줌.나. 가슴이 답답하고 얼굴에 열이 자주 오르는 사람에게 먹이면 중상이 완화 됨. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :바다에서 나는 귀한 식품중 하나인 굴은 굴과 l  벗굴과에 속하는 이매패류를 모두 가리켜 ‘굴’ 이라 칭하며 다른 이름으로 모려 l  석하 등으로 표기한다. 서식장소는 조간대의 바위에 부착생활을 하고 산란기는 6~7월이고 1년 만에 성숙한다. 우리나라 연안을 비롯해 일본 l  대만 근해에 분포한다. 플랑크톤을 먹이로 하며 입수공에서 바닷물과 함께 들여 마셔 아가미에서 여과 시켜 먹는다. 굴은 12~2월에 지질 함량이나 글리코겐 함량이 증가하므로 이때 채취한 것이 가장 맛있다. 5월 말부터 9월 초까지는 비브리오균에 의한 패혈증이 일어 날 수 있으므로 반드시 익혀 먹는 것이 좋다
							<br/><br/>95 l 우럭 :우럭의 성분조성을 살펴보면 수분 76.80% l  단백질 16.3g l  지질 2.0g l  회분 2.2g l  칼슘 56.0㎎ l  인 154㎎ l  철 4.10㎎ l  나트륨 89.0㎎ l  칼륨 400.0㎎ l  아연 2.66㎎ l  비타민 A 16.0 R.E l  니아신 2.6㎎ l  비타민 C 2.0㎎ l  콜레스테롤 93.0㎎ 등이 함유되어 있다 l 가. 질병 후 영양보충에 도움이 된다.나. 간기능 개선에 효과가 있다. l  l  l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :우럭은 무면목 우럭과에 속하는 연체동물이다. 유생기때 20~30일간 부유생활을 하다가 저서생활로 들어간다. 외형의 색은 껍데기는 회백색을 띠고 l  각피는 갈색 l  껍데기 안쪽은 흰색을 띤다. 진흙 속이나 더 깊은 곳에서 서식한다. 한국 l  일본 l  중국에 널리 분포한다. 우리나라의 경우 남해안과 서해안의 민물이 유입되는 하구의 모래뻘에 산다
							<br/><br/>96 l 농어 :농어의 성분 조성을 살펴보면 수분 73.3% l  단백질 20g l  지질 5.1g l  회분 1.2g l  칼슘 28㎎ l  인 231㎎ l  철 1.5㎎ l  나트륨 97㎎ l  칼륨 272㎎ l  아연 0.4㎎ l  비타민 A 197 R.E. 비타민 B1 0.17㎎ l  B2 0.15㎎ l  B6 0.40㎎ l  니아신 6.0㎎ l  엽산 5.0㎍ l  비타민 E 1.2㎎ l  코레스테롤 54㎎ 등이 함유되어 있다. 농어는 단백질이 많고 지질의 양이 적은 흰살 생선이다 l 가. 동맥경화의 예방 기능이 있다.나. 혈전 생성을 억제한다.다. 장 기능과 위 기능을 조화 시켜 준다.라. 부종을 치료한다. l  l 가. 허약체질에 푹 고아서 물을 마시게 했다.나. 산후에 미역과 함께 국을 끊여 먹였다.다. 원인을 알 수 없는 피부병에 농어 즙을 내어 바르면 효과가 있다. l 글. 윤*순 / 우석대학교 교수 식품영영학 전공 :농어는 농어과에 속하는 바닷물고기이다. 몸길이는 약 1m정도이고  긴 타원형으로 가늘고 길며 l  옆으로 납작하다. 입은 크고 윗턱은 아래턱보다 짧으며 l  그 뒷끝은 아래쪽에 있다.몸체는 등쪽은 회청록색 l  배는 은백색을 띠고 몸 옆면과 등지느러미에는 검은 점들이 박혀있다. 일년에 한번 산란하며 시기는 11~4월 이다. 주로 연안이나 만입구의 수심이 약간 깊은곳에 서식 하며 우리나라 연근해 l  동중국해 l  타이완 l  일본 지역 등에 분포한다
							<br/><br/>97쌀 l 쌀에는 질이 좋은 탄수화물이 많이 들어 있고 l  우수한 단백질 l  지방 l  비타민 l  미네랄 등 10여가지 영양성분이 골고루 들어 있다. 쌀은 미네랄이 풍부해 빈혈 l  골다공증 l  예방에 도움을 주고 필수아미노산인 라이신이 풍부해 성장발육 촉진 l  두뇌발달 l  기억력 개선에 도움을 준다. 쌀의 탄수화물은 수분이 15.5%일 경우 약 76%정도로 대부분이 녹말이며 l  식이섬유소는 현미인 경우 약 1.0% l  흰쌀인 경우 0.3~0.4%정도 된다. 또한 l  흰쌀에는 단백질이 6.8% 정도 들어 있는데 l  쌀 단백질은 대부분이 위산에 잘 녹는 성질을 가진 단백질로 되어있고 라이신 등 필수아미노산 함량이 높아서 다른 곡식보다 단백가와 소화이용률이 두드러지게 높은 고급 단백질이다.
						</p>
					</div>
				</div>
			</div>

		</div>
	</div>

	<script>
		var ctx = document.getElementById("myChart");
		var myChart = new Chart(ctx, {
			type: 'pie',
			data: {
				labels: ['탄수화물(${api3.info_CAR}g) [<fmt:formatNumber value="${api3.info_CAR/1.3}" pattern=".00"/>%]', '단백질(${api3.info_PRO}g) [<fmt:formatNumber value="${api3.info_PRO/0.7}" pattern=".00"/>%]', '지방(${api3.info_FAT}g) [<fmt:formatNumber value="${api3.info_FAT/0.539}" pattern="0.00"/>%]', '나트륨 (${api3.info_NA}mg) [<fmt:formatNumber value="${api3.info_NA/20}" pattern=".00"/>%]'],
				datasets: [{
					label: '# of Tomatoes',
					data: [${api3.info_CAR}, ${api3.info_PRO}, ${api3.info_FAT}, 0],
					backgroundColor: [
						'rgb(255, 159, 64)',
						'rgba(54, 162, 235, 0.8)',
						'rgba(255, 206, 86, 0.8)',
						'rgba(44, 166, 156, 0.8)',
						'rgba(75, 192, 192, 0.8)'
					],

					borderWidth: 1
				}]
			},
			options: {
				//cutoutPercentage: 40,
				responsive: false,

			}
		});

		var labels = [];
		var texts = [];
		var texts2 = [];
		var texts3 = [];

		// var i = parseInt(0);
		// var n = parseInt(2);


<c:set var="text" value="${api3.rcp_PARTS_DTLS}"/>

	<c:set var = "testStr" value = "${fn:split(text, ',')[x]}"/>

			<c:forEach var="F" begin="0" end="20">

		    	<c:forEach var="n" begin="0" end="40">
	        	<c:if test="${fn:contains(fn:split(text, ',')[F], api5[n].item_name)}">

		        var RGB_1 = Math.floor(Math.random() * (255 + 1))
		        var RGB_2 = Math.floor(Math.random() * (255 + 1))
		        var RGB_3 = Math.floor(Math.random() * (255 + 1))
		        var strRGBA = 'rgba(' + RGB_1 + ',' + RGB_2 + ',' + RGB_3 + ',0.8)'

				amount1 = "${api5[n].dpr1}".replace(",", "")
				amount2 = "${api5[n].dpr2}".replace(",", "")
				amount3 = "${api5[n].dpr3}".replace(",", "")
				amount4 = "${api5[n].dpr4}".replace(",", "")
				amount5 = "${api5[n].dpr5}".replace(",", "")


				var ctx = document.getElementById("myChart"+"${F-5}"+"${n}");
				var myChart = new Chart(ctx, {
					type: 'line',
					data: {
						labels: ['${api5[n].day1}', '${api5[n].day2}', '${api5[n].day3}', '${api5[n].day4}'],
						datasets: [{
							label: '${api5[n].item_name}-${api5[n].kind_name}-${api5[n].unit}',
							data: [amount1, amount2, amount3, amount4, amount5],
							backgroundColor: [
								strRGBA,
							],
							borderColor : [
								strRGBA,
							],
							borderWidth: 3,

						}]
					},
					options: {
						plugins: {
							title: {
								display: true,
								text: "",
								<%--text: "${F}+${n}id비교",--%>
							}
						},


						//cutoutPercentage: 40,
						responsive: false,
					},


				});

	        	</c:if>
				</c:forEach>

			</c:forEach>



	</script>


	<hr />
	<form>
		<div class="d-flex justify-content-center">
			<input id="ID1" type="hidden" value="3"/>
			<input id="ID2" type="hidden" value="${api3.id2}"/>
			<input id="ID3" type="hidden" value="${api3.ID}"/>
			<input type="hidden" class="form-control" value="${principal.user.username}" id="username">
			<div class="card-body">
				<div class="card-text d-flex justify-content-around">
					<button style="height:40px;" type="button" id="btn-reply-save" class="btn btn-secondary align-middle" onclick="this.disabled=true">등록</button>
					<textarea id="rcontent" class="form-control" placeholder="" style="width:70%; height:40px; border: 1px solid #FFFFFF; background-color: antiquewhite"></textarea>

					<span style="margin-right: -40px;" class="mt-2">평점 :</span>
					<div style="height: 18px;" class="starpoint_box mt-2">
						<label for="starpoint_1" class="label_star" title="0.5점"><span
								class="blind">0.5점</span></label> <label for="starpoint_2" class="label_star"
																		 title="1점"><span
							class="blind">1점</span></label> <label
							for="starpoint_3" class="label_star" title="1.5점"><span
							class="blind">1.5점</span></label> <label for="starpoint_4" class="label_star"
																	 title="2점"><span
							class="blind">2점</span></label> <label
							for="starpoint_5" class="label_star" title="2.5점"><span
							class="blind">2.5점</span></label> <label for="starpoint_6" class="label_star"
																	 title="3점"><span
							class="blind">3점</span></label> <label
							for="starpoint_7" class="label_star" title="3.5점"><span
							class="blind">3.5점</span></label> <label for="starpoint_8" class="label_star"
																	 title="4점"><span
							class="blind">4점</span></label> <label
							for="starpoint_9" class="label_star" title="4.5점"><span
							class="blind">4.5점</span></label> <label for="starpoint_10" class="label_star"
																	 title="5점"><span
							class="blind">5점</span></label> <input
							type="radio" name="starpoint" id="starpoint_1" class="star_radio" value=1> <input
							type="radio" name="starpoint" id="starpoint_2" class="star_radio" value=2> <input
							type="radio" name="starpoint" id="starpoint_3" class="star_radio" value=3> <input
							type="radio" name="starpoint" id="starpoint_4" class="star_radio" value=4> <input
							type="radio" name="starpoint" id="starpoint_5" class="star_radio" value=5> <input
							type="radio" name="starpoint" id="starpoint_6" class="star_radio" value=6
							checked="checked" ;> <input
							type="radio" name="starpoint" id="starpoint_7" class="star_radio" value=7> <input
							type="radio" name="starpoint" id="starpoint_8" class="star_radio" value=8> <input
							type="radio" name="starpoint" id="starpoint_9" class="star_radio" value=9> <input
							type="radio" name="starpoint" id="starpoint_10" class="star_radio" value=10> <span
							class="starpoint_bg"></span>
					</div>
				</div>
			</div>
		</div>
	</form>

	<br />
	<div class="card">
		<div class="card-header">댓글 리스트</div>

		<c:forEach var="reply" items="${reply}">
			<c:if test="${reply.REPLY_TYPE2 == api3.id2 && reply.REPLY_TYPE == 3 && principal.user.username eq reply.REPLY_USERNAME}">
				<div class="m-3 ml-5"
					 style="background-color: rgba(236, 236, 236, 0.8); width:600px; min-height: 100px; border-radius: 20px 20px 20px 0px;">
					<div class="d-flex justify-content-between" style="width: 100%">
						<p class="ml-3" style="margin-top:5px; color:#151823;">작성자 : ${reply.REPLY_USERNAME}</p>
						<p class="mr-3" style="margin-top:5px; color:#151823;">${reply.REPLY_CDATE}</p>
					</div>
					<div>
						<p class="pt-1 pr-3 pl-3" style="color:#151823">${reply.REPLY_CONTENT}</p>
					</div>
					<div class="d-flex justify-content-between">
						<p class="pt-2 pl-3" style="font-size:20px; color:#151823; height: 30px;">${reply.REPLY_NUM1/2}</p>
						<button onClick="index.apireplyDelete(${api3.id2}, ${reply.id})" class="bnon pr-2 pl-2" style="background-color: rgba(0,0,0,0)">
							<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
								 class="bi bi-trash2-fill" viewBox="0 0 16 16">
								<path d="M2.037 3.225A.703.703 0 0 1 2 3c0-1.105 2.686-2 6-2s6 .895 6 2a.702.702 0 0 1-.037.225l-1.684 10.104A2 2 0 0 1 10.305 15H5.694a2 2 0 0 1-1.973-1.671L2.037 3.225zm9.89-.69C10.966 2.214 9.578 2 8 2c-1.58 0-2.968.215-3.926.534-.477.16-.795.327-.975.466.18.14.498.307.975.466C5.032 3.786 6.42 4 8 4s2.967-.215 3.926-.534c.477-.16.795-.327.975-.466-.18-.14-.498-.307-.975-.466z"/>
							</svg>
						</button>
					</div>
				</div>
			</c:if>

			<c:if test="${reply.REPLY_TYPE2 == api3.id2 && reply.REPLY_TYPE == 3 && principal.user.username ne reply.REPLY_USERNAME}">
			    <div class=" d-flex justify-content-end" style="width:100%;">
					<div class="m-3 mr-5" style="background-color: rgba(87, 159, 251, 0.8); width:600px; min-height: 100px; border-radius: 18px 18px 0px 18px;">
						<div class="d-flex justify-content-between" style="width: 100%">
							<p class="ml-3" style="margin-top:5px; color:#151823;">작성자 : ${reply.REPLY_USERNAME}</p>
							<p class="mr-3" style="margin-top:5px; color:#151823;">${reply.REPLY_CDATE}</p>
						</div>
						<div>
							<p class="pt-1 pr-3 pl-3" style="color:#151823">${reply.REPLY_CONTENT}</p>
						</div>
						<div class="d-flex justify-content-between">
							<p class="pt-2 pl-3" style="font-size:20px; color:#151823; height: 30px;">${reply.REPLY_NUM1/2}</p>
							<c:if test="${'ADMIN' eq principal.user.USER_ROLE}">
								<button onClick="index.apireplyDelete(${api3.id2}, ${reply.id})" class="btn pr-2 pl-2">
									<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
										 class="bi bi-trash2-fill" viewBox="0 0 16 16">
										<path d="M2.037 3.225A.703.703 0 0 1 2 3c0-1.105 2.686-2 6-2s6 .895 6 2a.702.702 0 0 1-.037.225l-1.684 10.104A2 2 0 0 1 10.305 15H5.694a2 2 0 0 1-1.973-1.671L2.037 3.225zm9.89-.69C10.966 2.214 9.578 2 8 2c-1.58 0-2.968.215-3.926.534-.477.16-.795.327-.975.466.18.14.498.307.975.466C5.032 3.786 6.42 4 8 4s2.967-.215 3.926-.534c.477-.16.795-.327.975-.466-.18-.14-.498-.307-.975-.466z"/>
									</svg>
								</button>
							</c:if>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>







	</div>
</div>
<div style="padding-bottom: 200px;"></div>
<script>
	$(document).ready(function() {
		$('.slick-sample').slick({
			dots: true,
			infinite: true,
			speed: 500,
			fade: true,
			centerMode: true,
			autoplay: true,
			dots: true,
			arrows: true,

		});
	});

</script>

<script src="https://cdn.jsdelivr.net/npm/chart.js@3/dist/chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://use.fontawesome.com/releases/v5.9.0/js/all.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<script src="/js/board.js"></script>











<!-- 글쓰기 디자인 https://summernote.org/getting-started/#without-bootstrap -->