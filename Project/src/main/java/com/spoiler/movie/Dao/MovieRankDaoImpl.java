package com.spoiler.movie.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spoiler.movie.Dto.MovieRankDto;
@Repository
public class MovieRankDaoImpl implements MovieRankDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public List<MovieRankDto> movieRankList() {
		return session.selectList("movie.getRankList");
	}

	@Override
	public void updateRank(MovieRankDto dto) {
		session.insert("movie.updateRank", dto);
	}

	@Override
	public void deleteRank() {
		session.delete("movie.deleteRank");
	}

}
