<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header2.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<style>
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
		border: 2px solid;
		border-color: #FFFFFF #FFFFFF #252b37 #FFFFFF;
		display: table-cell;
		height: 90px;
		padding: 5px 5px;
	}
	.divTableCell2 {
		border: 1px solid;
		border-color: #FFFFFF #FFFFFF #252b37 #FFFFFF;
		padding: 5px 5px;

	}

	.divTableHead {
		border: 2px solid;
		display: table-cell;
		padding: 3px 14px;
		color:white;
		border-radius: 3px;
		background-color: #252b37;
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
		border: 1px solid;
		border-color: #ffffff #ffffff #252b37 #ffffff;
		width: 1000px;
		height: 60px;
		outline: 1px solid #FFFFFF;
	}
	.input1:focus {
		border: 2px solid;
		border-color: #ffffff #ffffff #252b37 #ffffff;
	}

	.noutline {
		outline: 0;
	}


	.scroll1 {
		width: 100%;
		height: 190px;
		overflow: auto;
	}
	.scroll1::-webkit-scrollbar {
		width: 9px;
	}
	.scroll1::-webkit-scrollbar-thumb {
		background-color: orangered;
		border-radius: 10px;
		background-clip: padding-box;
		border: 2px solid transparent;
	}
	.scroll1::-webkit-scrollbar-track {
		border-radius: 10px;
	}

	.scroll2 {
		height: 90px!important;
		overflow: auto!important;
		border: 2px solid;
		border-color: #FFFFFF #FFFFFF #252b37 #FFFFFF;
		padding: 5px 5px;
		font-size : 12px;
	}
	.scroll2::-webkit-scrollbar {
		width: 9px!important;
	}
	.scroll2::-webkit-scrollbar-thumb {
		background-color: #252b37!important;
		border-radius: 10px!important;
		background-clip: padding-box!important;
		border: 2px solid transparent!important;
	}
	.scroll2::-webkit-scrollbar-track {
		border-radius: 10px!important;
	}

	*{ padding: 0; margin: 0; }
	li{ list-style: none; }

	.gallery{
		width: 300px; margin: 0 auto;
		overflow: hidden;
	}
	.gallery h3{
		width: 100%; height: 50px;
		line-height: 50px; text-align: center;
	}
	.gallery li{
		float: left;
		width: 300px; height: 310px;
		margin-right: 20px;
	}
	.gallery li:last-child{ margin-right: 0; }

	.gallery a{
		display: block; /* 영역적용위해 사용 */
		width: 100%; height: 100%;

		overflow: hidden;

		position: relative; /* absolute의 기본기준은 body로 처리 - 현재 요소로 기준변경 */
	}

	.gallery figure{
		width: 100%; height: 100%;
	}
	.gallery figcaption{
		width: 100%; height: 100%;
		background-color: rgba(0,0,0,0.7);

		position: absolute; /* 이미지와 겹치게 처리 */
		top: 0; left: 0;

		color: #fff; text-align: center;
		line-height: 200px;

		opacity: 0; /* 처음엔 안보이고 */

		transition: 0.3s;
	}

	.gallery a:hover figcaption, .gallery a:focus figcaption{
		/* 마우스를 올리면 보이게 처리 */
		opacity: 1;
	}

	.cellhover{
		background-color: #252b37;
	}
	.cellhover:hover{
		background-color: rgba(255, 255, 255, 0.21);
	}

	.Smplan1{
		border: 0;
		width: 120px;
		height: 40px;
		color: white;
		text-align-last: center;
		-webkit-appearance:none; /* 크롬 화살표 없애기 */
		-moz-appearance:none; /* 파이어폭스 화살표 없애기 */
		appearance:none; /* 화살표 없애기 */
		cursor:pointer;
	}
	select{
		appearance:none;
		background:url('..');
		outline: 0;

	}

	.noOutline{
		border: 0;
		outline: 0;
	}
	.noOutline:active, .noOutline:focus {
		border: none !important; box-shadow: none !important;
	}

</style>



<%--<c:forEach var="apis" items="${api.content}">--%>
<%--	=${apis}=--%>
<%--</c:forEach>--%>

