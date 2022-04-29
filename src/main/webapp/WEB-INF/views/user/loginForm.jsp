<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header2.jsp"%>
<style>
.zoomm{
width: 100%;
transition: .3s; /*서서히 나타내기*/
background-color: #0c2537;
color:white;

}

.zoomm:focus{
width: 100%;
background-color: #C2D1FB;
color:black;
}


body {
	background-color: #;
}

button, button::after {
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	-o-transition: all 0.3s;
	transition: all 0.3s;
}

button {
	width: 180px;
	height: 44px;
	background: none;
	border: 2px solid #1c3b58;
	border-radius: 5px;
	color: #1c3b58;
	display: block;
	font-size: 0.8em;
	font-weight: bold;
	padding: 1em 3em;
	position: relative;
	text-transform: uppercase;
}

button::before, button::after {
	background: #1c3b58;
	content: '';
	position: absolute;
	z-index: -1;
}

button:hover {
	color: #ffffff;
}

/* BUTTON 1 */
.btn-1::after {
	height: 0;
	left: 0;
	top: 0;
	width: 100%;
}

.btn-1:hover:after {
	height: 100%;
}

/* BUTTON 2 */
.btn-2::after {
	height: 100%;
	left: 0;
	top: 0;
	width: 0;
}

.btn-2:hover:after {
	width: 100%;
}

/* BUTTON 3 */
.btn-3::after {
	height: 0;
	left: 50%;
	top: 50%;
	width: 0;
}

.btn-3:hover:after {
	height: 100%;
	left: 0;
	top: 0;
	width: 100%;
	border-radius:5px;
}

/* BUTTON 4 */
.btn-4::before {
	height: 100%;
	left: 0;
	top: 0;
	width: 100%;
}

.btn-4::after {
	background: #2ecc71;
	height: 100%;
	left: 0;
	top: 0;
	width: 100%;
}

.btn-4:hover:after {
	height: 0;
	left: 50%;
	top: 50%;
	width: 0;
}

/* BUTTON 5 */
.btn-5 {
	overflow: hidden;
}

.btn-5::after {
	/*background-color: #f00;*/
	height: 100%;
	left: -35%;
	top: 0;
	transform: skew(50deg);
	transition-duration: 0.6s;
	transform-origin: top left;
	width: 0;
}

.btn-5:hover:after {
	height: 100%;
	width: 135%;
}
</style>

<div style="margin-bottom: 200px; margin-top: 150px; width: 100%;" class="container d-flex justify-content-center pt-1">
	<form action="/auth/loginProc" method="post">
		<div class="p-3" style="border: 2px solid #1c3b58; border-radius: 15px;">
			<div style="margin-left:" class="pt-2">
				<div class="form-group">
					<label style="width: 100%;" for="username">🗨 Username</label> <input style="border: 2px solid #1c3b58; border-radius: 5px;" type="text" name="username"
						class="form-control zoomm" placeholder="🗨 Enter Username" id="username">
				</div>

				<div class="form-group">
					<label for="password">🔑 Password</label> <input style="border: 2px solid #1c3b58; border-radius: 5px;" type="password" name="password" class="form-control zoomm"
						placeholder="🔑 Enter password" id="password">
				</div>
			</div>
			<div style="margin-left:" class="pb-3">
				<div style="margin-top: 30px;" class="col d-flex justify-content-center mb-2 mt-4">
					<a href="https://kauth.kakao.com/oauth/authorize?client_id=80132b34d6a4672223b8ee7f2be81ba7&redirect_uri=http://localhost:8000/auth/kakao/callback&response_type=code">
						<div style="height: 46px; width: 370px;">
							<img class="mr-2 mb-1" src="/image/kakao_login_medium_narrow.png" />
					</a>
				</div>
				<button style="margin-left: -175px;" id="btn-login" class="btn-3 ">기본 로그인</button>
			</div>
			<div class="col">
				<a href="/oauth2/authorization/google"><img height="38px" src="/image/btn_google_signin_light_normal_web.png" /></a> <a href="/oauth2/authorization/naver"><img height="38px"
					src="/image/btnD_naver.png" /></a>
			</div>
		</div>

		<a href="http://localhost:8000/auth/PW_FIND">비밀번호 찾기</a>
</div>
</form>



</div>

<!-- <script src="/js/user.js"></script> -->
<%@ include file="../layout/footer.jsp"%>