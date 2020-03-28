package com.spoiler.movie.favorite.Service;

import java.util.List;

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
	public void delete(int num) {
		dao.delete(num);
	}

	@Override
	public List<FavoriteDto> favoriteList(String id) {
		
		return dao.favoriteList(id);
	}

	@Override
	public int getCount(String id, String movieId) {
		return 0;
	}

	@Override
	public FavoriteDto getData(String id) {
		return null;
	}

	
}