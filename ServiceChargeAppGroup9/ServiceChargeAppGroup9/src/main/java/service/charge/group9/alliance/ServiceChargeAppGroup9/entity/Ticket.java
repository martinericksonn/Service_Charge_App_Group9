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
}
