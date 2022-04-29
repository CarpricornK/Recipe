<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header2.jsp"%>

<table class="table table-striped table-hover container">
	<thead>
	<tr>
		<th class="text-center">NUMBER</th>
		<th class="text-center">TITLE</th>
		<th class="text-right">USERNAME&nbsp;</th>
	</tr>
	</thead>

	<tbody>
	<c:forEach var="favorite" items="${favorites.content}">
		<c:if test="${principal.user.username eq favorite.FAVORTIE_NAME}">

		<tr>
			<td class="text-center">${favorite.ID}</td>
			<td class="text-center"><a href="/board/${favorite.ID}" style="color: rgba(23, 23, 23, 0.99);">
					${favorite.FAVORTIE_TITLE}</a></td>
			<td class="text-right">${favorite.FAVORTIE_NAME}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr>

		</c:if>
	</c:forEach>
	</tbody>
</table>
--${rList}--

<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>