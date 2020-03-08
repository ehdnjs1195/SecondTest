package com.spoiler.movie.search.service;

import javax.servlet.http.HttpServletRequest;

public interface SearchService {
	public void getSearch(HttpServletRequest request, String keyword);
}
