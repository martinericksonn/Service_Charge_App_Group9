package service.charge.group9.alliance.ServiceChargeAppGroup9.roles.enitiy;

public class Role {
    private int roleID;

    private String role;

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getRole() {
        return role;
    }

    public Role(int roleID, String role) {
        this.roleID = roleID;
        this.role = role;
    }

    public void setRole(String role) {
        this.role = role;
    }

}
