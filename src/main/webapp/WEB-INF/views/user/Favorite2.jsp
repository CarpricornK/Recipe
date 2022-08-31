<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<style>
	button{
		background: none;
		outline: none;
	}

	.selectbox1{
		width: 200px;
		height: 60px;
		border: 1px solid;
		border-color: #ffffff #ffffff #777575 #ffffff;
		background: none;
		outline: none;
		text-align: center;
	}

	.selectbox1:hover{
		width: 200px;
		border: 2px solid;
		border-color: #ffffff #ffffff #777575 #ffffff;
		background: none;
		outline: none;
		text-align: center;
	}


	.backgroundcolor3{
		background-color: #777575;
	}
	.bordercolor3{
		border: 1px solid;
		border-color: #ffffff #ffffff #777575 #ffffff;
	}

	.bordercolor3:focus {
		border: 2px solid;
		border-color: #ffffff #ffffff #777575 #ffffff;
	}

	.color3{
		color : #777575;
	}

	.noblue {
		background: none;
		outline: none;
		border: none;
	}

	.noblue:focus {
		outline: none;
	}

	.divTable{
		display: table;
		width: 100%;
	}
	.divTableRow {
		display: table-row;
		font-size:12px;
	}
	.divTableHeading {
		background-color: #EEE;
		display: table-header-group;
	}
	.divTableCell {
		border: 1px solid;
		border-color: #FFFFFF #FFFFFF #1a1a1a #FFFFFF;
		display: table-cell;
		padding: 5px 5px;
	}
	.divTableCell2 {
		border: 1px solid;
		border-color: #FFFFFF #FFFFFF #1a1a1a #FFFFFF;
		padding: 5px 5px;

	}

	.divTableHead {
		border: 1px solid;
		display: table-cell;
		padding: 3px 14px;
		color:white;
		border-radius: 3px;
		font-family: 'Hind Siliguri', sans-serif;
	}
	.divTableHeading {
		background-color: #EEE;
		display: table-header-group;
		font-weight: bold;
	}
	.divTableFoot {
		background-color: #EEE;
		display: table-footer-group;
		font-weight: bold;
	}
	.divTableBody {
		display: table-row-group;
	}

	.input1 {
		width: 800px;
		height: 60px;
		outline: 1px solid #FFFFFF;
	}


	.noutline {
		outline: 0;
	}

	.imgbox1 > p > img{
		width: 0px!important;
		height: 0px!important;
	}


</style>


<div class="container">
<h3 class="text-center color3" style="margin-bottom: -35px;">A.BOARD</h3>
<div class="table-users" style="max-width:1400px; margin-bottom:100px; z-index: 1; background: #FFFFFF; padding: 45px; text-align: center; box-shadow: 0 0 11px rgba(33,33,33,.2); ">

	<div class="divTable">
		<div class="divTableBody">
			<div class="divTableRow">
				<div class="divTableHead backgroundcolor3">ID</div>
				<div class="divTableHead backgroundcolor3">Score</div>
				<div class="divTableHead backgroundcolor3">Title</div>
				<div class="divTableHead backgroundcolor3" style="max-width:400px;">Content</div>
				<div class="divTableHead backgroundcolor3">COUNT</div>
				<div class="divTableHead backgroundcolor3">SET</div>
			</div>

			<c:forEach var="i" begin="0" end="11">
				<c:if test="${boards.content[i].BOARDTITLE ne null}">
					<c:set var="totalstar1" value="0" />
					<c:set var="totalstar2" value="0" />
					<c:forEach var="reply1" items="${reply}" varStatus="status">
						<c:if test="${null ne reply1.REPLY_NUM1 && reply1.REPLY_TYPE2 == boards.content[i].ID}">
							<c:set var="totalstar1" value="${totalstar1 + 1}" />
							<c:set var="totalstar2" value="${totalstar2 + reply1.REPLY_NUM1/2}" />
						</c:if>
					</c:forEach>
			    	<c:if test="${boards.content[i].BOARDUSERNAME eq principal.user.username}">
					<div class="divTableRow">
						<div class="divTableCell align-middle">${boards.content[i].ID}</div>
						<div class="divTableCell align-middle"><c:if test="${0 != totalstar2}"><fmt:formatNumber value="${(totalstar2/totalstar1)}" pattern=".00"/></c:if></div>
						<div class="divTableCell align-middle"> <a style="color: black;" href="/board/${boards.content[i].ID}"> ${boards.content[i].BOARDTITLE} </a> </div>
						<div class="divTableCell align-middle" style="width:800px; word-break: break-all; vertical-align: middle;">
							<a class="imgbox1" style="color: black;" href="/board/${boards.content[i].ID}">
									${boards.content[i].BOARDCONTENT}
							</a>
						</div>
						<div class="divTableCell align-middle">${boards.content[i].BOARDCOUNT}</div>
						<div class="divTableCell align-middle">
							<div class="row d-flex justify-content-center">
								<button onClick="index.Delete(${boards.content[i].ID}, ${1})"
										class="align-middle color3"
										style="border:none; margin-left:-10px; width:50px; font-size:15px; hegiht: 50px;">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										 fill="currentColor" class="bi bi-trash-fill"
										 viewBox="0 0 16 16">
										<path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
									</svg>
								</button>
								<a href="/board/${boards.content[i].ID}/updateForm"
								   style="hegiht: 50px; margin-top: 1px; margin-left:-10px;" class="align-middle color3">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										 fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 16 16">
										<path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001z"/>
									</svg>
								</a>
							</div>
						</div>
					</div>
					</c:if>
				</c:if>
			</c:forEach>

		</div>
	</div>
