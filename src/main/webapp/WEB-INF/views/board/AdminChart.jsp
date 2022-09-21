<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
   declarations1.last > declarations2.last && declarations1.last > declarations3.last
   && declarations1.last > declarations4.last
   "

--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/0.6.5/tailwind.min.css'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.1.js"
            integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

    <style>
        /*신고 통계*/
        .logo-brand {
            width: 250px;
            height: 60px;
            position: absolute;
            left: 0;
            top: 0;
            font-size: 20px;
            font-weight: 700;
            padding: 0;
            text-align: center;
            background: #242A34;
            color: #fff;
        }

        .logo-brand a {
            color: #fff;
            font-size: 40px;
            text-decoration: none;
        }

        .col-lg-3 {
            padding: 7px;
        }

        .col-lg-7 {
            padding: 7px;
        }

        .col-lg-5 {
            padding: 7px;
        }

        .card {
            color: #e8eaf6;
            height: 100px;
            display: block;
            position: relative;
            overflow: hidden;
            border-radius: 2px;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 1px 2px rgba(0, 0, 0, .26);
        }

        .chart-card {
            display: block;
            position: relative;
            overflow: hidden;
            border-radius: 2px;
            background-color: #fff;
            padding: 30px;
            box-shadow: 0 1px 2px rgba(0, 0, 0, .26);
        }

        .chart-card .content {
            padding: 5px;
            overflow: hidden;
            box-shadow: 0 -1px 0 0 rgba(0, 0, 0, .1);
        }

        .chart-card .chart-heading {
            text-transform: uppercase;
            font-weight: 700;
            font-size: 24px;
            line-height: 30px;
        }

        .orders-card h4 {
            margin: 0;
        }

        .orders-card .row {
            margin-top: 0;
            margin-bottom: 0;
        }

        .card>i {
            position: absolute;
            font-size: 2.5rem;
            right: 0;
            bottom: 0rem;
        }

        .card .count {
            position: relative;
            font-weight: 700;
            font-size: 20px;
            line-height: 30px;
        }

        .card .name {
            position: relative;
            font-size: 16px;
            line-height: 14px;
        }

        .card1 {
            background-color: #9575cd;
            border-color: #9575cd;
        }

        .card2 {
            background-color: #7986cb;
            border-color: #7986cb;
        }

        .card3 {
            background-color: #4db6ac;
            border-color: #4db6ac;
        }

        .card4 {
            background-color: #64B5F6;
            border-color: #64B5F6;
        }


        .wrapper {
            font-family: 'Lato', Calibri, Arial, sans-serif;
            padding: 0;
            margin: 0;
            background: #E8E9EE;
            height: 115px;
            position: relative;
        }
        /*신고 통계*/
        .fakeimg {
            height: 200px;
            width: 50%;
            background: #aaa;
            font-family: Rockwell;
        }

        .fakeimg2 {
            height: 250px;
            width: 500px;
            background: #aaa;
        }

        .chart__container {
            padding-top: 20px;
            box-shadow: 0px 5px 12px rgba(0,0,0,0.2);
            background-color: #273241;
            border-radius: 8px;
        }

        .nav2{
            width:150px;
            background-color:none;
            margin-top:30px;
            padding-bottom: 100%;
            border-right: 1px solid #848484;
        }

        .card-title:hover{
            background-color:#EF8719;
        }

        .box-title:hover{
            background-color:#EFECEC;
        }

        .box {
            padding-left:25px;
            padding-right:10px;
        }
        .jumbotron{
            background: url("https://picsum.photos/1600/?random") center no-repeat;
            background-color: #0005;
            background-blend-mode: darken;
        }

    </style>
</head>
<body>

<div class="jumbotron text-center" style="margin-bottom:0; color:white;">
    <h1>Admin page</h1>
    <p>Resize this responsive page to see the effect!</p>
</div>

<%--신고문의--%>
<c:set var = "d1count" value = "0" />
<c:forEach var="dlists1" items="${declarations1}">
            <c:set var="d1count" value="${d1count + 1}" />
</c:forEach>
<c:set var = "d2count" value = "0" />
<c:forEach var="dlists2" items="${declarations2}">
    <c:set var="d2count" value="${d2count + 1}" />
</c:forEach>
<c:set var = "d3count" value = "0" />
<c:forEach var="dlists3" items="${declarations3}">
    <c:set var="d3count" value="${d3count + 1}" />
</c:forEach>
<c:set var = "d4count" value = "0" />
<c:forEach var="dlists4" items="${declarations2}">
    <c:set var="d4count" value="${d4count + 4}" />
