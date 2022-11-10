package service.charge.group9.alliance.ServiceChargeAppGroup9.controller;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ph.alliance.prelims.group9_prelims.entity.TicketTest;
import service.charge.group9.alliance.ServiceChargeAppGroup9.entity.Ticket;
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
			
	// Update
			@PostMapping("/ticket/update/{id}")
			public String save(@PathVariable final int id, @RequestParam("subject") final String subject,
					@RequestParam("description") final String description, @RequestParam("tracker") final String tracker,
					@RequestParam("assignee") final String assignee, @RequestParam("status") final String status)
					throws IOException {

				try {
					return service.update(new Ticket(id, assignee, status, subject, description, tracker)) >= 1 ? "Success" : "Something went wrong";
				} catch (Exception e) {
					System.out.println(e);
					return e.toString();
				}
			}
	
	// Update Ticket Status
			@PostMapping("/ticket/update-status/{id}")
			public String save(@PathVariable final int id, @RequestParam("status") final String status) throws IOException {
				try {
					Ticket ticket = new Ticket();
					ticket.setStatus(status);
					ticket.setTicketID(id);
					return service.updateStatus(ticket) >= 1 ? "Success" : "Something went wrong";
				} catch (Exception e) {
					System.out.println(e);
					return e.toString();
				}

			}
	// Update Ticket Assignee
			@PostMapping("/ticket/update-assignee/{id}")
			public String saveAsignee(@PathVariable final int id, @RequestParam("assignee") final String asignee)
					throws IOException {
				try {
					Ticket ticket = new Ticket();
					ticket.setStatus(asignee);
					ticket.setTicketID(id);
					return service.updateTicketAssignee(ticket) >= 1 ? "Success" : "Something went wrong";
				} catch (Exception e) {
					System.out.println(e);
					return e.toString();
				}

			}
			
}
