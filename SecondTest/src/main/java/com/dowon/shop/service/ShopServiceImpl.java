package com.dowon.shop.service;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.dowon.exception.NoDeliveryException;
import com.dowon.shop.dto.OrderDto;
import com.dowon.shop.dto.ShopDto;
import com.dowon.shop.dao.OrderDao;
import com.dowon.shop.dao.ShopDao;

@Service
public class ShopServiceImpl implements ShopService{
	@Autowired
	private ShopDao shopDao;
	@Autowired
	private OrderDao orderDao;
	
	@Override
	public void getList(ModelAndView mView) {
		List<ShopDto> list=shopDao.getList();
		mView.addObject("list",list);
		
	}
	/*
	 *  - Spring �봽�젅�엫�썙�겕�뿉�꽌 �듃�젋�젥��?? �꽕�젙 諛⑸�?
	 *  1. pom.xml �뿉 spring-tx dependency  ?��붽�
	 *  2. servlet-context.xml �뿉 transaction �꽕�젙 ?��붽�
	 *  3. �듃�젋�젥��?��?�� �쟻�슜�븷 �꽌?��꾩뒪�쓽 硫붿?���뱶�뿉 @Transactional  �뼱�끂��?��?����?��?�� ?��붽� �븳�떎.
	 */

	//�긽��?? ?��?�엯 泥섎?��?���? �븯�뒗 ?��꾩쫰�땲�뒪 濡쒖�?
	@Transactional
	@Override
	public void buy(HttpServletRequest request, ModelAndView mView) {
		//濡쒓?���씤�맂 �븘�씠�뵒
				String id=(String)request.getSession().getAttribute("id");
				//?��?�엯�븷 �긽��?? 踰덊?��
				int num=Integer.parseInt(request.getParameter("num"));
				//1. �긽��?��?�� 媛�寃⑹?��蹂� �뼸�뼱�삤湲�
				int price=shopDao.getPrice(num);
				//2. �긽��?��?�� 媛�寃⑸쭔��? ?�꾩�? �옍�븸 以꾩?��湲�
				ShopDto dto=new ShopDto();
				dto.setId(id);
				dto.setPrice(price);
				dto.setNum(num);
				shopDao.minusMoney(dto);
				//3. 媛�寃⑹?�� 10% ?���? �룷�씤�듃濡� �쟻?���?
				shopDao.plusPoint(dto);
				//4. �옱?�좎?�� 媛��닔?���? 1 媛먯?�� �떆�궓�떎.
				shopDao.minusCount(num);
				//5. 諛곗?�� �슂泥� �젙蹂�?�� ?��붽� �븳�떎.
				OrderDto dto2=new OrderDto();
				dto2.setId(id);
				dto2.setCode(num);
				dto2.setAddr("媛뺣궓��? �뒪��踰낆?��");
				orderDao.addOrder(dto2);
			
		}
}