<%
	Calendar cal = Calendar.getInstance();
	String format = "dd";
	SimpleDateFormat sdf = new SimpleDateFormat(format);
	cal.add(cal.DATE, +1); //날짜를 하루 더한다.
	String date = sdf.format(cal.getTime());

	Calendar cal2 = Calendar.getInstance();
	cal2.set(Calendar.DAY_OF_MONTH, cal2.getActualMaximum(Calendar.DAY_OF_MONTH));
	SimpleDateFormat sdf2 = new SimpleDateFormat("dd");
	String datelast = sdf2.format(cal2.getTime());

%>





<div class="container">

	<div style="max-width:1200px;">
		<form method="get" action="/board/APIForm">
			<h3 class="text-center" style="color:#252b37; ">SEARCH BAR</h3>
			<input class="input1" type="text" placeholder="무엇을 검색 하시겠습니까?" name="search">
			<button class="p-1" style="border: none; margin-left: -3px; width: 65px; background-color: #FFFFFF;"
					name="style" type="submit" value="2">
				<svg style="margin-left:20px; border-radius:3px; background-color:#252b37; color:white; padding: 10px;" xmlns="http://www.w3.org/2000/svg" width="70" height="40" fill="currentColor" class="bi bi-search"
					 viewBox="0 0 16 16">
					<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
				</svg>
			</button>
		</form>
	</div>

	<h3 class="text-center mt-5" style="color:#252b37; margin-bottom: -35px;">LIST</h3>
	<div class="well well-sm mt-5" style="min-width:1200px; margin-left: -45px; margin-right: -50px; background-color: #252b37; border-radius: 2px;">
		<div class="btn-group">
			<div class="row d-flex justify-content-center align-items-center ml-1" style="height: 36px;">
				<form method="get" action="/board/APIForm">
					<button class="p-1 cellhover" style="outline: 0; border: none; width: 65px; color:#FFFFFF" name="style" type="submit" value="1">
						<svg style="color:#FFFFFF;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-ul" viewBox="0 0 16 16">
							<path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm-3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm0 4a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm0 4a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
						</svg>
						<a>List</a>
					</button>
					<input style="width: 50px;" type="hidden" name="search" value="${param.search}" />
					<input style="width: 50px;" type="hidden" name="page" value="${api.number}" />
					<input style="width: 50px;" type="hidden" name="board" value="${param.board}" />
					<button class="p-1 cellhover" style="outline: 0; color:#FFFFFF; border: none; margin-left: -3px; width: 65px;" name="style" type="submit" value="2">
						<i class="fas fa-border-all fa-1x"></i>
						<a>Grid</a>
					</button>
				</form>
			</div>
		</div>
	</div>