</div>
</div>



<div class="container mt-3">
	<h3 class="text-center color3" style="margin-bottom: -35px;">B.BOARD</h3>
	<div class="table-users" style="max-width:1400px; margin-bottom:100px; z-index: 1; background: #FFFFFF; padding: 45px; text-align: center; box-shadow: 0 0 11px rgba(33,33,33,.2); ">

		<div class="divTable">
			<div class="divTableBody">
				<div class="divTableRow">
					<div class="divTableHead backgroundcolor3">ID</div>
					<div class="divTableHead backgroundcolor3">Score</div>
					<div class="divTableHead backgroundcolor3">Title</div>
					<div class="divTableHead backgroundcolor3" style="max-width:400px;">Content</div>
					<div class="divTableHead backgroundcolor3">COUNT</div>
					<div class="divTableHead backgroundcolor3">SET</div>
				</div>

				<c:forEach var="i" begin="0" end="11">
					<c:if test="${rboards.content[i].RBOARDTITLE ne null}">
						<c:set var="totalstar1" value="0" />
						<c:set var="totalstar2" value="0" />
						<c:forEach var="reply1" items="${reply}" varStatus="status">
							<c:if test="${null ne reply1.REPLY_NUM1 && reply1.REPLY_TYPE2 == rboards.content[i].ID}">
								<c:set var="totalstar1" value="${totalstar1 + 1}" />
								<c:set var="totalstar2" value="${totalstar2 + reply1.REPLY_NUM1/2}" />
							</c:if>
						</c:forEach>

						<c:if test="${rboards.content[i].RBOARDUSERNAME eq principal.user.username}">
						<div class="divTableRow">
							<div class="divTableCell align-middle">${rboards.content[i].ID}</div>
							<div class="divTableCell align-middle"><c:if test="${0 != totalstar2}"><fmt:formatNumber value="${(totalstar2/totalstar1)}" pattern=".00"/></c:if></div>
							<div class="divTableCell align-middle"> <a style="color: black;" href="/rboard/${rboards.content[i].ID}"> ${rboards.content[i].RBOARDTITLE} </a> </div>
							<div class="divTableCell align-middle" style="width:800px; word-break: break-all; vertical-align: middle;">
								<a class="imgbox1" style="color: black;" href="/board/${rboards.content[i].ID}">
										${rboards.content[i].RBOARDCONTENT}
								</a>
							</div>
							<div class="divTableCell align-middle">${rboards.content[i].RBOARDCOUNT}</div>
							<div class="divTableCell align-middle">
								<div class="row d-flex justify-content-center">
									<button onClick="index.Delete(${rboards.content[i].ID}, ${0})"
											class="align-middle color3"
											style="border:none; margin-left:-10px; width:50px; font-size:15px; hegiht: 50px;">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											 fill="currentColor" class="bi bi-trash-fill"
											 viewBox="0 0 16 16">
											<path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
										</svg>
									</button>
									<a href="/rboard/${rboards.content[i].ID}/updateForm"
									   style="hegiht: 50px; margin-top: 1px; margin-left:-10px;" class="align-middle color3">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											 fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 16 16">
											<path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001z"/>
										</svg>
									</a>
								</div>
							</div>
						</div>
						</c:if>
					</c:if>
				</c:forEach>

			</div>
		</div>
	</div>
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
<script src="https://cdn.lordicon.com/xdjxvujz.js"></script>
<%--<%@ include file="../layout/footer.jsp"%>--%>