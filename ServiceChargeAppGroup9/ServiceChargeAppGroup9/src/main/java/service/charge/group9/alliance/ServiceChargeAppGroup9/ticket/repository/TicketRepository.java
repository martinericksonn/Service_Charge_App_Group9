package service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.entity.Ticket;

@Repository
public class TicketRepository implements ITicketRepository	{
	
	@Autowired
	private JdbcTemplate template;
	
		//Create
		public Ticket create(final Ticket ticket)
		{
			final String sql = " INSERT INTO ticket (ticketID, assignee, status,subject,description,tracker) VALUES  (?,?,?,?,?,? );";
			final int result = template.update(sql, ticket.getTicketID(), ticket.getAssignee(), ticket.getStatus(),ticket.getSubject(),ticket.getDescription(),ticket.getTracker());
			
			return ticket;
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
		
		//Update ticket assignee
		public int updateTicketAssignee(Ticket ticket) {
			System.out.println(ticket.getAssignee()  + " " + ticket.getTicketID());
			final String sql = "UPDATE ticket SET assignee=?  WHERE ticketID=?";
			final int result = template.update(sql, ticket.getAssignee(), ticket.getTicketID());
			
			return result;
			
		}
		//delete
		public int deleteByID(final int id)
		{
			final String sql = "DELETE FROM ticket WHERE ticketID=?";
			final int result = template.update(sql, id);
			
			return result;
		}
		
		
}
