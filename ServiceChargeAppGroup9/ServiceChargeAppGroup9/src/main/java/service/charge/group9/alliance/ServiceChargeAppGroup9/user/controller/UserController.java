package service.charge.group9.alliance.ServiceChargeAppGroup9.user.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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


	@DeleteMapping("/delete/{id}")
	public ApiResponse deleteUser(@PathVariable int id){
		try{
			serv.deleteUser(id);
			return ApiResponse.CreateSuccess(null, Messages.USER_SUCCESSFULLY_DELETED);
		}catch (Exception e){
			return ApiResponse.CreateError(Messages.USER_NOT_FOUND);
		}
	}

	@GetMapping("/{id}")
	public ApiResponse getById(@PathVariable int id) {
		try {
			User savedUser = serv.findUserById(id);
			return ApiResponse.CreateSuccess(savedUser, Messages.USER_FOUND);
		} catch (Exception e) {
			return ApiResponse.CreateError(Messages.USER_NOT_FOUND);
		}
	}

	@PostMapping("/update")
	@ResponseBody
	public ApiResponse update(User user) throws IOException {
		User savedUser = serv.saveUser(user);
		if (savedUser != null) {
			return ApiResponse.CreateSuccess(savedUser,Messages.USER_SUCCESSFULLY_UPDATED);
		}
		return ApiResponse.CreateError(Messages.USER_NOT_FOUND);
	}

	@GetMapping("/users-from-role/{id}")
	@ResponseBody
	public ApiResponse usersFromRole(@PathVariable int id){
		List<User> userList =serv.usersFromRoleID(id);
		return ApiResponse.CreateSuccess(userList,Messages.ALL_USER_SUCCESSFULLY__RETIEVE_);
	}

}
