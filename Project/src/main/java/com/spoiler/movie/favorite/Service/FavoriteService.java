package com.spoiler.movie.favorite.Service;



import org.springframework.web.servlet.ModelAndView;

import com.spoiler.movie.favorite.Dto.FavoriteDto;


public interface FavoriteService {
	
	public void insertFavorite(FavoriteDto dto);
	public void deleteFavorite(FavoriteDto dto);
	public void showInfo(String id, ModelAndView mView);
}








