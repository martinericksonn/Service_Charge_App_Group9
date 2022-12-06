package service.charge.group9.alliance.ServiceChargeAppGroup9.roles.enitiy;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "roles")
public class Roles {
    @Id
    @Column(name = "roleID", nullable = false)
    private int roleID;

    private String role;

    public Roles() {}

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getRole() {
        return role;
    }

    public Roles(int roleID, String role) {
        this.roleID = roleID;
        this.role = role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Roles get() {
        Roles role = new Roles();
        role.roleID = this.roleID;
        role.role = this.role;
        return role;
    }
}
