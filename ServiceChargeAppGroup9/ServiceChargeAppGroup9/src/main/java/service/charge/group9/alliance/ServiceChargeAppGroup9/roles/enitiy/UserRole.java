package service.charge.group9.alliance.ServiceChargeAppGroup9.roles.enitiy;


import javax.persistence.*;

@Entity
@Table(name = "userRole")
public class UserRole {
    @Id
    @Column(name = "userRoleID", nullable = false)
    @GeneratedValue(strategy =  GenerationType.IDENTITY)
    private int userRoleID;

    @JoinColumn(name ="userID",nullable = false)
    private int userID;

    @JoinColumn(name ="roleID",nullable = false)
    private int roleID;

    public UserRole() {
    }

    public UserRole(int userRoleID, int userID, int roleID) {
        this.userRoleID = userRoleID;
        this.userID = userID;
        this.roleID = roleID;
    }
    public UserRole get(){
        UserRole ur = new UserRole();
        ur.roleID = this.roleID;
        ur.userID = this.userID;
        ur.userRoleID = this.userRoleID;
        return ur;
    }
    public int getUserRoleID() {
        return userRoleID;
    }

    public void setUserRoleID(int userRoleID) {
        this.userRoleID = userRoleID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }
}
