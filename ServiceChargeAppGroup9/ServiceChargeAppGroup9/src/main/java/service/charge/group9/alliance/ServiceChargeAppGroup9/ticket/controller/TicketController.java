package service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import service.charge.group9.alliance.ServiceChargeAppGroup9.common.models.ApiResponse;
import service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.entity.Ticket;
import service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.message.Messages;
import service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.service.ITicketService;

import java.util.List;

@RestController
@RequestMapping("/ticket")
public class TicketController {
	@Autowired
	private ITicketService service;

	@PostMapping("/create")
	@ResponseBody
	public ApiResponse save(Ticket ticket) throws IOException {
		Ticket savedTicket = service.saveTicket(ticket);
		if (savedTicket != null) {
			return ApiResponse.CreateSuccess(savedTicket, Messages.TICKET_SUCCESSFULLY_SAVED);
		}
		
		return ApiResponse.CreateError(Messages.GENERIC_UNSUCCESSFUL_SAVE);
	}
	

//			
//	// Update
//			@PostMapping("/ticket/update/{id}")
//			public String save(@PathVariable final int id, @RequestParam("subject") final String subject,
//					@RequestParam("description") final String description, @RequestParam("tracker") final String tracker,
//					@RequestParam("assignee") final String assignee, @RequestParam("status") final String status)
//					throws IOException {
//
//				try {
//					return service.update(new Ticket(id, assignee, status, subject, description, tracker)) >= 1 ? "Success" : "Something went wrong";
//				} catch (Exception e) {
//					System.out.println(e);
//					return e.toString();
//				}
//			}
 //	
//	// Update Ticket Status
//			@PostMapping("/ticket/update-status/{id}")
//			public String save(@PathVariable final int id, @RequestParam("status") final String status) throws IOException {
//				try {
//					Ticket ticket = new Ticket();
//					ticket.setStatus(status);
//					ticket.setTicketID(id);
//					return service.updateStatus(ticket) >= 1 ? "Success" : "Something went wrong";
//				} catch (Exception e) {
//					System.out.println(e);
//					return e.toString();
//				}
//
//			}
//	// Update Ticket Assignee
//			@PostMapping("/ticket/update-assignee/{id}")
//			public String saveAsignee(@PathVariable final int id, @RequestParam("assignee") final String asignee)
//					throws IOException {
//				try {
//					Ticket ticket = new Ticket();
//					ticket.setStatus(asignee);
//					ticket.setTicketID(id);
//					return service.updateTicketAssignee(ticket) >= 1 ? "Success" : "Something went wrong";
//				} catch (Exception e) {
//					System.out.println(e);
//					return e.toString();
//				}
//
//			}
	 

}
