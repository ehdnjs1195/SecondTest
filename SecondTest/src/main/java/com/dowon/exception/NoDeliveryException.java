package com.dowon.exception;

import org.springframework.dao.DataAccessException;

public class NoDeliveryException extends DataAccessException {

	//??±?? ?Έ?λ‘? ??Έ λ©μΈμ§?λ₯? ? ?¬ λ°μ? 
	public NoDeliveryException(String msg) {
		//λΆ?λͺ? ??±?? ? ?¬?λ©?
		super(msg);
		//message??? ???₯??€.
	}
	
}
