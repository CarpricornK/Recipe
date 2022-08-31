<%@ page import="java.util.Random" %>
<%@ page import="java.util.Properties" %>
<%@ page import="com.cos.blog.util.Gmail" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.*" %>
<%@ page import="com.cos.blog.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%--<script>--%>
<%--    history.replaceState({}, null, location.pathname);--%>
<%--</script>--%>
<%@ include file="layout/header2.jsp"%>
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
    button {
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

    #button3 {
        font-family: "Roboto", sans-serif;
        text-transform: uppercase;
        outline: 0;
        background: #4CAF50;
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

<div class="login-page">
    <div class="form">
        <input type="hidden" id="id" value="${principal.user.id}" />
        <div>
            <form>
                <div class="form-group">
                    <input type="text" placeholder="password" class="form-control" id="password">
                </div>

                <div class="form-group">
                    <input type="text" placeholder="비밀번호 다시입력" class="form-control" id="password2">
                </div>

                <div class="form-group">
                    <input type="text" placeholder="인증번호 입력" class="form-control" id="Rnum">
                </div>
                <div class="form-group">
                    <input type="hidden" value="${param.Rnum}" class="form-control" id="RnumC">
                </div>

                <div class="form-group">
                    <input type="hidden" value="${param.username}" class="form-control" id="username">
                </div>

            </form>
        </div>
        <button id="btn-PW_FIND2" class="btn-3 mb-3" >비밀번호 변경</button>

    </div>
</div>

<


</br>

<%@ include file="layout/footer.jsp"%>

<script src="/js/user.js"></script>