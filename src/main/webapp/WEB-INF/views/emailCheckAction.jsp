<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%--<script>--%>
<%--    history.replaceState({}, null, location.pathname);--%>
<%--</script>--%>
<%@ include file="layout/header2.jsp"%>

<input type="hidden" id="id" value="${principal.user.id}" />
<div>
<form>
    <div class="form-group">
        <input type="hidden" value="${param.username}" class="form-control"id="username" readonly>
    </div>

    <div class="form-group">
        <input type="hidden" value="${param.USER_PASSWORD}" class="form-control" id="password"readonly>
    </div>

    <div class="form-group">
        <input type="hidden" value="${param.USER_EMAIL}" class="form-control" id="email"readonly>
    </div>


</form>

<c:if test="${principal.user.username eq param.username && principal.user.USER_PASSWORD eq param.password && null ne principal.user.username}">
    <button id="btn-emailcheck" class="btn-3 mb-3" >메일 인증하기</button>
</c:if>
</div>
<c:if test="${null eq principal.user.username}">
    <a style="color:red;">로그인후 진행해 주세요</a>
</c:if>

</br>

${param.username}-${param.email}-${param.password}
${principal.user.username}

<%@ include file="layout/footer.jsp"%>

<script src="/js/user.js"></script>