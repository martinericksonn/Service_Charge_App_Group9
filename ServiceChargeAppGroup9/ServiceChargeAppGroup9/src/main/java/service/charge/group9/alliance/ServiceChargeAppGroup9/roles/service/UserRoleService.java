package service.charge.group9.alliance.ServiceChargeAppGroup9.roles.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.charge.group9.alliance.ServiceChargeAppGroup9.roles.enitiy.UserRole;
import service.charge.group9.alliance.ServiceChargeAppGroup9.roles.repository.RoleRepository;

import java.util.List;

@Service
public class UserRoleService implements IUserRoleService {

    @Autowired
    private RoleRepository roleRepository;

    @Override
    public UserRole saveUserRole(UserRole userRole) {
        return roleRepository.saveAndFlush(userRole);
    }

    @Override
    public UserRole updateUserRole(UserRole userRole) {
        return null;
    }

    @Override
    public UserRole findUserRoleByID(int id) {
        return roleRepository.getReferenceById(id).get();
    }

    @Override
    public List<UserRole> getAllUserRole() {
        return roleRepository.findAll();
    }

    @Override
    public void deleteUserRole(int id) {
        roleRepository.deleteById(id);
    }
}
