package com.daoimpl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
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
			// if (!file.exists()) {
			mapper.writeValue(file, functions);
			// }else {
			// return false;
			// }
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

		for (File file : files("jsonFunctions/")) {
			try {
				l.add(mapper.readValue(file, Functions.class));
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
		});
	}

	@Override
	public boolean delete(Functions functions) {
		File file = new File("jsonFunctions/" + functions.getFunctionName() + "_function.json");

		if (file.delete()) {
			// System.out.println("File: " + file.getAbsolutePath()+" exist and will be
			// deleted");
			return true;
		}

		return false;
	}

	@Override
	public Functions getFunction(String fileName) {
		File fileToFind = new File("jsonFunctions/" + fileName + "_function.json");
		try {
			return mapper.readValue(fileToFind, Functions.class);
		} catch (IOException e) {
			System.err.println("File: " + fileToFind + " does not exist!");
			// e.printStackTrace();
		}

		return null;
	}

	@Override
	public StringBuilder getTemplateFEA() {
		File templateFile = new File("aspTemplate/TemplateFEA.asp");
		StringBuilder sb = new StringBuilder();
		String line;
		BufferedReader br;
		try {
			br = new BufferedReader(new FileReader(templateFile));
			while ((line = br.readLine()) != null) {
				sb.append(line);
				sb.append("<br>");
			}
		} catch (FileNotFoundException e) {
			System.err.println("File: " + templateFile.getAbsolutePath() + " not found!");
		} catch (IOException e) {
			System.err.println("I/O problem: " + templateFile.getAbsolutePath() + " !");
			// e.printStackTrace();
		}

		return sb;
	}

}
