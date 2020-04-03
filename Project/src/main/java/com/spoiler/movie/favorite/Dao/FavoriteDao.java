package com.spoiler.movie.favorite.Dao;



import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.spoiler.movie.favorite.Dto.FavoriteDto;


public interface FavoriteDao {
	public void favoriteList(FavoriteDto dto);
	public void insert(FavoriteDto dto);
	public void delete(String id);
	public int getCount(String id);
}

