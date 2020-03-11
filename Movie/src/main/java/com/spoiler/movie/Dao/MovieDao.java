package com.spoiler.movie.Dao;

import java.util.List;

import com.spoiler.movie.Dto.MovieDto;

public interface MovieDao {
	public List<MovieDto> getList();

	public MovieDto getData(int num);
}
