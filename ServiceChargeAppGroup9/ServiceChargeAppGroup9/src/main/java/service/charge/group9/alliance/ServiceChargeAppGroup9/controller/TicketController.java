package service.charge.group9.alliance.ServiceChargeAppGroup9.controller;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import service.charge.group9.alliance.ServiceChargeAppGroup9.service.ITicketService;

public class TicketController {
	private ITicketService service;

	@Autowired
	public TicketController(final ITicketService service)
	{
		this.service = service;
	}
	
	// Retrieve Ticket
		@RequestMapping("/ticket/{id}")
		public String getById(@PathVariable final int id) {

			try {
				return service.findById(id);
			} catch (Exception e) {
				System.out.println(e);
				return e.toString();
			}
		}
	
	// Create
			@PostMapping("/ticket/create")
			public String save(final HttpServletRequest request) throws IOException {
				try {
					final BufferedReader body = request.getReader();
					return service.save(body) >= 1 ? "Success" : "Something went wrong";
				} catch (Exception e) {
					System.out.println(e);
					return e.toString();
				}
			}
}
