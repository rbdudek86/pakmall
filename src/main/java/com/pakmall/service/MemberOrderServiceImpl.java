package com.pakmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pakmall.domain.OrderVO;
import com.pakmall.dto.Criteria;
import com.pakmall.mapper.MemberOrderMapper;

import lombok.Setter;
@Service
public class MemberOrderServiceImpl implements MemberOrderService {

	@Setter(onMethod_ = @Autowired)
	private MemberOrderMapper memberOrderMapper;
	
	@Override
	public List<OrderVO> orderInfo_list(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return memberOrderMapper.orderInfo_list(cri);
		
	}

	@Override
	public int getTotalCountOrder(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return memberOrderMapper.getTotalCountOrder(cri);
	}

}
