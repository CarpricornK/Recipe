<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header2.jsp"%>

<style>
	.button {
		margin-top:100px;
		width: 240px;
		height: 125px;
		font-family: 'Roboto', sans-serif;
		font-size: 15px;
		text-transform: uppercase;
		letter-spacing: 2.5px;
		font-weight: 500;
		color: seashell;
		background-color: #777575;
		border: none;
		border-radius: 7px;
		box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
		transition: all 0.3s ease 0s;
		cursor: pointer;
		outline: none;
	}

	.button:hover {
		background-color: #1a1a1a;
		box-shadow: 0px 15px 20px rgba(51, 51, 51, 0.4);
		color: #fff;
		transform: translateY(-7px);
	}
	.wrap {
		height: 100%;
		display: flex;
		align-items: center;
		justify-content: center;
	}

</style>

<div class="container wrap d-flex justify-content-center mt-5">
	<button style="height: 250px;" type="button" class="button" onClick="location.href='/user/Favorite'">
		<h4>즐겨찾기 목록</h4> <br/>
		<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-box2-heart-fill" viewBox="0 0 16 16">
			<path d="M3.75 0a1 1 0 0 0-.8.4L.1 4.2a.5.5 0 0 0-.1.3V15a1 1 0 0 0 1 1h14a1 1 0 0 0 1-1V4.5a.5.5 0 0 0-.1-.3L13.05.4a1 1 0 0 0-.8-.4h-8.5ZM8.5 4h6l.5.667V5H1v-.333L1.5 4h6V1h1v3ZM8 7.993c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z"/>
		</svg>
	</button>

	<div style="padding: 60px;"></div>

	<button style="height: 250px;" type="button" class="button" onClick="location.href='/user/Favorite2'">
		<h4>내 글</h4> <br/>
		<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-collection-fill" viewBox="0 0 16 16">
			<path d="M0 13a1.5 1.5 0 0 0 1.5 1.5h13A1.5 1.5 0 0 0 16 13V6a1.5 1.5 0 0 0-1.5-1.5h-13A1.5 1.5 0 0 0 0 6v7zM2 3a.5.5 0 0 0 .5.5h11a.5.5 0 0 0 0-1h-11A.5.5 0 0 0 2 3zm2-2a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 0-1h-7A.5.5 0 0 0 4 1z"/>
		</svg>

	</button>
</div>


<script src="/js/user.js"></script>
<%@ include file="../layout/footer.jsp"%>