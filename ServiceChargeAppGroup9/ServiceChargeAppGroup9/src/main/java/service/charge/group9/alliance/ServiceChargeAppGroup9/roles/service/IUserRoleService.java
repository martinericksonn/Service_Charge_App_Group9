package service.charge.group9.alliance.ServiceChargeAppGroup9.roles.service;
import service.charge.group9.alliance.ServiceChargeAppGroup9.roles.enitiy.UserRole;

import java.util.List;

public interface IUserRoleService {
    UserRole saveUserRole(UserRole userRole);
    UserRole updateUserRole(UserRole userRole);
    UserRole findUserRoleByID(int id);
    List<UserRole> getAllUserRole();
    void deleteUserRole(int id);

}
