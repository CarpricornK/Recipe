<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp"%>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Armata&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />

<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Droid+Sans:400,700'>

<link rel="stylesheet" href="/css/index.css">

<style>
	.imgbox1 > p > img{
		width: 0px!important;
		height: 0px!important;
	}


</style>



<%--https://codepen.io/jasonleewilson/pen/gPrxwX--%>



<div class="container animation1" style="max-width:1300px;">
	<div class="d-flex justify-content-between">
		<a class="" style="color:#151823; font-family: 'Source Code Pro'; margin-right: -35px; font-size:28px;">
			MENU
		</a>
		<a href="/" style="color:#1a1a1a; font-family: 'Readex Pro', sans-serif; margin-right: -35px; margin-top: 15px">
			MORE+
		</a>
	</div>
<div class="tarkikComandSlider p-4 border text-center" style="font-size:30px;">
<c:forEach var="i" begin="0" end="5">
	<c:set var="ran"><%= java.lang.Math.round(java.lang.Math.random() * 1000) %></c:set>
	<c:set var="totalstar1" value="0" />
	<c:set var="totalstar2" value="0" />
	<c:forEach var="reply1" items="${reply}" varStatus="status">
		<c:if test="${null ne reply1.REPLY_NUM1 && reply1.REPLY_TYPE2 == api2[ran].id2}">
			<c:set var="totalstar1" value="${totalstar1 + 1}" />
			<c:set var="totalstar2" value="${totalstar2 + reply1.REPLY_NUM1/2}" />
		</c:if>
	</c:forEach>
	<article class="comandSlider__item text-center">

		<img class="comandSlider__item_name ml-4" style="height:250px; width:250px; border-radius: 3px;" src="${api2[ran].att_FILE_NO_MK}" />

		<p class="comandSlider__item_name mt-2" style="margin-bottom: -3px; margin-top: -10px; font-family: 'Gowun Dodum', sans-serif;"><a style="color:#333; font-size:16px;" href="/board/APIForm/${api2[ran].ID}">${api2[ran].rcp_NM}<small style="color:#f74e3b">(${totalstar1})</small> <c:if test="${0 != totalstar2}"><fmt:formatNumber value="${(totalstar2/totalstar1)}" pattern=".00"/></c:if> </a></p>

		<div class="comandSlider__item_contact" style="font-size:10px; word-break: break-all">
			나트륨:${api2[ran].info_NA}(g),
			열량:${api2[ran].info_ENG}(cal),
			지방:${api2[ran].info_FAT}(g),
			칼륨:${api2[ran].info_CAR}(kcal),

		</div>
	</article>
</c:forEach>

</div>
</div>

<div class="container animation2" style="max-width:1300px;">
	<div class="d-flex justify-content-between">
		<a style="color:#1a1a1a; font-family: 'Source Code Pro'; margin-right: -35px; font-size:28px;">
			R.BOARD
		</a>
		<a href="/board?ROLE=&board=0" style="color:#1a1a1a; font-family: 'Readex Pro', sans-serif; margin-right: -35px; margin-top: 15px">
			MORE+
		</a>
	</div>

	<div class="tarkikComandSlider p-4 border text-center" style="font-size:30px;">
		<c:forEach var="i" begin="0" end="5">
			<c:set var="totalstar1" value="0" />
			<c:set var="totalstar2" value="0" />
			<c:forEach var="reply1" items="${reply}" varStatus="status">
				<c:if test="${null ne reply1.REPLY_NUM1 && reply1.REPLY_TYPE2 == rboards.content[i].ID}">
					<c:set var="totalstar1" value="${totalstar1 + 1}" />
					<c:set var="totalstar2" value="${totalstar2 + reply1.REPLY_NUM1/2}" />
				</c:if>
			</c:forEach>
			<article class="comandSlider__item text-center">

				<div class="comandSlider__item_name ml-4" style="height:250px; width:250px; border-radius: 3px;" >${rboards.content[i].RBOARDIMG01}<c:if test="${rboards.content[i].RBOARDIMG01 == ''}"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/300px-No_image_available.svg.png?20190827162820"/></c:if></div>

				<p class="comandSlider__item_name mt-2" style="margin-bottom: -3px; margin-top: -10px; font-family: 'Gowun Dodum', sans-serif;"><a style="color:#333; font-size:16px;" href="/Rboard/${rboards.content[i].ID}">${rboards.content[i].RBOARDTITLE}<small>(${totalstar1})</small> <c:if test="${0 != totalstar2}"><fmt:formatNumber value="${(totalstar2/totalstar1)}" pattern=".00"/></c:if> </a></p>

				<div class="comandSlider__item_contact imgbox1 P-3" style="font-size:10px; word-break:break-all; text-overflow: ellipsis;">
					${rboards.content[i].RBOARDCONTENT}
				</div>
			</article>
		</c:forEach>

	</div>
</div>

