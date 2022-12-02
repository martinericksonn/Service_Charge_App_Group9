package service.charge.group9.alliance.ServiceChargeAppGroup9.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.charge.group9.alliance.ServiceChargeAppGroup9.user.entity.User;
import service.charge.group9.alliance.ServiceChargeAppGroup9.user.respository.UserRespository;

@Service
public class UserService implements IUserService{
	@Autowired
	private UserRespository userJpaRepository;
	
	@Override
	public User saveUser(User user) {
		return userJpaRepository.saveAndFlush(user);
	}

	@Override
	public User updateUser(User user) {
		User userTemp = findUserById(user.getUserId());
		if(userTemp != null) {
			return userJpaRepository.saveAndFlush(userTemp);
		}
		return null;
	}

	@Override
	public User findUserById(int id) {
		userJpaRepository.getReferenceById(id);	
		return null;
	}

	@Override
	public List<User> getAllUser() {
		return userJpaRepository.findAll();
	}

	@Override
	public void deleteUser(int id) {
		userJpaRepository.deleteById(id);
	}

}
