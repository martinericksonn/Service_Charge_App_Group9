package service.charge.group9.alliance.ServiceChargeAppGroup9.service;

import java.io.BufferedReader;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;

import service.charge.group9.alliance.ServiceChargeAppGroup9.entity.Ticket;
import service.charge.group9.alliance.ServiceChargeAppGroup9.repository.ITicketRepository;

public class TicketService {
	private ITicketRepository repository;
	private Gson gson;
	 
	 @Autowired
	    public TicketService(final ITicketRepository repository)
	    {
	        this.repository = repository;
	        this.gson = new Gson();
	    }
	
	public int save(final BufferedReader body)
    {
        //from just a simple requestBody, we transform it to a class using fromJson
        final Ticket ticket= gson.fromJson(body, Ticket.class);

        return repository.create(ticket);
    }
}
