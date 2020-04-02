package com.spoiler.movie.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.spoiler.movie.Dto.PopupDto;

public interface AdminService {
	public void popUp(HttpServletRequest request);
	public void noPopUp(HttpServletRequest request, HttpServletResponse response);
	public void addPopUp(PopupDto dto);
	public void getPopUp(ModelAndView mView,HttpSession session);
	public void updateState(PopupDto dto, HttpServletRequest request);
}
