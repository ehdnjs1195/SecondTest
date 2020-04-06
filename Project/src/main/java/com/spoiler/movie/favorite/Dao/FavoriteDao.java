package com.spoiler.movie.favorite.Dao;



import com.spoiler.movie.favorite.Dto.FavoriteDto;


public interface FavoriteDao {
	public boolean isExist(FavoriteDto dto);
	
	public void insert(FavoriteDto dto);
	public void delete(FavoriteDto dto);
	public int getCount(String id);
}

