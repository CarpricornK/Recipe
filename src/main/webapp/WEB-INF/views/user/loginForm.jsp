<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header2.jsp"%>
<style>
	@import url(https://fonts.googleapis.com/css?family=Roboto:300);

	.login-page {
		width: 360px;
		padding: 8% 0 0;
		margin: auto;
	}
	.form {
		position: relative;
		z-index: 1;
		background: whitesmoke;
		max-width: 360px;
		margin: 0 auto 100px;
		padding: 45px;
		text-align: center;
		box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
	}
	.form input {
		font-family: "Roboto", sans-serif;
		outline: 0;
		background: #c5c5c5;
		width: 100%;
		color: #151823;
		border: 0;
		margin: 0 0 15px;
		padding: 15px;
		box-sizing: border-box;
		font-size: 14px;
	}
	.form button {
		font-family: "Roboto", sans-serif;
		text-transform: uppercase;
		outline: 0;
		background: #4CAF50;
		width: 100%;
		border: 0;
		padding: 15px;
		color: #FFFFFF;
		font-size: 14px;
		-webkit-transition: all 0.3 ease;
		transition: all 0.3 ease;
		cursor: pointer;
	}
	.form button:hover,.form button:active,.form button:focus {
		background: #43A047;
	}
	.form .message {
		margin: 15px 0 0;
		color: #b3b3b3;
		font-size: 12px;
	}
	.form .message a {
		color: #4CAF50;
		text-decoration: none;
	}
	.form .register-form {
		display: none;
	}
	.container {
		position: relative;
		z-index: 1;
		max-width: 300px;
		margin: 0 auto;
	}
	.container:before, .container:after {
		content: "";
		display: block;
		clear: both;
	}
	.container .info {
		margin: 50px auto;
		text-align: center;
	}
	.container .info h1 {
		margin: 0 0 15px;
		padding: 0;
		font-size: 36px;
		font-weight: 300;
		color: #1a1a1a;
	}
	.container .info span {
		color: #4d4d4d;
		font-size: 12px;
	}
	.container .info span a {
		color: #000000;
		text-decoration: none;
	}
	.container .info span .fa {
		color: #EF3B3A;
	}
	body {
		font-family: "Roboto", sans-serif;
		-webkit-font-smoothing: antialiased;
		-moz-osx-font-smoothing: grayscale;
	}
</style>


<form action="/auth/loginProc" method="post">

	<div class="login-page">

		<div class="form">
			<h3 style="margin-top: -20px; margin-bottom: 20px;">Login</h3>

				<div class="form-group">
					<input type="text" name="username" class="form-control" placeholder="username" id="username">
				</div>

				<div class="form-group">
					<input type="password" name="password" class="form-control" placeholder="password" id="password">
				</div>
			<button id="btn-login" class="btn-3">기본 로그인</button>
			<p class="message">Not registered? <a href="/auth/joinForm">Create an account</a></p>
			<p class="message">Find password? <a href="/auth/PW_FIND">비밀번호 찾기</a></p>

			<p class="message">연동 로그인</p>

			<div class="d-flex justify-content-center mt-3 ml-2">
				<a class="mr-3" href="/oauth2/authorization/google"><img height="38px" src="/image/btn_google.png"/></a>
				<a style="margin-right: 12px;" href="https://kauth.kakao.com/oauth/authorize?client_id=80132b34d6a4672223b8ee7f2be81ba7&redirect_uri=http://a.recipekyj.link:8000/auth/kakao/callback&response_type=code"><img height="38px" class="mr-2 mb-1" src="/image/kakao_login_button.png"/></a>
				<a class="mr-2" href="/oauth2/authorization/naver"><img height="38px" src="/image/btnD_naver.png"/></a>
			</div>
		</div>
	</div>



</form>




<!-- <script src="/js/user.js"></script> -->

<%@ include file="../layout/footer.jsp"%>
