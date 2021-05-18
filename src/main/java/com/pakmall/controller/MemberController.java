package com.pakmall.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pakmall.domain.BoardVO;
import com.pakmall.domain.MemberVO;
import com.pakmall.dto.EmailDTO;
import com.pakmall.dto.LoginDTO;
import com.pakmall.service.EmailService;
import com.pakmall.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
public class MemberController {

	@Setter(onMethod_ = @Autowired)
	private MemberService service;

	@Setter(onMethod_ = @Autowired)
	private EmailService mailService;

	@Inject
	private BCryptPasswordEncoder cryPassEnc;
	
	
	// 로그인 주소
	@GetMapping("/login")
	public void login() {

		log.info("로그인");
	}

	// 로그인 인증
	@PostMapping(value = "/loginPost")
	public void login_ok(LoginDTO dto, RedirectAttributes rttr, HttpSession session, Model model) throws Exception {

		MemberVO vo = service.login_ok(dto);
		System.out.println("LoginDTO에 담겨있는 정보 ======== " + vo);
		
		if(vo == null) return;

		String result = "loginIDFail";

		if(vo != null) {

			
			if(cryPassEnc.matches(dto.getMemb_pw(), vo.getMemb_pw())){
				// vo.setMemb_pw(""); 비밀번호 보안처리
				// session.setAttribute("loginStatus", vo); //세션정보로 인증상태를 저장
				
				// 인터셉터에서 참조할 모델작업
				model.addAttribute("memberVO", vo);
				
				
				// 세션정보로(vo)에 고객정보를 모두 "loginStatus"에 인증상태를 저장
				result = "loginSuccess";
			}else {
				result = "loginPWFail";
				return;
			}
		}

		rttr.addFlashAttribute("status", result);

		//return "redirect:/"; // main.jsp 실행

	}

	// 로그아웃 기능 : 메인페이지("/")
	@GetMapping("/logout")
	public String logout(HttpSession session, RedirectAttributes rttr) {

		log.info("logout.....");

		session.invalidate();

		rttr.addFlashAttribute("status", "");

		return "redirect:/";

	}

	

	// 회원가입 폼
	@GetMapping("/join")
	public void register() {

		log.info("회원가입");
	}

	
	//회원가입
		@PostMapping("/join")
		public String join(MemberVO vo, RedirectAttributes rttr) throws Exception {
			
			log.info(vo);
			
			vo.setMemb_pw(cryPassEnc.encode(vo.getMemb_pw()));
			
			String result = "";
			service.join(vo);
			
			result = "insertSuccess";
			
			rttr.addFlashAttribute("status", result);
			
			return "redirect:/";
		}
	

	/* 아이디 중복체크(ajax요청)   /member/checkIdDuplicate  */
	@ResponseBody
	@RequestMapping(value = "checkIdDuplicate", method=RequestMethod.POST)
	public ResponseEntity<String> checkIdDuplicate(@RequestParam("memb_id") String memb_id) throws Exception {

		log.info("id check.....");

		ResponseEntity<String> entity = null;
		try {
			int count = service.checkIdDuplicate(memb_id);
			// count 가 0이면 아이디 사용가능, 1d 이면 사용 불가능.

			if(count != 0) {
				// 아이디가 존재해서 사용이 불가능.
				entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
			} else {
				// 사용가능한 아이디
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}

		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST); // 요청이 문제가 있다.
		}

