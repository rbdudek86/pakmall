package com.pakmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pakmall.domain.LottoVO;
import com.pakmall.dto.Criteria;
import com.pakmall.dto.PageDTO;
import com.pakmall.service.LottoService;

import lombok.Setter;

@Controller
@RequestMapping("/lotto/*")
public class LottoController {

	@Setter(onMethod_ = @Autowired)
	private LottoService lottoService;
	
	
	@GetMapping("/lotto_insert")
	public void lotto_insert() {
		
	}
	
	@PostMapping("/lotto_insert")
	public String lotto_insert(LottoVO vo) throws Exception {
		
		System.out.println("LottoVO==========" + vo);
		lottoService.lotto_insert(vo);
		
		return "/lotto/lotto_insert";
		
	}
	
	@GetMapping("/lotto_list")
	public void lotto_list(@ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		
		
		model.addAttribute("lottoList",lottoService.lotto_list(cri));
		
		int total = lottoService.getTotalCount(cri);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}
	
	@ResponseBody
	@GetMapping("/lotto_list2")
	public void lotto_list2() throws Exception { 
				
		
	}
	
	@GetMapping("/lotto_detail2")
	public String lotto_detail2(LottoVO vo, Model model) throws Exception{
		
		System.out.println("LottoVO============" + vo);
		
		model.addAttribute("seq",vo.getSeq());
		
		return "/lotto/lotto_detail2";
	}
	
	@ResponseBody
	@GetMapping("/ajaxDetail")
	public ResponseEntity<LottoVO> ajaxDetail(LottoVO vo) throws Exception {
		
		ResponseEntity<LottoVO> entity = null;
		
		LottoVO detail = lottoService.lotto_detail(vo);
		
		System.out.println("detail==========" + detail);
		
		if(detail != null) {
			entity = new ResponseEntity<LottoVO>(detail,HttpStatus.OK);
		}else {
			entity = new ResponseEntity<LottoVO>(HttpStatus.OK);
		}
		
		return entity;
		
	}
	
	@PostMapping("/lotto_del")
	public ResponseEntity<String> lotto_del(String seq) throws Exception {
		
		ResponseEntity<String> entity = null;
		
		int resultCnt = lottoService.lotto_del(seq);
		
		if(resultCnt > 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}
		
		return entity;
	}
	
}

