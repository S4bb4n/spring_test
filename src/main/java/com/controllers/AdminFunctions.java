package com.controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entities.Functions;
import com.serviceapi.FunctionsService;

@Controller
@RequestMapping("functions")
public class AdminFunctions {

	@Autowired
	FunctionsService functionsService;

	@RequestMapping(value = { "", "/page" }, method = RequestMethod.GET)
	public String getPage() {
		return "functions";
	}

	@RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> writeIntoFunctions(Functions functions) {

		Map<String, Object> map = new HashMap<String,Object>();
		System.out.println(functions.toString());
		if (functionsService.saveOrUpdate(functions)) {
			map.put("status", "200");
			map.put("message", "Record saved successfully!");
		} else {
			map.put("status", "403");
			map.put("message", "Record not saved!");
		}

		return map;
	}

}