</c:forEach>

<%--날짜별 회원--%>

<c:set var = "month01" value = "0" /><c:set var = "month02" value = "0" />
<c:set var = "month03" value = "0" /><c:set var = "month04  " value = "0" />
<c:set var = "month05" value = "0" /><c:set var = "month06" value = "0" />
<c:set var = "month07" value = "0" /><c:set var = "month08" value = "0" />
<c:set var = "month09" value = "0" /><c:set var = "month10" value = "0" />
<c:set var = "month11" value = "0" /><c:set var = "month12" value = "0" />

<c:forEach var="ulists1" items="${Users}">
    <fmt:formatDate value="${ulists1.USER_CDATE}" var="MDate" pattern="MM"/>
    <c:if test="${MDate == '01'}">
        <c:set var="month01" value="${month01 + 1}" />
    </c:if>
    <c:if test="${MDate == '02'}">
        <c:set var="month02" value="${month02 + 1}" />
    </c:if>
    <c:if test="${MDate == '03'}">
        <c:set var="month03" value="${month03 + 1}" />
    </c:if>
    <c:if test="${MDate == '04'}">
        <c:set var="month04" value="${month04 + 1}" />
    </c:if>
    <c:if test="${MDate == '05'}">
        <c:set var="month05" value="${month05 + 1}" />
    </c:if>
    <c:if test="${MDate == '06'}">
        <c:set var="month06" value="${month06 + 1}" />
    </c:if>
    <c:if test="${MDate == '07'}">
        <c:set var="month07" value="${month07 + 1}" />
    </c:if>
    <c:if test="${MDate == '08'}">
        <c:set var="month08" value="${month08 + 1}" />
    </c:if>
    <c:if test="${MDate == '09'}">
        <c:set var="month09" value="${month09 + 1}" />
    </c:if>
    <c:if test="${MDate == '10'}">
        <c:set var="month10" value="${month10 + 1}" />
    </c:if>
    <c:if test="${MDate == '11'}">
        <c:set var="month11" value="${month11 + 1}" />
    </c:if>
    <c:if test="${MDate == '12'}">
        <c:set var="month12" value="${month12 + 1}" />
    </c:if>
</c:forEach>

<%--게시판 분류별 수--%>
<c:set var = "Type1" value = "0" /><c:set var = "Type2" value = "0" />
<c:set var = "Type3" value = "0" /><c:set var = "Type4  " value = "0" />
<c:set var = "Type5" value = "0" /><c:set var = "Type6" value = "0" />
<c:set var = "Type7" value = "0" /><c:set var = "Type8" value = "0" />
<c:set var = "Type9" value = "0" /><c:set var = "Type10" value = "0" />
<c:set var = "Type11" value = "0" /><c:set var = "Type12" value = "0" />

<c:forEach var="rboardv" items="${rboards2}">

    <c:if test="${rboardv.RBOARDFTYPE == '밥'}">
        <c:set var="Type1" value="${Type1 + 1}" />
    </c:if>
    <c:if test="${rboardv.RBOARDFTYPE == '후식'}">
        <c:set var="Type2" value="${Type2 + 1}" />
    </c:if>
    <c:if test="${rboardv.RBOARDFTYPE == '국'}">
        <c:set var="Type3" value="${Type3 + 1}" />
    </c:if>
    <c:if test="${rboardv.RBOARDFTYPE == '과일'}">
        <c:set var="Type4" value="${Type4 + 1}" />
    </c:if>
    <c:if test="${rboardv.RBOARDFTYPE == '빵'}">
        <c:set var="Type5" value="${Type5 + 1}" />
    </c:if>
    <c:if test="${rboardv.RBOARDFTYPE == '과자'}">
        <c:set var="Type6" value="${Type6 + 1}" />
    </c:if>
    <c:if test="${rboardv.RBOARDFTYPE == '조림'}">
        <c:set var="Type7" value="${Type7 + 1}" />
    </c:if>
    <c:if test="${rboardv.RBOARDFTYPE == '찜'}">
        <c:set var="Type8" value="${Type8 + 1}" />
    </c:if>
    <c:if test="${rboardv.RBOARDFTYPE == '무침'}">
        <c:set var="Type9" value="${Type9 + 1}" />
    </c:if>
    <c:if test="${rboardv.RBOARDFTYPE == '해물'}">
        <c:set var="Type10" value="${Type10 + 1}" />
    </c:if>
    <c:if test="${rboardv.RBOARDFTYPE == '볶음'}">
        <c:set var="Type11" value="${Type11 + 1}" />
    </c:if>
