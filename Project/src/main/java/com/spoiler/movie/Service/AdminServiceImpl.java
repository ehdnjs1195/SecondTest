package com.spoiler.movie.Service;


import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spoiler.movie.Dao.AdminDao;
import com.spoiler.movie.Dto.PopupDto;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDao adminDao;
	@Override
	public void popUp(HttpServletRequest request) {
		
		int num = Integer.parseInt(request.getParameter("Popup"));
		PopupDto dto = adminDao.getPopup(num);
		request.setAttribute("popupDto", dto);
	}
	@Override
	public void noPopUp(HttpServletRequest request, HttpServletResponse response) {
		// "isPopup" 이라는 파라미터명으로 넘어 오는 값이 있는지 읽어와 본다.
		String isPopup=request.getParameter("isPopup");
		if(isPopup != null){// null 이 아니면 체크박스를 체크한 것이므로 
			//팝업을 일정시간 띄우지 않도록 쿠키를 응답한다.
			Cookie cook=new Cookie("isPopup"+isPopup, isPopup);
			cook.setMaxAge(60*60);//1시간동안 띄우지 않기
			response.addCookie(cook);
		}
	}
	@Override
	public void addPopUp(PopupDto dto) {
		adminDao.insertPopup(dto);
	}
	
	@Override
	public void getPopUp(ModelAndView mView, int num) {
		PopupDto dto = adminDao.getPopup(num);
		mView.addObject("PopDto",dto);
	}
	
	@Override
	public void updateState(PopupDto dto, HttpServletRequest request, HttpServletResponse response) {
		String num = Integer.toString(dto.getNum());
		ServletContext app = request.getServletContext();
		adminDao.updateState(dto);
		if(dto.getState().equals("true")) {
			// 마스터이름+Popup을 추가.
			Cookie cook=new Cookie("Popup"+num, num);
			cook.setPath("/movie");
			cook.setMaxAge(60*60*24*31); //한달
			response.addCookie(cook);
			
		}else {
			Cookie cook=new Cookie("Popup"+num, num);
			cook.setPath("/movie");
			cook.setMaxAge(0);//쿠키 삭제
			response.addCookie(cook);
			app.removeAttribute("Popup"+num);
		}
		
		List<PopupDto> list = adminDao.getPopupList();
		for(PopupDto tmp:list) {
			if(tmp.getState().equals("true")) {
				app.setAttribute("Popup"+num, num);					
			}else {
				app.removeAttribute("Popup"+num);
			}
		}
		
	}
	@Override	
	public void checkPopup(HttpServletRequest request,HttpServletResponse response) {
		List<PopupDto> list = adminDao.getPopupList();
		for(PopupDto tmp:list) {
			String num = Integer.toString(tmp.getNum());
			if(tmp.getState().equals("true")) {	//팝업이 있는 상태
				// 마스터이름+Popup을 추가.
				Cookie cook=new Cookie("Popup"+num, num);
				cook.setPath("/movie");
				cook.setMaxAge(60*60*24*31); //한달
				response.addCookie(cook);
			}else {	//팝업이 없는 상태
				Cookie cook=new Cookie("Popup"+num, num);
				cook.setPath("/movie");
				cook.setMaxAge(0);//쿠키 삭제
				response.addCookie(cook);
			}
		}
	}
	
	@Override
	public void getPopUp_list(HttpServletRequest request) {
		List<PopupDto> list = adminDao.getPopupList();
		request.setAttribute("list", list);
		
	}
	
	@Override
	public void deletePopup(HttpServletRequest request, HttpServletResponse response) {
		String num = request.getParameter("num");
		Cookie cook=new Cookie("Popup"+num, num);
		cook.setPath("/movie");
		cook.setMaxAge(0);//쿠키 삭제
		response.addCookie(cook);
		adminDao.deletePop(Integer.parseInt(request.getParameter("num")));
	}
	@Override
	public void updatePopup(PopupDto dto) {
		adminDao.updatePopup(dto);
	}
}
