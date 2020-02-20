package com.dowon.project.exception;

import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

/*
 *  Exception ?�� 발생?��?��?�� 처리?��?�� 컨트롤러 만들�?
 *  
 *  - @ControllerAdvice ?��?��?��?��?��?�� ?��?��?��?�� 붙인?��.
 *  
 *  - 메소?��?�� @ExceptionHandler(?��?�� class type) ?�� 붙여?�� ?��?���? 처리 ?��?��. 
 */
@ControllerAdvice
public class ExceptionController {
	// CanNotDeleteException type ?�� ?��?���? 발생?���? ?��출되?�� 메소?�� 
	@ResponseStatus(HttpStatus.FORBIDDEN) //?��?�� ?��?���? ?��?�� ?���? ?��?���? ?��?�� ?��?��
	@ExceptionHandler(CanNotDeleteException.class)
	public ModelAndView forbidden() {
		
		ModelAndView mView=new ModelAndView();
		mView.addObject("msg", "..");
		mView.setViewName("error/forbidden");
		return mView;
	}
	
	//custom?��?���?
	@ExceptionHandler(NoDeliveryException.class)
	public ModelAndView noDelevery(NoDeliveryException nde) {
		ModelAndView mView=new ModelAndView();
		mView.addObject("exception",nde);
		mView.setViewName("error/data_access");
		return mView;
	}
	
	/*
	 * @Repository ?��?��?��?��?��?�� ?��?��?�� Dao?��?�� DB�??�� Exception?�� 발생?���? 
	 * Spring ?��?��?��?��?���? DataAccessException type?�� ?��?���? 발생?��?��?��.
	 * ?��?�� 객체?�� 메소?��?�� ?��?���? ?��?��?���? ?��?�� ?��?��객체?��  getMessage()?��?�� 
	 * getter메소?���? 존재?��?��.
	 * ?��?�� 메소?���? ?��출하�? ?��?�� 메세�?�? 리턴?���??��.
	 * 
	 * */
	@ExceptionHandler(DataAccessException.class)
	public ModelAndView dateAccess(DataAccessException dae) {
		ModelAndView mView=new ModelAndView();
		//"exception"?��?��?�� ?��값으�? ?��?�� 객체�? ?��?��?��.
		mView.addObject("exception",dae);
		// view page?��?��
		mView.setViewName("error/data_access");
		return mView;
	}
}










