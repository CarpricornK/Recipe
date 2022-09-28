package com.cos.blog.controller;

import java.util.UUID;

import com.cos.blog.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.cos.blog.model.KakaoProfile;
import com.cos.blog.model.OAuthToken;
import com.cos.blog.model.User;
import com.cos.blog.service.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

// 인증이 안된 사용자들이 출입할 수 있는 경로를 /auth/** 허용
// 그냥 주소가 / 이면 index.jsp 허용
// static 이하에 있는 /js/**, /css/**, /image/**

@Controller
public class UserController {

	@Value("${cos.key}")
	private String cosKey;

	@Autowired
	private AuthenticationManager authenticationManager;

	@Autowired
	private UserService userService;

	@Autowired
	private BoardService boardService;

	@GetMapping("/auth/joinForm")
	public String joinForm(Model model) {
		model.addAttribute("Users",userService.muserlist());
		return "user/joinForm";
	}




	@GetMapping({ "", "/auth/PW_FIND" })
	public String PW_FIND(Model model) {
		model.addAttribute("Users",userService.muserlist());

		return "PW_FIND";
	}

	@GetMapping({ "", "/auth/PW_FIND2" })
	public String PW_FIND2() {

		return "PW_FIND2";
	}

	@GetMapping({ "", "/auth/emailCheckAction" })
	public String emailCheckAction() {

		return "emailCheckAction";
	}


	@GetMapping("/auth/loginForm")
	public String loginForm() {

		return "user/loginForm";
	}

	@GetMapping("/auth/kakao/callback")
	public String kakaoCallback(String code) { // Data를 리턴해주는 컨트롤러 함수

		RestTemplate rt = new RestTemplate();

		// HttpHeader 오브젝트 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// HttpBody 오브젝트 생성
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "80132b34d6a4672223b8ee7f2be81ba7");
		params.add("redirect_uri", "http://localhost:8000/auth/kakao/callback"); //AWS 할때 http://a.recipekyj.link:8000/auth/kakao/callback
		params.add("code", code);

		// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);

		ResponseEntity<String> response = rt.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST,
				kakaoTokenRequest, String.class);

		// Gson, Json Simple, ObjectMapper
		ObjectMapper objectMapper = new ObjectMapper();
		OAuthToken oauthToken = null;
		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		System.out.println("카카오 엑세스 토큰 : " + oauthToken.getAccess_token());

		RestTemplate rt2 = new RestTemplate();

		// HttpHeader 오브젝트 생성
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + oauthToken.getAccess_token());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 = new HttpEntity<>(headers2);

		ResponseEntity<String> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST,
				kakaoProfileRequest2, String.class);
		System.out.println("response2.getBody() : " + response2.getBody());

		ObjectMapper objectMapper2 = new ObjectMapper();
		KakaoProfile KakaoProfile = null;
		try {
			KakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		// User 오브젝트 : username, password, email
		System.out.println("카카오 아이디(번호) : " + KakaoProfile.getId());
		System.out.println("카카오 이메일 : " + KakaoProfile.getKakao_account().getEmail());

		System.out.println("카카오 유저네임 : " + KakaoProfile.getKakao_account().getEmail() + "_" + KakaoProfile.getId());
		System.out.println("카카오 유저네임2 : " + KakaoProfile.getKakao_account().profile.getNickname());

		System.out.println("블로그서버 이메일 : " + KakaoProfile.getKakao_account().getEmail());
		// UUID란 -> 중복되지 않는 어떤 특정 값을 만들어내는 알고리즘
		// UUID garbagePassword = UUID.randomUUID();
		System.out.println("블로그서버 패스워드 : " + cosKey);

		User kakaouser = User.builder()
				.username(KakaoProfile.getKakao_account().profile.getNickname()+"K")
				.USER_PASSWORD(cosKey)
				.USER_EMAIL(KakaoProfile.getKakao_account().getEmail())
				.USER_OAUTH("kakao")
                .build();
		
		// 가입자 혹은 비가입자 체크 해서 처리
		User originUser = userService.회원찾기(kakaouser.getUsername());

		if (originUser.getUsername() == null) {
			System.out.println("기존 회원이 아닙니다 자동 회원가입을 진행합니다.");
			userService.회원가입(kakaouser);
			/* UserService의 회원가입에 username, password, email 넣는곳 */
		}

		System.out.println("자동 로그인을 진행합니다");
		// 로그인 처리
		Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(kakaouser.getUsername(), cosKey));
		SecurityContextHolder.getContext().setAuthentication(authentication);

		return "redirect:/";
	}

	@GetMapping("/user/updateForm")
	public String updateForm(Model model) {
		model.addAttribute("Users",userService.muserlist());
		model.addAttribute("MpList",boardService.mPList());
		return "user/updateForm";
	}
}
