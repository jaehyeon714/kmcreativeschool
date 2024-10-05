package com.km.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.km.common.exception.KmAccessDeniedException;

public class LoginCheckInterface implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session=request.getSession();
		if(session.getAttribute("loginPolice")==null) {
			throw new KmAccessDeniedException("비로그인 후 기능 이용");
		}
		return true;
	}
	
	
}
