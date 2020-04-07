package com.spoiler.movie.Service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.spoiler.movie.Dto.RecommendDto;

public interface RecommendService {
	public int recommendDataSelect(HttpServletRequest request);
	public int recommendDataExist(HttpServletRequest request);
	public void recommendDataInsert(HttpServletRequest request);
	public void recommendDataDelete(HttpServletRequest request);
}
