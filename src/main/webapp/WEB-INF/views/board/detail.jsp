<%@page import="com.cos.blog.model.User"%>
<%@page import="com.cos.blog.config.auth.PrincipalDetail"%>
<%@page import="com.cos.blog.model.Board"%>
<%@page import="org.springframework.security.oauth2.core.user.OAuth2User"%>
<%@page import="org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header2.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>

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

	/* =============== 별찍기 =============== */
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

</style>

<div class="container">

	<c:set var="totalstar1" value="0" />
	<c:set var="totalstar2" value="0" />
	<c:forEach var="reply1" items="${reply}" varStatus="status">
		<c:if test="${null ne reply1.REPLY_NUM1 && reply1.REPLY_TYPE2 == board.ID}">
			<c:set var="totalstar1" value="${totalstar1 + 1}" />
			<c:set var="totalstar2" value="${totalstar2 + reply1.REPLY_NUM1/2}" />
		</c:if>
	</c:forEach>

	<br />


	<div class="row pb-2 mb-2 d-flex justify-content-between" style="border:1px solid; border-color:#FFFFFF #FFFFFF #dedede #FFFFFF;">
		<div class="row">
		<div class="mt-1 ml-4">
			<h4>${board.BOARDTITLE}</h4>
		</div>
		<div class="custom-review-badge ml-2">
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

		<div>
			<form>
				<input id="title" type="hidden" value="${board.BOARDTITLE}${board.ID}${principal.user.username}"/>
				<input id="name" type="hidden" class="form-control" value="${principal.user.username}">
				<input id="BID" type="hidden" class="form-control" value="${board.ID}">

				<button id="btn-favorite" class="bnon">
					<svg xmlns="http://www.w3.org/2000/svg" width="38" height="38" fill="currentColor" class="bi bi-markdown-fill" viewBox="0 0 16 16">
						<path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm11.5 1a.5.5 0 0 0-.5.5v3.793L9.854 8.146a.5.5 0 1 0-.708.708l2 2a.5.5 0 0 0 .708 0l2-2a.5.5 0 0 0-.708-.708L12 9.293V5.5a.5.5 0 0 0-.5-.5zM3.56 7.01h.056l1.428 3.239h.774l1.42-3.24h.056V11h1.073V5.001h-1.2l-1.71 3.894h-.039l-1.71-3.894H2.5V11h1.06V7.01z"/>
					</svg>
				</button>
				<button class="bnon" onclick="history.back()">
					<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-arrow-left-square-fill" viewBox="0 0 16 16">
						<path d="M16 14a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12zm-4.5-6.5H5.707l2.147-2.146a.5.5 0 1 0-.708-.708l-3 3a.5.5 0 0 0 0 .708l3 3a.5.5 0 0 0 .708-.708L5.707 8.5H11.5a.5.5 0 0 0 0-1z"/>
					</svg>
				</button>
			</form>
		</div>
	</div>


	<div>
		글 번호 : <span id="id"><i>${board.ID} </i></span> 작성자 : <span><i> ${board.BOARDUSERNAME} </i></span> 조회수 : ${board.BOARDCOUNT} <br />
	</div>

	<div class="form-group">
		<div class="mt-3 mb-3" style="min-height: 300px;">${board.BOARDCONTENT}</div>
	</div>

	<hr />



	<c:if test="${board.BOARDUSERNAME==principal.user.username}">
		<div class="d-flex justify-content-end mb-2" style="margin-top: -8px;">
			<a href="/board/${board.ID}/updateForm" class="bnon">
				<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-wrench-adjustable-circle-fill" viewBox="0 0 16 16">
					<path d="M6.705 8.139a.25.25 0 0 0-.288-.376l-1.5.5.159.474.808-.27-.595.894a.25.25 0 0 0 .287.376l.808-.27-.595.894a.25.25 0 0 0 .287.376l1.5-.5-.159-.474-.808.27.596-.894a.25.25 0 0 0-.288-.376l-.808.27.596-.894Z"/>
					<path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16Zm-6.202-4.751 1.988-1.657a4.5 4.5 0 0 1 7.537-4.623L7.497 6.5l1 2.5 1.333 3.11c-.56.251-1.18.39-1.833.39a4.49 4.49 0 0 1-1.592-.29L4.747 14.2a7.031 7.031 0 0 1-2.949-2.951ZM12.496 8a4.491 4.491 0 0 1-1.703 3.526L9.497 8.5l2.959-1.11c.027.2.04.403.04.61Z"/>
				</svg>
			</a>
			<button id="btn-delete" class="bnon">
				<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
					<path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/>
				</svg>
			</button>
		</div>
	</c:if>


	<form>
	<div class="d-flex justify-content-center">
			<input id="ID1" type="hidden" value="1"/>
			<input id="ID2" type="hidden" value="${board.ID}"/>
			<input type="hidden" class="form-control" value="${principal.user.username}" id="username">
			<div class="card-body">
				<div class="card-text d-flex justify-content-around">
					<button style="height:40px;" type="button" id="btn-reply-save" class="btn btn-secondary align-middle" onclick="this.disabled=true">등록</button>
					<textarea id="rcontent" class="form-control" placeholder="" style="width:70%; height:40px; border: 1px solid #ffffff; background-color: antiquewhite"></textarea>

					<span style="margin-right: -33px; margin-top: 6px;" class="">평점 :</span>
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
	<c:if test="${reply.REPLY_TYPE2 == board.ID && principal.user.username eq reply.REPLY_USERNAME}">
		<div class="m-3 ml-5"
			 style="background-color: rgba(236, 236, 236, 0.8); width:600px; min-height: 100px; border-radius: 18px 18px 18px 0px;">
			<div class="d-flex justify-content-between" style="width: 100%">
				<p class="ml-3" style="margin-top:5px; color:#151823;">작성자 : ${reply.REPLY_USERNAME}</p>
				<p class="mr-3" style="margin-top:5px; color:#151823;">${reply.REPLY_CDATE}</p>
			</div>
			<div>
				<p class="pt-1 pr-3 pl-3" style="color:#151823">${reply.REPLY_CONTENT}</p>
			</div>
			<div class="d-flex justify-content-between">
				<p class="pt-2 pl-3" style="font-size:20px; color:#151823; height: 30px;">${reply.REPLY_NUM1/2}</p>

				<button onClick="index.replyDelete(${board.ID}, ${reply.id})" class="bnon pr-2 pl-2" style="background-color: rgba(0,0,0,0);">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
						 class="bi bi-trash2-fill" viewBox="0 0 16 16">
						<path d="M2.037 3.225A.703.703 0 0 1 2 3c0-1.105 2.686-2 6-2s6 .895 6 2a.702.702 0 0 1-.037.225l-1.684 10.104A2 2 0 0 1 10.305 15H5.694a2 2 0 0 1-1.973-1.671L2.037 3.225zm9.89-.69C10.966 2.214 9.578 2 8 2c-1.58 0-2.968.215-3.926.534-.477.16-.795.327-.975.466.18.14.498.307.975.466C5.032 3.786 6.42 4 8 4s2.967-.215 3.926-.534c.477-.16.795-.327.975-.466-.18-.14-.498-.307-.975-.466z"/>
					</svg>
				</button>

			</div>
		</div>
	</c:if>

	<c:if test="${reply.REPLY_TYPE2 == board.ID && reply.REPLY_TYPE == 1 && principal.user.username ne reply.REPLY_USERNAME}">
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
					<button onClick="index.replyDelete(${board.ID}, ${reply.id})" class="btn pr-2 pl-2">
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




<script src="/js/board.js"></script>


<!-- 글쓰기 디자인 https://summernote.org/getting-started/#without-bootstrap -->