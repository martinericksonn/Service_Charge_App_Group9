package service.charge.group9.alliance.ServiceChargeAppGroup9.user.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import service.charge.group9.alliance.ServiceChargeAppGroup9.user.entity.User;

import java.util.List;

public interface IUserRepository extends JpaRepository<User, Integer> {
    @Query(value = "SELECT * FROM users WHERE userID IN (SELECT userID  FROM roles INNER JOIN userrole WHERE roles.roleID = ?1 AND roles.roleID = userrole.roleID);",nativeQuery = true)
    List<User> findUserByRoleIds(int id);


}
