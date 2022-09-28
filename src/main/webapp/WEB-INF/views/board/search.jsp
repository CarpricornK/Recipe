<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<META HTTP-EQUIV="EXPIRES" CONTENT="Mon, 22 Jul 2002 11:12:01 GMT">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal" />
</sec:authorize>
<%--
  Created by IntelliJ IDEA.
  User: Carpricorn
  Date: 2022-09-19
  Time: 오후 5:09
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
<html lang="en">
<head>
    <title>Admin page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/0.6.5/tailwind.min.css'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js'></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3/dist/chart.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />

    <style>
        .loader2{
            width: 100%;
            height: 100%;
            background-color: #252b37;
            opacity: 0.1;
            background-blend-mode: darken;
            position: fixed;
        }
        /*로딩화면*/
        .loader{
            border: 7px solid black;
            border-top: 7px solid #EF8719;
            border-radius: 50%;
            width: 60px;
            height: 60px;
            animation: spin .5s linear infinite;
            position: fixed;
            top:50%;
            left:50%;
            transform: translate(-50%,-50%);
        }
        @keyframes spin {
            0% {transform: translate(-50%,-50%) rotate(0deg);}
            100% {transform: translate(-50%,-50%) rotate(360deg);}
        }
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
        .nav2{
            width:150px;
            padding-top:30px;
            padding-bottom: 100%;
            border-right: 1px solid black;
        }

        .nav3{
            top:160px;
            position: sticky;
        }



        .box-title:hover{
            background-color:#EFECEC;
        }
        .box {
            padding-left:25px;
            padding-right:10px;
        }

        .jumbotron{
            /*background: url("https://picsum.photos/2400/?random") center no-repeat;*/
            background-color: #0005;
            background-blend-mode: darken;
            height: 200px;
        }

        .jumbotron2{
            background-blend-mode: darken;
            background-color: #0005;
            height: 60px;
            padding-bottom: 50px;
        }

        .searchbar{
            padding: 20px;
            width: 700px;
            height: 40px;
            border: 1px solid #0005;
            border-radius: 35px;
            /*box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3) 0px 3px 7px -3px;*/
        }
        input {
            /*background-image: url(https://cdn1.iconfinder.com/data/icons/hawcons/32/698627-icon-111-search-256.png);*/
            background-position: 450px center;
            background-size: contain;
            background-repeat: no-repeat;
            border: 1px solid white;
            padding: 5px 5px;
            text-indent: 25px;
            width: 120px;
        }

        @keyframes animationH1 {
            from{
                height: 280px;
            }
            to{
                position: fixed;
                height: 100px;
                width: 100%;
                margin-top: -20px;
                padding-bottom: 110px;
            }
        }
        @keyframes animationH2 {
            from{
                position: fixed;
                height: 100px;
                width: 100%;
            }
            to{
                height: 280px;
            }
        }
        @keyframes disappear2 {
            from{
                opacity: 1;
            }
            to{
                opacity: 0.1;
            }
        }


        @keyframes move3 {
            from{
                margin-top: 0px;
            }
            to{
                margin-top: -30px;
            }
        }

        @keyframes move4 {
            from{
                margin-top: -30px;
            }
            to{
                margin-top: 0px;
            }
        }



        .slick-sample {
        }
        .slick-list {
        }

        .txt{
            font-size: 14px;
            color: #151823;
        }

        .linkc{
            color: #FFFFFF!important;
            text-underline: none;
        }
        .linkc:hover{
            color: #9C9C9C!important;
            transition-duration: 1s;
        }

        p {
            font-family: 'Roboto','Helvetica Neue', Helvetica, Arial, sans-serif;
            font-style: normal;
            font-weight: 300;
            letter-spacing: 1px;
            text-rendering: optimizeLegibility;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            -moz-font-feature-settings: "liga" on;
        }


        @font-face {
            font-family: 'Cafe24Oneprettynight';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Oneprettynight.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }



        .mycard1{
            background-color: white;
            box-shadow: rgba(67, 71, 85, 0.27) 0px 0px 0.25em, rgba(90, 125, 188, 0.05) 0px 0.25em 1em;
            border-radius: 5px;
            padding: 25px;

        }

        .title2{
            font-size: 20px;
            margin-bottom: 5px;
        }

        #imgbox5 > img {
            height: 170px!important;
            width: 170px!important;
            padding: 10px;
            border-radius: 15px;
            margin-top: -30px;
        }

        #imgbox5{
            height: 170px!important;
            width: 170px!important;
        }

        #imgbox5 > a > small {
            font-size: 5px;
            letter-spacing: 0px!important;
            padding: 3px;
            margin-left: 15px;
            background-color: rgb(255,64,96);
            color: white;
            font-weight: 30!important;
            border-radius: 3px;
            position: relative;
            z-index: 2;
        }

        #imgbox5 > a {
            text-decoration: none;
        }



    </style>
