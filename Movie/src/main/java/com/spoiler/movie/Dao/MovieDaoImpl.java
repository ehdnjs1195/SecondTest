package com.spoiler.movie.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spoiler.movie.Dto.MovieDto;

@Repository
public class MovieDaoImpl implements MovieDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public List<MovieDto> getList(MovieDto dto) {
		return session.selectList("movie.getList",dto);
	}

	@Override
	public int getCount(MovieDto dto) {
		return session.selectOne("movie.getCount",dto);
	}

}
