package com.spoiler.movie.Dao;

import com.spoiler.movie.Dto.RecommendDto;

public interface RecommendDao {
	public void insert(RecommendDto dto);
	public List<> select(RecommendDto dto);
	public void delete(RecommendDto dto);
}
