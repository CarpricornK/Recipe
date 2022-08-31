<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%--<script>--%>
<%--    history.replaceState({}, null, location.pathname);--%>
<%--</script>--%>
<%@ include file="layout/header2.jsp"%>

<input type="hidden" id="id" value="${principal.user.id}" />
<div class="container d-flex justify-content-center">
<form>
    <div class="form-group">
        <input type="hidden" value="${param.username}" class="form-control"id="username" readonly>
    </div>

    <div class="form-group">
        <input type="hidden" value="${param.email}" class="form-control" id="password"readonly>
    </div>

    <div class="form-group">
        <input type="hidden" value="${param.password}" class="form-control" id="email"readonly>
    </div>


</form>

<c:if test="${principal.user.username eq param.username && null ne principal.user.username}">


    <button id="btn-emailcheck" class="btn btn-outline-primary mb-3">메일 인증하기</button>


</c:if>
</div>
<c:if test="${principal.user.username eq param.username && null ne principal.user.username}">
<div class="container col d-flex justify-content-center">
    <div>
    <p>인증 유저 : ${param.username}</p>
    <p>인증 유저 이메일 :${param.email}</p>
    <p>인증 유저 암호 :${param.password}</p>
    </div>
</div>
</c:if>


<c:if test="${principal.user.username ne param.username}">
    <a style="color:red;">다른 사용자의 이메일 인증입니다</a>
</c:if>

<c:if test="${null eq principal.user.username}">
    <a style="color:red;">로그인후 진행해 주세요</a>
</c:if>

</br>

<%--${principal.user.username} == ${param.username} --- ${principal.user.USER_PASSWORD} == ${param.password}  null != ${principal.user.username}--%>

<%@ include file="layout/footer.jsp"%>

<script>
    history.replaceState({}, null, location.pathname);
</script>
<script src="/js/user.js"></script>