</c:forEach>

<div class="row">



    <div class="nav2">

        <a class="" style="color:black; text-decoration: none;" href="/">
        <div class="box border-right-0 border-left-0 border-white">
            <div class="border-0 text-center">
                <h4 class="box-title rounded p-4">
                    <i class='fas fa-door-open' style='font-size:24px'></i>
                    <p class="" style="font-size:4px;"><small>EXIT</small></p>
                </h4>
            </div>
        </div>
        </a>

        <a class="" style="color:black; text-decoration: none;" href="/user/Admin">
            <div class="box border-right-0 border-left-0 border-white">
                <div class="border-0 text-center">
                    <h4 class="box-title rounded p-4">
                        <i class='fa fa-lock' style='font-size:24px'></i>
                        <p style="font-size:4px;"><small>Admin</small></p>
                    </h4>
                </div>
            </div>
        </a>

        <a class="" style="color:black; text-decoration: none;" href="/board/report">
            <div class="box border-right-0 border-left-0 border-white">
                <div class="border-0 text-center">
                    <h4 class="box-title rounded p-4">
                        <i class="material-icons" style="font-size:36px">message</i>
                        <p class="" style="font-size:4px;"><small>Report</small></p>
                    </h4>
                </div>
            </div>
        </a>

        <a class="" style="color:black; text-decoration: none;" href="/search/Naver">
            <div class="box border-right-0 border-left-0 border-white">
                <div class="border-0 text-center">
                    <h4 class="box-title rounded p-4">
                        <i class="material-icons" style="font-size:36px">search</i>
                        <p style="font-size:4px;"><small>Search</small></p>
                    </h4>
                </div>
            </div>
        </a>

        <a class="" style="color:black; text-decoration: none;" href="/board/AdminChart">
            <div class="box border-right-0 border-left-0 border-white">
                <div class="border-0 text-center">
                    <h4 class="box-title rounded p-4">
                        <i class="material-icons" style="font-size:36px">insert_chart</i>
                        <p style="font-size:4px;"><small>Chart</small></p>
                    </h4>
                </div>
            </div>
        </a>

        <a class="" style="color:black; text-decoration: none;" href="/user/updateForm">
            <div class="box border-right-0 border-left-0 border-white">
                <div class="border-0 text-center">
                    <h4 class="box-title rounded p-4">
                        <i class='fa fa-id-card' style='font-size:24px'></i>
                        <p class="" style="font-size:4px;"><small>My page & plan</small></p>
                    </h4>
                </div>
            </div>
        </a>


    </div>



    <div class="container " style="margin-top:30px">
        <div class="row ml-3">
            <div class="col-sm-6 ">
                <h3>회원가입</h3>
                <h5>Photo of me:</h5>

                <div class="fakeimg2">

                    <div class="chart__container">
                        <canvas id="chart" width="600" height="300"></canvas>
                    </div>

                </div>


                <hr class="d-sm-none">
            </div>

            <div class="col-sm-6">
                <h3>분류별 게시글</h3>
                <h5>Photo of me:</h5>

                <div class="fakeimg2">

                    <div class="chart__container">
                        <canvas id="chart_0" width="600" height="300"></canvas>
                    </div>

                </div>


                <hr class="d-sm-none">
            </div>
        </div>


        <div class="wrapper mt-5">

            <div class="container-fluid">

                <div class="row">

                    <div class="col-lg-3 col-sm-6" ng-controller="WebsocketCtrl as ws">
                        <div class="card card1">
                            <i class="fa fa-truck"></i>
                            <span class="count">${d1count}</span>
                            <div class="name">신고 처리중</div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card card2">
                            <i class="fa fa-binoculars "></i>
                            <span class="count">${d2count}</span>
                            <div class="name">문의 처리중</div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card card3">
                            <i class="fa fa-ban"></i>
                            <span class="count">${d3count}</span>
                            <div class="name">신고 처리완료</div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card card4">
                            <i class="fa fa-ban"></i>
                            <span class="count">${d4count}</span>
                            <div class="name">문의 처리완료</div>
                        </div>
                    </div>
                </div>

            </div>



<%--            문의 구현             --%>

            <span class="d-flex justify-content-center text-3xl mt-5"> 문의중 </span>
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
        </div>
<%--        신고활성화 : ${d1count}--%>
<%--        문의활성화 : ${d2count}--%>
<%--        신고비활성화 : ${d3count}--%>
<%--        문의비활성화 : ${d4count}--%>

