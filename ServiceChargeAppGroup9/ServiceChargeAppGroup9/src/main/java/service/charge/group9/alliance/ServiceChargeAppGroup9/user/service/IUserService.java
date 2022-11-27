package service.charge.group9.alliance.ServiceChargeAppGroup9.user.service;

import service.charge.group9.alliance.ServiceChargeAppGroup9.user.entity.User;
import java.util.List;

public interface IUserService {
	
	public User saveUser(User user);
	public User updateUser(User user);
	public User findUserById(int id);
	public List<User> getAllUser();
	public void deleteUser(int id);
	
}
