package com.spoiler.movie.favorite.Service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spoiler.movie.favorite.Dao.FavoriteDao;
import com.spoiler.movie.favorite.Dto.FavoriteDto;



@Service
public class FavoriteServiceImpl implements FavoriteService{
	
	@Autowired
	private FavoriteDao dao;
	//인자로 전달된 아이디가 존재하는지 여부를 Map 에 담아서 리턴하는 메소드 
	
	@Override
	public void insertFavorite(FavoriteDto dto) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void deleteFavorite(FavoriteDto dto) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void showInfo(String id, ModelAndView mView) {
		// TODO Auto-generated method stub
		
	}
	
}













