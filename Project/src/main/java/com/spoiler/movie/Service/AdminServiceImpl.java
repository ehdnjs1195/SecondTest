package com.spoiler.movie.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		String writer = request.getParameter("Popup");
		PopupDto dto = adminDao.getPopup(writer);
		request.setAttribute("popupDto", dto);
	}
	@Override
	public void noPopUp(HttpServletRequest request, HttpServletResponse response) {
		// "isPopup" 이라는 파라미터명으로 넘어 오는 값이 있는지 읽어와 본다.
		String isPopup=request.getParameter("isPopup");
		if(isPopup != null){// null 이 아니면 체크박스를 체크한 것이므로 
			//팝업을 일정시간 띄우지 않도록 쿠키를 응답한다.
			Cookie cook=new Cookie("isPopup", isPopup);
			cook.setMaxAge(60*60);//1시간동안 띄우지 않기
			response.addCookie(cook);
		}
	}
	@Override
	public void addPopUp(PopupDto dto) {
		if(adminDao.checkAdmin(dto.getWriter())) {
			adminDao.updatePopup(dto);
		}else {
			adminDao.insertPopup(dto);
		}
	}
	
	@Override
	public void getPopUp(ModelAndView mView, HttpSession session) {
		String id = (String) session.getAttribute("id");
		PopupDto dto = adminDao.getPopup(id);
		mView.addObject("PopDto",dto);
	}
	
	@Override
	public void updateState(PopupDto dto, HttpServletRequest request, HttpServletResponse response) {
		if(dto.getState().equals("true")) {
			// 마스터이름+Popup을 추가.
			Cookie cook=new Cookie("Popup", dto.getWriter());
			cook.setPath("/movie");
			response.addCookie(cook);
		}else {
			Cookie cook=new Cookie("Popup", dto.getWriter());
			cook.setPath("/movie");
			cook.setMaxAge(0);//쿠키 삭제
			response.addCookie(cook);
		}
		adminDao.updateState(dto);
	}
}
