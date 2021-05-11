package com.pakmall.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.log4j.Log4j;

@Log4j //롬복 작동안함
public class SampleInterceptor extends HandlerInterceptorAdapter{

	// 인터셉터 기능을 갖는 클래스를 만들려면, HandlerInterceptorAdapter 추상클래스를 상속받아야 한다.
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		//log.info("preHandle.....");
		
		System.out.println("preHandle.....");
		
		// return false; -> 진행될 경우에는 컨트롤러로 제어가 넘어가지 않음
		// return true; -> 진행될 경우에는 컨트롤러로 제어가 넘어갔다가 다시 postHandle로 돌아옴
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		//log.info("postHandle.....");
		
		System.out.println("postHandle.....");
		
		super.postHandle(request, response, handler, modelAndView);
	}

	
}
