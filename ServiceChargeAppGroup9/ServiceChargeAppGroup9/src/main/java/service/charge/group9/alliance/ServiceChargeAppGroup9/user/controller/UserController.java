package service.charge.group9.alliance.ServiceChargeAppGroup9.user.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import service.charge.group9.alliance.ServiceChargeAppGroup9.common.models.ApiResponse;
import service.charge.group9.alliance.ServiceChargeAppGroup9.user.message.Messages;
import service.charge.group9.alliance.ServiceChargeAppGroup9.user.entity.User;
import service.charge.group9.alliance.ServiceChargeAppGroup9.user.service.IUserService;

@RestController
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private IUserService serv;
	
	@PostMapping("/create")
	@ResponseBody
	public ApiResponse save(User user) throws IOException {
		System.out.println(user);
		User savedUser = serv.saveUser(user);
		if (user != null) {
			return ApiResponse.CreateSuccess(savedUser , Messages.USER_SUCCESSFULLY_SAVED);
		}
		
		return ApiResponse.CreateError(Messages.GENERIC_UNSUCCESSFUL_SAVE);
	}
	@RequestMapping("/all")
	public ApiResponse retrieveAllUser() {
		List<User> userList = serv.getAllUser();
		return ApiResponse.CreateSuccess(userList,Messages.ALL_USER_SUCCESSFULLY__RETIEVE_);
	}
}
