<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header2.jsp"%>
<style>
	.iconb:hover{
      color:#2B99F8;
	}
	.iconb{
		color:#241d20;
	}
	.backgroundcolor3{
		background-color: #241d20;
	}
	.bordercolor3{
		border: 1px solid;
		border-color: #ffffff #ffffff #241d20 #ffffff;
	}

	.bordercolor3:focus {
		border: 2px solid;
		border-color: #ffffff #ffffff #241d20 #ffffff;
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

	.imgbox1 > a > p > img{
		width: 0px!important;
		height: 0px!important;
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

<c:if test="${'ADMIN' eq principal.user.username}">

</c:if>

<div style="margin-bottom: 300px;" class="container">


	<form action="" method="post">

		<div class="d-flex justify-content-end mb-4">
			<input type="checkbox" id="check" value="1">
			<label for="check">
				공지글
			</label>
		</div>
	
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
	<%--	<button id="btn-save" class="btn btn-primary mb-2">공지 글쓰기</button>--%>
	<button class="btn btn-primary mb-2" onclick="work()" this.onclick=null;>공지 글쓰기</button>


	<script>
		function work() {
			var result = confirm("등록 하시겠습니까?")
			if (result == true) {

				let data = {
					BOARDTITLE: $("#title").val(),
					BOARDCONTENT: $("#content").val(),
					BOARDTYPE: $("#check").is(":checked"),
					BOARDUSERNAME: $("#username").val()
				};
				$.ajax({
					type: "POST",
					url: "/api/board",
					data: JSON.stringify(data),
					contentType: "application/json; charset=utf-8",
					dataType: "json",
				}).done(function (resp) {
					alert("글쓰기가 완료되었습니다.");
					// + data.BOARDTYPE +"check:"+ $("#check").is(":checked")
					location.href = "/";
				}).fail(function (error) {
					alert(JSON.stringify(error));
				});

			} else {
				alert("취소!")
			}
		}
	</script>

	<hr/>

	<div class="d-flex justify-content-center">
		<div class="table-users mt-3" style="max-width:1200px; z-index: 1; background: #FFFFFF; padding: 45px; text-align: center; box-shadow: 0 0 11px rgba(33,33,33,.2); ">
			<div class="divTable">
				<div class="divTableBody">
					<div class="divTableRow">
						<div class="divTableHead backgroundcolor3">ID</div>
						<div class="divTableHead backgroundcolor3">Title</div>
						<div class="divTableHead backgroundcolor3" style="max-width:400px;">Content</div>
						<div class="divTableHead backgroundcolor3">COUNT</div>
						<div class="divTableHead backgroundcolor3">SET</div>
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
							<div class="divTableCell align-middle"> <a style="color: black;" href="/board/${notice.ID}"> ${notice.BOARDTITLE}</a> </div>
							<div class="divTableCell align-middle imgbox1" style="width:800px; word-break: break-all; vertical-align: middle;"> <a style="color: black;" href="/board/${notice.ID}">${notice.BOARDCONTENT} </a> </div>
							<div class="divTableCell align-middle">${notice.BOARDCOUNT}</div>


							<div class="divTableCell align-middle row">
									<div class="row d-flex justify-content-center">
										<button onClick="index.Delete(${notice.ID}, ${1})"
												class="align-middle iconb"
												style="border:none; font-size:15px; margin-top:-3px; background-color:#FFFFFF;">
											<svg xmlns="http://www.w3.org/2000/svg" width="17" height="17"
												 fill="currentColor" class="bi bi-trash-fill"
												 viewBox="0 0 16 16">
												<path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
											</svg>
										</button>
										<a href="/board/${notice.ID}/updateForm"
										   style="background-color:#FFFFFF;" class="align-middle iconb">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
												 fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 16 16">
												<path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001z"/>
											</svg>
										</a>
									</div>
								</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>




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