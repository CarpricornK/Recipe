<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header2.jsp"%>

<div class="container">
	<form>
		<input type="hidden" id="id" value="${principal.user.id}" />
		<div class="form-group">
			<label for="username">Username</label>
			<input type="text" value="${principal.user.username}" class="form-control" placeholder="Enter Username" id="username" readonly>
		</div>

		<div class="form-group">
			EmailChecK : ${principal.user.USER_CHECK}
		</div>
		<input type="text" value="${principal.user.USER_OAUTH}" class="form-control" placeholder="" id="USER_OAUTH" readonly>

		<c:if test="${empty principal.user.USER_OAUTH}">
			<div class="form-group">
				<label for="password">Password</label>
				<input type="password" class="form-control" placeholder="Enter password" id="password">
			</div>
		</c:if>


		<small>
		<a>아이디:${principal.user.id}</a>
		<a>이메일:${principal.user.USER_EMAIL}</a>
		<a>권한:${principal.user.USER_ROLE}</a>
		<a>연동:${principal.user.USER_OAUTH}</a>
		</small>

	</form>
	<button id="btn-update" class="btn btn-primary mt-2">회원수정완료</button>

</div>

<div class="container mt-5">
<form>
	<input type="hidden" id="id1" value="${principal.user.id}" />

	<input type="hidden" value="${principal.user.username}" class="form-control" placeholder="Enter Username" id="username1" readonly>

	<input type="hidden" value="${principal.user.USER_PASSWORD}" class="form-control" placeholder="" id="passwordhash1" readonly>

	<input type="hidden" value="${principal.user.USER_OAUTH}" class="form-control" placeholder="" id="USER_OAUTH1" readonly>

	<div class="form-group">
		<input type="email" value="${principal.user.USER_EMAIL}" class="form-control" placeholder="Enter email" id="email1"readonly>
		<button id="btn-Mail" class="btn btn-primary mt-2">메일인증전송</button>
	</div>

</form>
</div>


<div>
- 회원목록 -


<br/>

<c:forEach var="User" items="${Users}">
	${User.username}
</c:forEach>
</div>


<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>