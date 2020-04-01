package com.spoiler.movie.favorite.Service;

import java.util.List;

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
	public void insert(FavoriteDto dto) {
		dao.insert(dto); 
}
		

	
	@Override
	public List<FavoriteDto> favoriteList(String id) {
		
		return dao.favoriteList(id);
	}

	@Override
	public int getCount(String id) {
		return dao.getCount(id);
	}

	@Override
	public List<FavoriteDto> getData(String id) {
		return dao.getData(id);
	}


	@Override
	public void delete(String id) {
		dao.delete(id);
		
	}



	@Override
	public FavoriteDto getMovieInfo(String id) {
		return (FavoriteDto) dao.getData(id);
		
	}

	
}