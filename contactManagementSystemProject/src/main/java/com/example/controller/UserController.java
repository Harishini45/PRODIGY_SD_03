package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.model.UserModel;
import com.example.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userserv;
	@GetMapping("/")
	public String homePage(Model model) {
		model.addAttribute("users",userserv.displayContacts());
		
		return "index";
		
	}
	@RequestMapping("/updatedisplay")
	public String updateView(@RequestParam int id,Model model) {
		model.addAttribute("id",id);
		UserModel user = userserv.getUser(id);
		model.addAttribute("user",user);
		return "update";
	}
	@RequestMapping("/adddisplay")
	public String addView() {
		return "add";
		
	}
	@PostMapping("/add")
	public String addContactDetails(@RequestParam String name,@RequestParam String phno,@RequestParam String email,Model model) {
		userserv.addContact(name, phno, email) ;
		model.addAttribute("users",userserv.displayContacts());
		return "index";
	}
	@PostMapping("/update")
	public String updateContactDetails(@RequestParam  int id,@RequestParam String name,@RequestParam String phno,@RequestParam String email,Model model) {
		userserv.updateContact(id,name, phno, email) ;
		model.addAttribute("users",userserv.displayContacts());
		
		return "index";
	}
	@RequestMapping("/delete")
	public String updateContactDetails(@RequestParam  int id,Model model) {
		userserv.deleteContact(id) ;
		model.addAttribute("users",userserv.displayContacts());
		
		return "index";
	}
	
	

}
