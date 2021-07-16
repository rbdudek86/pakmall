package com.pakmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pakmall.domain.LottoVO;
import com.pakmall.dto.Criteria;
import com.pakmall.mapper.LottoMapper;

import lombok.Setter;

@Service
public class LottoServiceImpl implements LottoService {

	@Setter(onMethod_ = @Autowired)
	private LottoMapper lottoMapper;
	
	@Override
	public void lotto_insert(LottoVO vo) throws Exception{
		// TODO Auto-generated method stub
		lottoMapper.lotto_insert(vo);
	}

	@Override
	public List<LottoVO> lotto_list(Criteria cri) throws Exception{
		// TODO Auto-generated method stub
		return lottoMapper.lotto_list(cri);
	}

	@Override
	public LottoVO lotto_detail(LottoVO vo) throws Exception {
		// TODO Auto-generated method stub
		return lottoMapper.lotto_detail(vo);
	}

	@Override
	public int lotto_del(String seq) throws Exception {
		// TODO Auto-generated method stub
		return lottoMapper.lotto_del(seq);
	}

	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return lottoMapper.getTotalCount(cri);
	}


}
