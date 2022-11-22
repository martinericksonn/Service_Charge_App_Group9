package service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Ticket {

	@Id
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
		this.description = ticket.description != null? this.description : ticket.description;
		this.status = ticket.status != null? this.status : ticket.status;
		this.subject= ticket.subject != null? this.subject  : ticket.subject;
		this.tracker =  ticket.tracker != null ? this.tracker : ticket.tracker;
	
		return ticket;
	}
	
	
	public Ticket get(){
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
