package com.spoiler.movie.favorite.Service;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spoiler.movie.favorite.Dao.FavoriteDao;
import com.spoiler.movie.favorite.Dto.FavoriteDto;

@Service
public class FavoriteServiceImpl implements FavoriteService{
	
	@Autowired
	private FavoriteDao dao;

	@Override
	public void insert(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("id");
		String movieId = request.getParameter("movieId");
		String movieSeq = request.getParameter("movieSeq");
		String title = request.getParameter("title");
		String genre= request.getParameter("genre");
		String repRlsDate=request.getParameter("repRlsDate");
		String posters=request.getParameter("posters");
		FavoriteDto dto = new FavoriteDto();
		dto.setId(id);
		dto.setMovieId(movieId);
		dto.setMovieSeq(movieSeq);
		dto.setTitle(title);
		dto.setGenre(genre);
		dto.setRepRlsDate(repRlsDate);
		dto.setPosters(posters);
		
		dao.insert(dto);
		
}
		

	
	@Override
	public void favoriteList(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("id");
		String movieSeq = request.getParameter("movieSeq");
		
		FavoriteDto dto = new FavoriteDto();
		dto.setId(id);
		dto.setMovieSeq(movieSeq);
		
		dao.favoriteList(dto);
	}

	@Override
	public int getCount(String id) {
		return dao.getCount(id);
	}

	


	@Override
	public void delete(String id) {
		dao.delete(id);
		
	}



	@Override
	public FavoriteDto getMovieInfo(String id) {
		// TODO Auto-generated method stub
		return null;
	}



	



	

	
}