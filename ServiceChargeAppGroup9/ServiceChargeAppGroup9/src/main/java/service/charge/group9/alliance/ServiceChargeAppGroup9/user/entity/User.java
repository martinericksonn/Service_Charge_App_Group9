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
	@Column(name = "userId", nullable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userId;

	private String firstName;
	private String lastName;
	private String username;
	private String password;
	private String role;

	public User() {
	}

	public User(int userId, String firstName, String lastName, String username, String password, String role) {
		super();
		this.userId = userId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.username = username;
		this.password = password;
		this.role = role;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public User get() {
		User user = new User();
		user.firstName = firstName;
		user.lastName = lastName;
		user.password= password;
		user.role = role;
		user.userId = userId;
		user.username= username;
		
		return user;
	}
}
