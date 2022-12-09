package service.charge.group9.alliance.ServiceChargeAppGroup9.roles.service;
import service.charge.group9.alliance.ServiceChargeAppGroup9.roles.enitiy.Roles;
import service.charge.group9.alliance.ServiceChargeAppGroup9.roles.enitiy.UserRole;

import java.util.List;

public interface IUserRoleService {
    UserRole saveUserRole(UserRole userRole);
    UserRole updateUserRole(UserRole userRole);
    UserRole findUserRoleByID(int id);
    List<UserRole> getAllUserRole();
    void deleteUserRole(int id);
    List<Roles> getAllRole();
    Roles getRoleByID(int id);
    String findRoleByUserID(int userID);
    int findUserRoleId(int userID,int roleID);

    int findRoleIdByRole(String role);
}
