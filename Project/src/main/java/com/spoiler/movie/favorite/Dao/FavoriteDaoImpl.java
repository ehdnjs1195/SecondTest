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
	public boolean isExist(String inputId) {
		//인자로 전달되는 아이디를 이용해서 select 를 한다.
		String id=session.selectOne("users.isExist", inputId);
		//만일 select 된 결과가 null 이면 존재하지 않는 아이디이다.
		if(id==null) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public void insert(FavoriteDto dto) {
		session.insert("favorite.insert", dto);
	}


	@Override
	public FavoriteDto getData(String id) {
		
		return session.selectOne("favorite.getData", id);
	}

	
	@Override
	public void delete(String id) {
		session.delete("favorite.delete", id);
	}

	@Override
	public FavoriteDto getCount(FavoriteDto dto) {
		return session.selectOne("favorite.getCount",dto);
	}

	@Override
	public List<FavoriteDto> movieList() {
		return session.selectList("favorite.getFavoriteList");
	}


	
	

	

	
	

}








