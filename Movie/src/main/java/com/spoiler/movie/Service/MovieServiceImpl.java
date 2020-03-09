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
		String orderby = request.getParameter("orderby");
		String genre = request.getParameter("genre");

		// 검색 키워드가 존재한다면 키워드를 담을 CafeDto 객체 생성
		MovieDto dto = new MovieDto();
		if (keyword != null) {// 검색 리스트에서 > 검색 키워드가 전달된 경우
			if (orderby != null) {
				if (orderby.equals("title")) {
					dto.setTitle(orderby);
					dto.setTitle(keyword);
				} else if (orderby.equals("releaseDate")) {
					dto.setReleaseDate(orderby);
					//dto.setTitle(keyword);
				}
				String encodedKeyword = null;
				try {
					encodedKeyword = URLEncoder.encode(keyword, "utf-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				// 키워드와 검색조건을 request 에 담는다.
				request.setAttribute("encodedKeyword", encodedKeyword);
			}
			request.setAttribute("keyword", keyword);
			request.setAttribute("orderby", orderby);
		}

		if (genre != null) {// 장르 리스트에서 > 정렬 키워드가 전달된 경우
			if (orderby != null) {
				if (orderby.equals("title")) {
					dto.setTitle(orderby);
					dto.setGenre(genre);
				} else if (orderby.equals("releaseDate")) {
					dto.setReleaseDate(orderby);
				}
				String encodedKeyword2 = null;
				try {
					encodedKeyword2 = URLEncoder.encode(orderby, "utf-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				// 키워드와 검색조건을 request 에 담는다.
				request.setAttribute("encodedKeyword2", encodedKeyword2);
			}
			request.setAttribute("orderby", orderby);
			request.setAttribute("genre", genre);
		}
		// 1. DB 에서 파일 목록을 얻어온다.
		List<MovieDto> list = dao.getList(dto);
		// 2. view page에 할요한 값을 request에 담아준다
		request.setAttribute("list", list);
	}
	
}
