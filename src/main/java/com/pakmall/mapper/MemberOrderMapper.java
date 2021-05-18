package com.pakmall.mapper;

import java.util.List;

import com.pakmall.domain.OrderVO;
import com.pakmall.dto.Criteria;

public interface MemberOrderMapper {

	
	// 상품리스트
	public List<OrderVO> orderInfo_list(Criteria cri) throws Exception;
	
	// 상품개수(페이징기능에 사용)
	public int getTotalCountOrder(Criteria cri) throws Exception;
}
