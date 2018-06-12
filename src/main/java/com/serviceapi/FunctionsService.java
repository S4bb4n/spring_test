package com.serviceapi;

import java.util.List;

import com.entities.Functions;

public interface FunctionsService {
	public Functions getFunction(String functionName);
	public boolean saveOrUpdate(Functions functions);
	public List<Functions> list();
	public boolean delete(Functions functions);
	public StringBuilder getTemplateFEA();
}
