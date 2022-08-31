<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<style>
	.scroll1 {
		width: 100%;
		max-height: 800px;
		overflow: auto;
	}
	.scroll1::-webkit-scrollbar {
		width: 10px;
	}
	.scroll1::-webkit-scrollbar-thumb {
		background-color: orangered;
		border-radius: 10px;
		background-clip: padding-box;
		border: 2px solid transparent;
	}
	.scroll1::-webkit-scrollbar-track {
		background-color: grey;
		border-radius: 10px;
		box-shadow: inset 0px 0px 5px white;
	}

	.scroll2 {
		width: 100%;
		height: 120px;
		overflow: auto;
	}
	.scroll2::-webkit-scrollbar {
		width: 10px;
	}
	.scroll2::-webkit-scrollbar-thumb {
		background-color: orangered;
		border-radius: 10px;
		background-clip: padding-box;
		border: 2px solid transparent;
	}
	.scroll2::-webkit-scrollbar-track {
		border-radius: 10px;
	}


</style>

<div class="text-center pt-1" style="margin-top:50px; font-family: 'Baloo Da 2', cursive; font-size:20px; color: tomato; box-shadow: 1px 1px 3px 1px #dadce0; height:40px; width:80%; margin-left:10%; margin-right:10%; background-color: rgba(51, 51, 51, 0.7); border-radius: 3px;">A.BOARD</div>
<br/>

<div class="row scroll1 d-flex justify-content-around pr-2" style="overflow-y: scroll; width:80%; margin-left:10%; margin-right:10%; margin-bottom: 100px;">
	<c:forEach var="favorite" items="${favorites.content}">
		<c:forEach var="z" begin="0" end="999" step="1">

			<c:if test="${principal.user.username eq favorite.FAVORTIE_NAME && favorite.FAVORTIE_TITLE eq (api.content[1000-z].rcp_NM+=''+=z+=''+=principal.user.username)}">

				<div class="mt-4" style="background-color: #F79E5F; color:white; width: 350px; height: 550px; border-radius: 7px; word-break:break-all;">
					<div class="d-flex justify-content-end" style="background-size : cover; background-image: url(${api.content[1000-z].att_FILE_NO_MAIN}); width: 350px; height: 300px; border-radius: 7px 7px 0px 0px;">

						<button style="height:40px;" class="mt-1 mr-1 btn" onClick="index.Delete2(${favorite.ID}, ${favorite.FAVORITE_ID})" >
							<svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-trash-fill text-white" viewBox="0 0 16 16">
								<path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
							</svg>
						</button>
					</div>
					<h6 class="p-3 ml-2 mr-2" style="color: #FFFFFF; border:1px solid; border-color: rgba(0, 0, 0, 0.00) rgba(0, 0, 0, 0.00) #FFFFFF rgba(0, 0, 0, 0.00)"><a style="color:azure;" href="/board/APIForm/${api.content[1000-z].ID}">${api.content[1000-z].rcp_NM}</a></h6>

					<div class="p-3 ml-2 mr-2 mt-1 row d-flex justify-content-between" style="color:white;">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-info-circle-fill" viewBox="0 0 22 22">
							<path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
						</svg>
						<span style="margin-top: -5px;">2022-06-03 09:41:45.817</span>
					</div>
					<div class="scroll2 p-4" style="margin-top: -18px;">
						<span style="font-size: 12px!important;">${api.content[1000-z].rcp_PARTS_DTLS}</span>
					</div>
				</div>

			</c:if>

			<%--			${favorite.FAVORTIE_TITLE eq (api.content[z].rcp_NM+=''+=api.content[z].id2)}--%>

		</c:forEach>
	</c:forEach>
</div>



<div class="text-center pt-1" style="font-family: 'Baloo Da 2', cursive; font-size:20px; color: tomato; box-shadow: 1px 1px 3px 1px #dadce0; height:40px; width:80%; margin-left:10%; margin-right:10%; background-color: rgba(51, 51, 51, 0.7); border-radius: 3px;">BOARD</div>
<br/>

