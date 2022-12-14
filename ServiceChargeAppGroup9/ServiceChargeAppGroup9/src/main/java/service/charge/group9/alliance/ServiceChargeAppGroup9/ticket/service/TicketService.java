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
}

//	public Ticket saveAndFlush(Ticket ticket)
//    {
//		System.out.println(ticket);
//		return repository.create(ticket);
//    }
	
//	public int update(final Ticket ticket)
//    {
//        return repository.updateTicket(ticket);
//    }
//    
//	public int updateStatus(final Ticket ticket) 
//    {
//        return repository.updateTicketStatus(ticket);
//    }
//	 public int updateTicketAssignee(final Ticket ticket) 
//	{
//	    return repository.updateTicketAssignee(ticket);
//	}
//	 public int deleteById(final int id)
//	    {
//	        return repository.deleteByID(id);
//	    } 