		return entity;
	}
	
	/* 
	 * 이메일 인증 코드 확인   // /member/checkAuthcode
	 * - 입력된 인증 코드와 세션에 저장해 두었던 인증 코드가 일치하는지 확인
	 */
	@ResponseBody
	@RequestMapping(value = "checkAuthcode", method=RequestMethod.POST)
	public ResponseEntity<String> checkAuthcode(@RequestParam("code") String code, HttpSession session){
		
		ResponseEntity<String> entity = null;
		
		try {
			if(code.equals(session.getAttribute("authcode"))) {
				// 인증코드 일치
				entity= new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
				session.removeAttribute("authcode"); // 앞에서 했던 작업을 없애주는 작업
			
			} else {
				// 인증코드 불일치
				entity= new ResponseEntity<String>("FAIL", HttpStatus.OK);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			entity= new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	// 회원수정 폼 : db에서 회원정보를 가져와서 출력 
	@GetMapping("/modify")
	public void reg_edit(HttpSession session, Model model) throws Exception {

		String memb_id = ((MemberVO) session.getAttribute("loginStatus")).getMemb_id();

		//	    MemberVO vo = service.member_info(memb_id);
		//	    model.addAttribute("vo", vo);

		//	    model.addAttribute(service.member_info(memb_id)); //jsp에 전달되는 데이터의 키? memberVO
		model.addAttribute("vo", service.member_info(memb_id));   
	}
	
	

	// 회원수정
	@PostMapping("/modify")
	public String modifyPOST(MemberVO vo, RedirectAttributes rttr, HttpSession session) throws Exception {

		String result ="";
		//	    if(service.modifyPOST(vo) == true) {
		//      result = "modifySuccess";
		//  }else {
		//     result = "modifyFail";
		//  }

		//로그인시 세션에서 아이디를 참고
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMemb_id();
		vo.setMemb_id(mem_id);
		
		//MemberVO vo에 회원수정폼에서 아이디 파라미터가 존재한 경우
		service.modifyPOST(vo);
		result = "modifySuccess";

		rttr.addFlashAttribute("status", result);


		return "redirect:/";

	}

	// 회원삭제 기능(Get)
	@GetMapping("/delete")
	public String member_delete(HttpSession session, RedirectAttributes rttr) throws Exception {

		log.info("delete........");

		String memb_id = ((MemberVO) session.getAttribute("loginStatus")).getMemb_id();

		service.member_delete(memb_id);
		session.invalidate();

		String result = "regdelete";

		rttr.addFlashAttribute("status", result);

		return "redirect:/";
	}


	// 아이디찾기 폼
	@GetMapping("/find_id")
	public void find_id() {
		log.info("find_id");
	}

	// 아이디찾기기능(ajax적용) : 화면출력
	@ResponseBody
	@PostMapping("/find_id")
	public ResponseEntity<String> find_id(@RequestParam("memb_name") String memb_name) throws Exception {

		log.info("이름? " + memb_name);

		ResponseEntity<String> entity = null;

		String memb_id = service.find_id(memb_name);

		if(memb_id != null) {
			entity = new ResponseEntity<String>(memb_id, HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}

		return entity;
	}

	// 비밀번호 찾기 폼
	@GetMapping("/find_pwd")
	public void find_pwd() {
		log.info("find_pwd");
	}


	// 비밀번호 찾기기능(ajax적용)
	@ResponseBody
	@PostMapping("/find_pwd")
	public ResponseEntity<String> find_pwd(@RequestParam("memb_id") String memb_id, @RequestParam("memb_name") String memb_name, EmailDTO dto ) throws Exception {

		log.info("아이디? " + memb_id);
		log.info("이름? " + memb_name);


		ResponseEntity<String> entity = null;

		MemberVO vo = service.find_pwd(memb_id, memb_name);


		if(vo != null) {

			// 메일발송작업
			dto.setReceiveMail(vo.getMemb_email());
			dto.setSubject("요청하신 비밀번호입니다.");
			dto.setMessage(memb_id + " 님의 비밀번호입니다.");

			mailService.sendMail(dto, vo.getMemb_pw());


			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}

		return entity;
	}
	
	// 비밀번호찾기 폼(암호화)
	@GetMapping("/pw_search")
	public void pw_search() {
		
	}
	
	
	///member/pw_search
	@ResponseBody
	@PostMapping("/pw_search")
	public ResponseEntity<String> pw_search(String id, EmailDTO email_dto) throws Exception{
		
		log.info(id);
		
		ResponseEntity<String> entity = null;
		
		LoginDTO dto = new LoginDTO();
		dto.setMemb_id(id);
		dto.setMemb_pw("");
		
		MemberVO vo = service.login_ok(dto);
		
		String imsi_pw = "";
		
		log.info("이메일" +vo.toString());
		
		if(vo != null) {
			String email = vo.getMemb_email();
			
			for(int i=0; i<12; i++) {
				imsi_pw += (char)((Math.random() * 26) + 97);
			}
			
			// 비번 암호화작업
			String enc_pw = cryPassEnc.encode(imsi_pw);
			dto.setMemb_pw(enc_pw);
			
			// dto를 파라미터로 하여, 사용자 아이디에 해당하는 비번변경작업 
			// 1)update 회원테이이블 set 비번컬럼명 = 암호화된 비번 where 조건식(아이디일치)
			service.pw_search(dto);
			
			
			// 2)평문 비번을 메일전송
			email_dto.setReceiveMail(email);
			email_dto.setSubject("요청하신 임시 비밀번호입니다. 로그인해서 비밀번호를 변경해주세요.");
			email_dto.setMessage(id + " 님의 비밀번호입니다.");

			mailService.sendMail(email_dto, imsi_pw);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}

		return entity;
		
	}
	
	//마이페이지 폼
	@GetMapping("/my_info")
	public void my_info() {
		
	}
	
	//비밀번호 변경 폼
	@GetMapping("/pw_update")
	public void pw_update() {
		
	}
	
//	@PostMapping("/pw_update")
//	@ResponseBody
//	public String updatePOST(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
//
//		System.out.println("비번변경 =========== " +vo.getMemb_pw() + vo.getMemb_pw1() + vo.getMemb_pw2());
//		
//		
//		String memb_id = ((MemberVO) session.getAttribute("loginStatus")).getMemb_id();
//		System.out.println("memb_id==========" + memb_id);
//		
//		
//		String memb_pw = vo.getMemb_pw1();
//		System.out.println("memb_pw==========" + memb_pw);
//		
////		String memb_pwck = vo.getMemb_pw2();
////		System.out.println("memb_pwck==========" + memb_pwck);
//		
//		service.updatePOST(memb_id, memb_pw);
//	
//		//String result = "updateSuccess";
//		
//		//rttr.addFlashAttribute("status", result);
//
//		return "redirect:/";
//		
//	}
	
	
	@PostMapping("/pw_update")
	public String updatePOST(MemberVO vo, RedirectAttributes rttr, HttpSession session) throws Exception {

      String result ="";
      
      System.out.println("session에 있는걸 MemberVO에 담기 : " + ((MemberVO) session.getAttribute("loginStatus")));
      
      // 1. 세션에 담겨있는 password (암호화되어 있음)
      String loginPassword = ((MemberVO) session.getAttribute("loginStatus")).getMemb_pw();
      System.out.println("session에 있는 비밀번호 : " + ((MemberVO) session.getAttribute("loginStatus")).getMemb_pw());
      
      
      // 2. 화면에서 가져온 password (원본)
      String memb_pw = vo.getMemb_pw();
      System.out.println("화면에서 가져온 기존비밀번호(원본) : " + memb_pw);
      
      
      // session에 담겨있는 memb_id를 vo에 담기
      String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMemb_id();
      vo.setMemb_id(mem_id);
      
      // 위에 사용한 match를 참고해보니,
      // matches(기존비밀번호(원본),  세션에 담겨있는 비밀번호(암호화))
      if(cryPassEnc.matches(memb_pw, loginPassword)){
         System.out.println("일치함");
         
         // vo에서 받아온 비밀번호를 암호화 해서 다시 vo에 담기 
         vo.setMemb_pw(cryPassEnc.encode(vo.getMemb_pw1()));

         
         // 여기에 신규 password update (일단 주석해놓음)
	         service.updatePOST(vo);
	        
	         
	         result = "updateSuccess";
      } else {
         System.out.println("불일치함");
         
      }
      
      rttr.addFlashAttribute("status", result);

      return "redirect:/";

   }
	
	

}
