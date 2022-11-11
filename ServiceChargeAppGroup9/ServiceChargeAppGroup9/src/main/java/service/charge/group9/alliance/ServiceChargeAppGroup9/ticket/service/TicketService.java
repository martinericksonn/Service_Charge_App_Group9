package service.charge.group9.alliance.ServiceChargeAppGroup9.service;

import java.io.BufferedReader;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import service.charge.group9.alliance.ServiceChargeAppGroup9.entity.Ticket;
import service.charge.group9.alliance.ServiceChargeAppGroup9.repository.ITicketRepository;

@Service
public class TicketService implements ITicketService{
	private ITicketRepository repository;
	private Gson gson;
	 
	 @Autowired
	    public TicketService(final ITicketRepository repository)
	    {
	        this.repository = repository;
	        this.gson = new Gson();
	    }
	 
	 public String findById(final int id)
	    {
	        return gson.toJson(repository.findById(id));
	    }
	
	public int save(final BufferedReader body)
    {
        //from just a simple requestBody, we transform it to a class using fromJson
        final Ticket ticket= gson.fromJson(body, Ticket.class);

        return repository.create(ticket);
    }
	
	public int update(final Ticket ticket)
    {
        return repository.updateTicket(ticket);
    }
    
	public int updateStatus(final Ticket ticket) 
    {
        return repository.updateTicketStatus(ticket);
    }
	 public int updateTicketAssignee(final Ticket ticket) 
	{
	    return repository.updateTicketAssignee(ticket);
	}
	 public int deleteById(final int id)
	    {
	        return repository.deleteByID(id);
	    }
}
