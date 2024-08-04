package com.example.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.model.UserModel;
import com.example.repository.UserRepository;


@Service
public class UserService  {
	@Autowired
	private UserRepository userrepo;
    public void addContact(String name,String ph_num,String email) {
    	UserModel user = new UserModel(name,ph_num,email);
    	userrepo.save(user);
    }
    public void updateContact(int id, String name,String ph_num,String email) {
    Optional<UserModel> users = userrepo.findById(id);
    if(users.isPresent()) {
    	UserModel user = users.get();
    	user.setName(name);
    	user.setPhonenumber(ph_num);
    	user.setEmail(email);
    	userrepo.save(user);
    }
    }
    public List<UserModel> displayContacts() {
 List<UserModel> users = (List<UserModel>) userrepo.findAll();
   return users;
  
    }
    public void deleteContact(int id) {
    	userrepo.deleteById(id);
    }
    public UserModel getUser(int id) {
    	Optional<UserModel> users = userrepo.findById(id);
    	if(users.isPresent()) {
    	return users.get();
    	}
    	return null;
    	
    }
	
	

}
