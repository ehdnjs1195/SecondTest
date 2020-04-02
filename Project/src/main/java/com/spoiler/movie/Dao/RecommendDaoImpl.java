package com.spoiler.movie.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spoiler.movie.Dto.RecommendDto;

@Repository
public class RecommendDaoImpl implements RecommendDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(RecommendDto dto) {
		session.insert("recommend.insert",dto);
	}
	
	@Override
	public void select(RecommendDto dto) {
		session.selectOne("recommend.select",dto);
	}

	@Override
	public void delete(RecommendDto dto) {
		session.delete("recommend.delete",dto);
	}

	

}
