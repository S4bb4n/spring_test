package com.entities;

public class Functions {

	
//	int id;
	
	String functionName;
	
	String textFunction;

//	public int getId() {
//		return id;
//	}
//
//	public void setId(int id) {
//		this.id = id;
//	}

	public String getFunctionName() {
		return functionName;
	}

	public void setFunctionName(String functionName) {
		this.functionName = functionName;
	}

	public String getTextFunction() {
		return textFunction;
	}

	public void setTextFunction(String textFunction) {
		this.textFunction = textFunction;
	}

	@Override
	public String toString() {
		return "Functions [functionName=" + functionName + ", textFunction=" + textFunction + "]";
	}

	/*@Override
	public String toString() {
		return "Functions [id=" + id + ", functionName=" + functionName + ", textFunction=" + textFunction + "]";
	}*/
	
	
	
}
