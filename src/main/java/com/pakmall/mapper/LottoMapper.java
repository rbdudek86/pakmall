package com.pakmall.mapper;

import java.util.List;

import com.pakmall.domain.LottoVO;
import com.pakmall.dto.Criteria;

public interface LottoMapper {

	public void lotto_insert(LottoVO vo) throws Exception;
	
	public List<LottoVO> lotto_list(Criteria cri) throws Exception;
	
	
	public LottoVO lotto_detail(LottoVO vo) throws Exception;
	
	public int lotto_del(String seq) throws Exception;
	
	public int getTotalCount(Criteria cri) throws Exception;
	
	
}
