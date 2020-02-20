package com.dowon.project.exception;

import org.springframework.dao.DataAccessException;

public class NoDeliveryException extends DataAccessException {

	//?��?��?��?�� ?��?���? ?��?�� 메세�?�? ?��?�� 받아?�� 
	public NoDeliveryException(String msg) {
		//�?�? ?��?��?��?�� ?��?��?���?
		super(msg);
		//message?��?��?�� ???��?��?��.
	}
	
}
