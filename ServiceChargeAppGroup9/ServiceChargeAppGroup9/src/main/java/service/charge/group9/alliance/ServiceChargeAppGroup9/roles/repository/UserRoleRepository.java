package service.charge.group9.alliance.ServiceChargeAppGroup9.roles.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import service.charge.group9.alliance.ServiceChargeAppGroup9.roles.enitiy.UserRole;

public interface UserRoleRepository extends JpaRepository<UserRole, Integer> {
    @Query(value = "SELECT userRoleID FROM userrole where userrole.userID = ?1 AND userrole.roleID = ?2",nativeQuery = true)
    int findUserRoleId(int userID,int roleID);

    //

    @Query(value = "select roles.role from users join userrole on userrole.userID = users.userID join roles on roles.roleID = userrole.roleID where users.userID = ?1",nativeQuery = true)
    String findRoleByUserID(int userID);
}
