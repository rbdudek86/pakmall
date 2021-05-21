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

	@Override
	public int board_register(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.board_register(vo);
	}

	@Override
	public BoardVO board_detail(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.board_detail(vo);
	}

	@Override
	public int board_update(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.board_update(vo);
	}

	@Override
	public int board_delete(long bd_num) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.board_delete(bd_num);
	}

}
