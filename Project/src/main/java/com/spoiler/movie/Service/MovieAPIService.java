package com.spoiler.movie.Service;

import java.util.List;

import com.spoiler.movie.Dto.MovieDto;

public interface MovieAPIService {
	public List<MovieDto> getList(String titleKey, String genreKey, String nationKey, int pageNum);
	public MovieDto getMovieInfo(String movieSeqKey, String movieIdKey);
	public void updateMovie();
	public List<MovieDto> moreMovieList(String startCount, String genre, String title,String nation);
}
