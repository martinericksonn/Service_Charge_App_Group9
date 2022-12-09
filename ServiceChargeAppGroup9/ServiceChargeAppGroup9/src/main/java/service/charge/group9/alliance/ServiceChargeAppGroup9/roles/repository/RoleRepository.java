package service.charge.group9.alliance.ServiceChargeAppGroup9.roles.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import service.charge.group9.alliance.ServiceChargeAppGroup9.roles.enitiy.Roles;

public interface RoleRepository extends JpaRepository<Roles, Integer> {
//select * from roles where roles.role = "Sales Team"
    @Query(value = "select * from roles where roles.role = ?1",nativeQuery = true)
    int findRoleIdByRole(String role);
}
