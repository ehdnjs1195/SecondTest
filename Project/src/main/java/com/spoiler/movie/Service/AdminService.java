package com.spoiler.movie.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface AdminService {
	public void popUp(HttpServletRequest request);
	public void noPopUp(HttpServletRequest request, HttpServletResponse response);
	
}
