package com.spoiler.movie.favorite.Dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spoiler.movie.Dto.MovieDto;
import com.spoiler.movie.favorite.Dto.FavoriteDto;
import com.spoiler.movie.users.Dto.UsersDto;


@Repository
public class FavoriteDaoImpl implements FavoriteDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(FavoriteDto dto) {
		session.insert("favorite.insert", dto);
	}


	@Override
	public FavoriteDto getData(String id) {
		
		return session.selectOne("favorite.getData", id);
	}



	@Override
	public List<FavoriteDto> favoriteList(String id) {
        return session.selectList("favorite.favoritelist", id);

	}


	@Override
	public void delete(int num) {
		session.delete("favorite.delete", num);
		
	}


	@Override
	public int getCount(String id, String movieId) {
		
		return 0;
	}


	
	

	

	
	

}








