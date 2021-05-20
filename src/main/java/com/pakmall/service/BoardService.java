package com.pakmall.service;

import java.util.List;

import com.pakmall.domain.BoardVO;

public interface BoardService {

	// 게시판 리스트
	public List<BoardVO> getBoardList(BoardVO vo) throws Exception;
	
	// 게시글 등록
	public int board_register(BoardVO vo) throws Exception;
	
	// 게시글 디테일
	public BoardVO board_detail(BoardVO vo) throws Exception;
}