</head>
<body class="">
<div class="loader2">

</div>
<div class="loader">

</div>

<div class="container-fluid jumbotron text-center" style="margin-bottom:0; color:white; border-radius: 0!important;">
    <nav style="margin-top: -58px;" class="navbar navbar-expand-sm navbar-dark d-flex justify-content-between mb-4">

        <a class="navbar-brand linkc" href="/">
            <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-egg-fill" viewBox="0 0 16 16">
                <path d="M14 10a6 6 0 0 1-12 0C2 5.686 5 0 8 0s6 5.686 6 10z"/>
            </svg>
            Recipe
        </a>

        <c:choose>
            <c:when test="${empty principal}">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link linkc" href="/">Home</a></li>
                    <li class="nav-item"><a class="nav-link linkc" href="/auth/loginForm">Login</a></li>
                    <li class="nav-item">
                        <a class="nav-link linkc" href="/auth/joinForm">
                            Sign in
                        </a>
                    </li>
                </ul>
            </c:when>


            <c:otherwise>
                <ul class="navbar-nav" style="margin-left: 90px;">
                    <li class="nav-item"><a class="nav-link linkc" href="/">Home</a></li>
                    <li class="nav-item"><a class="nav-link linkc" href="/search/Naver">Search</a></li>
                    <li class="nav-item">
                        <a class="nav-link linkc" href="/board/report">Report</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link linkc" href="/board/APIForm?style=2">API</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link linkc" href="/user/My">
                            My Page
                        </a>
                    </li>
                    <li class="nav-item"><a class="nav-link linkc" href="/board">Gallery</a></li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle linkc" data-toggle="dropdown" href="#">Write</a>
                        <div class="dropdown-menu">
                            <a style="color: blue; " class="dropdown-item linkc2" href="/board/saveForm">Board</a>
                            <a style="color: blue; " class="dropdown-item linkc2" href="/board/RsaveForm">Recipe</a>
                            <c:if test="${principal.user.USER_ROLE eq 'ADMIN'}">
                                <a style="color: blue; " class="dropdown-item linkc2" href="/board/AsaveForm">Notice</a>
                            </c:if>

                        </div>
                    </li>
                </ul>

                <ul class="row mt-3" style="margin-bottom: 0px;">
                    <p class="nav-item">
                        <a class="nav-link linkc" href="/">
                            <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
                                <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
                            </svg>
                        </a>
                    </p>
                    <p class="nav-item">
                        <a class="nav-link linkc" href="/user/updateForm">
                            <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-credit-card-2-front-fill" viewBox="0 0 16 16">
                                <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2.5 1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h2a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-2zm0 3a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm3 0a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm3 0a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm3 0a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1z"/>
                            </svg>
                        </a>
                    </p>
                    <p class="nav-item">
                        <a class="nav-link linkc" href="/logout">
                            <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-person-x-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6.146-2.854a.5.5 0 0 1 .708 0L14 6.293l1.146-1.147a.5.5 0 0 1 .708.708L14.707 7l1.147 1.146a.5.5 0 0 1-.708.708L14 7.707l-1.146 1.147a.5.5 0 0 1-.708-.708L13.293 7l-1.147-1.146a.5.5 0 0 1 0-.708z"/>
                            </svg>
                        </a>
                    </p>
                </ul>

            </c:otherwise>
        </c:choose>
    </nav>

    <div style="margin-top: -25px; margin-bottom: 25px;">
        <div class="allDelete off">
            <span class="btn" style="color: white">최근 검색어&nbsp;<i
                    class="fas fa-trash no-underline text-white-darker hover:text-red-dark"
                    aria-hidden="true"></i></span>
        </div>
        <div class="slick-sample" style="">

        </div>
    </div>



</div>


