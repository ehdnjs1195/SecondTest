package com.spoiler.movie.Service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.spoiler.movie.Dao.MovieDao;
import com.spoiler.movie.Dto.MovieDto;

@Service
public class MovieServiceImpl implements MovieService{
	@Autowired
	private MovieDao dao;
	
	@Override
	public void movieList(HttpServletRequest request) {
		List<MovieDto> list = dao.getList();
		request.setAttribute("list", list);
	}

}
