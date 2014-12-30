package com.bootstrap.restful;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class Main {

	@RequestMapping("/index.do")
	public String main(){
		return "index";
	}
	
	
	 @RequestMapping(value = "/person/profile/{id}/{name}/{status}", method = RequestMethod.GET)  
	public @ResponseBody Person porfile(@PathVariable int id, @PathVariable String name, @PathVariable boolean status) {
		 System.out.println("bbbbbbbbbbbbbbbbbbbb");
	        return new Person(id, name, status);  
	    }  
	 
	 /** 
	     * 登录 
	     *  
	     * @param person 
	     * @return 
	     */  
	    @RequestMapping(value = "/person/login", method = RequestMethod.POST)  
	    public @ResponseBody  
	    Person login(@RequestBody Person person) {  
	        return person;  
	    }  
	
}
