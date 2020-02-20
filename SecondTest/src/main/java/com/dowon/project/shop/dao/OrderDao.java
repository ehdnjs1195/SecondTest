package com.dowon.project.shop.dao;

import com.dowon.project.shop.dto.OrderDto;

public interface OrderDao {
	//배송 ?��보�?? 추�??��?�� 메소?��
	public void addOrder(OrderDto dto);
}