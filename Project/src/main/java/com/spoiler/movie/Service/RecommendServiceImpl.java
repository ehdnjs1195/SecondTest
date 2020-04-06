package com.spoiler.movie.Service;



import java.util.List;

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
		
		
	}

	@Override
	public int recommendDataSelect(HttpServletRequest request) {
		
		String id = (String) request.getSession().getAttribute("id");
		int num=Integer.parseInt(request.getParameter("num"));
		
		RecommendDto dto=new RecommendDto();
		dto.setId(id);
		dto.setNum(num);
		
		int result= recommentDao.isExist(dto);
		if(result!=0) {
			commentDao.downCnt(num);
			recommentDao.delete(dto);
			return 0;
		}else {
			commentDao.upCnt(num);
			recommentDao.insert(dto);
			return 1;
		}
	}

	@Override
	public void recommendDataDelete(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("id");
		int num=Integer.parseInt(request.getParameter("num"));
				
		RecommendDto dto=new RecommendDto();
		dto.setId(id);
		dto.setNum(num);
		
	}

}
