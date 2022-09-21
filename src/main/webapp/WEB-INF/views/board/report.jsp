<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header2.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: Carpricorn
  Date: 2022-08-31
  Time: 오후 3:51
  To change this template use File | Settings | File Templates.

  https://codepen.io/codetimeio/pen/RYMEJe

  테일윈드 사용법
  https://v1.tailwindcss.com/docs/padding

   관리자만 볼수있는 페이지!

   문의완료 문의완료 취소만 남았음

   페이징 4개 받은것중 제일큰거
   c:if test = "
   declaration1.last > declaration2.last && declaration1.last > declaration3.last
   && declaration1.last > declaration4.last
   "

--%>
<!DOCTYPE html>
<html lang="en" >
<head>
    <meta charset="UTF-8">
    <title>CodePen - Tailwind - Responsive Card Grid</title>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/0.6.5/tailwind.min.css'>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>

</head>
<body>
<%--${declaration.content}--%>
<%--${declaration.content[1].CONTENT}--%>
<%--<c:forEach var="i" begin="0" end="11">--%>
<%--    ${declaration.content[i].CONTENT}--%>
<%--</c:forEach>--%>





<%--<c:forEach var="favorite" items="${favorites.content}">--%>
<%--    -${favorite.FAVORTIE_TITLE}---%>
<%--</c:forEach>--%>
<!-- partial:index.partial.html -->

<span class="d-flex justify-content-center text-3xl"> 문의중 </span>
<!-- 문의중 -->
<hr/>
<span class="d-flex justify-content-center"> 신고 </span>
<div class="container my-12 mx-auto px-4 md:px-12">
    <div class="flex flex-wrap -mx-1 lg:-mx-4">


        <c:forEach var="dlists" items="${declaration1.content}">
            <!-- Column -->
            <div class="my-1 px-1 w-full md:w-1/2 lg:my-4 lg:px-4 lg:w-1/3">

                <!-- Article -->
                <article class="overflow-hidden rounded-lg shadow-lg">


                    <div class="h-48 py-4 px-3 w-full" style="word-break:break-all !important;">
                            ${dlists.CONTENT}
                    </div>

                    <header class="flex items-center justify-between leading-tight p-2 md:p-4">
                        <h1 class="text-lg">
                            <p class="no-underline hover:text-blue text-black" href="#">
                                    ${dlists.TITLE}
                            </p>
                        </h1>
                        <p class="text-grey-darker text-sm">
                                ${dlists.DDATE}
                        </p>
                    </header>

                    <footer class="flex items-center justify-between leading-none p-2 md:p-4 ">
                        <span class="flex items-center no-underline hover:text-blue text-black " href="#">
                            <img alt="Placeholder" class="block rounded-full" src="https://picsum.photos/32/32/?random">
                            <p class="ml-2 no-underline hover:text-blue text-black">
                                    ${dlists.NAME}
                            </p>
                        </span>
                        <a class="no-underline text-grey-darker hover:text-red-dark" href="#">
                            <span class="hidden">Like</span>


                            <button onClick="index2.reportT(${dlists.ID}, ${2})"
                                    class="align-middle"
                                    style="color:#777575; border:none; width:25px; font-size:15px; margin-top: -2px; margin-left: -5px; hegiht: 50px;">
                                <i class="fa fa-check no-underline text-grey-darker hover:text-red-dark" aria-hidden="true"></i>
                            </button>
                        </a>
                    </footer>

                </article>
                <!-- END Article -->

            </div>
            <!-- END Column -->
        </c:forEach>
    </div>

</div>

<hr/>
<span class="d-flex justify-content-center"> 문의 </span>

