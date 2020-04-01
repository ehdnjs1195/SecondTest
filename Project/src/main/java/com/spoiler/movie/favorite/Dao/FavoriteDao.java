package com.spoiler.movie.favorite.Dao;



import java.util.List;

import com.spoiler.movie.favorite.Dto.FavoriteDto;


public interface FavoriteDao {
	public List<FavoriteDto> favoriteList(String id);
	public void insert(FavoriteDto dto);
	public void delete(String id);
	public List<FavoriteDto> getData(String id);
	public int getCount(String id);
}

