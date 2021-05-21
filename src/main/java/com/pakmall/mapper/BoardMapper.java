package com.pakmall.mapper;

import java.util.List;

import com.pakmall.domain.BoardVO;

public interface BoardMapper {

	public List<BoardVO> getBoardList(BoardVO vo) throws Exception;
	
	public int board_register(BoardVO vo) throws Exception;
	
	public BoardVO board_detail(BoardVO vo) throws Exception;
	
	public int board_update(BoardVO vo) throws Exception;
	
	public int board_delete(long bd_num) throws Exception;
}
