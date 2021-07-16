package com.pakmall.service;

import java.util.List;

import com.pakmall.domain.BoardVO;
import com.pakmall.dto.Criteria;

public interface BoardService {

// 페이징 처리 게시글 조회
	public List<BoardVO> getBoardList(Criteria cri) throws Exception;
	
	// 게시물 총 갯수
	public int getTotalCountList(Criteria cri) throws Exception;
	
	// 게시글 등록
	public void board_register(BoardVO vo) throws Exception;
	
	// 게시글 디테일
	public BoardVO board_detail(BoardVO vo) throws Exception;
	
	// 게시글 업데이트
	public void board_update(BoardVO vo) throws Exception;
	
	// 게시글 삭제하기
	public int board_delete(long bd_num) throws Exception;
	
	

}
