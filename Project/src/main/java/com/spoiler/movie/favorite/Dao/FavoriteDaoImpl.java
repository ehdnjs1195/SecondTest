package com.spoiler.movie.favorite.Dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spoiler.movie.favorite.Dto.FavoriteDto;


@Repository
public class FavoriteDaoImpl implements FavoriteDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public boolean isExist(String inputId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void insert(FavoriteDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public FavoriteDto getData(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		
	}
	
}