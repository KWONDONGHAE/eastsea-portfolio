package com.mycom.app;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		return "home";
	}
	
//	@RequestMapping(value = "/login", method = RequestMethod.GET)
//	public String login(Locale locale, Model model) {
//		
//		return "login";
//	}
	
	@RequestMapping(value = "/products", method = RequestMethod.GET)
	public String products(Locale locale, Model model) {
		
		return "products";
	}
	
	@RequestMapping(value = "/contactus", method = RequestMethod.GET)
	public String contactus(Locale locale, Model model) {
		
		return "contactus";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "statics/login";
    }
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
    public String test() {
        return "test";
    }
	
}
