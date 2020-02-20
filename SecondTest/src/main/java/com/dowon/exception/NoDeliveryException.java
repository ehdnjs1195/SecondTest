package com.dowon.exception;

import org.springframework.dao.DataAccessException;

public class NoDeliveryException extends DataAccessException {

	//?ƒ?„±??˜ ?¸?ë¡? ?˜ˆ?™¸ ë©”ì„¸ì§?ë¥? ? „?‹¬ ë°›ì•„?„œ 
	public NoDeliveryException(String msg) {
		//ë¶?ëª? ?ƒ?„±??— ? „?‹¬?•˜ë©?
		super(msg);
		//message?•„?“œ?— ???¥?œ?‹¤.
	}
	
}
