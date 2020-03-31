package com.spoiler.movie.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.spoiler.movie.Dto.PopupDto;

public interface AdminService {
	public void popUp(HttpServletRequest request);
	public void noPopUp(HttpServletRequest request, HttpServletResponse response);
	public void addPopUp(PopupDto dto);
	public void getPopUPList(ModelAndView mView);
	public void updateState(PopupDto dto, HttpServletRequest request);
}
