package com.spoiler.movie.Service;

import java.util.List;

import com.spoiler.movie.Dto.MovieDto;

public interface MovieAPIService {
	public List<MovieDto> getList(String titleKey, String genreKey, int pageNum);
	public MovieDto getMovieInfo(String movieSeqKey);
	public void updateMovie();
}
