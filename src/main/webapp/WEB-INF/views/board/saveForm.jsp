<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header2.jsp"%>
<style>

	.cbox {
	}
	/*Checkboxes styles*/
	input[type="checkbox"] { display: none; }

	input[type="checkbox"] + label {
		display: block;
		position: relative;
		padding-left: 35px;
		margin-bottom: 20px;
		font: 14px/20px 'Open Sans', Arial, sans-serif;
		color: #333;
		cursor: pointer;
		-webkit-user-select: none;
		-moz-user-select: none;
		-ms-user-select: none;
	}

	input[type="checkbox"] + label:last-child { margin-bottom: 0; }

	input[type="checkbox"] + label:before {
		content: '';
		display: block;
		width: 20px;
		height: 20px;
		border: 1px solid #6cc0e5;
		position: absolute;
		left: 0;
		top: 0;
		opacity: .6;
		-webkit-transition: all .12s, border-color .08s;
		transition: all .12s, border-color .08s;
	}

	input[type="checkbox"]:checked + label:before {
		width: 10px;
		top: -5px;
		left: 5px;
		border-radius: 0;
		opacity: 1;
		border-top-color: transparent;
		border-left-color: transparent;
		-webkit-transform: rotate(45deg);
		transform: rotate(45deg);
	}
	/*Checkboxes stylesEND*/
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





<div style="margin-bottom: 300px;" class="container">


	<form action="" method="post">
<c:if test="${'ADMIN' eq principal.user.USER_ROLE}">
		<div class="d-flex justify-content-end mb-4">

			<input type="checkbox" id="check" value="1">

			<label for="check">
				공지글
			</label>
		</div>
</c:if>
	<c:if test="${'admin' ne principal.user.username}">
    	<div class="row d-flex justify-content-center mb-2">
			<input style="margin-left:13px; margin-right:13px;" type="text" class="form-control" placeholder="Enter title" id="title">
		</div>
	</c:if>
	

		<div class="form-group">
		- 작성자 -<input type="text" class="form-control" value="${principal.user.username}" id="username">
		</div>

		<div class="form-group">
			<textarea class="form-control summernote" rows="5" id="content"></textarea>
		</div>
	</form>
	<button id="btn-save" class="btn btn-primary mb-2" onclick="this.disabled=true">글쓰기 완료</button>




</div>

<script>
	$('.summernote').summernote(

			{
				placeholder : 'Hello stand alone ui',
				tabsize : 2,
				height : 450,
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