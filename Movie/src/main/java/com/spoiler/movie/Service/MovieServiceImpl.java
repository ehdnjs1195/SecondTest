package com.spoiler.movie.Service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spoiler.movie.Dao.MovieDao;
import com.spoiler.movie.Dto.MovieDto;

@Service
public class MovieServiceImpl implements MovieService {
	@Autowired
	private MovieDao dao;

	@Override
	public void movieList(HttpServletRequest request) {
		// 검색과 관련된 파라미터를 읽어와 본다.
		String keyword = request.getParameter("keyword");
		String condition = request.getParameter("condition");

		// 검색 키워드가 존재한다면 키워드를 담을 CafeDto 객체 생성
		MovieDto dto = new MovieDto();
		if (keyword != null) {// 검색 키워드가 전달된 경우
			dto.setTitle(keyword);
			// 키워드와 검색조건을 request 에 담는다.
			request.setAttribute("keyword", keyword);
			// request.setAttribute("encodedKeyword", encodedKeyword);
			request.setAttribute("condition", condition);
		}

		List<MovieDto> list = dao.getList();
		request.setAttribute("list", list);
	}
}
