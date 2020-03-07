package com.spoiler.movie.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spoiler.movie.Dto.MovieCommentDto;

@Repository
public class MovieCommentDaoImpl implements MovieComementDao{
	
	@Autowired
	private SqlSession session;
	//인자로 전달된 그룹번호(원글의 글번호) 에 해당되는 댓글 목록 얻어오기
	@Override
	public List<MovieCommentDto> getList(String title) {
		session.selectList("getList", title);
		return null;
	}

	@Override
	public void delete(int num) {
		
	}

	@Override
	public void insert(MovieCommentDto dto) {
		
	}

	@Override
	public int getSequnce() {

		return 0;
	}

}
