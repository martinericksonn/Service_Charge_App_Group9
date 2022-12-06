package service.charge.group9.alliance.ServiceChargeAppGroup9.user.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.entity.Ticket;

@Entity
@Table(name = "users")
public class User {

    @Id
    @Column(name = "userID", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int userID;

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Column(name = "firstName")
    private String firstName;

    @Column(name = "lastName")
    private String lastName;

    @Column(name = "password")
    private String password;


    @Column(name = "email")
    private String email;

    public User(int userId, String firstName, String lastName, String username, String password, String role, String email) {
        super();
        this.userID = userId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.password = password;
        this.email = email;
    }

    public User() {
    }

    public User get() {
        User user = new User();
        user.firstName = firstName;
        user.lastName = lastName;
        user.password = password;

        user.userID = userID;
        user.email = email;
        return user;
    }
}
