package com.dowon.shop.dao;

import com.dowon.shop.dto.OrderDto;

public interface OrderDao {
	//배송 ?��보�?? 추�??��?�� 메소?��
	public void addOrder(OrderDto dto);
}