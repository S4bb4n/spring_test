package com.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("home")
public class HomeController {

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView test() {
		ModelAndView view = new ModelAndView("index");

		return view;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView getHome() {
		ModelAndView view = new ModelAndView("home");
		return view;
	}
	
	

}
