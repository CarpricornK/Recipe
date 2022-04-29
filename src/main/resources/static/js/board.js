let index = {
	init: function() {
		$("#btn-save").on("click", () => {
			this.save();
		});
		$("#btn-delete").on("click", () => {
			this.deleteById();
		});
		$("#btn-update").on("click", () => {
			this.update();
		});
		$("#btn-reply-save").on("click", () => {
			this.replySave();
		});
		$("#btn-count").on("click", () => {
			this.productupdatecount();
		});
		$("#btn-favorite").on("click", () => {
			this.favorite();
		});
	},

	save: function() {
		let data = {
			BOARD_TITLE: $("#title").val(),
			BOARD_CONTENT: $("#content").val(),
			BOARD_TYPE: $("#type").val(),
			BOARD_USERNAME: $("#username").val()
			
		};

		$.ajax({
			type: "POST",
			url: "/api/board",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json",
		}).done(function(resp) {
			alert("글쓰기가 완료되었습니다.");
			location.href = "/";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});

	},

	deleteById: function() {
		let ID = $("#id").text();

		$.ajax({
			type: "DELETE",
			url: "/api/board/"+ID,
			contentType: "application/json; charset=utf-8",
			dataType: "json",
		}).done(function(resp) {
			alert("삭제가 완료되었습니다.");
			location.href = "/";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});

	},

	update: function() {
		let ID = $("#id").val();

		let data = {
			BOARD_TITLE: $("#title").val(),
			BOARD_CONTENT: $("#content").val(),
		};

		$.ajax({
			type: "PUT",
			url: "/api/board/"+ID,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json",
		}).done(function(resp) {
			alert("글수정이 완료되었습니다.");
			location.href = "/";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});

	},
	
	replySave: function() {
		let data = {
			REPLY_CONTENT: $("#rcontent").val(),
			REPLY_USERNAME: $("#username").val(),
			REPLY_TYPE: $("#ID2").val(),
			REPLY_NUM1: $("input:radio[name='starpoint']:checked").val(),


		};

		let ID2 = $("#ID2").val();
		
		$.ajax({
			type: "POST",
			url: "/api/board/"+ID2+"/reply",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json",
		}).done(function(resp){
			alert("댓글 작성 완료.."+data.REPLY_CONTENT+"번호"+ID2+"경로:/api/board/"+ID2+"/reply",);
			location.href = "/board/"+ID2
		}).fail(function(error){
			alert(JSON.stringify(error));
		});

	},

	replyDelete: function(boardId, replyid) {
		$.ajax({
			type: "DELETE",
			url: "/api/board/"+boardId+"/reply/"+replyid,
			dataType: "json"
		}).done(function(resp){
			alert("댓글 삭제 성공.");
			location.href = "/board/"+boardId
		}).fail(function(error){
			alert(JSON.stringify(error));
		});

	},

	favorite: function() {
		let data = {
			FAVORITE_TITLE: $("#title").val(),
			FAVORITE_NAME: $("#name").val()
		};

		$.ajax({
			type: "POST",
			url: "/api/board/favorite",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json",
		}).done(function(resp) {
			alert("즐겨찾기가 완료되었습니다.");
			location.href = "/";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});

	},


}

index.init();