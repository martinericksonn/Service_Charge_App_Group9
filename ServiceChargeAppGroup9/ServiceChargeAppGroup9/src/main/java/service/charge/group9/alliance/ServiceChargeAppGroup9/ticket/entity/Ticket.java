package service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.entity;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "ticket")
public class Ticket {
	

	@Id
	@Column(name = "ticketID", nullable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int ticketID;
	@JoinColumn(name ="userID",nullable = false)
	private int userID;

	@JoinColumn(name ="userRoleID",nullable = false)
	private int categoryID;
	private String status;
	private String subject;
	private String description;

	private Timestamp date;
	public Ticket(int ticketID, int assigneeID, int userID, int category, String status, String subject, String description, Timestamp date) {
		this.ticketID = ticketID;
		this.userID = userID;
		this.categoryID = categoryID;
		this.status = status;
		this.subject = subject;
		this.description = description;
		this.date = date;
	}

	public int getTicketID() {
		return ticketID;
	}

	public void setTicketID(int ticketID) {
		this.ticketID = ticketID;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public int getCategoryOID() {
		return categoryID;
	}

	public void setCategory(int category) {
		this.categoryID = category;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public Ticket() {
	}

	public Ticket get() {
		Ticket ticket = new Ticket();
		ticket.ticketID = ticketID;
		ticket.status = status;
		ticket.subject = subject;
		ticket.description = description;
		ticket.userID = userID;
		ticket.categoryID = categoryID;


		return ticket;
	}

}
