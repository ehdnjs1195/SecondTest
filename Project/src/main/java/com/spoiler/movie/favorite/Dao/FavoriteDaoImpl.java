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
	public void delete(FavoriteDto dto) {
		session.delete("favorite.delete", dto);
		
	}


	public int getCount(String id) {
		return session.selectOne("favorite.getCount",id);
	}



	@Override
	public boolean isExist(FavoriteDto dto) {
		String isExistMovie=session.selectOne("favorite.isExist", dto);
		//만일 select 된 결과가 null 이면 존재하지 않는 아이디이다.
		if(isExistMovie==null) {
			return false;
		}else {
			return true;
		}		
	}











	
	

	

	
	

}








