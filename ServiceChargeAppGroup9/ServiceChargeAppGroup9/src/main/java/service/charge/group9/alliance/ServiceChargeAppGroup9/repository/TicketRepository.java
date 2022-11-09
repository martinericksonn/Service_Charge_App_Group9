package service.charge.group9.alliance.ServiceChargeAppGroup9.repository;

import service.charge.group9.alliance.ServiceChargeAppGroup9.entity.Ticket;

public class TicketRepository {
	//Create
		public int create(final Ticket ticket)
		{
			final String sql = " INSERT INTO ticket (ticketID, assignee, status,subject,description,tracker) VALUES  (?,?,?,?,?,? );";
			final int result = template.update(sql, ticket.getTicketID(), ticket.getAssignee(), ticket.getStatus(),ticket.getSubject(),ticket.getDescription(),ticket.getTracker());
			
			return result;
		}
		
}
