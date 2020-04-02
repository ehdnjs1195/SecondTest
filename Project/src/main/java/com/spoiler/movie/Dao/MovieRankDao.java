package com.spoiler.movie.Dao;

import java.util.List;

import com.spoiler.movie.Dto.MovieRankDto;

public interface MovieRankDao {
	public List<MovieRankDto> movieRankList();
	public void updateRank(MovieRankDto dto);
	public void deleteRank();
}
