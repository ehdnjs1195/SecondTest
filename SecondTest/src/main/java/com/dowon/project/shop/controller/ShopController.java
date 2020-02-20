package com.dowon.project.shop.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dowon.project.shop.service.ShopService;

@Controller
public class ShopController {
	@Autowired
	private ShopService service;
	
	@RequestMapping("/shop/list")
	public ModelAndView list(ModelAndView mView) {
		mView.setViewName("shop/list");
		return mView;
	}
	public ModelAndView authBuy(HttpServletRequest request,ModelAndView mView) {
		service.buy(request,mView);
		return mView;
	}
}
