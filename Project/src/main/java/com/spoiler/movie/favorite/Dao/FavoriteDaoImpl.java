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
	public void insert(FavoriteDto dto) {
		session.insert("favorite.insert",dto);
	}



	@Override
	public void favoriteList(FavoriteDto dto) {
       session.selectOne("favorite.favoriteList", dto);

	}


	@Override
	public void delete(String id) {
		session.delete("favorite.delete", id);
		
	}


	public int getCount(String id) {
		return session.selectOne("favorite.getCount",id);
	}











	
	

	

	
	

}








