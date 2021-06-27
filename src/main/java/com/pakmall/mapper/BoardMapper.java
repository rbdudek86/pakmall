package com.pakmall.mapper;

import java.util.List;

import com.pakmall.domain.BoardVO;
import com.pakmall.domain.PagingVO;
import com.pakmall.dto.Criteria;

public interface BoardMapper {

	// 게시물 총 갯수
	public List<BoardVO> getBoardList(Criteria cri) throws Exception;
	
	// 페이징 처리 게시글 조회
	public int getTotalCountList() throws Exception;
	
	public void board_register(BoardVO vo) throws Exception;
	
	public BoardVO board_detail(BoardVO vo) throws Exception;
	
	public void board_update(BoardVO vo) throws Exception;
	
	public int board_delete(long bd_num) throws Exception;
	
}