</div>

	<%--style = 1 이나 null 은 기본형--%>
	<c:if test="${param.style == 1 || param.style eq null}">
		<div class="d-flex justify-content-center">
		<div class="table-users mt-3" style="width:1200px; z-index: 1; background: #FFFFFF; padding: 45px; text-align: center; box-shadow: 0 0 11px rgba(33,33,33,.2); ">
			<div class="divTable">
				<div class="divTableBody">
					<div class="divTableRow">
						<div class="divTableHead">ID</div>
						<div class="divTableHead">Score</div>
						<div class="divTableHead">메뉴명</div>
						<div class="divTableHead">재료 & 영양성분</div>
						<div class="divTableHead">Count</div>
						<div class="divTableHead">Favorite</div>
					</div>

					<c:forEach var="i" begin="0" end="11">
						<c:set var="totalstar1" value="0" />
						<c:set var="totalstar2" value="0" />
						<c:forEach var="reply1" items="${reply}" varStatus="status">
							<c:if test="${null ne reply1.REPLY_NUM1 && reply1.REPLY_TYPE2 == api.content[i].id2}">
								<c:set var="totalstar1" value="${totalstar1 + 1}" />
								<c:set var="totalstar2" value="${totalstar2 + reply1.REPLY_NUM1/2}" />
							</c:if>
						</c:forEach>
					<c:if test="${null ne api.content[i].rcp_NM}">
					  <div class="divTableRow">
						<div class="divTableCell align-middle">${api.content[i].id2}</div>
						<div class="divTableCell align-middle"><c:if test="${0 != totalstar2}"><fmt:formatNumber value="${(totalstar2/totalstar1)}" pattern=".00"/></c:if></div>
						  <div class="divTableCell align-middle">
							  <a style="color: black;" href="/board/APIForm/${api.content[i].ID}">
									  ${api.content[i].rcp_NM}
										  <c:forEach var="favorties" items="${favorite}">
											  <c:if test="${favorties.FAVORTIE_TITLE eq (api.content[i].rcp_NM+=''+=api.content[i].id2+=''+=principal.user.username)}">
												  <br/><small style="color:red;">즐겨찾기 완료</small>
											  </c:if>
										  </c:forEach>
							  </a>
						  </div>
						  <div class="scroll2 align-middle p-2">
							  <a style="color: black;" href="/board/APIForm/${api.content[i].ID}">
									  재료 - ${api.content[i].rcp_PARTS_DTLS}
								  <br/>
								  <span style="color: lightsalmon">영양성분 - 칼륨 : ${api.content[i].info_CAR}(g), 단백질 : ${api.content[i].info_PRO}(g), 지방 : ${api.content[i].info_FAT}(g), 나트륨 : ${api.content[i].info_NA}(mg)</span>
							  </a>
						  </div>
						<div class="divTableCell align-middle">${api.content[i].api_COUNT}</div>
						<div class="divTableCell align-middle">
								<button class="noblue"
										onClick="index.favorites(${api.content[i].id2+1}, ${api.content[i].id2}, '${principal.user.username}', '${api.content[i].rcp_NM}')"
										class="btn"
										style="height: 22px; margin-bottom: 10px; margin-top: -10px; color:white; margin-right: -10px;">
									<lord-icon
											src="https://cdn.lordicon.com/mdgrhyca.json"
											trigger="click"
											colors="primary:#252b37,secondary:#ffffff"
											stroke="75"
											style="width:100%;height:200%;margin-left: -10px;">
									</lord-icon>
								</button>
						</div>
					  </div>
					</c:if>
					</c:forEach>

				</div>
			</div>
		</div>
		</div>
	</c:if>

	<%---------------------------style = 2 는 갤러리형---------------------------%>
	<c:if test="${param.style == 2}">
		<div class="d-flex justify-content-center">

			<div class="row d-flex justify-content-center pt-5 mt-2" style="width:1200px; position: relative; z-index: 1;background: whitesmoke; padding: 45px; text-align: center; box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);">

<%--				<c:forEach var="board" items="${api.content}">--%>
	                <c:forEach var="i" begin="0" end="11">
						<c:set var="totalstar1" value="0" />
						<c:set var="totalstar2" value="0" />
						<c:forEach var="reply1" items="${reply}" varStatus="status">
							<c:if test="${null ne reply1.REPLY_NUM1 && reply1.REPLY_TYPE2 == api.content[i].id2}">
								<c:set var="totalstar1" value="${totalstar1 + 1}" />
								<c:set var="totalstar2" value="${totalstar2 + reply1.REPLY_NUM1/2}" />
							</c:if>
						</c:forEach>

					<c:if test="${null ne api.content[i].rcp_NM}">
					<div class="card ml-3 mr-3 mt-4 mb-4" style="width:300px; height: 410px; border:none;">
						<span class="p-1" style="text-align:center !important; color:#FFFFFF; background-color: #252b37; border-radius: 4px 4px 0px 0px; font-size:14px;">${api.content[i].rcp_NM} <c:if test="${0 != totalstar2}"><fmt:formatNumber value="${(totalstar2/totalstar1)}" pattern=".00"/></c:if></span>
						<span class="p-1" style="text-align:center !important; color:#FFFFFF; background-color: #252b37; font-size:14px;">
<%--여기 날짜 계산--%>
<c:set var="lasdate" value="<%=cal.getActualMaximum(Calendar.DAY_OF_MONTH)%>"/>

<c:set var="today" value="<%=new java.util.Date()%>"/>
							<!-- 현재날짜 -->
<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss"/></c:set>
							<!-- 현재년도 -->
<c:set var="year"><fmt:formatDate value="${today}" pattern="yyyy"/></c:set>
							<!-- 현재월 -->
<c:set var="month"><fmt:formatDate value="${today}" pattern="MM"/></c:set>

