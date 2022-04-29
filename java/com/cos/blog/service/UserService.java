package com.cos.blog.service;



import com.cos.blog.model.Board;
import com.cos.blog.util.Gmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.Pbkdf2PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.blog.model.RoleType;
import com.cos.blog.model.User;
import com.cos.blog.repository.UserRepository;
import org.springframework.web.bind.annotation.RequestMapping;


import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;
import java.util.Random;

//스프링이 컴포넌트 스캔을 통해서 Bean에 등록을 해줌. IoC를 해준다
@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private BCryptPasswordEncoder encoder;

	public List<User> 회원목록(){ return userRepository.findAll(); }

	public int userIdCheck(String username) {
		userRepository.findByUsername(username);
		return 1;
	}

	@Transactional
	public void 인증메일전송(User user) {

		Random r = new Random();
		int Rnum = r.nextInt(999999);

		String host = "http://localhost:8000/auth/PW_FIND2";
		String from = "kwon991223@gmail.com";
		String to = user.getUSER_EMAIL();
		String subject = "인증번호가 발송된 메일입니다";
		String content = "다음 링크에 접속하여 비밀번호를 설정해주세요.인증번호 :" + Rnum +
				"<a href='" + host + "?username=" + user.getUsername() + "&email=" + user.getUSER_EMAIL() + "&Rnum=" + Rnum + "'>비밀번호 변경</a>";

		Properties p = new Properties();

		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");

		//p.put("mail.smtp.starttls.required", "true");

		p.put("mail.smtp.ssl.protocols", "TLSv1.2");

		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");

		User persistance = userRepository.findByUsername(user.getUsername()).orElseThrow(() -> {
			return new IllegalArgumentException("회원 찾기 실패");
		});

		String str1 = persistance.getUSER_EMAIL();
		String str2 = user.getUSER_EMAIL();
		String str3 = persistance.getUsername();
		String str4 = user.getUsername();

		if(str1.equals(str2) && str3.equals(str4) == true) {
		try {
			Authenticator auth = new Gmail();

			Session ses = Session.getInstance(p, auth);

			ses.setDebug(true);

			MimeMessage msg = new MimeMessage(ses);

			msg.setSubject(subject);

			Address fromAddr = new InternetAddress(from);

			msg.setFrom(fromAddr);

			Address toAddr = new InternetAddress(to);

			msg.addRecipient(Message.RecipientType.TO, toAddr);

			msg.setContent(content, "text/html;charset=UTF-8");

			Transport.send(msg);

			System.out.println(persistance.getUSER_EMAIL() + "==" +user.getUSER_EMAIL() + "@@" + persistance.getUsername() + "==" + user.getUsername());
			System.out.println(str1.equals(str2)+ "2222" + str3.equals(str4));

		} catch (Exception e) {
			System.out.println("메일 전송 실패");
			return;
		}

		} else {
			System.out.println("정보 불일치 : 전송 실패");
			System.out.println(persistance.getUSER_EMAIL() + "==" +user.getUSER_EMAIL() + "@@" + persistance.getUsername() + "==" + user.getUsername());
			System.out.println(str1.equals(str2)+ "2222" + str3.equals(str4));

		}


		}


	@Transactional
	public void 인증메일전송2(User user) {

		String rawPassword = user.getUSER_PASSWORD();//1234 원문

		System.out.println("비밀번호"+rawPassword);
//		UserDAO userDAO = new UserDAO();
//		Integer userID = null;

			String host = "http://localhost:8000/auth/";
			String from = "kwon991223@gmail.com";
			String to = user.getUSER_EMAIL();
			String subject = "가입 인증을 위한 이메일 인증 메일입니다";
			String content = "다음 링크에 접속하여 이메일 인증을 진행하세요." +
					"<a href='" + host + "emailCheckAction?username=" + user.getUsername() + "&email=" + user.getUSER_EMAIL() + "&password=" + rawPassword + "'>이메일 인증</a>";


			// SMTP에 접속하기 위한 정보를 기입합니다.

			Properties p = new Properties();

			p.put("mail.smtp.host", "smtp.gmail.com");
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");


			//p.put("mail.smtp.starttls.required", "true");

			p.put("mail.smtp.ssl.protocols", "TLSv1.2");

			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");


			try {

				Authenticator auth = new Gmail();

				Session ses = Session.getInstance(p, auth);

				ses.setDebug(true);

				MimeMessage msg = new MimeMessage(ses);

				msg.setSubject(subject);

				Address fromAddr = new InternetAddress(from);

				msg.setFrom(fromAddr);

				Address toAddr = new InternetAddress(to);

				msg.addRecipient(Message.RecipientType.TO, toAddr);

				msg.setContent(content, "text/html;charset=UTF-8");

				Transport.send(msg);

			} catch (Exception e) {

				System.out.println("오류 발생");


				return;

			}
		}







	@Transactional
	public void 회원가입(User user) {
		String rawPassword = user.getUSER_PASSWORD();//1234 원문
		String encPassword = encoder.encode(rawPassword);//해쉬됨
		user.setUSER_PASSWORD(encPassword);
		user.setUSER_ROLE(RoleType.USER);
		user.setUSER_CHECK("N");
		userRepository.save(user);

//		UserDAO userDAO = new UserDAO();
//		Integer userID = null;

		if (user.getUSER_OAUTH() == null) {
			String host = "http://localhost:8000/auth/";
			String from = "kwon991223@gmail.com";
			String to = user.getUSER_EMAIL();
			String subject = "가입 인증을 위한 이메일 인증 메일입니다";
			String content = "다음 링크에 접속하여 이메일 인증을 진행하세요." +
					"<a href='" + host + "emailCheckAction?username=" + user.getUsername() + "&email=" + user.getUSER_EMAIL() + "&password=" + encPassword + "'>이메일 인증</a>";


			// SMTP에 접속하기 위한 정보를 기입합니다.

			Properties p = new Properties();

			p.put("mail.smtp.host", "smtp.gmail.com");
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");


			//p.put("mail.smtp.starttls.required", "true");

			p.put("mail.smtp.ssl.protocols", "TLSv1.2");

			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");


			try {

				Authenticator auth = new Gmail();

				Session ses = Session.getInstance(p, auth);

				ses.setDebug(true);

				MimeMessage msg = new MimeMessage(ses);

				msg.setSubject(subject);

				Address fromAddr = new InternetAddress(from);

				msg.setFrom(fromAddr);

				Address toAddr = new InternetAddress(to);

				msg.addRecipient(Message.RecipientType.TO, toAddr);

				msg.setContent(content, "text/html;charset=UTF-8");

				Transport.send(msg);

			} catch (Exception e) {

				System.out.println("오류 발생");


				return;

			}
		}
	}

	@Transactional(readOnly = true)
	public User 회원찾기(String username) {

		User user = userRepository.findByUsername(username).orElseGet(() -> {
			return new User(); /* 유저를 찾아서 없으면 빈 객체를 리턴해라 */

		});
		return user;

	}

	@Transactional
	public void 회원수정(User user) {
		// 수정시에는 영속성 컨텍스트 User 오브젝트를 영속화시키고, 영소고하된 User 오브젝트를 수정
		// select를 해서 User오브젝트를 DB로 부터 가져오는 이유는 영속화를 하기 위해서
		// 영속화된 오브젝트를 변경하면 자동으로 DB에 update문을 날려줌..
		User persistance = userRepository.findById(user.getId()).orElseThrow(() -> {
			return new IllegalArgumentException("회원 찾기 실패");
		});

// Validate 체크 db에 Oauth가 있고 없고를 감지해서 패스워드 수정가능여부 막기(다른프로그램을 이용한 공격 예방)
		if (persistance.getUSER_OAUTH() == null || persistance.getUSER_OAUTH().equals("")) {
			String rawPassword = user.getUSER_PASSWORD();
			String encPassword = encoder.encode(rawPassword);
			persistance.setUSER_PASSWORD(encPassword);
		}

		// 회원수정 함수 종료시 = 서비스 종료시 = 트랜잭션 종료 = commit 이 자동으로 된다.
		// 영속화된 persistance 객체의 변화가 감지되면 (더티체킹이 되어) update문을 날려줌.
	}

	@Transactional
	public void 회원수정2(User user) {
		// 수정시에는 영속성 컨텍스트 User 오브젝트를 영속화시키고, 영소고하된 User 오브젝트를 수정
		// select를 해서 User오브젝트를 DB로 부터 가져오는 이유는 영속화를 하기 위해서
		// 영속화된 오브젝트를 변경하면 자동으로 DB에 update문을 날려줌..
		User persistance = userRepository.findByUsername(user.getUsername()).orElseThrow(() -> {
			return new IllegalArgumentException("회원 찾기 실패");
		});

// Validate 체크 db에 Oauth가 있고 없고를 감지해서 패스워드 수정가능여부 막기(다른프로그램을 이용한 공격 예방)
		if (persistance.getUSER_OAUTH() == null || persistance.getUSER_OAUTH().equals("")) {
			String rawPassword = user.getUSER_PASSWORD();
			String encPassword = encoder.encode(rawPassword);
			persistance.setUSER_PASSWORD(encPassword);
		}

		// 회원수정 함수 종료시 = 서비스 종료시 = 트랜잭션 종료 = commit 이 자동으로 된다.
		// 영속화된 persistance 객체의 변화가 감지되면 (더티체킹이 되어) update문을 날려줌.
	}




	@Transactional
	public void 메일인증(User user) {
		User persistance = userRepository.findById(user.getId()).orElseThrow(() -> {
			return new IllegalArgumentException("회원 찾기 실패");
		});
		String rawPassword = user.getUSER_PASSWORD();
		persistance.setUSER_CHECK("Y");



	}

}