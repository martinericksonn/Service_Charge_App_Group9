package service.charge.group9.alliance.ServiceChargeAppGroup9.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.entity.Ticket;
import service.charge.group9.alliance.ServiceChargeAppGroup9.user.entity.User;
import service.charge.group9.alliance.ServiceChargeAppGroup9.user.repository.IUserRepository;

@Service
public class UserService implements IUserService{
	@Autowired
	private IUserRepository userJpaRepository;
	
	@Override
	public User saveUser(User user) {
		return userJpaRepository.saveAndFlush(user);
	}

	@Override
	public User updateUser(User user) {
		User userTemp = findUserById(user.getUserID());
		if(userTemp != null) {
			return userJpaRepository.saveAndFlush(userTemp);
		}
		return null;
	}

	@Override
	public User findUserById(int id) {
		return userJpaRepository.getReferenceById(id).get();
	}

	@Override
	public List<User> getAllUser() {
		return userJpaRepository.findAll();
	}

	@Override
	public void deleteUser(int id) {
		userJpaRepository.deleteById(id);
	}

	public List<User> usersFromRoleID(int id) {
		return userJpaRepository.findUserByRoleIds( id);
	}

	public User loginUser(String email,String password){
		return userJpaRepository.loginUser(email,password);


	}


}
