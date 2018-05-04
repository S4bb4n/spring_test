package com.daoimpl;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Component;

import com.daoapi.FunctionsDao;
import com.entities.Functions;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
@Component
public class FunctionsImpl implements FunctionsDao {
	ObjectMapper mapper = new ObjectMapper();

	@Override
	public boolean saveOrUpdate(Functions functions) {

		try {
			String jsonInString = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(functions);
			System.out.println("Json function is: " + jsonInString);
			mapper.configure(SerializationFeature.INDENT_OUTPUT, true);
			File file = new File("jsonFunctions/"+functions.getFunctionName()+"_function.json");
			File dir=new File("jsonFunctions"); 
			if(!dir.exists()) {
				dir.mkdir();
			}
			mapper.writeValue(file, functions);
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public List<Functions> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean delete(Functions functions) {
		// TODO Auto-generated method stub
		return false;
	}

}
