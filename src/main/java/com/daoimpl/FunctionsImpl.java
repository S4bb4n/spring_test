package com.daoimpl;

import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.ArrayList;
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
			File file = new File("jsonFunctions/" + functions.getFunctionName() + "_function.json");
			File dir = new File("jsonFunctions");
			if (!dir.exists()) {
				dir.mkdir();
			}
			if (!file.exists()) {
				mapper.writeValue(file, functions);
			}else {
				return false;
			}
		} catch (JsonGenerationException e) {
			e.printStackTrace();
			return false;
		} catch (JsonMappingException e) {
			e.printStackTrace();
			return false;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

	@Override
	public List<Functions> list() {
		
		List<Functions> l = new ArrayList<>();
		
		for(File file: files("jsonFunctions/")) {
			try {
				l.add(mapper.readValue(file,Functions.class));
			} catch (IOException e) {
				e.printStackTrace();
				return null;
			}
		}
		return l;
		
	}
	
	public File[] files(String path) {
		File dir = new File(path);
		return dir.listFiles(new FilenameFilter() {			
			@Override
			public boolean accept(File dir, String name) {
				return name.endsWith(".json");
			}
		} );
	}
	

	@Override
	public boolean delete(Functions functions) {
		File file = new File("jsonFunctions/"+functions.getFunctionName()+"_function.json");
		
		if(file.delete()) {
//			System.out.println("File: " + file.getAbsolutePath()+" exist and will be deleted");
			return true;
		}
			
		return false;
	}

	
}
