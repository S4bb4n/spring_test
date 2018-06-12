package com.daoapi;

import java.util.List;

import com.entities.Functions;
import com.entities.Users;

public interface FunctionsDao {

	public boolean saveOrUpdate(Functions functions);

	public List<Functions> list();

	public boolean delete(Functions functions);
	
	public Functions getFunction(String fileName);
	
	public StringBuilder getTemplateFEA();

}