<div class="jumbotron2 row navbar navbar-expand-sm sticky-top d-flex justify-content-center">
    <%--검색창--%>
    <form id="todo-form" class="form">
        <input class="searchbar mt-3" name="url" type="text"/>
        <button type="submit" form="todo-form" style="margin-left: -40px;">
            <i class="fa fa-search" style="font-size:20px; color: #9C9C9C"></i>
        </button>
    </form>



</div>








    <c:if test="${param.url ne '' && param.url eq null}">
        <div class="row" style="height: 500px;">

            <div class="" style="top:50px; width:140px; border-right: 1px solid black; position: sticky;">
                <a class="" style="color:black; text-decoration: none;" href="/">
                    <div class="box border-right-0 border-left-0 border-white" style="margin-top: 30px;">
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

    <div class="container d-flex justify-content-center mt-5" style="margin-top:30px; height: 300px;">
        <p style="color:black; font-size: 3.5ex; font-family: sans-serif; margin-left: -80px;">- 검색해주세요 -</p>

    </div>
    </div>
    </c:if>

    <c:if test="${param.url ne null}">
    <div class="row">
        <div class="nav2">
            <div class="nav3">
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
        </div>


    <div class="container" style="margin-top:30px; padding-left: 60px;">

        <p class="d-flex justify-content-center" style="font-size: 18px; margin-left: -100px;">추천메뉴</p>
        <div class="container" style="overflow-x: auto; overflow-y: hidden; margin-left: -50px;">
            <div class="d-flex justify-content-center px-2"
                 style="height: 180px; display: flex; width: ${(fn:length(api.content)-1)*170}px; align-items: center; margin-bottom: -20px;">
                <c:if test="${fn:length(api.content) ne 0}">
                <c:forEach var="y" begin="1" end="${fn:length(api.content)-1}">
                    <div id="imgbox5">
                        <a href="/board/APIForm/${api.content[y].ID}"><small
                                class="imgbox5small">${api.content[y].rcpNM}</small></a>
                        <img src="${api.content[y].att_FILE_NO_MAIN}" height="300">
                    </div>
                </c:forEach>
                </c:if>
            </div>
        </div>

        <br/>
        <br/>

        <%--검색 정보--%>
        <p class="d-flex justify-content-center" style="color:black; font-size: 3.5ex; font-family: sans-serif; margin-left: -80px; font-weight: 500!important;">검색 정보</p>
        <div class="mt-3" style="margin-left: -60px">
            <div class="row">

            <div class="container row text-center mt-2"><h2>${list2[0]}</h2></div>

                    <div class="mycard1 row d-flex justify-content-center">
                        <div class="mb-4" style=""><img src="${list1[1].thumbnail}" width="300" height="300"/></div>
                        <div class="">
                            <c:forEach var="i" begin="1" end="20">
                            ${list2[i]}
                            </c:forEach>
                        </div>
                    </div>
            </div>
        </div>

        <br/>
        <hr style="margin-left: -80px;"/>
        <br/>

        <%--음식 보감 정보--%>

        <p class="d-flex justify-content-center" style="color:black; font-size: 3ex; font-family: sans-serif; margin-left: -80px; font-weight: 500!important;">음식 보감 정보</p>

        <c:forEach var="a" begin="0" end="${fn:length(list3)}">
            <c:if test="${fn:contains(list3[a].FOOD_NM, param.url) eq true}">
                <c:set var="contains1" value="1" ></c:set>
            </c:if>

            <c:if test="${param.url eq list3[a].FOOD_NM}">
            <div class="d-flex align-items-center mt-5 row" style="border-left:2px solid #CCCCCC;  min-height:150px; margin-left: 0px;">
                <div class="ml-1 d-flex justify-content-center align-middle" style="width: 200px; font-size: 22px">
                    ${list3[a].FOOD_NM}
                </div>
                <div class="" style="width: 750px;">
                    <p class="mycard1" style="font-family: Cafe24Oneprettynight;">
                        <b class="d-flex justify-content-center title2">-내용-</b>
                            ${list3[a].FOOD_CONTENT}
                    </p>
                    <p class="mycard1" style="font-family: Cafe24Oneprettynight;">
                        <b class="d-flex justify-content-center title2">-약성-</b>
                            ${list3[a].FOOD_DRUG}
                    </p>
                    <p class="mycard1" style="font-family: Cafe24Oneprettynight;">
                        <b class="d-flex justify-content-center title2">-민간요법-</b>
                            ${list3[a].FOOD_PT}
                    </p>
                    <p class="mycard1" style="font-family: Cafe24Oneprettynight;">
                        <b class="d-flex justify-content-center title2">-영양성분-</b>
                            ${list3[a].FOOD_CONTENT2}
                    </p>
                </div>
            </div>
            </c:if>
        </c:forEach>
        <c:if test="${contains1 ne 1}">
            <br/>
            <br/>
            <h4 class="d-flex justify-content-center">-정보가 없습니다-</h4>
        </c:if>

        <br/>
        <hr style="margin-left: -80px;"/>
        <br/>

            <%--가격정보--%>
        <p class="d-flex justify-content-center" style="color:#1a1a1a; font-size: 3ex; font-family: sans-serif; margin-left: -80px; font-weight: 500!important;">가격정보</p>
            <div class="mt-5 row" style="margin-left: -0px;">
                <div class="ml-1 row" style="height: 100%;">
                    <c:forEach var="i" begin="0" end="280">
                        <c:if test="${fn:contains(api5[i].item_name, param.url)}">
                            <%--									${x}+${i} id비교--%>
                            <%--									${fn:split(text, ',')[x]} == ${api5[i].item_name} : ${fn:contains(fn:split(text, ',')[x], api5[i].item_name)}--%>
                            <canvas style="width: 500px" id="myChart${i}"></canvas>
