package service.charge.group9.alliance.ServiceChargeAppGroup9.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import service.charge.group9.alliance.ServiceChargeAppGroup9.user.service.IUserService;



@RestController
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private IUserService service;
	
	
}
