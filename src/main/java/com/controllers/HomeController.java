package com.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("home")
public class HomeController {

	@RequestMapping(value = "/menu1", method = RequestMethod.GET)
	public String getMenu1() {
//		ModelAndView view = new ModelAndView("index");

//		return view;
		return "menu1";
	}
	
	@RequestMapping(value = "/menu2", method = RequestMethod.GET)
	public String getMenu2() {
//		ModelAndView view = new ModelAndView("index");

//		return view;
		return "menu2";
	}

	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView getHome() {
		ModelAndView view = new ModelAndView("home");
		return view;
	}
	
	

}
