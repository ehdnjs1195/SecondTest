package com.dowon.project.cafe.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.dowon.project.cafe.dao.CafeDao;
import com.dowon.project.cafe.dto.CafeDto;


@Service
public class CafeServiceImpl implements CafeService{
	@Autowired
	private CafeDao cafeDao;// 댓글기능을 추가했을때 또다른 dao를 사용하면 했갈릴수도 있으니깐 cafeDao를 변수이름으로 지정하엿다
	
	
	
}
