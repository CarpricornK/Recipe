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
            animation: spin 1s linear infinite;
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
            background-color:none;
            margin-top:30px;
            padding-bottom: 100%;
            border-right: 1px solid #848484;
        }
        .box-title:hover{
            background-color:#EFECEC;
        }
        .box {
            padding-left:25px;
            padding-right:10px;
        }
        .jumbotron{
            background: url("https://picsum.photos/2000/?random") center no-repeat;
            background-color: #0005;
            background-blend-mode: darken;
            height: 280px;
        }
        .searchbar{
            padding: 20px;
            width: 500px;
            height: 40px;
            border-radius: 30px;
        }
        input {
            /*background-image: url(https://cdn1.iconfinder.com/data/icons/hawcons/32/698627-icon-111-search-256.png);*/
            background-position: 450px center;
            background-size: contain;
            background-repeat: no-repeat;
            border: 1px solid #ffffff;
            padding: 5px 5px;
            text-indent: 25px;
            width: 120px;
        }
        input:focus {
            background-image: none;
            background-position: -10px center;
            text-indent: 0;
            width: 500px;
            outline: 0;
            transition-duration: .1s;
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

        @keyframes move1 {
            from{
                padding-top: 300px;
            }
            to{
                padding-top: 160px;
            }
        }

        @keyframes move2 {
            from{
                padding-top: 160px;
            }
            to{
                padding-top: 300px;
            }
        }

        @keyframes move3 {
            from{
                margin-top: 0px;
            }
            to{
                margin-top: -20px;
            }
        }

        @keyframes move4 {
            from{
                margin-top: -20px;
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
            color: #1a1a1a!important;
            transition-duration: 1s;
        }


    </style>
</head>
<body class="">
<div class="loader2">

</div>
<div class="loader">

</div>
<div class="jumbotron text-center" style="margin-bottom:0; color:white;">
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
    <%--검색창--%>
    <div class="searchbox">
        <form>
            <input class="searchbar" name="url" type="text"/>
            <button style="margin-left: -50px;" type="url">
                <i class="fa fa-search" style="font-size:18px"></i>
            </button>
        </form>
    </div>

    <br/>

    <div class="slick-sample">
        <p>Resize this responsive page to see the effect1!</p>
        <p>Resize this responsive page to see the effect2!</p>
        <p>Resize this responsive page to see the 3!</p>
        <p>Resize this responsive page to see the effect4!</p>
        <p>Resize this responsive page to see the effect5!</p>
        <p>Resize this responsive page to see the effect6!</p>
    </div>


</div>







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


    <div class="container" style="margin-top:30px; padding-left: 100px;">

        <br/>
        <hr style="margin-left: -80px;"/>
        <br/>

        <%--검색 정보--%>
        <p style="color:chocolate; font-size: 3.5ex; font-family: sans-serif; margin-left: -80px;">검색 정보</p>
        <div class="mt-5" style="margin-left: -60px">
            <div class="row">
            <img src="${list1[1].thumbnail}" width="150" height="150"/>
                <div class="container row text-center mt-2"><h2>-</h2>${list2[0]}<h2>-</h2></div>
                <c:forEach var="i" begin="1" end="20">
                    ${list2[i]}
                </c:forEach>
            </div>
        </div>

        <br/>
        <hr style="margin-left: -80px;"/>
        <br/>

        <%--음식 보감 정보--%>

        <p style="color:#4e54c8; font-size: 3ex; font-family: sans-serif; margin-left: -70px;">음식 보감 정보</p>

        <c:forEach var="a" begin="0" end="${fn:length(list3)}">
            <c:if test="${fn:contains(list3[a].FOOD_NM, param.url) eq true}">
                <c:set var="contains1" value="1" ></c:set>
            </c:if>

            <c:if test="${param.url eq list3[a].FOOD_NM}">
            <div class="d-flex align-items-center mt-5 row" style="min-height:150px; margin-left: -100px;">
                <div class="ml-1 d-flex justify-content-center align-middle" style="width: 200px;">
                    ${list3[a].FOOD_NM}
                </div>
                <div class="" style="width: 750px;">
                        <b>-내용-</b><br/>
                        ${list3[a].FOOD_CONTENT} <br/>
                        <b>-약성-</b><br/>
                        ${list3[a].FOOD_DRUG} <br/>
                        <b>-민간요법-</b><br/>
                        ${list3[a].FOOD_PT} <br/>
                        <b>-영양성분-</b><br/>
                        ${list3[a].FOOD_CONTENT2}
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

        <%--네이버 백과사전--%>
        <p style="color:#2ecc71; font-size: 3ex; font-family: sans-serif; margin-left: -70px;">네이버 백과사전</p>
        <c:forEach var="z" begin="0" end="${fn:length(list1)}">
        <div class="mt-5 row" style="height: 150px; margin-left: -100px;">
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

<script>
    let mainText1 = document.querySelector(".jumbotron");
    let mainText2 = document.querySelector(".nav3");
    let mainText3 = document.querySelector(".slick-sample");
    let mainText4 = document.querySelector(".searchbox");


    window.addEventListener('scroll',function (){
        let value = window.scrollY
        console.log("scrollY", value);
        if (value>30) {
            mainText1.style.animation='animationH1 0.5s forwards';
            mainText2.style.animation='move1 0.5s forwards';
            mainText3.style.opacity= '0';
            mainText3.style.transitionDuration='1';
            mainText4.style.animation='move3 0.5s forwards'
            mainText4.style.transitionDuration= '1';
        } else {
            mainText1.style.animation='animationH2 0.5s forwards';
            mainText2.style.animation='move2 0.5s forwards';
            mainText3.style.opacity= '1';
            mainText3.style.transitionDuration= '1';
            mainText4.style.animation='move4 0.5s forwards'
            mainText4.style.transitionDuration= '1';
        }
    });
</script>

<script>
    $(document).ready(function(){
        $('.slick-sample').slick({
            infinite: true,
            speed: 1500,
            fade: true,
            centerMode: true,
            autoplay: true,
            dots: false,
            arrows: false,
        });
    });
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