<%--                            ${api5[i].day1}', '${api5[i].day2}', '${api5[i].day3}', '${api5[i].day4}<br/>--%>
<%--                            ${api5[i].item_name}-${api5[i].kind_name}-${api5[i].unit}--%>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="" style="width: 750px;">
<%--                    <c:forEach var="i" begin="0" end="280">--%>
<%--                        ${api5[i].item_name} == ${param.url} <br/>--%>
<%--                        ${fn:contains(api5[i].item_name, param.url)}--%>
<%--                    </c:forEach>--%>
                </div>
            </div>


        <br/>
        <hr style="margin-left: -80px;"/>
        <br/>

        <%--네이버 백과사전--%>
        <p class="d-flex justify-content-center" style="color:rgb(3,175,77); font-size: 3ex; font-family: sans-serif; margin-left: -80px; font-weight: 500!important;">네이버 백과사전</p>
        <c:forEach var="z" begin="0" end="${fn:length(list1)}">
        <div class="mt-5 row" style="height: 150px; margin-left: 0px;">
            <div class="ml-1 d-flex justify-content-center" style="width: 200px; height: 100%; overflow: clip;">
                <a href="${list1[z].link}">
                  <c:if test="${list1[z].thumbnail ne ''}">
                  <img src="${list1[z].thumbnail}" width="150" height="150"/>
                  </c:if>
                </a>
            </div>
            <div class="" style="width: 750px;">
                <a href="${list1[z].link}" style="color: #252b37;">
                ${list1[z].description}
                </a>
            </div>
        </div>
        <hr style="margin-right: 25%"/>
        </c:forEach>
    </div>
    </div>
    </c:if>


</div>







<%--가격정보 차트--%>
<script>
    <c:forEach var="n" begin="0" end="280">
    <c:if test="${fn:contains(api5[n].item_name, param.url)}">
    var RGB_1 = Math.floor(Math.random() * (255 + 1))
    var RGB_2 = Math.floor(Math.random() * (255 + 1))
    var RGB_3 = Math.floor(Math.random() * (255 + 1))
    var strRGBA = 'rgba(' + RGB_1 + ',' + RGB_2 + ',' + RGB_3 + ',0.8)'

    amount1 = "${api5[n].dpr1}".replace(",", "")
    amount2 = "${api5[n].dpr2}".replace(",", "")
    amount3 = "${api5[n].dpr3}".replace(",", "")
    amount4 = "${api5[n].dpr4}".replace(",", "")
    amount5 = "${api5[n].dpr5}".replace(",", "")


    var ctx = document.getElementById("myChart"+"${n}");


    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['${api5[n].day1}', '${api5[n].day2}', '${api5[n].day3}', '${api5[n].day4}'],
            datasets: [{
                label: '${api5[n].item_name}-${api5[n].kind_name}-${api5[n].unit}',
                data: [amount1, amount2, amount3, amount4, amount5],
                backgroundColor: [
                    strRGBA,
                ],
                borderColor : [
                    strRGBA,
                ],
                borderWidth: 3,

            }]
        },
        options: {
            plugins: {
                title: {
                    display: true,
                    text: "",
                    <%--text: "${F}+${n}id비교",--%>
                }
            },


            //cutoutPercentage: 40,
            responsive: false,
        },


    });
    </c:if>
    </c:forEach>
