package com.pakmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pakmall.domain.BoardVO;
import com.pakmall.domain.ReplyVO;
import com.pakmall.dto.Criteria;
import com.pakmall.mapper.Replymapper;

import lombok.Setter;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Setter(onMethod_ = @Autowired)
	private Replymapper replymapper;
	
	@Override
	public int reply_insert(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		return replymapper.reply_insert(vo);
	}

	@Override
	public List<ReplyVO> reply_getList(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return replymapper.reply_getList(cri);
	}

	@Override
	public void reply_register(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		replymapper.reply_register(vo);
	}

	@Override
	public void update_bd_ref(BoardVO VO) throws Exception {
		// TODO Auto-generated method stub
		replymapper.update_bd_ref(VO);
	}

	@Override
	public int reply_delete(long bd_rno) throws Exception {
		// TODO Auto-generated method stub
		return replymapper.reply_delete(bd_rno);
	}

	@Override
	public void reply_update(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		replymapper.reply_update(vo);
	}

	@Override
	public int getTotalCountList(long bd_num) throws Exception {
		// TODO Auto-generated method stub
		return replymapper.getTotalCountList(bd_num);
	}

}
