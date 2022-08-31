<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header2.jsp"%>

<style>
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
</style>
<div class="container">


	<form>
		<c:if test="${'ADMIN' eq principal.user.USER_ROLE}">
			<div class="d-flex justify-content-end mb-4">
				<input type="checkbox" id="check" value="1">
				<label for="check">
					공지글
				</label>
			</div>
		</c:if>

		<input type="hidden" id="id" value="${board.ID}"/>
		<div class="form-group">
			<input value="${board.BOARDTITLE}" type="text" class="form-control" placeholder="Enter title" id="title">
		</div>

		<div class="form-group">
			<textarea class="form-control summernote" rows="5" id="content">${board.BOARDCONTENT}</textarea>
		</div>
	</form>
	<button id="btn-update" class="btn btn-primary" onclick="this.disabled=true">글수정 완료</button>
</div>


<script>
	$('.summernote').summernote(
			{
				placeholder : 'Hello stand alone ui',
				tabsize : 2,
				height : 300,
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
<%@ include file="../layout/footer.jsp"%>



<!-- 글쓰기 디자인 https://summernote.org/getting-started/#without-bootstrap -->