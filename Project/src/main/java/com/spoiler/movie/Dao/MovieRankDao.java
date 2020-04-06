package com.spoiler.movie.Dao;

import java.util.List;

import com.spoiler.movie.Dto.MovieRankDto;

public interface MovieRankDao {
	public List<MovieRankDto> movieRankList(MovieRankDto dto);
	public void updateRank(MovieRankDto dto);
	public void deleteRank();
	public int getCount();
	public MovieRankDto getInfo(String title);
}