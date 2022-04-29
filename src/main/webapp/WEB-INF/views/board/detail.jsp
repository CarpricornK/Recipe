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
</style>

<div class="container">

	<c:set var="totalstar1" value="0" />
	<c:set var="totalstar2" value="0" />
	<c:forEach var="reply1" items="${board.replys}" varStatus="status">
		<c:if test="${null ne reply1.REPLY_NUM1}">
			<c:set var="totalstar1" value="${totalstar1 + 1}" />
			<c:set var="totalstar2" value="${totalstar2 + reply1.REPLY_NUM1/2}" />
		</c:if>
	</c:forEach>


	
	<span></span> 
	<br /> 
	<br />
	<div>
		글 번호 : <span id="id"><i>${board.ID} </i></span> 작성자 : <span><i> ${board.BOARD_USERNAME} </i></span> <br />
	</div>
	<div class="form-group">
		<h3>${board.BOARD_TITLE}</h3>
	</div>

	<div class="custom-review-badge">
		<div class="star-ratings-css">
			<div class="star-ratings-css-top" style="width: <fmt:formatNumber value="${(totalstar2/totalstar1)*23}" pattern="0" />%">
				<span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9733;</span>
			</div>
			<div class="star-ratings-css-bottom">
				<span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9733;</span>
			</div>
		</div>
	</div>

	<div class="custom-review-badge-1 ml-3">
		<span class=review-label><fmt:formatNumber value="${(totalstar2/totalstar1)}" pattern=".00" /></span> <span class=review-star-symbol>&#9733;</span>
	</div>

	<hr />

	<div class="form-group">
		<div class="mt-3 mb-3">${board.BOARD_CONTENT}</div>
	</div>
	<hr />
	<button class="btn btn-secondary mb-3" onclick="history.back()">돌아가기</button>





	<c:if test="${board.BOARD_USERNAME==principal.user.username}">
		<a href="/board/${board.ID}/updateForm" class="btn btn-warning mb-3">수정</a>
		<button id="btn-delete" class="btn btn-danger mb-3">삭제</button>
	</c:if>
	<form>
		<input id="title" type="hidden" value="${board.BOARD_TITLE}${board.ID}" />
		<input id="name" type="hidden" class="form-control" value="${principal.user.username}">

		<button id="btn-favorite" class="btn btn-info mb-3">즐겨찾기</button>

	</form>

	<div class="card">
		<form>

			<input id="ID2" type="hidden" value="${board.ID}" />
			<div class="card-body">
				<div class="starpoint_wrap">
					<div class="row">
						<span class="ml-2 mr-2 mt-2">평점 :</span>

						<div style="height: 18px;" class="starpoint_box mt-2">

							<label for="starpoint_1" class="label_star" title="0.5점"><span class="blind">0.5점</span></label> <label for="starpoint_2" class="label_star" title="1점"><span class="blind">1점</span></label> <label
								for="starpoint_3" class="label_star" title="1.5점"><span class="blind">1.5점</span></label> <label for="starpoint_4" class="label_star" title="2점"><span class="blind">2점</span></label> <label
								for="starpoint_5" class="label_star" title="2.5점"><span class="blind">2.5점</span></label> <label for="starpoint_6" class="label_star" title="3점"><span class="blind">3점</span></label> <label
								for="starpoint_7" class="label_star" title="3.5점"><span class="blind">3.5점</span></label> <label for="starpoint_8" class="label_star" title="4점"><span class="blind">4점</span></label> <label
								for="starpoint_9" class="label_star" title="4.5점"><span class="blind">4.5점</span></label> <label for="starpoint_10" class="label_star" title="5점"><span class="blind">5점</span></label> <input
								type="radio" name="starpoint" id="starpoint_1" class="star_radio" value=1> <input type="radio" name="starpoint" id="starpoint_2" class="star_radio" value=2> <input type="radio" name="starpoint" id="starpoint_3" class="star_radio" value=3> <input type="radio" name="starpoint" id="starpoint_4" class="star_radio" value=4> <input type="radio" name="starpoint" id="starpoint_5" class="star_radio" value=5> <input type="radio" name="starpoint" id="starpoint_6" class="star_radio" value=6 checked="checked";> <input
								type="radio" name="starpoint" id="starpoint_7" class="star_radio" value=7> <input type="radio" name="starpoint" id="starpoint_8" class="star_radio" value=8> <input type="radio" name="starpoint" id="starpoint_9" class="star_radio" value=9> <input type="radio" name="starpoint" id="starpoint_10" class="star_radio" value=10> <span class="starpoint_bg"></span>
						</div>
						<div class="ml-2">
							<textarea id="rcontent" class="form-control" placeholder="" style="width:700px; height:40px;"></textarea>
				    	</div>

				</div>
<%--				<input id="rscore" class="form-control" placeholder="" rows="1" value="1">--%>
			</div>
			<div class="form-group">
				<input type="hidden" class="form-control" value="${principal.user.username}" id="username">
			</div>
			<div class="card-footer">
				<button type="button" id="btn-reply-save" class="btn btn-primary">등록</button>
			</div>
		</form>

	</div>
	<br />
	<div class="card">
		<div class="card-header">댓글 리스트</div>


		<ul id="reply-box" class="list-group">

			<c:forEach var="reply" items="${board.replys}">
				<li id="reply-${reply.id}" class="list-group-item d-flex justify-content-between">
					<div>${reply.REPLY_CONTENT}</div>

					<div class="d-flex">
						<div class="font-italic mr-1">작성자 : ${reply.REPLY_USERNAME}</div>
						<c:if test="${principal.user.username eq reply.REPLY_USERNAME}">
							<button onClick="index.replyDelete(${board.ID}, ${reply.id})" class="badge">삭제</button>
						</c:if>
						<div class="custom-review-badge-2 ml-2 mb-1">
							<span class=review-label>${reply.REPLY_NUM1/2}</span>
							<span class=review-star-symbol>&#9733;</span>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>

	</div>

</div>




<script src="/js/board.js"></script>


<!-- 글쓰기 디자인 https://summernote.org/getting-started/#without-bootstrap -->