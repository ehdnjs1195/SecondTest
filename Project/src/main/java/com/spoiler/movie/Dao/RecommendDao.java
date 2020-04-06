package com.spoiler.movie.Dao;

import java.util.List;

import com.spoiler.movie.Dto.RecommendDto;

public interface RecommendDao {
	public void insert(RecommendDto dto);
	public int isExist(RecommendDto dto);
	public void delete(RecommendDto dto);
}
