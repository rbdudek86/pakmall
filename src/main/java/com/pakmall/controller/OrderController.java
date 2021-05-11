package com.pakmall.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pakmall.domain.CartVOList;
import com.pakmall.domain.MemberVO;
import com.pakmall.domain.OrderDetailListVO;
import com.pakmall.domain.OrderDetailVO;
import com.pakmall.domain.OrderVO;
import com.pakmall.domain.ProductVO;
import com.pakmall.service.CartService;
import com.pakmall.service.OrderService;
import com.pakmall.service.UserProductService;
import com.pakmall.util.FileUploadUtils;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/order/*") // (views)JSP폴더명 and 공통경로 
public class OrderController {
	
	// bean 주입
	@Setter(onMethod_ = @Autowired)
	private CartService cartServiece;
	
	@Setter(onMethod_ = @Autowired)
	private OrderService orderService;
	
	@Setter(onMethod_ = @Autowired)
	private UserProductService userProductservice;
	
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	
	//@PostMapping("/order") // type1 즉시구매
	//@GetMapping("/order") // Model : JSP뿌리기 위해 // type2 바구니
	
	//@RequestParam(required = false) : get요청에 의한 해당쿼리스트링이 존재하지 않아도 처리하고자 할때 사용.(예외발생이 안됨)
	
	@RequestMapping(value = "/order", method= RequestMethod.GET)
	public void order(HttpSession session, @ModelAttribute("type") String type, @RequestParam(required = false) Long pdt_num, @RequestParam(required = false) Integer odr_amount, Model model) throws Exception{
	
		// type:  1-즉시구매, 2-장바구니기반으로 주문하기
		
		// 사용자별 장바구니 내역
		String memb_id = ((MemberVO) session.getAttribute("loginStatus")).getMemb_id();
		
		if(type.equals("1")) {
			// 즉시구매
			log.info("즉시구매" + type);
			
			// c.cart_code, p.pdt_img, p.pdt_name, c.cart_amount, p.pdt_price
			ProductVO vo = userProductservice.getProductByNum((long)pdt_num);
			
			// 즉시구매시 상품상세정보를 폼에 삽입하기위한 Model작업
			model.addAttribute("pdt_num", pdt_num);
			model.addAttribute("odr_amount", odr_amount);
			model.addAttribute("odr_price", vo.getPdt_price());
			
			
			//매개변수가 있는 생성자를 만들어서, 디폴트생성자 처리해 줄것.
			CartVOList cartvo = new CartVOList(0, vo.getPdt_img(), vo.getPdt_name(), (int)odr_amount, vo.getPdt_price());
			
			List<CartVOList> cartvoList = new ArrayList<CartVOList>();
			cartvoList.add(cartvo);
			
			model.addAttribute("cartVOList", cartvoList);
			
			// 구매상품에 대한 정보를 표시
			//model.addAttribute("cartVOList", memb_id)userProductservice.getProductByNum(0)
			
		} else if(type.equals("2")){
			log.info("장바구니 기반으로 구매" + type);
			// 장바구니 기반으로 사용
			model.addAttribute("cartVOList", cartServiece.list_cart(memb_id));
			
			// 사용하지 않는 값이지만, 주문하기 클릭을 하게되면, OrderDetailVO vo2 파라미터에서 에러발생이 되므로, 형식만 유지를 했음.
			model.addAttribute("pdt_num", 0);
			model.addAttribute("odr_amount", 0);
			model.addAttribute("odr_price", 0);
		}
		
		// 주문입력폼 구성작업
		
	}
	// 상품이미지 뷰
	@ResponseBody
	@GetMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {

	return FileUploadUtils.getFile(uploadPath, fileName);
	}
	
	// 결제후 다른 페이지로 이동하기 때문에 String
	// 전체상품 주문하기
	// order.jsp에서 type파라미터 정보를 받아와야, 즉시구매, 장바구니를 통한 구매 분기작업을 할수가 있다.
	// 
	@PostMapping("/order_buy")
	public String order_buy(OrderVO vo, OrderDetailVO vo2, String type, HttpSession session) throws Exception {
		
		log.info("order_buy" + vo);
		
		String mem_id = ((MemberVO) session.getAttribute("loginStatus")).getMemb_id();
		vo.setMem_id(mem_id);
		
		if(type.equals("1")) {
			
			log.info("order: " + vo);
			log.info("orderDetail: " + vo2);
			
			// 장바구니 테이블 제외(즉시구매이므로 장바구니에 상품을 저장안함)
			// 주문, 주문상세테이블 작업 : pdt_num, odr_amount, odr_price
			orderService.orderDirect_buy(vo, vo2); // 즉시구매한 상품구성 해줄것
		}else if(type.equals("2")) {

			// 주문, 주문상세(장바구니참조), 장바구니 삭제
			orderService.order_buy(vo, mem_id);
		}
		
		return "redirect:/";
	}
	
	@PostMapping("/cart_amount_update")
	@ResponseBody
	public ResponseEntity<String> cart_amount_update(int cart_code, int cart_amount) throws Exception {
		
		ResponseEntity<String> entity = null;
		
		try {
			cartServiece.cart_amount_update(cart_code, cart_amount);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
		

}
