package service.charge.group9.alliance.ServiceChargeAppGroup9.roles.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.charge.group9.alliance.ServiceChargeAppGroup9.roles.enitiy.Roles;
import service.charge.group9.alliance.ServiceChargeAppGroup9.roles.enitiy.UserRole;
import service.charge.group9.alliance.ServiceChargeAppGroup9.roles.repository.RoleRepository;
import service.charge.group9.alliance.ServiceChargeAppGroup9.roles.repository.UserRoleRepository;

import java.util.List;

@Service
public class UserRoleService implements IUserRoleService {
    @Autowired
    private UserRoleRepository userRoleRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Override
    public UserRole saveUserRole(UserRole userRole) {
        return userRoleRepository.saveAndFlush(userRole);
    }
    @Override
    public UserRole updateUserRole(UserRole userRole) {
        return null;
    }

    @Override
    public UserRole findUserRoleByID(int id) {
        return userRoleRepository.getReferenceById(id).get();
    }

    @Override
    public List<UserRole> getAllUserRole() {
        return userRoleRepository.findAll();
    }

    @Override
    public void deleteUserRole(int id) {
        userRoleRepository.deleteById(id);
    }

    @Override
    public List<Roles> getAllRole() {
        return roleRepository.findAll();
    }

    @Override
    public Roles getRoleByID(int id) {
        return roleRepository.getReferenceById(id).get();
    }
    public int findUserRoleId(int userID, int roleID){
        return  userRoleRepository.findUserRoleId ( userID ,roleID);
    }
    public String findRoleByUserID(int userID){
        return  userRoleRepository.findRoleByUserID(userID);
    }
}
