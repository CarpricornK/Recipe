package com.cos.blog.service;



import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.blog.model.RoleType;
import com.cos.blog.model.User;
import com.cos.blog.repository.UserRepository;



import javax.mail.*;
import javax.mail.internet.*;
import java.util.Date;
import java.util.Properties;

import java.util.List;
import java.util.Properties;
import java.util.Random;






//스프링이 컴포넌트 스캔을 통해서 Bean에 등록을 해줌. IoC를 해준다
@Slf4j
@Service("UserService")
public class UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private BCryptPasswordEncoder encoder;

	public List<User> muserlist() {
		return userRepository.findAll();
	}

	public int userIdCheck(String username) {
		userRepository.findByUsername(username);
		return 1;
	}

	public class MyAuthentication extends Authenticator {

		PasswordAuthentication account;

		public MyAuthentication(){
			String id = "jun991223";
			String pw = "Kyj482848@@";
			account = new PasswordAuthentication(id, pw);
		}

		public PasswordAuthentication getPasswordAuthentication(){
			return account;
		}
	}
//	인증메일전송
	@Transactional
	public void 인증메일전송(User user) {

		Random r = new Random();
		int Rnum = r.nextInt(999999);

		if (user.getUSER_OAUTH() == null) {

			User persistance = userRepository.findByUsername(user.getUsername()).orElseThrow(() -> {
				return new IllegalArgumentException("회원 찾기 실패");
			});

			String str1 = persistance.getUSER_EMAIL();
			String str2 = user.getUSER_EMAIL();
			String str3 = persistance.getUsername();
			String str4 = user.getUsername();
			String str5 = persistance.getUSER_PASSWORD();
			if (str1.equals(str2) && str3.equals(str4) == true) {
//		AWS 배포시 이걸로 수정
				String host1 = "http://a.recipekyj.link:8000/auth/PW_FIND2";
				String host2 = "http://localhost:8000/auth/PW_FIND2";

				Properties p = System.getProperties();
				p.put("mail.smtp.starttls.enable", "true");
				p.put("mail.smtp.host", "smtp.naver.com");
				p.put("mail.smtp.auth", "true");
				p.put("mail.smtp.port", "587");

				Authenticator auth = new MyAuthentication();
				Session session = Session.getDefaultInstance(p, auth);
				MimeMessage msg = new MimeMessage(session);

				try {
					msg.setSentDate(new Date());
					InternetAddress from = new InternetAddress();

					from = new InternetAddress("jun991223@naver.com");
					msg.setFrom(from);

					InternetAddress to = new InternetAddress(user.getUSER_EMAIL());
					msg.setRecipient(Message.RecipientType.TO, to);

					msg.setSubject("비밀번호 변경을 위한 메일입니다", "UTF-8");
					msg.setText("다음 링크에 접속하여 비밀번호를 설정해주세요.인증번호 :" + Rnum +"<a href='" + host1 + "?username=" + user.getUsername() + "&email=" + user.getUSER_EMAIL() + "&Rnum=" + Rnum + "'>비밀번호 변경</a>", "UTF-8");
					msg.setHeader("content-Type", "text/html");

					javax.mail.Transport.send(msg);
				} catch (AddressException addr_e){
					addr_e.printStackTrace();
				} catch (MessagingException msg_e){
					msg_e.printStackTrace();
				} finally {
					System.out.println(str5);
				}

			} else {
				System.out.println("정보 불일치 : 전송 실패");
				System.out.println(persistance.getUSER_EMAIL() + "==" + user.getUSER_EMAIL() + "@@" + persistance.getUsername() + "==" + user.getUsername());
				System.out.println(str1.equals(str2) + "2222" + str3.equals(str4));

			}



		}
	}

