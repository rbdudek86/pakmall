package com.pakmall.service;

import com.pakmall.domain.ReviewVO;
import com.pakmall.dto.Criteria;
import com.pakmall.dto.ReviewPageDTO;

public interface ReviewService {

	public ReviewPageDTO getReviewListWithPaging(Criteria cri, int pdt_num) throws	Exception;
	
	public void review_register(ReviewVO vo) throws Exception;
	
	public void review_modify(ReviewVO vo) throws Exception;
	
	public void review_delete(int rv_num) throws Exception;
}
