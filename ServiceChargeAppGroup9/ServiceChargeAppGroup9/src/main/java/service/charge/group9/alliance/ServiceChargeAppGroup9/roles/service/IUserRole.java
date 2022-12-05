package service.charge.group9.alliance.ServiceChargeAppGroup9.roles.service;
import java.util.List;

public interface IUserRole {

    UserRole saveRole(int userID, int roleID);
    UserRole updateRole(UserRole userRole);
    UserRole findUserRoleByID(int id);
    List<UserRole> getAllUser();
}