<div class="container my-12 mx-auto px-4 md:px-12">
    <div class="flex flex-wrap -mx-1 lg:-mx-4">


        <c:forEach var="dlists" items="${declaration2.content}">
            <!-- Column -->
            <div class="my-1 px-1 w-full md:w-1/2 lg:my-4 lg:px-4 lg:w-1/3">

                <!-- Article -->
                <article class="overflow-hidden rounded-lg shadow-lg">


                    <div class="h-48 py-4 px-3 w-full" style="word-break:break-all !important;">
                            ${dlists.CONTENT}
                    </div>

                    <header class="flex items-center justify-between leading-tight p-2 md:p-4">
                        <h1 class="text-lg">
                            <p class="no-underline hover:text-blue text-black" href="#">
                                    ${dlists.TITLE}
                            </p>
                        </h1>
                        <p class="text-grey-darker text-sm">
                                ${dlists.DDATE}
                        </p>
                    </header>

                    <footer class="flex items-center justify-between leading-none p-2 md:p-4 ">
                        <span class="flex items-center no-underline hover:text-blue text-black " href="#">
                            <img alt="Placeholder" class="block rounded-full" src="https://picsum.photos/32/32/?random">
                            <p class="ml-2 no-underline hover:text-blue text-black">
                                    ${dlists.NAME}
                            </p>
                        </span>
                        <a class="no-underline text-grey-darker hover:text-red-dark" href="#">
                            <span class="hidden">Like</span>
                            <button onClick="index2.reportT(${dlists.ID}, ${2})"
                                    class="align-middle"
                                    style="color:#777575; border:none; width:25px; font-size:15px; margin-top: -2px; margin-left: -5px; hegiht: 50px;">
                                <i class="fa fa-check no-underline text-grey-darker hover:text-red-dark" aria-hidden="true"></i>
                            </button>
                        </a>
                    </footer>

                </article>
                <!-- END Article -->

            </div>
            <!-- END Column -->
        </c:forEach>
    </div>

</div>


<br/>
<br/>
<br/>
<br/>
<br/>
<br/>



<span class="d-flex justify-content-center text-3xl"> 문의완료 </span>
<!--                         문의 완료                             -->
<hr/>
<span class="d-flex justify-content-center"> 신고 </span>
<div class="container my-12 mx-auto px-4 md:px-12">
    <div class="flex flex-wrap -mx-1 lg:-mx-4">


        <c:forEach var="dlists" items="${declaration3.content}">
            <!-- Column -->
            <div class="my-1 px-1 w-full md:w-1/2 lg:my-4 lg:px-4 lg:w-1/3">

                <!-- Article -->
                <article class="overflow-hidden rounded-lg shadow-lg">


                    <div class="h-48 py-4 px-3 w-full" style="word-break:break-all !important;">
                            ${dlists.CONTENT}
                    </div>

                    <header class="flex items-center justify-between leading-tight p-2 md:p-4">
                        <h1 class="text-lg">
                            <p class="no-underline hover:text-blue text-black" href="#">
                                    ${dlists.TITLE}
                            </p>
                        </h1>
                        <p class="text-grey-darker text-sm">
                                ${dlists.DDATE}
                        </p>
                    </header>

                    <footer class="flex items-center justify-between leading-none p-2 md:p-4 ">
                        <span class="flex items-center no-underline hover:text-blue text-black " href="#">
                            <img alt="Placeholder" class="block rounded-full" src="https://picsum.photos/32/32/?random">
                            <p class="ml-2 no-underline hover:text-blue text-black">
                                    ${dlists.NAME}
                            </p>
                        </span>
                        <a class="no-underline text-grey-darker hover:text-red-dark" href="#">
                            <span class="hidden">Like</span>


                            <button onClick="index2.reportT(${dlists.ID}, ${1})"
                                    class="align-middle"
                                    style="color:#777575; border:none; width:25px; font-size:15px; margin-top: -2px; margin-left: -5px; hegiht: 50px;">
                                <i class="fa fa-times no-underline text-grey-darker hover:text-red-dark" aria-hidden="true"></i>
                            </button>
                        </a>
                    </footer>

                </article>
                <!-- END Article -->

            </div>
            <!-- END Column -->
        </c:forEach>
    </div>

</div>


<hr/>
<span class="d-flex justify-content-center"> 문의 </span>

