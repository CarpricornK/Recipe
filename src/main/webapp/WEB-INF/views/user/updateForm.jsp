<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header2.jsp"%>
<style>
	.wrap-vertical{
		width: 100%;
		height: 390px;
		padding: 20px;
		overflow: scroll;
		color: none;
		background: none;
		/* 가로 스크롤 */
		overflow: auto;
		white-space: nowrap;
		margin-top: 30px;
		margin-bottom: 150px;
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

	.divTable{
		display: table;
		width: 100%;

	}
	.divTableRow {
		display: table-row;
	}
	.divTableHeading {
		background-color: #363435;
		color: #FFFFFF;
		display: table-header-group;
	}
	.divTableCell, .divTableHead {
		background-color: #363435;
		color: #FFFFFF;
		display: table-cell;
		padding: 3px 10px;
	}
	.divTableHeading {
		background-color: #363435;
		color: #FFFFFF;
		display: table-header-group;
		font-weight: bold;
	}
	.divTableFoot {
		background-color: #363435;
		color: #FFFFFF;
		display: table-footer-group;
		font-weight: bold;
	}
	.divTableBody {
		display: table-row-group;
	}
	input{
		background-color: #363435!important;
		color: white!important;
	}
	input::-webkit-input-placeholder {
		color: white!important;
	}
	input:-ms-input-placeholder {
		color: white!important;
	}
	.darkbox{
		background-color: #363435; color: #FFFFFF; border-radius: 5px;
	}
</style>



<div class="container">

	<div class="p-5 darkbox" style="">

	<form>

        <c:if test="${param.ROLE eq principal.user.USER_ROLE}">
			<div class="form-group">
				<label for="id">ID</label>
				<input class="form-control" type="text" id="id" value="${principal.user.id}" />
			</div>
		<div class="form-group">
			<label for="username">Username</label>
			<input type="text" value="${principal.user.username}" class="form-control" placeholder="Enter Username" id="username">
		</div>
		</c:if>
		<c:if test="${param.ROLE ne principal.user.USER_ROLE}">
			<input type="hidden" id="id" value="${principal.user.id}" />
			<div class="form-group">
				<label for="username">Username</label>
				<input type="text" value="${principal.user.username}" class="form-control" placeholder="Enter Username" id="username" readonly>
			</div>
		</c:if>


		<c:if test="${empty principal.user.USER_OAUTH}">
			<div class="form-group">
				<label for="password">Password</label>
				<input type="password" class="form-control" placeholder="Enter password" id="password">
			</div>
		</c:if>

		<c:if test="${principal.user.USER_OAUTH ne null && principal.user.USER_ROLE eq ADMIN}">
			<div class="form-group">
				<label for="password">Password</label>
				<input type="password" class="form-control" placeholder="Enter password" id="password">
			</div>
		</c:if>

	</form>

		<div class="d-flex justify-content-between">
			<div class="d-flex align-items-center" style="height: 46px; font-size:16px;">
					이메일인증여부:${principal.user.USER_CHECK}&nbsp;&nbsp;
					<a>아이디:${principal.user.id}</a>&nbsp;&nbsp;
					<a>이메일:${principal.user.USER_EMAIL}</a>&nbsp;&nbsp;
					<a>권한:${principal.user.USER_ROLE}</a>&nbsp;&nbsp;
					<a>연동:${principal.user.USER_OAUTH}</a>&nbsp;
			</div>



			<div class="d-flex align-items-center">
				<form method="get" action="/user/updateForm">
					<button class="mr-1" id="remoteb" style="border: none; width: 50px; color: white; background-color: #363435" name="ROLE" type="submit" value="ADMIN">
						<svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-tools" viewBox="0 0 16 16">
							<path d="M1 0 0 1l2.2 3.081a1 1 0 0 0 .815.419h.07a1 1 0 0 1 .708.293l2.675 2.675-2.617 2.654A3.003 3.003 0 0 0 0 13a3 3 0 1 0 5.878-.851l2.654-2.617.968.968-.305.914a1 1 0 0 0 .242 1.023l3.27 3.27a.997.997 0 0 0 1.414 0l1.586-1.586a.997.997 0 0 0 0-1.414l-3.27-3.27a1 1 0 0 0-1.023-.242L10.5 9.5l-.96-.96 2.68-2.643A3.005 3.005 0 0 0 16 3c0-.269-.035-.53-.102-.777l-2.14 2.141L12 4l-.364-1.757L13.777.102a3 3 0 0 0-3.675 3.68L7.462 6.46 4.793 3.793a1 1 0 0 1-.293-.707v-.071a1 1 0 0 0-.419-.814L1 0Zm9.646 10.646a.5.5 0 0 1 .708 0l2.914 2.915a.5.5 0 0 1-.707.707l-2.915-2.914a.5.5 0 0 1 0-.708ZM3 11l.471.242.529.026.287.445.445.287.026.529L5 13l-.242.471-.026.529-.445.287-.287.445-.529.026L3 15l-.471-.242L2 14.732l-.287-.445L1.268 14l-.026-.529L1 13l.242-.471.026-.529.445-.287.287-.445.529-.026L3 11Z"/>
						</svg>
					</button>
					<c:if test="${param.page ne null}">
						<input style="width: 50px;" type="hidden" name="page" value="${param.page}" />
					</c:if>
					<c:if test="${param.board ne null}">
						<input style="width: 50px;" type="hidden" name="board" value="${param.board}" />
					</c:if>
					<c:if test="${param.style ne null}">
						<input style="width: 50px;" type="hidden" name="style" value="${param.style}" />
					</c:if>
				</form>

				<button id="btn-update" class="btn btn-dark mr-1">회원수정완료</button>
				<button type="button" class="btn btn-dark" data-toggle="modal" data-target="#myModal">
					회원 탈퇴
				</button>
			</div>
		</div>

	</div>
</div>

<div class="container mt-5">
<form>
	<input type="hidden" id="id1" value="${principal.user.id}" />

	<input type="hidden" value="${principal.user.username}" class="form-control" placeholder="Enter Username" id="username1" readonly>

	<input type="hidden" value="${principal.user.USER_PASSWORD}" class="form-control" placeholder="" id="passwordhash1" readonly>

	<input type="hidden" value="${principal.user.USER_OAUTH}" class="form-control" placeholder="" id="USER_OAUTH1" readonly>

	<div class="form-group p-5 d-flex justify-content-between" style="background-color: #363435; border-radius: 5px;">
		<input style="width: 80%" type="email" value="${principal.user.USER_EMAIL}" class="form-control" placeholder="Enter email" id="email1"readonly>
		<button id="btn-Mail" class="btn btn-dark">메일인증전송</button>
	</div>

</form>

</div>
<c:if test="${param.ROLE eq principal.user.USER_ROLE && principal.user.USER_ROLE eq 'ADMIN'}">
<div class="container p-5 wrap-vertical" style="border-radius: 5px; background-color: #363435; max-width: 1110px;">
	<a style="color: white">- 회원목록 -</a>
<br/>

	<div class="divTable">
		<div class="divTableHeading">
			<div class="divTableRow">
				<div class="divTableHead">ID</div>
				<div class="divTableHead">Username</div>
<%--				<div class="divTableHead">Password</div>--%>
				<div class="divTableHead">ROLE</div>
				<div class="divTableHead">Email</div>
				<div class="divTableHead">CHECK?</div>
				<div class="divTableHead">Link</div>
			</div>
		</div>
<c:forEach var="User" items="${Users}">
		<div class="divTableBody">
			<div class="divTableRow">
				<div class="divTableCell">${User.id}</div>
				<div class="divTableCell">${User.username}</div>
<%--				<div class="divTableCell"><c:if test="${'cos1234' eq User.USER_PASSWORD2}">연동 로그인</c:if><c:if test="${'cos1234' ne User.USER_PASSWORD2}">${User.USER_PASSWORD2}</c:if></div>--%>
				<div class="divTableCell">${User.USER_ROLE}</div>
				<div class="divTableCell">${User.USER_EMAIL}</div>
				<div class="divTableCell">${User.USER_CHECK}</div>
				<div class="divTableCell">${User.USER_OAUTH}</div>
			</div>
		</div>
</c:forEach>
	</div>

</div>




</c:if>



<!-- 회원탈퇴 -->
<div class="modal fade" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h1 class="modal-title">회원탈퇴</h1>
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>

			<form>
				<!-- Modal body -->
				<div class="modal-body form-group">
					<h5 style="color:#f74e3b">※ 한번 회원 탈퇴를 진행하면 복구할 수 없습니다</h5>
					<p style="color:#f74e3b">※ 메일 인증이 되어있지 않으면 회원 탈퇴를 진행할 수 없습니다</p>
					<c:if test="${'ADMIN' eq principal.user.USER_ROLE && null ne param.ROLE}">
						<div class="row d-flex justify-content-center mb-2">
							<span class="mt-1">대상ID입력:&nbsp;&nbsp;</span>
							<input style="width:70% !important;" class="form-control" placeholder="삭제할 대상의 id"
								   type="text" id="userid" value="">
						</div>
					</c:if>
					<c:if test="${null eq param.ROLE}">
							<input style="width:70% !important;" type="hidden" class="form-control" id="userid"
								   value="${principal.user.id}">
					</c:if>

					<div class="row d-flex justify-content-center mb-3">
						<span class="mt-1">Username&nbsp;&nbsp;:&nbsp;&nbsp;</span>
						<c:if test="${'ADMIN' ne principal.user.USER_ROLE}">
							<input style="width:70% !important;" type="text" value="${principal.user.username}"
								   class="form-control" id="username2" readonly>
						</c:if>
						<c:if test="${'ADMIN' eq principal.user.USER_ROLE}">
							<input style="width:70% !important;" type="text" class="form-control" id="username2">
						</c:if>
					</div>


					<div class="row d-flex justify-content-center mb-2">
						<span class="mt-1">password&nbsp;&nbsp;:&nbsp;&nbsp;</span>
						<input style="width:34% !important;" type="password" class="form-control mr-2" id="password2">
						<input style="width:34% !important;" type="password" class="form-control" id="repassword2">
					</div>

					<div class="custom-control custom-switch ml-3">
						<input type="checkbox" name="switch1" class="custom-control-input" id="switch1" value="1">
						<label class="custom-control-label" for="switch1">회원 탈퇴를 신청하면 바로 로그아웃 됩니다."</label>
					</div>

					<div class="custom-control custom-switch ml-3">
						<input type="checkbox" name="switch2" class="custom-control-input" id="switch2" value="1">
						<label class="custom-control-label" for="switch2">탈퇴 후에는 작성된 글 삭제가 되지 않습니다.</label>
					</div>
				</div>
                 <c:if test="${'ADMIN' ne principal.user.USER_ROLE}">
				<input style="width:70% !important;" type="hidden" class="form-control" id="ckpassword2"
					   value="${principal.user.USER_PASSWORD2}">
                </c:if>
				<input type="hidden" id="check" value="${principal.user.USER_CHECK}">


			</form>
            <c:if test="${'ADMIN' ne principal.user.USER_ROLE}">
			<button id="btn-delete" class="btn btn-outline-danger mr-5 ml-5 mb-3">회원 탈퇴</button>
            </c:if>
			<c:if test="${'ADMIN' eq principal.user.USER_ROLE}">
				<button id="btn-delete2" class="btn btn-outline-danger mr-5 ml-5 mb-3">관리자 회원 탈퇴</button>
			</c:if>
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button>
			</div>

		</div>
	</div>
</div>

<script src="/js/user.js"></script>