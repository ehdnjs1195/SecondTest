package com.spoiler.movie.favorite.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spoiler.movie.favorite.Dao.FavoriteDao;
import com.spoiler.movie.favorite.Dto.FavoriteDto;
import com.spoiler.movie.users.Dto.UsersDto;

@Service
public class FavoriteServiceImpl implements FavoriteService{
	
	@Autowired
	private FavoriteDao dao;

	@Override
	public void insertFavorite(FavoriteDto dto) {
			dao.insert(dto);
	}

	@Override
	public void deleteFavorite(FavoriteDto dto) {
			dao.delete(dto.getId());
	}

	@Override
	public void showInfo(String id, ModelAndView mView) {
		FavoriteDto dto=dao.getData(id);
		mView.addObject("dto", dto);
	}


	}
	

	


















