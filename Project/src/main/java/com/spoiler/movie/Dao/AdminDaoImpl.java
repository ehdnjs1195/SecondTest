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
	public PopupDto getPopup(int num) {
		return session.selectOne("admin.getPopup", num);
	}
	@Override
	public void updateState(PopupDto dto) {
		session.update("admin.updateState", dto);
	}
	@Override
	public boolean checkAdmin(String writer) {
		if(session.selectOne("admin.checkAdmin", writer) != null) {
			return true;
		}else {
			return false;
		}
	}
	@Override
	public void updatePopup(PopupDto dto) {
		session.update("admin.updatePopup",dto);
	}
	
	@Override
	public List<PopupDto> getPopupList() {
		return session.selectList("admin.getList");
	}
	
	@Override
	public void deletePop(int num) {
		session.delete("admin.delete", num);
	}
}
