package com.spoiler.movie.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spoiler.movie.Dto.MovieCommentDto;

@Repository
public class MovieCommentDaoImpl implements MovieCommentDao{
	
	@Autowired
	private SqlSession session;
	//인자로 전달된 그룹번호(원글의 글번호) 에 해당되는 댓글 목록 얻어오기
	@Override
	public List<MovieCommentDto> getList(int ref_group) {
		
		return session.selectList("movieComment.getList", ref_group);
	}

	@Override
	public void delete(int num) {
		session.update("movieComment.delete", num);
	}

	@Override
	public void insert(MovieCommentDto dto) {
		session.insert("movieComment.insert", dto);
	}

	@Override
	public int getSequence() {
		//시퀀스 값을 얻어내서 
		int seq=session.selectOne("movieComment.getSequence");
		//리턴해준다.
		return seq;
	}
	@Override
	public int getNum(MovieCommentDto dto) {
		//시퀀스 값을 얻어내서 
		int num=session.selectOne("movieComment.getNum",dto);
		//리턴해준다.
		return num;
	}
	
	@Override
	public void update(MovieCommentDto dto) {
		session.update("movieComment.update", dto);
	}

	@Override
	public void updateCnt(int num) {
		session.update("movieComment.updateCnt",num);
		
	}
}
