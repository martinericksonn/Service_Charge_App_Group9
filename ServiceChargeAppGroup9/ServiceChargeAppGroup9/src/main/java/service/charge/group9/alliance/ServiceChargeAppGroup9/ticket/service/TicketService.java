package service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.service;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.entity.Ticket;
import service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.repository.TicketRepository;

@Service
public class TicketService implements ITicketService {

	@Autowired
	private TicketRepository ticketJpaRepository;
	
	public Ticket saveTicket(Ticket ticket) {
		Instant instant = Instant.now();
		Timestamp timestamp = java.sql.Timestamp.from( instant );
		ticket.setDate(timestamp);
		return ticketJpaRepository.saveAndFlush(ticket);
	}

	public TicketService() {
	}

	public Ticket findById(int id) {
		return ticketJpaRepository.getReferenceById(Integer.valueOf(id)).get(); 
	}
	
	public void deleteById(int id) {
		ticketJpaRepository.deleteById(id);
	}

	@Override
	public List<Ticket> findTicketStatus(String status) {
		return ticketJpaRepository.findTicketStatus(status);
	}

	@Override
	public List<Ticket> findTicketCategory(int roleID) {
		return ticketJpaRepository.findTicketCategory(roleID);
	}

	public List<Ticket> getAllTicket(){
		return  ticketJpaRepository.findAll();	
	}

	
	public Ticket updateTicket(Ticket ticket) {
		Ticket ticketTemp = findById(ticket.getTicketID());
		if(ticketTemp != null) {
			return ticketJpaRepository.saveAndFlush(ticketTemp);
		}
		
		return null;
	}

	public List<Ticket> findTicketCategoryByUserID(int userID){
		return ticketJpaRepository.findTicketCategoryByUserID(userID);
	}

	public List<Ticket> findTicketStatusByUserIdAndRoleId(int userID,String status){
		return ticketJpaRepository.findTicketStatusByUserIdAndRoleId(userID, status);
	}
}
