package com.pakmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pakmall.domain.ReviewVO;
import com.pakmall.dto.Criteria;
import com.pakmall.dto.ReviewPageDTO;
import com.pakmall.mapper.ReviewMapper;

import lombok.Setter;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Setter(onMethod_ = @Autowired)
	private ReviewMapper reviewMapper;
	
	@Override
	public ReviewPageDTO getReviewListWithPaging(Criteria cri, int pdt_num) throws Exception {
		// TODO Auto-generated method stub
		return new ReviewPageDTO(reviewMapper.getCountByProduct_pdt_num(pdt_num), reviewMapper.getReviewListWithPaging(cri, pdt_num));
	}

	@Override
	public void review_register(ReviewVO vo) throws Exception {
		// TODO Auto-generated method stub
		reviewMapper.review_register(vo);
	}

	@Override
	public void review_modify(ReviewVO vo) throws Exception {
		// TODO Auto-generated method stub
		reviewMapper.review_modify(vo);
	}

	@Override
	public void review_delete(int rv_num) throws Exception {
		// TODO Auto-generated method stub
		reviewMapper.review_delete(rv_num);
	}

}
