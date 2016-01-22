package com.base.ctrl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jfinal.core.Controller;
import com.jfinal.kit.StrKit;
import com.jfinal.render.JsonRender;
import org.apache.log4j.Logger;

import java.util.*;


/**
 * 基础Controller
 */
public abstract class BaseController extends Controller {

	public Logger log=Logger.getLogger(this.getClass());
	private boolean parseJson = false;
	private Map<String,Object> jsonData;
	
	//判断浏览器类型
	protected void renderJsonToBrowser(Object json){
		String agent = getRequest().getHeader("User-Agent");
		if(agent.contains("MSIE"))
			this.render(new JsonRender(json).forIE());
		else{
			this.render(new JsonRender(json));
		}
	}

	public JSONArray getParaToArray(String name){
		parseJson();
		if (jsonData==null) {
			return null;
		}
		Object obj = jsonData.get(name);
		if (obj instanceof JSONArray){
			return (JSONArray) obj;
		}else{
			return null;
		}
	}
	
	public List<Map<String, Object>> getParaToList(String name){
		parseJson();
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		if (jsonData!=null) {
			Object obj = jsonData.get(name);
			if (obj instanceof JSONArray){
				JSONArray jsonArr = (JSONArray) obj;
		        Iterator<Object> it = jsonArr.iterator();
		        while(it.hasNext()){
		            JSONObject json = (JSONObject) it.next();
		            Map<String,Object> jsonMap = new HashMap<String,Object>();
					for(Object k : json.keySet()){
			            Object v = json.get(k); 
			            jsonMap.put(k.toString(), v);
					}
		            list.add(jsonMap);
		        }
			}
		}
		return list;
	}
	
	public Map<String, Object> getParaToMap(String name){
		parseJson();
		Map<String,Object> jsonMap = new HashMap<String,Object>();
		if (jsonData!=null) {
			Object obj = jsonData.get(name);
			if (obj instanceof JSONObject){
				JSONObject json = (JSONObject) obj;
				for(Object k : json.keySet()){
		            Object v = json.get(k); 
		            jsonMap.put(k.toString(), v);
				}
			}
		}
		return jsonMap;
	}
	
	public Map<String, Object> getParas(){
		parseJson();
		Map<String, Object> paras = new HashMap<String, Object>();
		if (jsonData!=null) {
			for(Object k : jsonData.keySet()){
	            Object v = jsonData.get(k);
	            if (v instanceof String){
	            	paras.put(k.toString(), StrKit.isBlank(v.toString())?null:v);
	            }
			}
		}else{
		    Map<?, ?> properties = this.getRequest().getParameterMap();
		    Iterator<?> entries = properties.entrySet().iterator();
		    Map.Entry<?,?> entry;
		    String name = "";
		    String value = "";
		    while (entries.hasNext()) {
		        entry = (Map.Entry<?,?>) entries.next();
		        name = (String) entry.getKey();
		        Object valueObj = entry.getValue();
		        if(null == valueObj){
		            value = "";
		        }else if(valueObj instanceof String[]){
		            String[] values = (String[])valueObj;
		            for(int i=0;i<values.length;i++){
		                value = values[i] + ",";
		            }
		            value = value.substring(0, value.length()-1);
		        }else{
		            value = valueObj.toString();
		        }
		        paras.put(name, value);
		    }
		}
		return paras;
	}
		
	private void parseJson(){
		if (!parseJson){
			Enumeration<String> e = this.getParaNames();
			if (e.hasMoreElements()) {
				while (e.hasMoreElements()) {
					String ename = e.nextElement();
					if (ename.startsWith("{") || ename.startsWith("\"")){
						JSONObject json = JSON.parseObject(ename);
						jsonData = new LinkedHashMap<String,Object>();
						for(Object k : json.keySet()){
				            Object v = json.get(k); 
				            jsonData.put(k.toString(), v);
						}
					}
				}
			}
			parseJson = true;
		}
	}
}
