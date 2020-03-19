package com.spoiler.movie.favorite.Dao;

import com.spoiler.movie.favorite.Dto.FavoriteDto;


public interface FavoriteDao {
	public boolean isExist(String inputId);
	public void insert(FavoriteDto dto);
	public FavoriteDto getData(String id);
	public void delete(String id);
	
}