<c:set var="day"><fmt:formatDate value="${today}" pattern="dd"/></c:set>
<%--여기 날짜 계산end--%>
							<select id="pet-select${i}" class="Smplan1">
								<c:forEach var="z" begin="1" end="9">
									<option style="color: black" value="${year+='-'+=month+='-'+='0'+=z}">${year+='-'+=month+='-'+='0'+=z}</option>
								</c:forEach>
								<c:forEach var="z" begin="10" end="${lasdate}">
                                 <option style="color: black" value="${year+='-'+=month+='-'+=z}">${year+='-'+=month+='-'+=z}</option>
								</c:forEach>
							</select>

							<button onClick="index2.MPlan2('${api.content[i].info_CAR}', '${api.content[i].info_PRO}', '${api.content[i].info_NA}', '${api.content[i].info_ENG}', '${i}', '${api.content[i].rcp_NM}', 'breakfast', '${principal.user.username}')"  class="btn noOutline" style="height: 22px; margin-bottom: 10px; margin-top: -10px; color:white; margin-right: -10px;">
								<i class='fas fa-bread-slice'></i>
							</button>

							<button onClick="index2.MPlan2('${api.content[i].info_CAR}', '${api.content[i].info_PRO}', '${api.content[i].info_NA}', '${api.content[i].info_ENG}', '${i}', '${api.content[i].rcp_NM}', 'lunch', '${principal.user.username}')"  class="btn noOutline" style="height: 22px; margin-bottom: 10px; margin-top: -10px; color:white; margin-right: -10px;">
								<i class='fas fa-sun'></i>
							</button>

							<button onClick="index2.MPlan2('${api.content[i].info_CAR}', '${api.content[i].info_PRO}', '${api.content[i].info_NA}', '${api.content[i].info_ENG}', '${i}', '${api.content[i].rcp_NM}', 'dinner', '${principal.user.username}')"  class="btn noOutline" style="height: 22px; margin-bottom: 10px; margin-top: -10px; color:white; margin-right: -10px;">
								<i class='fas fa-moon'></i>
							</button>

						</span>
						<div class="gallery">
							<ul>
								<li>
									<a href="/board/APIForm/${api.content[i].ID}">

										<figure style="">
											<img height="300px" src="${api.content[i].att_FILE_NO_MAIN}" alt="이미지01">

											<figcaption style="padding-top: 30px; word-break:break-all !important; font-size: 14px;">
												자세히 보기
											</figcaption>
										</figure>
									</a>
								</li>
							</ul>
						</div>

						<dd class="p-1 scroll1" style="font-size: 11px; height: 80px; background-color: #252b37; margin-bottom: -3px; color: #FFFFFF;">
							<c:forEach var="favorties" items="${favorite}">
								<c:if test="${favorties.FAVORTIE_TITLE eq (api.content[i].rcp_NM+=''+=api.content[i].id2+=''+=principal.user.username)}">
									<small style="color:red;">즐겨찾기 완료</small>
									<br/>
								</c:if>
							</c:forEach>
						  ${api.content[i].rcp_PARTS_DTLS}
						</dd>

						<span class="p-1 d-flex justify-content-between" style="text-align:center !important; color:#FFFFFF; background-color: #252b37; border-radius: 0px 0px 4px 4px; font-size:12px;">


						    	<a style="margin-left: 5px; font-size: 14px;">조회수 : ${api.content[i].api_COUNT} </a>

<%--							    <input id="title" type="hidden" value="${api.content[i].id2}"/>--%>
<%--							    <input id="name" type="hidden" class="form-control" value="${principal.user.username}">--%>
<%--							    <input id="BID" type="hidden" class="form-control" value="${api.content[i].id2}">--%>
<%--								<input id="IDID" type="hidden" class="form-control" value="${i}">--%>

						    	<button onClick="index.favorites(${api.content[i].id2+1}, ${api.content[i].id2}, '${principal.user.username}', '${api.content[i].rcp_NM}')"  class="btn" style="height: 22px; margin-bottom: 10px; margin-top: -10px; color:white; margin-right: -10px;">
									<span style="font-size:13px">즐겨찾기</span>
								   <svg style="color:white;" xmlns="http://www.w3.org/2000/svg" width="20" height="20"
									 fill="currentColor" class="bi bi-plus-square-fill" viewBox="0 0 16 16">
								     <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm6.5 4.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3a.5.5 0 0 1 1 0z"/>
								   </svg>
							    </button>

						</span>



					</div>
					</c:if>


				</c:forEach>
			</div>
		</div>
