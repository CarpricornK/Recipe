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
<%
%>
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



</br>

<%@ include file="layout/footer.jsp"%>

<script src="/js/user.js"></script>