<div class="container my-12 mx-auto px-4 md:px-12">
    <div class="flex flex-wrap -mx-1 lg:-mx-4">


        <c:forEach var="dlists" items="${declaration4.content}">
            <!-- Column -->
            <div class="my-1 px-1 w-full md:w-1/2 lg:my-4 lg:px-4 lg:w-1/3">

                <!-- Article -->
                <article class="overflow-hidden rounded-lg shadow-lg">


                    <div class="h-48 py-4 px-3 w-full" style="word-break:break-all !important;">
                            ${dlists.CONTENT}
                    </div>

                    <header class="flex items-center justify-between leading-tight p-2 md:p-4">
                        <h1 class="text-lg">
                            <p class="no-underline hover:text-blue text-black" href="#">
                                    ${dlists.TITLE}
                            </p>
                        </h1>
                        <p class="text-grey-darker text-sm">
                                ${dlists.DDATE}
                        </p>
                    </header>

                    <footer class="flex items-center justify-between leading-none p-2 md:p-4 ">
                        <span class="flex items-center no-underline hover:text-blue text-black " href="#">
                            <img alt="Placeholder" class="block rounded-full" src="https://picsum.photos/32/32/?random">
                            <p class="ml-2 no-underline hover:text-blue text-black">
                                    ${dlists.NAME}
                            </p>
                        </span>
                        <a class="no-underline text-grey-darker hover:text-red-dark" href="#">
                            <span class="hidden">Like</span>
                            <button onClick="index2.reportT(${dlists.ID}, ${1})"
                                    class="align-middle"
                                    style="color:#777575; border:none; width:25px; font-size:15px; margin-top: -2px; margin-left: -5px; hegiht: 50px;">
                                <i class="fa fa-times no-underline text-grey-darker hover:text-red-dark" aria-hidden="true"></i>
                            </button>
                        </a>
                    </footer>

                </article>
                <!-- END Article -->

            </div>
            <!-- END Column -->
        </c:forEach>
    </div>

</div>





<!--           페이징           -->

<c:if test="${null ne param.page}">
    <div class="container d-flex justify-content-center">
        -${param.page+1}-
    </div>
</c:if>


    <c:if test="${declaration5.totalPages<=declaration5.number}">
	<span class="d-flex justify-content-center mt-1"> <a style="color: red; font-size: 14px;" href="?page=${declaration5.totalPages-1}">없는 페이지 입니다(누르면 마지막 페이지로 돌아갑니다)</a>
	</span>
    </c:if>

    <ul class="pagination justify-content-center mt-5">

        <c:choose>
            <c:when test="${declaration5.first}">
                <li class="page-item disabled"><a style="color: #363435; border: 1px #FFFFFF;" class="page-link" href="?page=${declaration5.number-1}">Previous</a></li>
            </c:when>
            <c:otherwise>
                <li class="page-item"><a style="color: #363435; border: 1px #FFFFFF;" class="page-link" href="?page=${declaration5.number-1}">Previous</a></li>
            </c:otherwise>
        </c:choose>

        <c:set var="pageend" value="${declaration5.totalPages}"/>
        <c:if test="${declaration5.totalPages>10}">
            <c:set var="pageend" value="10"/>
        </c:if>

        <c:if test="${declaration5.number<9}">
            <c:forEach var="i" begin="0" end="${pageend-1}">

                <c:if test="${null ne param.stype }">
                    <li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}"> ${i+1}</a></li>
                </c:if>
                <c:if test="${null eq param.stype }">
                    <li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}"> ${i+1}</a></li>
                </c:if>

            </c:forEach>
        </c:if>

        <c:if test="${declaration5.number>=9}">
            <c:if test="${(declaration5.totalPages-1)-param.page>5}">
                <c:forEach var="i" begin="${param.page-5}" end="${param.page+5}">
                    <c:if test="${null ne param.stype }">
                        <li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}"> ${i+1}</a></li>
                    </c:if>
                    <c:if test="${null eq param.stype }">
                        <li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}"> ${i+1}</a></li>
                    </c:if>
                </c:forEach>
            </c:if>
            <c:if test="${(declaration5.totalPages-1)-param.page<=5}">
                <c:forEach var="i" begin="${param.page-5}" end="${declaration5.totalPages-1}">
                    <c:if test="${null ne param.stype }">
                        <li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}"> ${i+1}</a></li>
                    </c:if>
                    <c:if test="${null eq param.stype }">
                        <li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}"> ${i+1}</a></li>
                    </c:if>
                </c:forEach>
            </c:if>
        </c:if>

        <c:choose>
            <c:when test="${declaration5.last}">
                <li class="page-item disabled"><a style="color: #363435; border: 1px #FFFFFF;" class="page-link" href="?page=${declaration5.number+1}">Next</a></li>
            </c:when>

            <c:otherwise>
                <li class="page-item"><a style="color: #363435; border: 1px #FFFFFF;" class="page-link" href="?page=${declaration5.number+1}">Next</a></li>
            </c:otherwise>
        </c:choose>

    </ul>



