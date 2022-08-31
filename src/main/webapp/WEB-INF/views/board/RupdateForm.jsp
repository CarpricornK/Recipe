<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header2.jsp"%>
<style>
	.wrap-vertical{
		width: 100%;
		height: 470px;
		padding: 20px;
		overflow: scroll;
		color: none;
		background: none;
		/* 가로 스크롤 */
		overflow: auto;
		white-space: nowrap;
	}
	.wrap-vertical::-webkit-scrollbar {
		width: 6px;
	}

	/* 스크롤바 막대 설정*/
	.wrap-vertical::-webkit-scrollbar-thumb {
		height: 4px;
		background-color: rgba(255, 141, 50, 1);
		border-radius: 10px;
	}

	/* 스크롤바 뒷 배경 설정*/
	.wrap-vertical::-webkit-scrollbar-track {
		background-color: rgba(33, 133, 133, 0.33);
	}
/* ============================= TIP =========================== */
.help-tip {
	position: fixed;
	top: 18px;
	right: 18px;
	text-align: center;
	background-color: #302F2F;
	border-radius: 50%;
	width: 24px;
	height: 24px;
	font-size: 10px;
	line-height: 26px;
	cursor: default;
}

.help-tip:before {
	content: 'TIP';
	font-weight: bold;
	color: #fff;
}

.help-tip:hover p {
	display: block;
	transform-origin: 100% 0%;
	-webkit-animation: fadeIn 0.3s ease-in-out;
	animation: fadeIn 0.3s ease-in-out;
}

.help-tip p {
	display: none;
	text-align: center;
	background-color: #1E2021;
	border: 1px solid #777575;
	padding: 20px;
	width: 350px;
	position: absolute;
	border-radius: 3px;
	box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);
	right: -4px;
	color: #FFFFFF;
	font-size: 13px;
	line-height: 1.4;
	padding: 20px;
}

.help-tip p:before {
	position: absolute;
	content: '';
	width: 0;
	height: 0;
	border: 6px solid transparent;
	border-bottom-color: #1E2021;
	right: 10px;
	top: -12px;
}

.help-tip p:after {
	width: 100%;
	height: 40px;
	content: '';
	position: absolute;
	top: -40px;
	left: 0;
}
</style>


<div class="help-tip">
	<p>
		- TIP - <br>Ctrl+Shift+E로 가운데 정렬을 할수있습니다 <br>관리자는 체크박스가 보인다면 공지글을 작성할수있습니다.
	</p>
</div>