<div class="container animation3" style="max-width:1300px;">
	<div class="d-flex justify-content-between">
		<a style="color:#1a1a1a; font-family: 'Source Code Pro'; margin-right: -35px; font-size:28px;">
			NOTICE
		</a>
		<a href="/board?ROLE=&board=1" style="color:#1a1a1a; font-family: 'Readex Pro', sans-serif; margin-right: -35px; margin-top: 15px">
			MORE+
		</a>
	</div>
	<div class="tarkikComandSlider p-4 border text-center" style="font-size:30px;">
		<c:forEach var="notice" items="${notice}">
			<c:set var="totalstar1" value="0" />
			<c:set var="totalstar2" value="0" />
			<c:forEach var="reply1" items="${reply}" varStatus="status">
				<c:if test="${null ne reply1.REPLY_NUM1 && reply1.REPLY_TYPE2 == api.content[i].id2}">
					<c:set var="totalstar1" value="${totalstar1 + 1}" />
					<c:set var="totalstar2" value="${totalstar2 + reply1.REPLY_NUM1/2}" />
				</c:if>
			</c:forEach>

			<article class="comandSlider__item text-center">

				<div class="comandSlider__item_name ml-4" style="height:250px; width:250px; border-radius: 3px;" ><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/300px-No_image_available.svg.png?20190827162820"/></div>

				<p class="comandSlider__item_name mt-2" style="margin-bottom: -3px; margin-top: -10px; font-family: 'Gowun Dodum', sans-serif;"><a style="color:#333; font-size:16px;" href="/board/${notice.ID}">${notice.BOARDTITLE}<small>(${totalstar1})</small> <c:if test="${0 != totalstar2}"><fmt:formatNumber value="${(totalstar2/totalstar1)}" pattern=".00"/></c:if> </a></p>

				<div class="comandSlider__item_contact imgbox1" style="font-size:10px;">
						${notice.BOARDCONTENT}
				</div>
			</article>
		</c:forEach>

	</div>
</div>

<div class="container animation4" style="max-width:1300px;">
	<div class="d-flex justify-content-between">
		<a style="color:#333; font-family: 'Readex Pro', sans-serif; margin-right: -35px; font-size:28px;">
			My FAVORITE
		</a>
		<a href="/user/Favorite" style="color:#1a1a1a; font-family: 'Readex Pro', sans-serif; margin-right: -35px; margin-top: 15px">
			MORE+
		</a>
	</div>
	<div class="tarkikComandSlider p-4 border text-center" style="font-size:30px;">
		<c:forEach var="favorite" items="${favorites.content}">

			<c:set var="totalstar1" value="0" />
			<c:set var="totalstar2" value="0" />
			<c:forEach var="reply1" items="${reply}" varStatus="status">
				<c:if test="${null ne reply1.REPLY_NUM1 && reply1.REPLY_TYPE2 == api.content[i].id2}">
					<c:set var="totalstar1" value="${totalstar1 + 1}" />
					<c:set var="totalstar2" value="${totalstar2 + reply1.REPLY_NUM1/2}" />
				</c:if>
			</c:forEach>
				<c:if test="${principal.user.username eq favorite.FAVORTIE_NAME}">

				<article class="comandSlider__item text-center">

				<img class="comandSlider__item_name ml-4" style="height:250px; width:250px; border-radius: 3px;" src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/300px-No_image_available.svg.png?20190827162820" />

				<p class="comandSlider__item_name mt-2" style="margin-bottom: -3px; margin-top: -10px; font-family: 'Gowun Dodum', sans-serif;"><a style="color:#333; font-size:16px;" href="/user/Favorite">${favorite.FAVORTIE_TITLE}<small>(${totalstar1})</small> <c:if test="${0 != totalstar2}"><fmt:formatNumber value="${(totalstar2/totalstar1)}" pattern=".00"/></c:if> </a></p>

				<div class="comandSlider__item_contact" style="font-size:10px;">
					<span style="font-size: 12px!important;">
							${favorite.BOARD_CDATE}

			<c:forEach var="i" begin="0" end="30">
			</c:forEach>
					</span>
				</div>
			</article>
				</c:if>
			</c:forEach>


	</div>
</div>







<br/>
<br/>
<br/>
<br/>
<br/>
<br/>








<div style="padding-bottom: 150px;"></div>





<script>
	// autoplay: true, dots: true,

	$(document).ready(function() {
		$('.tarkikComandSlider').slick({
			slidesToShow: 4,
			slidesToScroll: 1,
			autoplaySpeed: 5000,
			autoplay: true,
			arrows: true,
		});
	});
</script>

<script>
	let mainText1 = document.querySelector(".animation1");
	let mainText2 = document.querySelector(".animation2");
	let mainText3= document.querySelector(".animation3");
	let mainText4 = document.querySelector(".animation4");
	let mainText5 = document.querySelector(".backgroundimg");
	let mainText6 = document.querySelector(".hero-section");

	window.addEventListener('scroll',function (){
		let value = window.scrollY
		console.log("scrollY", value);

		 if (value>50) {
			 mainText6.style.animation='disappear2 1s ease-out forwards';
		 } else {
			 mainText6.style.animation='disappear 1s ease-out forwards';
		 }
		 if (value>450) {
			mainText2.style.animation='disappear 1.45s ease-out forwards';
		} else {

		 }
		 if (value>750) {
			mainText3.style.animation='disappear 1.45s ease-out forwards';
		} else {

		 }
		 if (value>1350) {
			mainText4.style.animation='disappear 1.45s ease-out forwards';
		} else {

		 }
	});
</script>



<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://use.fontawesome.com/releases/v5.9.0/js/all.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


<%--<%@ include file="layout/footer.jsp"%>--%>