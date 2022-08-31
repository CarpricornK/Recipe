let index = {
		init: function(){
			$("#btn-save").on("click", ()=>{ // function(){} , ()=>{} this를 바인딩하기 위해서!! 
				this.save();
			});
			$("#btn-update").on("click", ()=>{ // function(){} , ()=>{} this를 바인딩하기 위해서!! 
				this.update();
			});
			$("#btn-emailcheck").on("click", ()=>{ // function(){} , ()=>{} this를 바인딩하기 위해서!!
				this.emailcheck();
			});
			$("#btn-PW_FIND").on("click", ()=>{ // function(){} , ()=>{} this를 바인딩하기 위해서!!
				this.PW_FIND();
			});
			$("#btn-PW_FIND2").on("click", ()=>{ // function(){} , ()=>{} this를 바인딩하기 위해서!!
				this.PW_FIND2();
			});
			$("#btn-Mail").on("click", ()=>{ // function(){} , ()=>{} this를 바인딩하기 위해서!!
				this.Mail();
			});
			$("#btn-delete").on("click", ()=>{ // function(){} , ()=>{} this를 바인딩하기 위해서!!
				this.userdelete();
			});
			$("#btn-delete2").on("click", ()=>{ // function(){} , ()=>{} this를 바인딩하기 위해서!!
				this.userdelete2();
			});



		},

		save: function(){
			//alert('user의 save함수 호출됨');
			let data = {
			        username: $("#username").val(),
			    	USER_PASSWORD: $("#password").val(),
				    USER_EMAIL: $("#email").val()
			};
			let password = $("#password").val();
			let passwordre = $("#passwordre").val();
			//console.log(data);

			// ajax호출시 default가 비동기 호출
			// ajax 통신을 이용해서 3개의 데이터를 json으로 변경하여 insert 요청!!
			// ajax가 통신을 성공하고 서버가 json을 리턴해주면 자동으로 자바 오브젝트로 변환해주네요.
			if(passwordre == password && data.USER_EMAIL.indexOf('@') != -1 && data.USER_EMAIL.indexOf('.com') != -1 && data.username.length >= 4 && data.USER_PASSWORD.length >= 4 ) {
				$.ajax({
					type: "POST",
					url: "/auth/joinProc",
					data: JSON.stringify(data), // http body데이터
					contentType: "application/json; charset=utf-8",// body데이터가 어떤 타입인지(MIME)
					dataType: "json" // 요청을 서버로해서 응답이 왔을 때 기본적으로 모든 것이 문자열 (생긴게 json이라면) => javascript오브젝트로 변경
				}).done(function (resp) {
					if (resp.status === 500) {
					} else {
						alert("회원가입이 완료되었습니다.");
						location.href = "/";
					}

				}).fail(function (error) {
					alert(JSON.stringify(error));
				});
			} else if(passwordre != password){
				alert("회원가입이 실패했습니다. (비밀번호 확인)");
			} else if(data.USER_EMAIL.indexOf('@') == -1){
				alert("이메일 형식이 아닙니다 @가 없습니다");
			} else if(data.USER_EMAIL.indexOf('.com') == -1){
				alert("이메일 형식이 아닙니다 .com 으로 끝나야합니다");
			} else if(data.username.length < 4){
				alert("이름은 4자리 이상이여야 합니다");
			} else if(data.USER_PASSWORD.length < 4){
				alert("비밀번호는 4자리 이상이여야 합니다");
			}

			
		},
		
		update: function(){
		//alert('user의 save함수 호출됨');
			let data = {
					id: $("#id").val(),
					username: $("#username").val(),
					USER_PASSWORD: $("#password").val(),
					USER_EMAIL: $("#email").val()
			};
			
			//console.log(data);
			
		$.ajax({ 
				type: "PUT",
				url: "/user",
				data: JSON.stringify(data), // http body데이터
				contentType: "application/json; charset=utf-8",// body데이터가 어떤 타입인지(MIME)
				dataType: "json" // 요청을 서버로해서 응답이 왔을 때 기본적으로 모든 것이 문자열 (생긴게 json이라면) => javascript오브젝트로 변경
			}).done(function(resp){
				alert("회원수정이 완료되었습니다.");
				//console.log(resp);
				location.href = "/";
			}).fail(function(error){
				alert(JSON.stringify(error));
			}); 

		},


	    emailcheck: function(){
		//alert('user의 save함수 호출됨');
		 let data = {
			id: $("#id").val(),
			username: $("#username").val(),
			USER_EMAIL: $("#email").val()
		 };

		//console.log(data);

		 $.ajax({
			type: "PUT",
			url: "/auth/user",
			data: JSON.stringify(data), // http body데이터
			contentType: "application/json; charset=utf-8",// body데이터가 어떤 타입인지(MIME)
			dataType: "json" // 요청을 서버로해서 응답이 왔을 때 기본적으로 모든 것이 문자열 (생긴게 json이라면) => javascript오브젝트로 변경
		 }).done(function(resp){
			alert("메일인증이 완료되었습니다.");
			//console.log(resp);
			location.href = "/";
	 	}).fail(function(error){
			alert(JSON.stringify(error));
		 });

	},

	PW_FIND: function(){
		//alert('user의 save함수 호출됨');
		let data = {
			id: $("#id").val(),
			username: $("#username").val(),
			USER_EMAIL: $("#email").val()
		};

		//console.log(data);


		$.ajax({
			type: "PUT",
			url: "/auth/PW_FIND",
			data: JSON.stringify(data), // http body데이터
			contentType: "application/json; charset=utf-8",// body데이터가 어떤 타입인지(MIME)
			dataType: "json" // 요청을 서버로해서 응답이 왔을 때 기본적으로 모든 것이 문자열 (생긴게 json이라면) => javascript오브젝트로 변경
		}).done(function(resp){
			alert("인증번호를 전송했습니다.");
			//console.log(resp);
			location.href = "/";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},


	PW_FIND2: function(){
		//alert('user의 save함수 호출됨');
		let data = {
			username: $("#username").val(),
			USER_PASSWORD: $("#password").val(),

		};
		let password = $("#password").val();
		let password2 = $("#password2").val();
	    let Rnum = $("#Rnum").val();
		let RnumC = $("#RnumC").val();
		//console.log(data);
		if(Rnum == RnumC && password == password2){

		 $.ajax({
			type: "PUT",
			url: "/auth/PW_FIND2",
			data: JSON.stringify(data), // http body데이터
			contentType: "application/json; charset=utf-8",// body데이터가 어떤 타입인지(MIME)
			dataType: "json" // 요청을 서버로해서 응답이 왔을 때 기본적으로 모든 것이 문자열 (생긴게 json이라면) => javascript오브젝트로 변경
		 }).done(function(resp){
			alert("비밀번호를 변경했습니다.");
			 location.href = "/";
			//console.log(resp);
		 }).fail(function(error){
			alert(JSON.stringify(error));
		 });
		} else {
			alert("변경에 실패했습니다...");
		}

	},

	Mail: function(){
		//alert('user의 save함수 호출됨');
		let data = {
			username: $("#username1").val(),
			USER_PASSWORD: $("#passwordhash1").val(),
			USER_EMAIL: $("#email1").val(),
			USER_OAUTH: $("#USER_OAUTH1").val(),
		};
		//console.log(data);
			$.ajax({
				type: "POST",
				url: "/user/updateForm",
				data: JSON.stringify(data), // http body데이터
				contentType: "application/json; charset=utf-8",// body데이터가 어떤 타입인지(MIME)
				dataType: "json" // 요청을 서버로해서 응답이 왔을 때 기본적으로 모든 것이 문자열 (생긴게 json이라면) => javascript오브젝트로 변경
			}).done(function(resp){
				alert("메일을 전송했습니다.");
				location.href = "/";
				//console.log(resp);
			}).fail(function(error){
				alert(JSON.stringify(error));
			});
		},


	userdelete: function(){
		//alert('user의 save함수 호출됨');
		let data = {
			username: $("#username2").val(),
			USER_PASSWORD: $("#password2").val(),
			EMAILCHECK: $("#check").val(),
			REPASSWORD: $("#repassword2").val(),
			CKPASSWORD: $("#ckpassword2").val()

		};
		let switch1 = $("input:checkbox[name='switch1']:checked").val();
		let switch2 = $("input:checkbox[name='switch2']:checked").val();
		let userid = $("#userid").val();
		//console.log(data);

		// ajax호출시 default가 비동기 호출
		// ajax 통신을 이용해서 3개의 데이터를 json으로 변경하여 insert 요청!!
		// ajax가 통신을 성공하고 서버가 json을 리턴해주면 자동으로 자바 오브젝트로 변환해주네요.
		if(data.USER_PASSWORD == data.REPASSWORD && data.USER_PASSWORD == data.CKPASSWORD && switch1 == 1 && switch2 == 1 && data.EMAILCHECK != "N") {
			$.ajax({
				type: "DELETE",
				url: "/user/userdelete/"+userid,
				data: JSON.stringify(data), // http body데이터
				contentType: "application/json; charset=utf-8",// body데이터가 어떤 타입인지(MIME)
				dataType: "json" // 요청을 서버로해서 응답이 왔을 때 기본적으로 모든 것이 문자열 (생긴게 json이라면) => javascript오브젝트로 변경
			}).done(function (resp) {
				if (resp.status === 500) {
				} else {
					alert("회원탈퇴완료");
					location.href = "/logout";
				}

			}).fail(function (error) {
				alert("회원탈퇴 실패.");
			});
		} else if (data.EMAILCHECK == "N"){
			alert("이메일인증을 해주세요");
		} else if (data.USER_PASSWORD != data.REPASSWORD){
			alert("비밀번호 확인 불일치");
		} else if (data.USER_PASSWORD != data.CKPASSWORD){
			alert("비밀번호 DB 불일치");
		} else if (switch1 != 1 || switch2 != 1){
			alert("동의필수");
		}

	},

	userdelete2: function(){
		//alert('user의 save함수 호출됨');
		let data = {
			username: $("#username2").val(),
			USER_PASSWORD: $("#password2").val(),
			EMAILCHECK: $("#check").val(),
			REPASSWORD: $("#repassword2").val()

		};
		let switch1 = $("input:checkbox[name='switch1']:checked").val();
		let switch2 = $("input:checkbox[name='switch2']:checked").val();
		let userid = $("#userid").val();
		//console.log(data);

		// ajax호출시 default가 비동기 호출
		// ajax 통신을 이용해서 3개의 데이터를 json으로 변경하여 insert 요청!!
		// ajax가 통신을 성공하고 서버가 json을 리턴해주면 자동으로 자바 오브젝트로 변환해주네요.
		if(data.USER_PASSWORD == data.REPASSWORD && switch1 == 1 && switch2 == 1 && data.EMAILCHECK != "N") {
			$.ajax({
				type: "DELETE",
				url: "/user/userdelete/"+userid,
				data: JSON.stringify(data), // http body데이터
				contentType: "application/json; charset=utf-8",// body데이터가 어떤 타입인지(MIME)
				dataType: "json" // 요청을 서버로해서 응답이 왔을 때 기본적으로 모든 것이 문자열 (생긴게 json이라면) => javascript오브젝트로 변경
			}).done(function (resp) {
				if (resp.status === 500) {
				} else {
					alert("회원탈퇴");
					location.href = "/logout";
				}

			}).fail(function (error) {
				alert("회원탈퇴 실패.");
			});
		} else {
			alert("회원탈퇴");
		}

	},

}

index.init();