</script>



<script>
    let mainText1 = document.querySelector(".jumbotron2");
    let mainText2 = document.querySelector(".nav4");
    let mainText3 = document.querySelector(".slick-sample");
    let mainText4 = document.querySelector("#todo-form");
    let mainText5 = document.querySelector(".searchbar");


    window.addEventListener('scroll',function (){
        let value = window.scrollY
        console.log("scrollY", value);

        if (value>20) {
            mainText1.style.paddingBottom = "10";
            mainText1.style.transitionDuration='.5s';
            mainText5.style.border = "1px solid white";
            mainText5.style.transitionDuration='.5s';
            mainText3.style.opacity= '0';
            mainText3.style.transitionDuration='1';
            mainText4.style.transitionDuration='1';
        } else {
            mainText1.style.paddingBottom = "50";
            mainText1.style.transitionDuration='.5s';
            mainText5.style.border = "1px solid #0005";
            mainText5.style.transitionDuration='.1s';
            mainText3.style.opacity= '1';
            mainText3.style.transitionDuration= '1';
            mainText4.style.transitionDuration='1';
        }
    });
</script>

<script>
    $(document).ready(function(){
        $('.slick-sample').slick({
            infinite: true,
            speed: 400,
            fade: true,
            centerMode: true,
            autoplay: true,
            dots: false,
            arrows: false,
        });
    });
</script>

<script>
    const toDoForm = document.querySelector('#todo-form');
    const toDoInput = toDoForm.querySelector('input');
    const toDoList = document.querySelector('.slick-sample');
    const allDelete = document.querySelector('.allDelete');
    const txt = document.querySelector('.txt');
    const TODOS_KEY = "todos";

    let toDos = new Array();

    function saveToDos() { //item을 localStorage에 저장합니다.
        typeof(Storage) !== 'undefined' && localStorage.setItem(TODOS_KEY, JSON.stringify(toDos));
    };

    function allDeleteToDo() { //전체 item을 삭제
        history.go(0);
        localStorage.clear(toDos);
        toDoList.innerText = '최근검색어 내역이 없습니다.';
    };

    function deleteToDo(e) { //각각의 item을 삭제
        const li = e.target.parentElement;
        li.remove();
        toDos = toDos.filter((toDo) => toDo.id !== parseInt(li.id));
        toDos.length === 0 && (txt.innerText = '최근검색어 내역이 없습니다.')
        saveToDos();
    };

    function paintToDo(newTodo) { //화면에 뿌림
        const {id, text} = newTodo;
        const item = document.createElement("div");
        const span = document.createElement("a");
        const button = document.createElement("button");
        item.id = id;
        item.innerText = text;
        button.innerText = ' ';
        button.addEventListener("click", deleteToDo);
        allDelete.addEventListener("click", allDeleteToDo);
        item.appendChild(span);
        toDoList.appendChild(item);
        newTodo !== null && allDelete.classList.remove('off');
    };

    function handleToDoSubmit(event) { //form 전송
        location.href = "http://localhost:8000/search/Naver" + "?url=" + toDoInput.value;
        event.preventDefault();
        const newTodoItem = toDoInput.value;
        toDoInput.value = '';
        const newTodoObj = {
            id: Date.now(),
            text: newTodoItem
        };
        toDos.push(newTodoObj);
        paintToDo(newTodoObj);
        saveToDos();
    };

    toDoForm.addEventListener('submit', handleToDoSubmit);

    const savedToDos = JSON.parse(localStorage.getItem(TODOS_KEY));
    if(savedToDos !== null) {
        toDos = savedToDos //전에 있던 items들을 계속 가지도 있다록 합니다.
        savedToDos.forEach(paintToDo);
    }
</script>
















<script src="https://use.fontawesome.com/releases/v5.9.0/js/all.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


<script>
    window.onload = function () {
        $(".loader").delay('5000').hide();
        $(".loader2").delay('5000').hide();
    }
</script>

</body>
</html>