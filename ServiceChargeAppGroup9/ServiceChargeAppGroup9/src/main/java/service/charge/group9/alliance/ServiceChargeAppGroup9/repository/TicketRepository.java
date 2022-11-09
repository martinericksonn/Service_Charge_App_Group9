package service.charge.group9.alliance.ServiceChargeAppGroup9.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import service.charge.group9.alliance.ServiceChargeAppGroup9.entity.Ticket;

public class TicketRepository {
	@Autowired
	private JdbcTemplate template;
	
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
		
		//Update
		public int updateTicket(final Ticket ticket)
		{

			final String sql = "UPDATE ticket SET  assignee=?, status=?, subject=?,description=?,tracker=? WHERE ticketID=?";
			final int result  = template.update(sql,ticket.getAssignee(),ticket.getStatus(), ticket.getSubject(), ticket.getDescription(),ticket.getTracker(),ticket.getTicketID());
			
			return result;
		}
		
		//Update ticket status
		public int updateTicketStatus(final Ticket ticket)
		{
			
			final String sql = "UPDATE ticket SET assignee=?  WHERE ticketID=?";
			final int result = template.update(sql, ticket.getAssignee(), ticket.getTicketID());
			
			return result;
		}
		
		
		
}
