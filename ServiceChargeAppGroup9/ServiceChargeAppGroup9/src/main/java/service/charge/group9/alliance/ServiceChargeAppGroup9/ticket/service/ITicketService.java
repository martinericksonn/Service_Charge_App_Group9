package service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.service;

import java.util.List;

import service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.entity.Ticket;

public interface ITicketService {

	
	Ticket saveTicket(Ticket ticket);
	Ticket findById(int id);
	Ticket updateTicket(Ticket ticket);
	List<Ticket> getAllTicket();
	void deleteById(int id);
	List<Ticket> findTicketStatus(String status);
	List<Ticket> findTicketCategory(int roleID);
	List<Ticket> findTicketCategoryByUserID(int userID);


}
