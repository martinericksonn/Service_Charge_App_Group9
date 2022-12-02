package service.charge.group9.alliance.ServiceChargeAppGroup9.user.service;

import service.charge.group9.alliance.ServiceChargeAppGroup9.user.entity.User;
import java.util.List;

public interface IUserService {
	
	User saveUser(User user);
	User updateUser(User user);
	User findUserById(int id);
	List<User> getAllUser();
	void deleteUser(int id);
	
}
