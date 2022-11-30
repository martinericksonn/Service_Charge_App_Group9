package service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ticket")
public class Ticket {
	
	public Ticket() {
	}

	public Ticket(int ticketID, String assignee, String status, String subject, String description, String tracker) {
		super();
		this.ticketID = ticketID;
		this.assignee = assignee;
		this.status = status;
		this.subject = subject;
		this.description = description;
		this.tracker = tracker;
	}

	@Id
	@Column(name = "ticketID", nullable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int ticketID;
	private String assignee;
	private String status;
	private String subject;
	private String description;
	private String tracker;

	public int getTicketID() {
		return ticketID;
	}

	public void setTicketID(int ticketID) {
		this.ticketID = ticketID;
	}

	public String getAssignee() {
		return assignee;
	}

	public void setAssignee(String assignee) {
		this.assignee = assignee;
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

	public String getTracker() {
		return tracker;
	}

	public void setTracker(String tracker) {
		this.tracker = tracker;
	}

	public Ticket set(Ticket ticket) {
		this.assignee = ticket.assignee != null ? this.assignee : ticket.assignee;
		this.description = ticket.description != null ? this.description : ticket.description;
		this.status = ticket.status != null ? this.status : ticket.status;
		this.subject = ticket.subject != null ? this.subject : ticket.subject;
		this.tracker = ticket.tracker != null ? this.tracker : ticket.tracker;

		return ticket;
	}

	public Ticket get() {
		Ticket ticket = new Ticket();
		ticket.ticketID = ticketID;
		ticket.assignee = assignee;
		ticket.status = status;
		ticket.subject = subject;
		ticket.description = description;
		ticket.tracker = tracker;

		return ticket;
	}

}
