package com.pakmall.service;

import java.util.List;

import com.pakmall.domain.BoardVO;

public interface BoardService {

	public List<BoardVO> getBoardList(BoardVO vo) throws Exception;
}
