package com.pakmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pakmall.domain.BoardVO;
import com.pakmall.domain.PagingVO;
import com.pakmall.dto.Criteria;
import com.pakmall.mapper.BoardMapper;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;
	
	@Override
	public List<BoardVO> getBoardList(PagingVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.getBoardList(vo);
	}

	@Override
	public void board_register(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		boardMapper.board_register(vo);
	}

	@Override
	public BoardVO board_detail(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.board_detail(vo);
	}

	@Override
	public void board_update(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		boardMapper.board_update(vo);
	}

	@Override
	public int board_delete(long bd_num) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.board_delete(bd_num);
	}

	@Override
	public int getTotalCountList() throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.getTotalCountList();
	}


}
