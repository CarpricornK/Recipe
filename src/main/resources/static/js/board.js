let index = {
	init: function () {
		$("#btn-save").on("click", () => {
			this.save();
		});
		$("#btn-Rsave").on("click", () => {
			this.rsave();
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
		$("#btn-Rupdate").on("click", () => {
			this.Rupdate();
		});
		$("#btn-rdelete").on("click", () => {
			this.rdeleteById();
		});
		$("#btn-rdelete2").on("click", () => {
			this.rdeleteById2();
		});


	},

	save: function () {

		let data = {
			BOARDTITLE: $("#title").val(),
			BOARDCONTENT: $("#content").val(),
			BOARDTYPE: $("#check").is(":checked"),
			BOARDUSERNAME: $("#username").val()
		};

		$.ajax({
			type: "POST",
			url: "/api/board",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json",
		}).done(function (resp) {
			alert("글쓰기가 완료되었습니다.");
			// + data.BOARDTYPE +"check:"+ $("#check").is(":checked")
			location.href = "/board";
		}).fail(function (error) {
			alert(JSON.stringify(error));
		});

	},


	rsave: function () {
		let data = {
			RBOARDTITLE: $("#title").val(),
			RBOARDCONTENT: $("#content").val(),
			RBOARDUSERNAME: $("#username").val(),
			RBOARDNM: $("#RNM").val(),
			RBOARDFTYPE: $("#RNM2").val(),
			RBOARD01: $("#RBOARD01").val(),
			RBOARD02: $("#RBOARD02").val(),
			RBOARD03: $("#RBOARD03").val(),
			RBOARD04: $("#RBOARD04").val(),
			RBOARD05: $("#RBOARD05").val(),
			RBOARD06: $("#RBOARD06").val(),
			RBOARD07: $("#RBOARD07").val(),
			RBOARD08: $("#RBOARD08").val(),
			RBOARD09: $("#RBOARD09").val(),
			RBOARD10: $("#RBOARD10").val(),
			RBOARDIMG01: $("#RBOARDIMG01").val(),
			RBOARDIMG02: $("#RBOARDIMG02").val(),
			RBOARDIMG03: $("#RBOARDIMG03").val(),
			RBOARDIMG04: $("#RBOARDIMG04").val(),
			RBOARDIMG05: $("#RBOARDIMG05").val(),
			RBOARDIMG06: $("#RBOARDIMG06").val(),
			RBOARDIMG07: $("#RBOARDIMG07").val(),
			RBOARDIMG08: $("#RBOARDIMG08").val(),
			RBOARDIMG09: $("#RBOARDIMG09").val(),
			RBOARDIMG10: $("#RBOARDIMG10").val(),

		};

		$.ajax({
			type: "POST",
			url: "/api/Rboard",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json",
		}).done(function (resp) {
			alert("레시피 글쓰기가 완료되었습니다....");
			location.href = "/board";
		}).fail(function (error) {
			alert(JSON.stringify(error));
		});

	},


	deleteById: function () {
		let ID = $("#id").text();

		$.ajax({
			type: "DELETE",
			url: "/api/board/" + ID,
			contentType: "application/json; charset=utf-8",
			dataType: "json",
		}).done(function (resp) {
			alert("삭제가 완료되었습니다.");
			location.href = "/";
		}).fail(function (error) {
			alert(JSON.stringify(error));
		});

	},

	update: function () {
		let ID = $("#id").val();

		let data = {
			BOARDTITLE: $("#title").val(),
			BOARDCONTENT: $("#content").val(),
			BOARDTYPE: $("#check").is(":checked"),
		};

		$.ajax({
			type: "PUT",
			url: "/api/board/" + ID,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json",
		}).done(function (resp) {
			alert("글수정이 완료되었습니다");
			location.href = "/board/" + ID;
		}).fail(function (error) {
			alert(JSON.stringify(error));
		});

	},

	replySave: function () {
		let data = {
			REPLY_CONTENT: $("#rcontent").val(),
			REPLY_USERNAME: $("#username").val(),
			REPLY_TYPE: $("#ID1").val(),
			REPLY_NUM1: $("input:radio[name='starpoint']:checked").val(),
			REPLY_TYPE2: $("#ID2").val(),


		};
		let ID3 = $("#ID3").val();
		let ID2 = $("#ID2").val();
		let ID1 = $("#ID1").val();

		$.ajax({
			type: "POST",
			url: "/api/board/" + ID2 + "/reply/" + ID1,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json",
		}).done(function (resp) {
			alert("댓글 작성 완료..");
			if (data.REPLY_TYPE == 1) {
				location.href = "/board/" + ID2
			} else if (data.REPLY_TYPE == 2) {
				location.href = "/Rboard/" + ID2
			} else if (data.REPLY_TYPE == 3) {
				location.href = "/board/APIForm/" + ID3
			}

		}).fail(function (error) {
			alert(JSON.stringify(error));
		});

	},

	replyDelete: function (boardId, replyid) {
		$.ajax({
			type: "DELETE",
			url: "/api/board/" + boardId + "/reply/" + replyid,
			dataType: "json"
		}).done(function (resp) {
			alert("댓글 삭제 성공.");
			history.go(0);
		}).fail(function (error) {
			alert(JSON.stringify(error));
		});

	},

	apireplyDelete: function (boardId, replyid, ID3) {
		$.ajax({
			type: "DELETE",
			url: "/api/board/" + boardId + "/reply/" + replyid,
			dataType: "json"
		}).done(function (resp) {
			alert("댓글 삭제 성공.");
			history.go(0);
		}).fail(function (error) {
			alert(JSON.stringify(error));
		});

	},


	RreplyDelete: function (boardId, replyid) {
		$.ajax({
			type: "DELETE",
			url: "/api/board/" + boardId + "/reply/" + replyid,
			dataType: "json"
		}).done(function (resp) {
			alert("댓글 삭제 성공.");
			history.go(0);
		}).fail(function (error) {
			alert(JSON.stringify(error));
		});

	},

	favorite: function () {
		let data = {
			FAVORITE_TITLE: $("#title").val(),
			FAVORITE_NAME: $("#name").val(),
			FAVORITE_ID: $("#BID").val()
		};

		$.ajax({
			type: "POST",
			url: "/api/board/favorite",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json",
		}).done(function (resp) {
			alert("즐겨찾기가 완료되었습니다.");
			history.go(0);
		}).fail(function (error) {
			alert(JSON.stringify(error));
		});

	},





	Rupdate: function() {
		let ID = $("#id").val();

		let data = {
			RBOARDTITLE: $("#title").val(),
			RBOARDCONTENT: $("#content").val(),
			RBOARDUSERNAME: $("#username").val(),
			RBOARDNM: $("#RNM").val(),
			RBOARDFTYPE: $("#RNM2").val(),
			RBOARD01: $("#RBOARD01").val(),
			RBOARD02: $("#RBOARD02").val(),
			RBOARD03: $("#RBOARD03").val(),
			RBOARD04: $("#RBOARD04").val(),
			RBOARD05: $("#RBOARD05").val(),
			RBOARD06: $("#RBOARD06").val(),
			RBOARD07: $("#RBOARD07").val(),
			RBOARD08: $("#RBOARD08").val(),
			RBOARD09: $("#RBOARD09").val(),
			RBOARD10: $("#RBOARD10").val(),
			RBOARDIMG01: $("#RBOARDIMG01").val(),
			RBOARDIMG02: $("#RBOARDIMG02").val(),
			RBOARDIMG03: $("#RBOARDIMG03").val(),
			RBOARDIMG04: $("#RBOARDIMG04").val(),
			RBOARDIMG05: $("#RBOARDIMG05").val(),
			RBOARDIMG06: $("#RBOARDIMG06").val(),
			RBOARDIMG07: $("#RBOARDIMG07").val(),
			RBOARDIMG08: $("#RBOARDIMG08").val(),
			RBOARDIMG09: $("#RBOARDIMG09").val(),
			RBOARDIMG10: $("#RBOARDIMG10").val(),
		};

		$.ajax({
			type: "PUT",
			url: "/api/rboard/"+ID,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json",
		}).done(function(resp) {
			alert("레시피 글수정이 완료되었습니다");
			location.href = "/Rboard/" + ID;
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});

	},

	rdeleteById: function() {
		let ID = $("#id").text();

		$.ajax({
			type: "DELETE",
			url: "/api/rboard/"+ID,
			contentType: "application/json; charset=utf-8",
			dataType: "json",
		}).done(function(resp) {
			alert("삭제가 완료되었습니다.");
			history.go(0);
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});

	},

	Delete: function(boardId2, boardtype) {
		$.ajax({
			type: "DELETE",
			url: "/api/rboard/"+boardId2+"/delete/"+boardtype,
			dataType: "json"
		}).done(function(resp){
			alert("글삭제");
			location.href = "/board";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});

	},

	Delete2: function(boardId3, favoriteId) {
		$.ajax({
			type: "DELETE",
			url: "/api/rboard/"+boardId3+"/delete2/"+favoriteId,
			dataType: "json"
		}).done(function(resp){
			alert("즐겨찾기 삭제 완료");
			location.href = "/";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});

	},

	favorites: function(ID4, ID5, USERNAME, TITLE) {

		$.ajax({
			type: "PUT",
			url: "/api/board/favorites/"+ID4+"/fsave/"+ID5+/USERNAME/+USERNAME+/TITLE/+TITLE,
			dataType: "json",
		}).done(function(resp) {
			alert("즐겨찾기가 완료되었습니다.");
			// +ID4+"-"+ID5+"USERNAME :"+USERNAME+"TITLE:"+TITLE
			history.go(0);
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});

	},


}



index.init();