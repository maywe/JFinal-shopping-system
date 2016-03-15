package com.base.util;

import com.jfinal.plugin.activerecord.Record;

import java.util.List;

public class JsonUtil {
	
	private StringBuffer jsonBuf;
	private boolean isList = false;
	
	public JsonUtil(){
		jsonBuf = new StringBuffer();
	}
	
	public JsonUtil(String text){
		jsonBuf = new StringBuffer(text);
		jsonBuf.deleteCharAt(jsonBuf.length()-1);
	}
	
	public JsonUtil(List<Record> recordList){
		isList = true;
		jsonBuf = new StringBuffer();
		jsonBuf.append("[");
		for (int i=0,size=recordList.size();i<size;i++){
			Record record = recordList.get(i);
			if (i>0){
				jsonBuf.append(",");
			}
			jsonBuf.append(record.toJson());
		}
		jsonBuf.append("]");
	}
	
	public void put(String key,List<Record> recordList){
		if (isList){
			throw new RuntimeException("Illegal operation !");
		}
		if (jsonBuf.length()==0){
			jsonBuf.append("{\"");
		}else{
			jsonBuf.append(",\"");
		}
		jsonBuf.append(key).append("\":[");
		for (int i=0;i<recordList.size();i++){
			Record record = recordList.get(i);
			if (i>0){
				jsonBuf.append(",");
			}
			jsonBuf.append(record.toJson());
		}
		jsonBuf.append("]");
	}
	
	public void put(String key,String value){
		if (isList){
			throw new RuntimeException("Illegal operation !");
		}
		if (jsonBuf.length()==0){
			jsonBuf.append("{\"");
		}else{
			jsonBuf.append(",\"");
		}
		jsonBuf.append(key).append("\":\"").append(value).append("\"");
	}
	
	public String toString(){
		if (!isList){
			if (jsonBuf.charAt(jsonBuf.length()-1)!='}'){
				jsonBuf.append("}");
			}
		}
		return jsonBuf.toString().replace("\":null","\":\"\"");
	}
	
}