</c:if>







<c:if test="${null ne param.page}">
	<div class="container d-flex justify-content-center">
		-${param.page+1}-
	</div>
</c:if>
<c:if test="${api.totalPages<=api.number}">
	<span class="d-flex justify-content-center mt-1"> <a style="color: red; font-size: 14px;" href="?page=${param.totalPages-1}&board=${param.board}&style=${param.style}&search=${param.search}">없는 페이지 입니다(누르면 마지막 페이지로 돌아갑니다)</a>
	</span>
</c:if>


<ul class="pagination justify-content-center mt-5">

	<c:choose>
		<c:when test="${api.first}">
			<li class="page-item disabled"><a style="color: #363435; border: 1px #FFFFFF;" class="page-link" href="?page=${api.number-1}&board=${param.board}&style=${param.style}&search=${param.search}">Previous</a></li>
		</c:when>
		<c:otherwise>
			<li class="page-item"><a style="color: #363435; border: 1px #FFFFFF;" class="page-link" href="?page=${api.number-1}&board=${param.board}&style=${param.style}&search=${param.search}">Previous</a></li>
		</c:otherwise>
	</c:choose>

	<c:set var="pageend" value="${api.totalPages}"/>
	<c:if test="${api.totalPages>10}">
		<c:set var="pageend" value="10"/>
	</c:if>

	<c:if test="${api.number<9}">
		<c:forEach var="i" begin="0" end="${pageend-1}">

			<c:if test="${null ne param.stype }">
				<li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}&board=${param.board}&style=${param.style}&search=${param.search}"> ${i+1}</a></li>
			</c:if>
			<c:if test="${null eq param.stype }">
				<li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}&board=${param.board}&style=${param.style}&search=${param.search}"> ${i+1}</a></li>
			</c:if>

		</c:forEach>
	</c:if>

	<c:if test="${api.number>=9}">
		<c:if test="${(api.totalPages-1)-param.page>5}">
		<c:forEach var="i" begin="${param.page-5}" end="${param.page+5}">
			<c:if test="${null ne param.stype }">
				<li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}&board=${param.board}&style=${param.style}&search=${param.search}"> ${i+1}</a></li>
			</c:if>
			<c:if test="${null eq param.stype }">
				<li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}&board=${param.board}&style=${param.style}&search=${param.search}"> ${i+1}</a></li>
			</c:if>
		</c:forEach>
		</c:if>
		<c:if test="${(api.totalPages-1)-param.page<=5}">
			<c:forEach var="i" begin="${param.page-5}" end="${api.totalPages-1}">
				<c:if test="${null ne param.stype }">
					<li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}&board=${param.board}&style=${param.style}&search=${param.search}"> ${i+1}</a></li>
				</c:if>
				<c:if test="${null eq param.stype }">
					<li class="page-item"><a style="color: #777575; border: 1px #FFFFFF;" id="moveMove" class="page-link" href="?page=${i}&board=${param.board}&style=${param.style}&search=${param.search}"> ${i+1}</a></li>
				</c:if>
			</c:forEach>
		</c:if>
	</c:if>

	<c:choose>
		<c:when test="${api.last}">
			<li class="page-item disabled"><a style="color: #363435; border: 1px #FFFFFF;" class="page-link" href="?page=${api.number+1}&board=${param.board}&style=${param.style}&search=${param.search}">Next</a></li>
		</c:when>

		<c:otherwise>
			<li class="page-item"><a style="color: #363435; border: 1px #FFFFFF;" class="page-link" href="?page=${api.number+1}&board=${param.board}&style=${param.style}&search=${param.search}">Next</a></li>
		</c:otherwise>
	</c:choose>

</ul>

<div style="padding-bottom: 300px;"></div>

	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://use.fontawesome.com/releases/v5.9.0/js/all.js"></script>
<script src="/js/board.js"></script>
<script src="/js/board2.js"></script>
<script src="https://cdn.lordicon.com/xdjxvujz.js"></script>




