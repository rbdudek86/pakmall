package com.pakmall.service;

import java.util.List;

import com.pakmall.domain.BoardVO;
import com.pakmall.domain.ReplyVO;
import com.pakmall.dto.Criteria;

public interface ReplyService {

	// 댓글 등록
	public int reply_insert(ReplyVO vo) throws Exception;
	
	// 답글 삭제
	public int reply_delete(long bd_rno) throws Exception;
	
	// 답글 수정
	public void reply_update(ReplyVO vo) throws Exception;
		
	// 댓글 리스트
	public List<ReplyVO> reply_getList(Criteria cri) throws Exception;
	
	// 댓글 총 갯수
	public int getTotalCountList(long bd_num) throws Exception;
	
	// 답글 등록
	public void reply_register(BoardVO vo) throws Exception;
	
	// 답글 그룹 순서 업데이트
	public void update_bd_ref(BoardVO VO) throws Exception;
	
	
	
}
