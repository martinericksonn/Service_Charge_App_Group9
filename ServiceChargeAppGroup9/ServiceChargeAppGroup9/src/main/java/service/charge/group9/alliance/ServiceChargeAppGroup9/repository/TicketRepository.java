package service.charge.group9.alliance.ServiceChargeAppGroup9.repository;

import org.springframework.jdbc.core.BeanPropertyRowMapper;

import ph.alliance.prelims.group9_prelims.entity.TicketTest;
import service.charge.group9.alliance.ServiceChargeAppGroup9.entity.Ticket;

public class TicketRepository {
		//Create
		public int create(final Ticket ticket)
		{
			final String sql = " INSERT INTO ticket (ticketID, assignee, status,subject,description,tracker) VALUES  (?,?,?,?,?,? );";
			final int result = template.update(sql, ticket.getTicketID(), ticket.getAssignee(), ticket.getStatus(),ticket.getSubject(),ticket.getDescription(),ticket.getTracker());
			
			return result;
		}
		
		//Retrieve Ticket
		public Ticket findById(final int id)
		{
			final String sql = "SELECT * FROM ticket WHERE ticketID=?";
			final Ticket result = template.queryForObject(sql, BeanPropertyRowMapper.newInstance(Ticket.class), id);
			
			return result;
		}
		
}
