package com.spoiler.movie.Service;



import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spoiler.movie.Dao.MovieCommentDao;
import com.spoiler.movie.Dao.RecommendDao;
import com.spoiler.movie.Dto.RecommendDto;


@Service
public class RecommendServiceImpl implements RecommendService{
	@Autowired
	private MovieCommentDao commentDao;
	@Autowired
	private RecommendDao recommentDao;
	
	@Override
	public void recommendDataInsert(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String id = (String) request.getSession().getAttribute("id");
		int num=Integer.parseInt(request.getParameter("num"));
				
		RecommendDto dto=new RecommendDto();
		dto.setId(id);
		dto.setNum(num);
		
		recommentDao.insert(dto);
	}

	@Override
	public void recommendDataSelect(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("id");
		int num=Integer.parseInt(request.getParameter("num"));
		RecommendDto dto=new RecommendDto();
		dto.setId(id);
		dto.setNum(num);


	}

}
