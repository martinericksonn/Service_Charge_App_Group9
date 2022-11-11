package service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.repository;

import service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.entity.Ticket;

public interface ITicketRepository {
	public Ticket create(final Ticket ticket);
	public Ticket findById(final int id);
	public int updateTicket(final Ticket ticket);
	public int updateTicketStatus (final Ticket ticket);
	public int updateTicketAssignee(final Ticket ticket);
	public int deleteByID (final int id);
}
