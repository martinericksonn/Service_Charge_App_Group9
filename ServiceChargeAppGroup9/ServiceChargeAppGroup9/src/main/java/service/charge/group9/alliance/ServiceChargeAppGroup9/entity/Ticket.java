package service.charge.group9.alliance.ServiceChargeAppGroup9.entity;

public class Ticket {
	private int ticketID;
	 private String assignee;
	 private String status;
	 private String subject;
	 private String description;
	 private String tracker;
	 
	 
		public Ticket() {};

		public Ticket(final int ticketID, final String assignee, final String status, final String subject,
				final String description, final String tracker) {
			this.ticketID = ticketID;
			this.assignee = assignee;
			this.status = status;
			this.subject = subject;
			this.description = description;
			this.tracker = tracker;
		}
		
		 
		public int getTicketID() {
			return ticketID;
		}
		public void setTicketID(int ticketID) {
			this.ticketID = ticketID;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public String getAssignee() {
			return assignee;
		}
		public void setAssignee(String assignee) {
			this.assignee = assignee;
		}
		public String getTracker() {
			return tracker;
		}
		public void setTracker(String tracker) {
			this.tracker = tracker;
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
}
