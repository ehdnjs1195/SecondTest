package com.spoiler.movie.Service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.spoiler.movie.Dto.RecommendDto;

public interface RecommendService {
	public void recommendDataSelect(HttpServletRequest request);
	public void recommendDataInsert(HttpServletRequest request);
}
