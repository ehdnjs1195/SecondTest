package com.dowon.project.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dowon.project.shop.dto.ShopDto;
@Repository
public class ShopDaoImpl implements ShopDao{

	@Autowired //?��존객�?
	private SqlSession session;
	@Override
	public List<ShopDto> getList() {
		
		return null;
	}

	@Override
	public void minusCount(int num) {
		//?��고의 �??�� 줄이�?
		session.update("shop.misusCount",num);
		
	
	}

	@Override
	public void plusPoint(ShopDto dto) {
		//보너?�� ?��?��?�� ?���?
		session.update("shop.plusPoint",dto);
		
	}

	@Override
	public int getPrice(int num) {
		//�?�? select ?��?�� 리턴?���?
		return session.selectOne("shop.getPrice", num);
	}

	@Override
	public void minusMoney(ShopDto dto) {
		
		session.update("shop.minusMoney",dto);
		
	}

}
