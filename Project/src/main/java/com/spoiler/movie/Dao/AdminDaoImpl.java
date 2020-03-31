package com.spoiler.movie.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spoiler.movie.Dto.PopupDto;

@Repository
public class AdminDaoImpl implements AdminDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public void insertPopup(PopupDto dto) {
		session.insert("admin.insert-popup", dto);
	}
	
	@Override
	public List<PopupDto> getPopupList() {
		return session.selectList("admin.get-popuplist");
	}
	@Override
	public void updateState(PopupDto dto) {
		session.update("admin.updateState", dto);
	}
}
