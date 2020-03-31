package com.spoiler.movie.Service;

import java.util.List;

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
		//쿠키 읽어오기
		Cookie[] cookies=request.getCookies();
		//팝업을 띄울수 있는지 여부 
		boolean canPopup=true;
		if(cookies != null){
			//반복문 돌면서 모든 쿠키를 참조해서 
			for(Cookie tmp:cookies){
				// "isPopup" 이라는 쿠키 이름으로 저장된 값이 있으면
				if(tmp.getName().equals("isPopup")){
					//팝업을 띄우지 않도록 표시한다.
					canPopup=false;
				}
			}
		}
		System.out.println(canPopup);
		request.getSession().setAttribute("canPopup", canPopup);
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
		adminDao.insertPopup(dto);
	}
	
	@Override
	public void getPopUPList(ModelAndView mView) {
		List<PopupDto> list = adminDao.getPopupList();
		mView.addObject("list", list);
	}
	
	@Override
	public void updateState(PopupDto dto, HttpServletRequest request) {
		boolean showPopup = false;
		if(dto.getState().equals("true")) {
			showPopup = true;
		}else {
			showPopup = false;
		}
		request.getSession().setAttribute("showPopup", showPopup);
		adminDao.updateState(dto);
	}
}
