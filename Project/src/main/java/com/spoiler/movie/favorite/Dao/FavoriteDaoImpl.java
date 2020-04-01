package com.spoiler.movie.favorite.Dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spoiler.movie.favorite.Dto.FavoriteDto;


@Repository
public class FavoriteDaoImpl implements FavoriteDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(FavoriteDto dto) {
		session.insert("favorite.insert",dto);
	}


	@Override
	public List<FavoriteDto> getData(String id) {
		
		return session.selectList("favorite.getData",id);
	}



	@Override
	public List<FavoriteDto> favoriteList(String id) {
        return session.selectList("favorite.favoritelist", id);

	}


	@Override
	public void delete(String id) {
		session.delete("favorite.delete", id);
		
	}


	public int getCount(String id) {
		return session.selectOne("favorite.getCount",id);
	}








	
	

	

	
	

}








