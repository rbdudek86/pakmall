package com.pakmall.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pakmall.domain.MemberVO;
import com.pakmall.domain.OrderDetailListVO;
import com.pakmall.domain.OrderDetailVO;
import com.pakmall.dto.Criteria;
import com.pakmall.dto.PageDTO;
import com.pakmall.service.MemberOrderService;
import com.pakmall.service.OrderService;
import com.pakmall.util.FileUploadUtils;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/order/*")
@Log4j
public class MemberOrderController {

//	@Resource(name="uploadPath")
//	private String uploadPath;
	
	
	// @Autowired 필드주입 / @Setter(onMethod_ = 롬복의 setter메서드 주입
	@Setter(onMethod_ = @Autowired) 
	private MemberOrderService memberOrderService;
	
	//@RequestMapping(value = {"/order_list","order_detail_list"},method = {RequestMethod.GET, RequestMethod.POST})
	@RequestMapping(value = "/order_list",method = {RequestMethod.GET, RequestMethod.POST})
	public void order_list(@ModelAttribute("cri") Criteria cri, Model model, HttpSession session) throws Exception{
		
		System.out.println("memb_id=======" + ((MemberVO) session.getAttribute("loginStatus")).getMemb_id()); 
		
		//System.out.println("session에 있는걸 Criteria에 담기 : " + ((Criteria) session.getAttribute("loginStatus")));
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMemb_id();
		cri.setMem_id(mem_id);
	
		log.info("order_list: " + cri);
		
		model.addAttribute("order_list", memberOrderService.orderInfo_list(cri));
		
		int total = memberOrderService.getTotalCountOrder(cri);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
//	// ajax에서 넘어온 주문번호 파라미터를 가지고 주문상세테이블에 쿼리를 구성해야 한다.
//	@ResponseBody
//	@GetMapping(value = "/order_detail_list",
//				produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
//	
//	public ResponseEntity<List<OrderDetailListVO>> order_detail_list(long odr_code) throws Exception{
//		
//		
//		ResponseEntity<List<OrderDetailListVO>> entity = null;
//		
//		try {
//			entity = new ResponseEntity<List<OrderDetailListVO>>(orderService.order_detail_list(odr_code), HttpStatus.OK);
//		}catch(Exception e) {
//			entity = new ResponseEntity<List<OrderDetailListVO>>(HttpStatus.BAD_REQUEST);
//		}
//		return entity;
//	}
//	
//	// 상품이미지 뷰
//	@ResponseBody
//	@GetMapping("/displayFile")
//	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
//
//		return FileUploadUtils.getFile(uploadPath, fileName);
//
//	}
	
}
