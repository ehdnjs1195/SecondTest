package com.spoiler.movie.users.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spoiler.movie.users.dto.UsersDto;

public interface UsersService {
	//Map<key, value> 을 사용하는 이유 springMVC 에서 Map에 data 를 담아서 잘 응답하면(json) 자동으로 들어간다.
	public Map<String, Object> isExistId(String inputId);
	public void addUser(UsersDto dto);
	public void validUser(UsersDto dto, HttpSession session, ModelAndView mView); //비즈니스 로직에 필요한 것을 생각해서 명시한다.
	public void showInfo(String id, ModelAndView mView); // id를 전달하면 mView 에 정보를 담아주는 로직을 처리 할 예정
	public String saveProfileImage(HttpServletRequest request, MultipartFile mFile);
	public void updatePassword(UsersDto dto, ModelAndView mView); //dto에 id, pwd, newpwd 담아서 전달 
	public void updateUser(UsersDto dto);
	public void deleteUser(String id);
}
