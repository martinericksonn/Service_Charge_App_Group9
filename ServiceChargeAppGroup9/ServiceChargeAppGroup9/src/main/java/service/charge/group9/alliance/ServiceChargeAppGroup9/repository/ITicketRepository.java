package service.charge.group9.alliance.ServiceChargeAppGroup9.repository;

import service.charge.group9.alliance.ServiceChargeAppGroup9.entity.Ticket;

public interface ITicketRepository {
	public int create(final Ticket ticket);
	public Ticket findById(final int id);
	public int updateTicket(final Ticket ticket);
}
