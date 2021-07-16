package com.pakmall.service;

import java.util.List;

import com.pakmall.domain.BoardVO;
import com.pakmall.dto.Board2DTO;

public interface Board2Service {

	public int board2_insert(Board2DTO dto) throws Exception;
	
	public List<Board2DTO> getBoardList() throws Exception;
	
}
