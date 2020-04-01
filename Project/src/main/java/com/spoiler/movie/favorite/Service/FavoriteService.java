package com.spoiler.movie.favorite.Service;




import java.util.List;

import com.spoiler.movie.favorite.Dto.FavoriteDto;


public interface FavoriteService {
	public void insert(FavoriteDto dto);
	public void delete(String id);
	public List<FavoriteDto> favoriteList(String id);
	public int getCount(String id);
	public FavoriteDto getMovieInfo(String id);
	public List<FavoriteDto> getData(String id);
	
	
}








