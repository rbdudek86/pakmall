package com.pakmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pakmall.domain.AdminVO;
import com.pakmall.mapper.AdminMapper;

import lombok.Setter;

@Service
public class AdminServiceImpl implements AdminService {

	@Setter(onMethod_ = @Autowired )
	private AdminMapper adminMapper;
	
	@Override
	public AdminVO login_check(AdminVO vo) throws Exception {

		AdminVO adVO = adminMapper.login_check(vo);
		
		if(adVO != null) {
			adminMapper.login_update(vo.getAdmin_id());
		}
		
		return adVO; //이전 로그인 시간정보
	}
	

}