<div class="row scroll1 d-flex justify-content-around mb-5 pr-2" style=" overflow-y: scroll; width:80%; margin-left:10%; margin-right:10%;">



	<c:forEach var="favorite" items="${favorites.content}">
		<c:forEach var="i" begin="0" end="30">
		<c:if test="${principal.user.username eq favorite.FAVORTIE_NAME && favorite.FAVORTIE_TITLE eq (boards.content[i].BOARDTITLE+=''+=boards.content[i].ID+=''+=principal.user.username)}">

				<div class="mt-4" style="background-color: #F79E5F; color:white; width: 350px; height: 500px; border-radius: 7px; word-break:break-all;">
					<div class="d-flex justify-content-end" style="background-size : cover; background-image: url(https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RE4wyTq?ver=c8e5); width: 350px; height: 200px; border-radius: 7px 7px 0px 0px;">

							<button style="height:40px;" class="mt-1 mr-1 btn" onClick="index.Delete2(${favorite.ID}, ${favorite.FAVORITE_ID})" >
								<svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor"
									 class="bi bi-trash-fill text-white" viewBox="0 0 16 16">
									<path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
								</svg>
							</button>

					</div>
					<h6 class="p-3 ml-2 mr-2" style="color: #FFFFFF; border:1px solid; border-color: rgba(0, 0, 0, 0.00) rgba(0, 0, 0, 0.00) #FFFFFF rgba(0, 0, 0, 0.00)"><a href="/board/${boards.content[i].ID}" style="color:azure">${boards.content[i].BOARDTITLE}</a></h6>

					<div class="p-3 ml-2 mr-2 mt-1 row d-flex justify-content-between" style="color:white;">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-info-circle-fill" viewBox="0 0 22 22">
							<path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
						</svg>
						<span style="margin-top: -5px;">${boards.content[i].BOARDCDATE}</span>
					</div>
					<div class="scroll2 p-4" style="margin-top: -18px;">
						<span style="font-size: 12px!important;">${boards.content[i].BOARDCONTENT}</span>
					</div>
				</div>

		</c:if>
		</c:forEach>
	</c:forEach>

</div>


<div class="text-center pt-1" style="margin-top:100px; font-family: 'Baloo Da 2', cursive; font-size:20px; color: tomato; box-shadow: 1px 1px 3px 1px #dadce0; height:40px; width:80%; margin-left:10%; margin-right:10%; background-color: rgba(51, 51, 51, 0.7); border-radius: 3px;">R.BOARD</div>
<br/>

<div class="row scroll1 d-flex justify-content-around pr-2" style="overflow-y: scroll; width:80%; margin-left:10%; margin-right:10%; margin-bottom: 200px;">
	<c:forEach var="favorite" items="${favorites.content}">
		<c:forEach var="i" begin="0" end="30">
			<c:if test="${principal.user.username eq favorite.FAVORTIE_NAME && favorite.FAVORTIE_TITLE eq (rboards.content[i].RBOARDTITLE+=''+=rboards.content[i].ID+=''+=principal.user.username)}">

				<div class="mt-4" style="background-color: #F79E5F; color:white; width: 350px; height: 470px; border-radius: 7px; word-break:break-all;">
					<div class="d-flex justify-content-end" style="background-size : cover; background-image: url(https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RE4wyTq?ver=c8e5); width: 350px; height: 200px; border-radius: 7px 7px 0px 0px;">
						<button style="height:40px;" class="mt-1 mr-1 btn" onClick="index.Delete2(${favorite.ID}, ${favorite.FAVORITE_ID})" >
							<svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-trash-fill text-white" viewBox="0 0 16 16">
								<path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
							</svg>
						</button>
					</div>
					<h6 class="p-3 ml-2 mr-2" style="color: #FFFFFF; border:1px solid; border-color: rgba(0, 0, 0, 0.00) rgba(0, 0, 0, 0.00) #FFFFFF rgba(0, 0, 0, 0.00)"><a href="/Rboard/${rboards.content[i].ID}" style="color:azure">${rboards.content[i].RBOARDTITLE}</a></h6>

					<div class="p-3 ml-2 mr-2 mt-1 row d-flex justify-content-between" style="color:white;">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-info-circle-fill" viewBox="0 0 22 22">
							<path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
						</svg>
						<span style="margin-top: -5px;">${rboards.content[i].RBOARDCDATE}</span>
					</div>
					<div class="scroll2 p-4" style="margin-top: -18px;">
						<span style="font-size: 12px!important;">${rboards.content[i].RBOARDCONTENT}</span>
					</div>
				</div>

			</c:if>
		</c:forEach>
	</c:forEach>
</div>





<script>
	let mainText6 = document.querySelector(".hero-section");

	window.addEventListener('scroll',function (){
		let value = window.scrollY
		console.log("scrollY", value);

		if (value>150) {
			mainText6.style.animation='disappear2 1s ease-out forwards';
		} else {
			mainText6.style.animation='disappear 1s ease-out forwards';
		}
	});
</script>
<script src="/js/board.js"></script>
<%--<%@ include file="../layout/footer.jsp"%>--%>