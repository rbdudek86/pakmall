package com.pakmall.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.HtmlUtils;

import com.pakmall.domain.BoardVO;
import com.pakmall.domain.ReplyVO;
import com.pakmall.service.ReplyService;

import lombok.Setter;

@Controller
@RequestMapping("/reply/*")
public class ReplyController {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyService replyService;
	
	
	// 댓글 등록
	@ResponseBody
	@PostMapping("/reply_insert")
	public ResponseEntity<String> reply_insert (ReplyVO vo, RedirectAttributes rttr) throws Exception {
		
		System.err.println("댓글등록===================" + vo);
		ResponseEntity<String> entity = null;
		
		
		int resultCnt = replyService.reply_insert(vo);
		
		// 성공하면 resultCnt = 1
		if(resultCnt > 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}
		
		return entity;
	}
	

	// 댓글 삭제
	@ResponseBody
	@PostMapping("/reply_delete")
	public ResponseEntity<String> reply_delete(@RequestParam long bd_rno) throws Exception{
		System.out.println("bd_rno===========" + bd_rno);
		ResponseEntity<String> entity = null;
		
		int resultCnt = replyService.reply_delete(bd_rno);
		
		// 성공하면 resultCnt = 1
		if(resultCnt > 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}
		
		return entity;
	}
	
	// 게시글 수정
	@PostMapping("/reply_update")
	public String reply_update(ReplyVO vo, RedirectAttributes rttr) throws Exception {
		
		System.out.println("ReplyVO===========" + vo);
		
		
		replyService.reply_update(vo);
	
		System.out.println("reply_update============" + vo.getBd_reply());
		
		return "redirect:/board/board_detail2?bd_num=" + vo.getBd_num();
	}
	
	
	// 답글 등록 폼
	@GetMapping("/reply_register")
	public void reply_register(BoardVO vo, Model model) throws Exception{
		System.out.println("bd_num===========" + vo.getBd_num());
		
		model.addAttribute("bd_num", vo.getBd_num());
		
		System.out.println("bd_ref===========" + vo.getBd_ref());
		
		model.addAttribute("bd_ref", vo.getBd_ref());
		
		System.out.println("bd_parent===========" + vo.getBd_parent());
		
		model.addAttribute("bd_parent", vo.getBd_parent());
		
		System.out.println("bd_layer===========" + vo.getBd_layer());
		
		model.addAttribute("bd_layer", vo.getBd_layer());
		
		System.out.println("bd_title==========" + vo.getBd_title());
		
		model.addAttribute("bd_title", vo.getBd_title());
		
		
		System.out.println("reply_register===========" + vo);
		
	}
	
	// 답글 등록
	@PostMapping("/reply_register")
	public String reply_register(BoardVO vo, RedirectAttributes rttr) throws Exception{
		System.out.println("board_reply_register===========" + vo);
		
		replyService.update_bd_ref(vo);
		
		replyService.reply_register(vo);
		
		
		System.out.println("vo.getBd_title()" + vo.getBd_title());
		
		
		return "redirect:/board/board_list";
	}
	

	
	
}