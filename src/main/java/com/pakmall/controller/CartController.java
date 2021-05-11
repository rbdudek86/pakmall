package com.pakmall.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pakmall.domain.CartVO;
import com.pakmall.domain.MemberVO;
import com.pakmall.service.CartService;
import com.pakmall.util.FileUploadUtils;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/cart/*") // 공통주소로 사용 또는 JSP폴더명으로도 사용
public class CartController {

	// bean 주입
	@Setter(onMethod_ = @Autowired)
	private CartService cartServiece;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@ResponseBody
	@PostMapping("/add")
	public ResponseEntity<String> cart_add(long pdt_num, int pdt_amount, HttpSession session, HttpServletResponse response) throws Exception {
		
//		log.info("cart_add: " + pdt_num);
//		log.info("cart_add: " + pdt_amount);

		ResponseEntity<String> entity = null;

		//인증체크작업
		if(session.getAttribute("loginStatus") == null) {
			entity = new ResponseEntity<String>("LoginRequired", HttpStatus.OK);
			
			return entity;
		}
		
//		loginStatus 실제 저장된 성격 MemberVO : MemberController.java
		
		MemberVO vo = (MemberVO) session.getAttribute("loginStatus");
		
		CartVO cart = new CartVO(0, pdt_num, vo.getMemb_id(), pdt_amount);
		
		log.info("cart_add: " + cart);
		
		try {
			cartServiece.add_cart(cart);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@GetMapping("/cart_list")
	public void cart_list(HttpSession session, Model model) throws Exception {
		
		log.info("cart_list");
		
		String memb_id = ((MemberVO) session.getAttribute("loginStatus")).getMemb_id();
		model.addAttribute("cartVOList", cartServiece.list_cart(memb_id));
	}
	
	// 상품이미지 뷰
	@ResponseBody
	@GetMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {

	return FileUploadUtils.getFile(uploadPath, fileName);

	}
	
	@ResponseBody
	@PostMapping("/delete")
	public ResponseEntity<String> cart_delete(long cart_code) throws Exception {

		ResponseEntity<String> entity = null;
		
		// 개별작업 처리
		
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		return entity;
		

	}
	
	// 장바구니 비우기
	@GetMapping("/cart_all_delete")
	public String cart_all_delete(HttpSession session) throws Exception {
		
		String memb_id = ((MemberVO) session.getAttribute("loginStatus")).getMemb_id();
		cartServiece.cartAll_delete(memb_id);
		
		return "redirect:/cart/cart_list";
	}
	
	@ResponseBody
	@PostMapping("/cart_check_delete")
	public ResponseEntity<String> cart_check_delete(@RequestParam("checkArr[]") List<Integer> checkArr ) throws Exception{
		
		log.info("cart_check_delete: " + checkArr);
		
		ResponseEntity<String> entity = null;
		
		try {
			cartServiece.cart_check_delete(checkArr);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);		
			
		}catch(Exception ex) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
	return entity;
	}
	
	//선택상품 주문
	@ResponseBody
	@PostMapping("/cart_check_order")
	public ResponseEntity<String> cart_check_order(@RequestParam("checkArr[]") List<Integer> checkArr ) throws Exception{
		
		log.info("cart_check_order: " + checkArr);
		
		ResponseEntity<String> entity = null;
		
		try {
			cartServiece.cart_not_check_delete(checkArr);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);		
			
		}catch(Exception ex) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
	return entity;
	}
	
	@PostMapping("/cart_amount_update")
	@ResponseBody
	public ResponseEntity<String> cart_amount_update(int cart_code, int cart_amount) throws Exception{
		
		ResponseEntity<String> entity = null;
		
		try {
			cartServiece.cart_amount_update(cart_code, cart_amount);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
