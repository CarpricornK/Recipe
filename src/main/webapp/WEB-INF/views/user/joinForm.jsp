
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.PrintWriter"%>
<%@ page import="com.cos.blog.util.SHA256" %>
<%@ page import="com.cos.blog.model.User" %>
<%@page import="com.cos.blog.util.Gmail"%>
<%@ page import="com.cos.blog.util.UserDAO" %>

<%@ include file="../layout/header2.jsp"%>



<style>
.zoomm{
width: 350px;
transition: .3s; /*서서히 나타내기*/
background-color: #0c2537;
color:white;

}

.zoomm:focus{
width: 400px;
background-color: #C2D1FB;
color:black;
}

button, button::after {
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	-o-transition: all 0.3s;
	transition: all 0.3s;
}

button {
	width: 130px;
	height: 40px;
	background: none;
	border: 2px solid #1c3b58;
	border-radius: 5px;
	color: #1c3b58;
	display: block;
	font-size: 14px;
	font-weight: bold;
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
	width: 170px;
}

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
}
</style>


<%

%>


<div class="container">

	<form>

		<!-- 		<div class="form-group"> -->
		<!-- 			<label for="email">Email</label> <input type="email" class="form-control" placeholder="Enter email" id="email"> -->
		<!-- 		</div> -->
		<div style="margin-top: 150px; width: 100%;" class="container d-flex justify-content-center pt-1">
			<div style="border: 2px solid; border-color:#1c3b58 #ffffff #1c3b58 ; padding-right: 10%; padding-left: 10%;" class="pt-2">
				<div class="form-group">
					<label  for="username">🗨 Username</label>
                    <c:if test="${null eq check1 && null ne param.name}">
					<input style="border: 2px solid #1c3b58;  border-radius: 5px;" type="text" name="username" class="form-control zoomm" value="${param.name}" id="username">
					</c:if>
					<c:if test="${null eq param.name}">
					<input style="border: 2px solid #1c3b58;  border-radius: 5px;" type="text" name="username" class="form-control zoomm" placeholder="🗨 Enter Username" id="username">
					</c:if>
				</div>

				<div class="ml-1 row">
				<form ACTION ="joinForm.jsp" METHOD=POST>

					<input TYPE="text" NAME="name" SIZE=20 value=''> <br>

					<input TYPE="submit" VALUE="아이디중복체크">

				</form>
				</div>

				<c:forEach var="User" items="${Users}">
					<c:set var="title" value="${User.username}" />
					<c:set var="check" value="아이디 사용가능!" />
					<c:if test="${User.username eq param.name}">
						<c:set var="check1" value="아이디 중복!" />
					</c:if>
				</c:forEach>
				<c:if test="${null eq check1 && null ne param.name}">
				<a style="color:blue;">${check}</a>
				</c:if>
				<a style="color:blue;">${check1}</a>

				<div class="form-group">
					<label for="password">🔑 Password</label> <input style="border: 2px solid #1c3b58;  border-radius: 5px;" type="password" name="password" class="form-control zoomm"
						placeholder="🔑 Enter password" id="password">
				</div>

				<div class="form-group">
					<label for="password">🔑 Password Re</label>
					<input style="border: 2px solid #1c3b58;  border-radius: 5px;" type="password" name="password" class="form-control zoomm" placeholder="Re password" id="passwordre">
				</div>

				<div class="form-group">
					<label for="email"><span style="color: #35497F;">📧 Email</span></label> <input style="border: 2px solid #1c3b58;" type="email" class="form-control zoomm"
						placeholder="📧 Enter email" id="email">
				</div>

			</div>
			
		</div>
             
	</form>
          <div style="margin-bottom: 200px; width: 100%;" class="container d-flex justify-content-center pt-1">
               <div style="width: 570px; border: 2px solid; border-color:#ffffff #ffffff #FFFFFF ; " class="d-flex justify-content-center mt-2">
					<button id="btn-save" class="btn-3 mb-3" >회원가입</button>
			   </div>
		  </div>


</div>





<script src="/js/user.js"></script>


<%@ include file="../layout/footer.jsp"%>