package com.spoiler.movie.favorite.Service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public int getCount(String id) {
		return dao.getCount(id);
	}

	

	@Override
	public FavoriteDto getMovieInfo(String id) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public Map<String, Object> isExistMovie(FavoriteDto dto) {
		boolean isExist=dao.isExist(dto);
		Map<String, Object> map=new HashMap<>();
		if(isExist) {
			dao.delete(dto);
			map.put("result", true);
			
		}else {
			dao.insert(dto);
		map.put("result", false);
		}
		
		return map;
	}

	@Override
	public Map<String, Object> checkMovie(FavoriteDto dto) {
		boolean isExist=dao.isExist(dto);
		Map<String, Object> map=new HashMap<>();
		if(isExist) {
			map.put("result", true);
			
		}else {
		map.put("result", false);
		}
		
		return map;
	}


	@Override
	public void delete(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("id");
		String movieSeq = request.getParameter("movieSeq");
		FavoriteDto dto = new FavoriteDto();
		dto.setId(id);
		dto.setMovieSeq(movieSeq);
		
		dao.delete(dto);
		
	}




	@Override
	public List<FavoriteDto> movieList(String id) {
		FavoriteDto dto = new FavoriteDto();
		dto.setId(id);
		return	dao.movieList(id);
	}











	



	

	
}