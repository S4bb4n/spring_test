package com.servicesimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daoapi.FunctionsDao;
import com.entities.Functions;
import com.serviceapi.FunctionsService;

@Service
public class FunctionsServiceImpl implements FunctionsService{

	@Autowired
	FunctionsDao functionsDao;
	
	@Override
	public boolean saveOrUpdate(Functions functions) {

		return functionsDao.saveOrUpdate(functions);
	}

	@Override
	public List<Functions> list() {

		return functionsDao.list();
	}

	@Override
	public boolean delete(Functions functions) {
		
		return functionsDao.delete(functions);
	}
	
	

}