<div style="margin-bottom: 700px;" class="container">

	<form action="" method="post">
		    <input id="id" type="hidden" value="${board.ID}">

    	<div class="row d-flex justify-content-center mb-2">
			<input style="margin-left:13px; margin-right:13px;" type="text" class="form-control" value="${board.RBOARDTITLE}" id="title">
		</div>

		<div class="form-group">
		- 작성자 -<input type="text" class="form-control" value="${principal.user.username}" id="username">
		</div>

        <div class="wrap-vertical">
		<div class="row" style="width:4100px;">

			<div class="mr-2" style="width:360px">
				<textarea class="form-control summernote" rows="5" id="RBOARDIMG01">${board.RBOARDIMG01}</textarea>
				<textarea class="form-control mt-1" placeholder="...." id="RBOARD01">${board.RBOARD01}</textarea>
			</div>

			<div class="mr-2" style="width:360px">
				<textarea  class="form-control summernote" rows="2" id="RBOARDIMG02">${board.RBOARDIMG02}</textarea>
				<textarea class="form-control mt-1" placeholder="...." id="RBOARD02">${board.RBOARD02}</textarea>

			</div>

			<div class="mr-2" style="width:360px">
				<textarea class="form-control summernote" rows="2" id="RBOARDIMG03">${board.RBOARDIMG03}</textarea>
				<textarea class="form-control mt-1" placeholder="...." id="RBOARD03">${board.RBOARD03}</textarea>

			</div>

			<div class="mr-2" style="width:360px">
				<textarea class="form-control summernote" rows="2" id="RBOARDIMG04">${board.RBOARDIMG04}</textarea>
				<textarea class="form-control mt-1" placeholder="...." id="RBOARD04">${board.RBOARD04}</textarea>

			</div>

			<div class="mr-2" style="width:360px">
				<textarea class="form-control summernote" rows="2" id="RBOARDIMG05">${board.RBOARDIMG05}</textarea>
				<textarea class="form-control mt-1" placeholder="...." id="RBOARD05">${board.RBOARD05}</textarea>

			</div>

			<div class="mr-2" style="width:360px">
				<textarea class="form-control summernote" rows="2" id="RBOARDIMG06">${board.RBOARDIMG06}</textarea>
				<textarea class="form-control mt-1" placeholder="...." id="RBOARD06">${board.RBOARD06}</textarea>

			</div>

			<div class="mr-2" style="width:360px">
				<textarea class="form-control summernote" rows="2" id="RBOARDIMG07">${board.RBOARDIMG07}</textarea>
				<textarea class="form-control mt-1" placeholder="...." id="RBOARD07">${board.RBOARD07}</textarea>

			</div>

			<div class="mr-2" style="width:360px">
				<textarea class="form-control summernote" rows="2" id="RBOARDIMG08">${board.RBOARDIMG08}</textarea>
				<textarea class="form-control mt-1" placeholder="...." id="RBOARD08">${board.RBOARD08}</textarea>

			</div>

			<div class="mr-2" style="width:360px">
				<textarea class="form-control summernote" rows="2" id="RBOARDIMG09">${board.RBOARDIMG09}</textarea>

				<textarea class="form-control mt-1" placeholder="...." id="RBOARD09">${board.RBOARD09}</textarea>

			</div>

			<div class="mr-2" style="width:360px">
				<textarea class="form-control summernote" rows="2" id="RBOARDIMG10">${board.RBOARDIMG10}</textarea>
				<textarea class="form-control mt-1" placeholder="...." id="RBOARD10">${board.RBOARD10}</textarea>

			</div>

		</div>
		</div>



	<div class="row d-flex justify-content-around">

		<div class="d-flex align-items-center mt-3 ml-2" style="height: 50px;">
			<span class="mr-2">메뉴명 : </span>
			<input style="width:500px" class="form-control" id="RNM" placeholder="메뉴명" value="${board.RBOARDNM}">
		</div>

		<div class="d-flex align-items-center mt-3 mr-2" style="height: 50px;">
			<span class="mr-2">분류 : </span>
			<select style="width:500px;" class="form-control" id="RNM2">
				<option value="${board.RBOARDFTYPE}">${board.RBOARDFTYPE} -수정전-</option>
				<option value="밥">밥</option>
				<option value="후식">후식</option>
				<option value="국">국</option>
				<option value="과일">과일</option>
				<option value="빵">빵</option>
				<option value="과자">과자</option>
				<option value="조림">조림</option>
				<option value="찜">찜</option>
				<option value="무침">무침</option>
				<option value="해물">해물</option>
				<option value="볶음">볶음</option>
			</select>
		</div>

		<div class="form-group mt-5" style="width:97%">
			<textarea class="form-control summernote2" rows="2" id="content">${board.RBOARDCONTENT}</textarea>
		</div>
	</div>
	</form>
	<%--	<button id="" class="btn btn-primary mb-2" onclick="work()" this.onclick=null;>글쓰기 완료</button>--%>
	<div class="d-flex justify-content-center">
		<button id="btn-Rupdate" class="btn btn-outline-primary mb-2" style="width: 300px;" onclick="this.disabled=true">수정완료</button>
	</div>




</div>

<script>
	$('.summernote').summernote(

			{
				placeholder : '사진(드래그 앤 드롭)',
				tabsize : 2,
				height : 300,
				toolbar : [ [ 'style', [ '' ] ],
					[ 'para', [ 'paragraph' ] ],
					[ 'table', [ 'table' ] ],
					[ 'insert', [ 'link', 'picture'] ],
					[ 'view', [ '', 'codeview', 'help' ] ] ]
			});

	$('.summernote2').summernote(

			{
				placeholder : 'Hello stand alone ui',
				tabsize : 2,
				height : 250,
				toolbar : [ [ 'style', [ 'style' ] ],
					[ 'font', [ 'bold', 'underline', 'clear' ] ],
					[ 'color', [ 'color' ] ],
					[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
					[ 'table', [ 'table' ] ],
					[ 'insert', [ 'link', 'picture', 'video' ] ],
					[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ]
			});
</script>
<script src="/js/board.js"></script>




<!-- 글쓰기 디자인 https://summernote.org/getting-started/#without-bootstrap -->