package com.pakmall.mapper;

import java.util.List;

import com.pakmall.domain.BoardVO;
import com.pakmall.domain.ReplyVO;
import com.pakmall.dto.Criteria;

public interface Replymapper {
	
	public int reply_insert(ReplyVO vo) throws Exception;
	
	public int reply_delete(long bd_rno) throws Exception;
	
	public void reply_update(ReplyVO vo) throws Exception;
	
	public List<ReplyVO> reply_getList(Criteria cri) throws Exception;
	
	public int getTotalCountList(long bd_num) throws Exception;
	
	public void reply_register(BoardVO vo) throws Exception;
	
	public void update_bd_ref(BoardVO VO) throws Exception;
}
