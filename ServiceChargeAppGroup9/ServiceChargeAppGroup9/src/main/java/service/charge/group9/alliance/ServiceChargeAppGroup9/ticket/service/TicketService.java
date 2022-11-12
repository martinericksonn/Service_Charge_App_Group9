package service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.service;

import java.io.BufferedReader;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.entity.Ticket;
import service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.repository.TicketRepository;

@Service
public class TicketService implements ITicketService{
	private TicketRepository ticketJpaRepository;
	
	 
	 @Autowired
		public Ticket saveTicket(Ticket ticket) {
		 
			return ticketJpaRepository.saveAndFlush(ticket);
		}
//	    public TicketService(final ITicketRepository repository)
//	    {
//	        this.repository = repository;
//	        this.gson = new Gson();
//	    }
//	 
//	 public String findById(final int id)
//	    {
//	        return gson.toJson(repository.findById(id));
//	    }
//	
//	public Ticket saveAndFlush(Ticket ticket)
//    {
//		System.out.println(ticket);
//        return repository.create(ticket);
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
//


}
