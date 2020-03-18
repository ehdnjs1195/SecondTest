package com.spoiler.movie.Dao;

import java.util.List;

import com.spoiler.movie.Dto.MovieDto;

public interface MovieDao {
	public List<MovieDto> getList(MovieDto dto);
	public int getCount(MovieDto dto);//글의 갯수
	//detail.do 에 필요한 Data
	public MovieDto getData(int num);
	
	public void updateMovie(MovieDto dto);
	public void initMovie();
}