//	인증메일재전송
	@Transactional
	public void 인증메일재전송(User user) {
		String rawPassword = user.getUSER_PASSWORD();//1234 원문
		String encPassword = encoder.encode(rawPassword);//해쉬됨


			String host1 = "http://a.recipekyj.link:8000/auth/";
			String host2 = "http://localhost:8000/auth/";

			Properties p = System.getProperties();
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.host", "smtp.naver.com");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.port", "587");

			Authenticator auth = new MyAuthentication();
			Session session = Session.getDefaultInstance(p, auth);
			MimeMessage msg = new MimeMessage(session);

			try {
				msg.setSentDate(new Date());
				InternetAddress from = new InternetAddress();

				from = new InternetAddress("jun991223@naver.com");
				msg.setFrom(from);

				InternetAddress to = new InternetAddress(user.getUSER_EMAIL());
				msg.setRecipient(Message.RecipientType.TO, to);

				msg.setSubject("가입 인증을 위한 이메일 인증 메일입니다", "UTF-8");
				msg.setText("다음 링크에 접속하여 이메일 인증을 진행하세요." + "<a href='" + host1 + "emailCheckAction?username=" + user.getUsername() + "&email=" + user.getUSER_EMAIL() + "&password=" + rawPassword + "'>이메일 인증</a>", "UTF-8");
				msg.setHeader("content-Type", "text/html");

				javax.mail.Transport.send(msg);
			} catch (AddressException addr_e){
				addr_e.printStackTrace();
			} catch (MessagingException msg_e){
				msg_e.printStackTrace();
			}

	}


//	회원가입
	@Transactional
	public void 회원가입(User user) {
		String rawPassword = user.getUSER_PASSWORD();//1234 원문
		String encPassword = encoder.encode(rawPassword);//해쉬됨

		user.setUSER_PASSWORD(encPassword);
		user.setUSER_PASSWORD2(rawPassword);
		user.setUSER_ROLE(RoleType.USER);
		user.setUSER_CHECK("N");
		userRepository.save(user);

//		UserDAO userDAO = new UserDAO();
//		Integer userID = null;


		if (user.getUSER_OAUTH() == null) {
			String host1 = "http://a.recipekyj.link:8000/auth/";
			String host2 = "http://localhost:8000/auth/";

					Properties p = System.getProperties();
					p.put("mail.smtp.starttls.enable", "true");
					p.put("mail.smtp.host", "smtp.naver.com");
					p.put("mail.smtp.auth", "true");
					p.put("mail.smtp.port", "587");

					Authenticator auth = new MyAuthentication();
					Session session = Session.getDefaultInstance(p, auth);
					MimeMessage msg = new MimeMessage(session);

					try {
						msg.setSentDate(new Date());
						InternetAddress from = new InternetAddress();

						from = new InternetAddress("jun991223@naver.com");
						msg.setFrom(from);

						InternetAddress to = new InternetAddress(user.getUSER_EMAIL());
						msg.setRecipient(Message.RecipientType.TO, to);

						msg.setSubject("가입 인증을 위한 이메일 인증 메일입니다", "UTF-8");
						msg.setText("다음 링크에 접속하여 이메일 인증을 진행하세요." + "<a href='" + host1 + "emailCheckAction?username=" + user.getUsername() + "&email=" + user.getUSER_EMAIL() + "&password=" + encPassword + "'>이메일 인증</a>", "UTF-8");
						msg.setHeader("content-Type", "text/html");

						javax.mail.Transport.send(msg);
					} catch (AddressException addr_e){
						addr_e.printStackTrace();
					} catch (MessagingException msg_e){
						msg_e.printStackTrace();
					}

		}
	}
//	회원찾기
	@Transactional(readOnly = true)
	public User 회원찾기(String username) {

		User user = userRepository.findByUsername(username).orElseGet(() -> {
			return new User(); /* 유저를 찾아서 없으면 빈 객체를 리턴해라 */

		});
		return user;

	}
//	회원수정
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
			persistance.setUSER_PASSWORD2(rawPassword);
			persistance.setUsername(user.getUsername());
		}

		// 회원수정 함수 종료시 = 서비스 종료시 = 트랜잭션 종료 = commit 이 자동으로 된다.
		// 영속화된 persistance 객체의 변화가 감지되면 (더티체킹이 되어) update문을 날려줌.
	}
//	회원수정2
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

//	메일인증
	@Transactional
	public void 메일인증(User user) {
		User persistance = userRepository.findById(user.getId()).orElseThrow(() -> {
			return new IllegalArgumentException("회원 찾기 실패");
		});
		String rawPassword = user.getUSER_PASSWORD();
		persistance.setUSER_CHECK("Y");

	}
//	유저삭제
	@Transactional
	public void 유저삭제(int userid) {
		userRepository.deleteById(userid);
		System.out.println("ASD" + userid);
	}
}

