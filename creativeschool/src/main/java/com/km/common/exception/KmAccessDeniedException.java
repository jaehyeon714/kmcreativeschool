package com.km.common.exception;

public class KmAccessDeniedException extends RuntimeException{
	
	private static final long serialVersionUID = -751769680044469857L;

	public KmAccessDeniedException(String msg) {
		super(msg);
	}
}
