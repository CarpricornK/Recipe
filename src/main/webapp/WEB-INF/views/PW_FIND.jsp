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
<form name="frm" method="post" action="UserServlet" onSubmit="return Checkform()">

    <div class="form-group">
        <input type="text" name="name" placeholder="username" class="form-control"id="username">
    </div>

    <div class="form-group">
        <input type="text" placeholder="email" class="form-control" id="email">
    </div>
</form>
</div>
<button id="btn-PW_FIND" class="btn-3 mb-3" >인증번호전송</button>

</br>




</br>

<%@ include file="layout/footer.jsp"%>

<script src="/js/user.js"></script>