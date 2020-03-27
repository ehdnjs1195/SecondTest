package com.spoiler.movie.favorite.Dao;



import java.util.List;

import com.spoiler.movie.favorite.Dto.FavoriteDto;


public interface FavoriteDao {
	public List<FavoriteDto> movieList();
	public boolean isExist(String inputId);

	public void insert(FavoriteDto dto);
	public void delete(String id);
	public FavoriteDto getData(String id);
	public FavoriteDto getCount(FavoriteDto dto);
	
}
