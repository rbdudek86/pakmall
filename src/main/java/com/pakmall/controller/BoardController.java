package com.pakmall.controller;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
      
		System.out.println("model.addAttribute=========" + model.addAttribute("boardList", vo));
      
      // 방법1
      //model.addAttribute("boardList", boardService.getBoardList(boardVO));
      
      // 방법2
      List<BoardVO> boardList = boardService.getBoardList(vo);
      model.addAttribute("boardList", boardList);
      
      
      return "/board/board_list";
    }
	
	@GetMapping("/board_register")
	public void board_register() {
		
	}

}
