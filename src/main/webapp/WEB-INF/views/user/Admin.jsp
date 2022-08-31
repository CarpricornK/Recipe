<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header2.jsp"%>

<style>
	.button {
		margin-top:100px;
		width: 240px;
		height: 125px;
		font-family: 'Roboto', sans-serif;
		font-size: 15px;
		text-transform: uppercase;
		letter-spacing: 2.5px;
		font-weight: 500;
		color: seashell;
		background-color: #777575;
		border: none;
		border-radius: 7px;
		box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
		transition: all 0.3s ease 0s;
		cursor: pointer;
		outline: none;
	}

	.button:hover {
		background-color: #1a1a1a;
		box-shadow: 0px 15px 20px rgba(51, 51, 51, 0.4);
		color: #fff;
		transform: translateY(-7px);
	}
	.wrap {
		height: 100%;
		display: flex;
		align-items: center;
		justify-content: center;
	}

</style>


<c:if test="${'ADMIN' eq principal.user.USER_ROLE}">
	<div class="container wrap d-flex justify-content-center mt-5">
		<button style="height: 250px;" type="button" class="button" onClick="location.href='/board/AsaveForm'">
			<h5>공지사항 작성&관리</h5> <br/>
			<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-megaphone-fill" viewBox="0 0 16 16">
				<path d="M13 2.5a1.5 1.5 0 0 1 3 0v11a1.5 1.5 0 0 1-3 0v-11zm-1 .724c-2.067.95-4.539 1.481-7 1.656v6.237a25.222 25.222 0 0 1 1.088.085c2.053.204 4.038.668 5.912 1.56V3.224zm-8 7.841V4.934c-.68.027-1.399.043-2.008.053A2.02 2.02 0 0 0 0 7v2c0 1.106.896 1.996 1.994 2.009a68.14 68.14 0 0 1 .496.008 64 64 0 0 1 1.51.048zm1.39 1.081c.285.021.569.047.85.078l.253 1.69a1 1 0 0 1-.983 1.187h-.548a1 1 0 0 1-.916-.599l-1.314-2.48a65.81 65.81 0 0 1 1.692.064c.327.017.65.037.966.06z"/>
			</svg>
		</button>

		<div style="padding: 60px;"></div>

		<button style="height: 250px;" type="button" class="button" onClick="location.href='/user/updateForm?ROLE=ADMIN'">
			<h4>회원관리</h4> <br/>
			<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-person-lines-fill" viewBox="0 0 16 16">
				<path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z"/>
			</svg>
		</button>
	</div>
</c:if>


<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>