package com.pakmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pakmall.domain.BoardVO;
import com.pakmall.dto.Board2DTO;
import com.pakmall.mapper.Board2Mapper;

import lombok.Setter;

@Service
public class Board2ServiceImpl implements Board2Service {
	
	@Setter(onMethod_ = @Autowired)
	private Board2Mapper board2Mapper;

	@Override
	public int board2_insert(Board2DTO dto) throws Exception {
		// TODO Auto-generated method stub
		return board2Mapper.board2_insert(dto);
	}

	@Override
	public List<Board2DTO> getBoardList() throws Exception {
		// TODO Auto-generated method stub
		return board2Mapper.getBoardList();
	}
	
	
}
