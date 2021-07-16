package com.pakmall.service;

import java.util.List;

import org.springframework.ui.Model;

import com.pakmall.domain.LottoVO;
import com.pakmall.dto.Criteria;

public interface LottoService {

	public void lotto_insert(LottoVO vo) throws Exception;
	
	public List<LottoVO> lotto_list(Criteria cri) throws Exception;
	
	
	public LottoVO lotto_detail(LottoVO vo) throws Exception;
	
	public int lotto_del(String seq) throws Exception;
	
	public int getTotalCount(Criteria cri) throws Exception;
}
