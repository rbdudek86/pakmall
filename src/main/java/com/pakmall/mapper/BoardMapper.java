package com.pakmall.mapper;

import java.util.List;

import com.pakmall.domain.BoardVO;

public interface BoardMapper {

	public List<BoardVO> getBoardList(BoardVO vo) throws Exception;
}
