package com.pakmall.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pakmall.domain.CategoryVO;
import com.pakmall.domain.ProductVO;
import com.pakmall.dto.Criteria;

public interface UserProductService {

			// 1차 카테고리 
			public List<CategoryVO> getCategoryList() throws Exception;

			// 2차 카테고리
			public List<CategoryVO> getSubCategoryList(String cg_code) throws Exception;
			
			// 2차 카테고리에 해당하는 상품목록
			public List<ProductVO> getProductListBysubCate(Criteria cri, String cg_code) throws Exception;
			 
			public int getTotalCountProductBySubCate(String cg_code) throws Exception;
			
			// 상품상세설명
			// long 기본값 0 / Long(참조형) 기본값 null
			public ProductVO getProductByNum(Long pdt_num) throws Exception;
}
