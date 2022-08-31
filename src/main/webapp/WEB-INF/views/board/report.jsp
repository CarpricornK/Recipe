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
<hr/>
<span class="d-flex justify-content-center"> 신고 </span>
<div class="container my-12 mx-auto px-4 md:px-12">
    <div class="flex flex-wrap -mx-1 lg:-mx-4">


        <c:forEach var="dlists" items="${declaration1.content}">
            <!-- Column -->
            <div class="my-1 px-1 w-full md:w-1/2 lg:my-4 lg:px-4 lg:w-1/3">

                <!-- Article -->
                <article class="overflow-hidden rounded-lg shadow-lg">


                    <div class="h-48 py-4 px-3 w-full">
                            ${dlists.CONTENT}
                    </div>

                    <header class="flex items-center justify-between leading-tight p-2 md:p-4">
                        <h1 class="text-lg">
                            <a class="no-underline hover:underline text-black" href="#">
                                    ${dlists.TITLE}
                            </a>
                        </h1>
                        <p class="text-grey-darker text-sm">
                                ${dlists.DDATE}
                        </p>
                    </header>

                    <footer class="flex items-center justify-between leading-none p-2 md:p-4 ">
                        <a class="flex items-center no-underline hover:underline text-black " href="#">
                            <img alt="Placeholder" class="block rounded-full" src="https://picsum.photos/32/32/?random">
                            <p class="ml-2 text-sm">
                                    ${dlists.NAME}
                            </p>
                        </a>
                        <a class="no-underline text-grey-darker hover:text-red-dark" href="#">
                            <span class="hidden">Like</span>
                            <i class="fa fa-heart"></i>
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


                    <div class="h-48 py-4 px-3 w-full">
                            ${dlists.CONTENT}
                    </div>

                <header class="flex items-center justify-between leading-tight p-2 md:p-4">
                    <h1 class="text-lg">
                        <a class="no-underline hover:underline text-black" href="#">
                                ${dlists.TITLE}
                        </a>
                    </h1>
                    <p class="text-grey-darker text-sm">
                            ${dlists.DDATE}
                    </p>
                </header>

                <footer class="flex items-center justify-between leading-none p-2 md:p-4 ">
                    <a class="flex items-center no-underline hover:underline text-black " href="#">
                        <img alt="Placeholder" class="block rounded-full" src="https://picsum.photos/32/32/?random">
                        <p class="ml-2 text-sm">
                                ${dlists.NAME}
                        </p>
                    </a>
                    <a class="no-underline text-grey-darker hover:text-red-dark" href="#">
                        <span class="hidden">Like</span>
                        <i class="fa fa-heart"></i>
                    </a>
                </footer>

            </article>
            <!-- END Article -->

        </div>
        <!-- END Column -->
        </c:forEach>
    </div>

</div>
<!-- partial -->

</body>
</html>
