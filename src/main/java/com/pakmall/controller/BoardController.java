package com.pakmall.controller;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
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

import com.pakmall.domain.BoardVO;
import com.pakmall.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
public class BoardController {

	@Setter(onMethod_ = @Autowired)
	private BoardService boardService;
	
	
	// 게시판 리스트
	@GetMapping("/board_list")
	public String board_list(@Param("board") BoardVO vo, Model model) throws Exception {
      
		//System.out.println("model.addAttribute=========" + model.addAttribute("boardList", vo));
      
      // 방법1
      //model.addAttribute("boardList", boardService.getBoardList(boardVO));
      
      // 방법2
      List<BoardVO> boardList = boardService.getBoardList(vo);
      model.addAttribute("boardList", boardList);
      
      
      return "/board/board_list";
    }
	
	// 게시글 등록 페이지
	@GetMapping("/board_register")
	public String board_register(BoardVO vo, Model model) {
		return "/board/board_register";
	}
	
	
	// 게시글 등록
	@ResponseBody
	@PostMapping("/board_register")
	public ResponseEntity<String> board_register(BoardVO vo) throws Exception {
			
		ResponseEntity<String> entity = null;
		
		int resultCnt = boardService.board_register(vo);
		
		// 등록 성공하면 resultCnt = 1
		if(resultCnt > 0) {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}
		
		return entity;
	}
	
	// 게시글 상세
	@GetMapping("/board_detail")
	public String board_detail(BoardVO vo, Model model) throws Exception {
		
		BoardVO detail = boardService.board_detail(vo);
		
		System.out.println("detail========" + detail);
		
		model.addAttribute("detail", detail);
		
		return "/board/board_detail";
	}

}
