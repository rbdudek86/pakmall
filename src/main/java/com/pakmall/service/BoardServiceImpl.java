package com.pakmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pakmall.domain.BoardVO;
import com.pakmall.mapper.BoardMapper;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;
	
	@Override
	public List<BoardVO> getBoardList(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.getBoardList(vo);
	}

}
