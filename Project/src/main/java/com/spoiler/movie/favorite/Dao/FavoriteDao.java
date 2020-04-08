package com.spoiler.movie.favorite.Dao;

import java.util.List;

import com.spoiler.movie.favorite.Dto.FavoriteDto;

public interface FavoriteDao {
	public boolean isExist(FavoriteDto dto);
	public List<FavoriteDto> movieList(String id);
	public void insert(FavoriteDto dto);
	public void delete(FavoriteDto dto);
	public int getCount(String id);
}

