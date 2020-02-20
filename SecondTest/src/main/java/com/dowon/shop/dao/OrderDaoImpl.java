package com.dowon.shop.dao;

import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dowon.shop.dto.OrderDto;
import com.dowon.exception.NoDeliveryException;

@Repository
public class OrderDaoImpl implements OrderDao{

	@Autowired
	private SqlSession session;

	
	@Override
	public void addOrder(OrderDto dto) {
		//테스트를 위해 50%의 확률로 예외발생시키기
		Random ran=new Random();
		int ranNum=ran.nextInt(2);
		if(ranNum==0) {
			throw new NoDeliveryException("배송이 불가능 합니다.");
		}
		//주문 테이블에 주문 추가
		session.insert("shop.addOrder",dto);

		}
}