<c:if test="${'searchf' eq param.field && null eq param.NOTICE && '' ne declaration5.totalPages}">

    <c:if test="${declaration5.totalPages<=declaration5.number}">
	<span class="d-flex justify-content-center mt-1"> <a style="color: red; font-size: 14px;" href="?page=${declaration5.totalPages-1}">없는 페이지 입니다(누르면 마지막 페이지로 돌아갑니다)</a>
	</span>
    </c:if>

    <ul class="pagination justify-content-center mt-5">

        <c:choose>
            <c:when test="${declaration5.first}">
                <li class="page-item disabled"><a style="color: #363435; border: 1px #FFFFFF;" class="page-link" href="?page=${declaration5.number-1}">Previous</a></li>
            </c:when>
            <c:otherwise>
                <li class="page-item"><a style="color: #363435; border: 1px #FFFFFF;" class="page-link" href="?page=${declaration5.number-1}">Previous</a></li>
            </c:otherwise>
        </c:choose>

        <c:set var="pageend" value="${declaration5.totalPages}"/>
        <c:if test="${declaration5.totalPages>10}">
            <c:set var="pageend" value="10"/>
        </c:if>

        <c:if test="${declaration5.number<9}">
            <c:forEach var="i" begin="0" end="${pageend-1}">

                <c:if test="${null ne param.stype }">
                    <li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}"> ${i+1}</a></li>
                </c:if>
                <c:if test="${null eq param.stype }">
                    <li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}"> ${i+1}</a></li>
                </c:if>

            </c:forEach>
        </c:if>
        <c:if test="${declaration5.number>=9}">
            <c:if test="${(declaration5.totalPages-1)-param.page>5}">
                <c:forEach var="i" begin="${param.page-5}" end="${param.page+5}">
                    <c:if test="${null ne param.stype }">
                        <li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}"> ${i+1}</a></li>
                    </c:if>
                    <c:if test="${null eq param.stype }">
                        <li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}"> ${i+1}</a></li>
                    </c:if>
                </c:forEach>
            </c:if>
            <c:if test="${(declaration5.totalPages-1)-param.page<=5}">
                <c:forEach var="i" begin="${param.page-5}" end="${declaration5.totalPages-1}">
                    <c:if test="${null ne param.stype }">
                        <li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}"> ${i+1}</a></li>
                    </c:if>
                    <c:if test="${null eq param.stype }">
                        <li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}"> ${i+1}</a></li>
                    </c:if>
                </c:forEach>
            </c:if>
        </c:if>

        <c:choose>
            <c:when test="${declaration5.last}">
                <li class="page-item disabled"><a style="color: #363435; border: 1px #FFFFFF;" class="page-link" href="?page=${declaration5.number+1}">Next</a></li>
            </c:when>

            <c:otherwise>
                <li class="page-item"><a style="color: #363435; border: 1px #FFFFFF;" class="page-link" href="?page=${declaration5.number+1}">Next</a></li>
            </c:otherwise>
        </c:choose>

    </ul>
</c:if>








</body>

<script src="/js/board2.js"></script>

</html>

