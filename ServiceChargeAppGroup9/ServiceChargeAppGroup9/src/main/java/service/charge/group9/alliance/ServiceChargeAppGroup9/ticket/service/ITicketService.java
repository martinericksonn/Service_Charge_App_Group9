package service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.service;

import java.util.List;

import service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.entity.Ticket;

public interface ITicketService {

	
	public Ticket saveTicket(Ticket ticket);
	public Ticket findById(int id);
	public Ticket updateTicket(Ticket ticket);
	public List<Ticket> getAllTicket();
	public void deleteById(int id);

}
