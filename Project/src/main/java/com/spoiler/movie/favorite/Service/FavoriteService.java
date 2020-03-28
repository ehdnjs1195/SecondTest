package com.spoiler.movie.favorite.Service;




import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.spoiler.movie.favorite.Dto.FavoriteDto;


public interface FavoriteService {
	public void insert(FavoriteDto dto);
	public void delete(int num);
	public List<FavoriteDto> favoriteList(String id);
	public int getCount(String id,String movieId);
	public FavoriteDto getData(String id);
	
	
}