<%--        -${month01}- -${Type1}- <br/>--%>
<%--        -${month02}- -${Type2}- <br/>--%>
<%--        -${month03}- -${Type3}- <br/>--%>
<%--        -${month04}- -${Type4}- <br/>--%>
<%--        -${month05}- -${Type5}- <br/>--%>
<%--        -${month06}- -${Type6}- <br/>--%>
<%--        -${month08}- -${Type7}- <br/>--%>
<%--        -${month09}- -${Type8}- <br/>--%>
<%--        -${month10}- -${Type10}-<br/>--%>
<%--        -${month11}- -${Type11}-<br/>--%>




    </div>
</div>



<script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js'></script>

<%--chart1--%>
<script>



    let ctx = document.getElementById("chart").getContext('2d');

    var gradientStroke = ctx.createLinearGradient(500, 0, 100, 0);
    gradientStroke.addColorStop(0, "#ff6c00");
    gradientStroke.addColorStop(1, "#ff3b74");

    var gradientBkgrd = ctx.createLinearGradient(0, 100, 0, 400);
    gradientBkgrd.addColorStop(0, "rgba(244,94,132,0.2)");
    gradientBkgrd.addColorStop(1, "rgba(249,135,94,0)");

    let draw = Chart.controllers.line.prototype.draw;
    Chart.controllers.line = Chart.controllers.line.extend({
        draw: function() {
            draw.apply(this, arguments);
            let ctx = this.chart.chart.ctx;
            let _stroke = ctx.stroke;
            ctx.stroke = function() {
                ctx.save();
                //ctx.shadowColor = 'rgba(244,94,132,0.8)';
                ctx.shadowBlur = 8;
                ctx.shadowOffsetX = 0;
                ctx.shadowOffsetY = 6;
                _stroke.apply(this, arguments)
                ctx.restore();
            }
        }
    });

    var chart = new Chart(ctx, {
        // The type of chart we want to create
        type: 'line',

        // The data for our dataset
        data: {
            labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
            datasets: [{
                label: "Income",
                backgroundColor: gradientBkgrd,
                borderColor: gradientStroke,
                data: [${month01}, ${month02}, ${month03}, ${month04}, ${month05}, ${month06}, ${month07},${month08} ,${month09} ,${month10} ,${month11} ,${month12}],
                pointBorderColor: "rgba(255,255,255,0)",
                pointBackgroundColor: "rgba(255,255,255,0)",
                pointBorderWidth: 0,
                pointHoverRadius: 8,
                pointHoverBackgroundColor: gradientStroke,
                pointHoverBorderColor: "rgba(220,220,220,1)",
                pointHoverBorderWidth: 4,
                pointRadius: 1,
                borderWidth: 5,
                pointHitRadius: 16,
            }]
        },

        // Configuration options go here
        options: {
            tooltips: {
                backgroundColor:'#fff',
                displayColors:false,
                titleFontColor: '#000',
                bodyFontColor: '#000'

            },
            legend: {
                display: false
            },
            scales: {
                xAxes: [{
                    gridLines: {
                        display:false
                    }
                }],
                yAxes: [{
                    ticks: {
                        // Include a dollar sign in the ticks
                        callback: function(value, index, values) {
                            return (value / 1000) + 'K';
                        }
                    }
                }],
            }
        }
    });
</script>

<%--chart2--%>
<script>
    var data = {
        labels: ["밥", "후식", "국", "과일", "빵", "과자", "조림", "찜", "무침", "해물", "볶음"],
        datasets: [{
            label: "Dataset #1",
            backgroundColor: "rgba(255,99,132,0.2)",
            borderColor: "rgba(255,99,132,1)",
            borderWidth: 2,
            hoverBackgroundColor: "rgba(255,99,132,0.4)",
            hoverBorderColor: "rgba(255,99,132,1)",
            data: [${Type1}, ${Type2}, ${Type3}, ${Type4}, ${Type5}, ${Type6}, ${Type7}, ${Type8}, ${Type9}, ${Type10}, ${Type11}],
        }]
    };

    var option = {
        scales: {
            yAxes: [{
                stacked: true,
                gridLines: {
                    display: true,
                    color: "rgba(255,99,132,0.2)"
                }
            }],
            xAxes: [{
                gridLines: {
                    display: false
                }
            }]
        }
    };

    Chart.Bar('chart_0', {
        options: option,
        data: data
    });

</script>
</body>

<script src="/js/board2.js"></script>
</html>

