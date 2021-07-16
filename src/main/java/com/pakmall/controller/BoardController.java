package com.pakmall.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pakmall.domain.BoardVO;
import com.pakmall.domain.ReplyVO;
import com.pakmall.dto.Criteria;
import com.pakmall.dto.PageDTO;
import com.pakmall.service.BoardService;
import com.pakmall.service.ReplyService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
public class BoardController {

	@Setter(onMethod_ = @Autowired)
	private BoardService boardService;
	
	@Setter(onMethod_ = @Autowired)
	private ReplyService replyService;
	
	
	// 게시판 리스트
	@RequestMapping(value = "/board_list",method = {RequestMethod.GET, RequestMethod.POST})
	public void board_list (@ModelAttribute("cri") Criteria cri, Model model, BoardVO vo) throws Exception{
	    
		List<BoardVO> boardList = boardService.getBoardList(cri);
		
		System.out.println(boardList);
		model.addAttribute("boardList", boardList);
	    
	    int total = boardService.getTotalCountList(cri);
	    
	    System.out.println("total=============" + total);
	    model.addAttribute("total", total);
	    model.addAttribute("pageMaker", new PageDTO(cri, total));

	}
	
	// 게시판 리스트2 폼
	@GetMapping("/board_list2")
	public void board_list2() {
		
	}
	
	
	// 게시글 등록 페이지
	@GetMapping("/board_register")
	public void board_register() {
		
	}
	
	
	// 게시글 등록
	@PostMapping("/board_register")
	public String board_register(BoardVO vo, RedirectAttributes rttr) throws Exception {
		
		
		boardService.board_register(vo);
		
		
		return "redirect:/board/board_list";
	}
	
	// 게시글 상세
	@GetMapping("/board_detail")
	public String board_detail(BoardVO vo, Model model) throws Exception {
		
		BoardVO detail = boardService.board_detail(vo);
		
		System.out.println("detail========" + detail);
		
		model.addAttribute("detail", detail);
		
		return "/board/board_detail";
	}
	
	// 게시글 상세 ajax
	@GetMapping("/board_detail2")
	public String board_detail2(@ModelAttribute("cri") Criteria cri, @RequestParam("bd_num")long bd_num, BoardVO board, ReplyVO vo, Model model) throws Exception {
		
		
		model.addAttribute("bd_num", board.getBd_num());
		
		System.out.println("vo.getBd_num()=========" + board.getBd_num());
		
		int total = replyService.getTotalCountList(bd_num);
		
		System.out.println("total===========" + total);
		
		cri.setBd_num(board.getBd_num());
		
		System.out.println("cri.setBd_num==========" + cri.getBd_num());
		System.out.println("#{pageNum}=====" + cri.getPageNum());
		System.out.println("#{amount}==========" + cri.getAmount());
		
		// 댓글리스트
		List<ReplyVO> replyList = replyService.reply_getList(cri);
		
		System.out.println("댓글리스트===========" + replyList);
		
		model.addAttribute("replyList", replyList);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "/board/board_detail2";
	}
	
	@ResponseBody
	@GetMapping("/ajaxDetail")
	public ResponseEntity<BoardVO> ajaxDetail(BoardVO vo, HttpSession session) throws Exception {
		
		ResponseEntity<BoardVO> entity = null;
		
		BoardVO detail = boardService.board_detail(vo);
		
		System.out.println("detail===========" + detail);
		
		if(detail != null) {
			entity = new ResponseEntity<BoardVO>(detail,HttpStatus.OK);
		}else {
			entity = new ResponseEntity<BoardVO>(HttpStatus.OK);
		}
		
		
		
		return entity;
	}
	
	
	// 게시글 수정
	@PostMapping("/board_update")
	public String board_update(BoardVO vo, RedirectAttributes rttr) throws Exception {
		
		System.out.println("vo===========" + vo);
		
		boardService.board_update(vo);
	
		return "redirect:/board/board_list";
	}
	
	// 게시글 삭제
	@ResponseBody
	@PostMapping("/board_delete")
	public ResponseEntity<String> board_delete(long bd_num) throws Exception{
		System.out.println("bd_num===========" + bd_num);
		ResponseEntity<String> entity = null;
		
		int resultCnt = boardService.board_delete(bd_num);
		
		// 성공하면 resultCnt = 1
		if(resultCnt > 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}
		
		return entity;
	}
	
	
	
	

}
