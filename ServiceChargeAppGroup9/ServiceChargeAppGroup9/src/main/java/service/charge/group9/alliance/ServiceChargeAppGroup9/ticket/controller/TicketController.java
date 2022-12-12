package service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import service.charge.group9.alliance.ServiceChargeAppGroup9.common.models.ApiResponse;
import service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.entity.Ticket;
import service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.message.Messages;
import service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.service.ITicketService;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.List;

@RestController
@RequestMapping("/ticket")
public class TicketController {
	@Autowired
	private ITicketService service;

	@PostMapping("/create")
	@ResponseBody
	public ApiResponse save(Ticket ticket) throws IOException {

		Instant instant = Instant.now();
		Timestamp timestamp = java.sql.Timestamp.from( instant );
		ticket.setDate(timestamp);
		Ticket savedTicket = service.saveTicket(ticket);
		if (savedTicket != null) {
			return ApiResponse.CreateSuccess(savedTicket, Messages.TICKET_SUCCESSFULLY_SAVED);
		}
		
		return ApiResponse.CreateError(Messages.GENERIC_UNSUCCESSFUL_SAVE);
	}
	
	@PostMapping("/update")
	@ResponseBody
	public ApiResponse update(Ticket ticket) throws IOException {
		Ticket savedTicket = service.saveTicket(ticket);
		if (savedTicket != null) {
			return ApiResponse.CreateSuccess(savedTicket, Messages.TICKET_SUCCESSFULLY_SAVED);
		}
		

		return ApiResponse.CreateError(Messages.GENERIC_TICKET_NOT_FOUND);
	}
	
	@GetMapping("/{id}")
	public ApiResponse getById(@PathVariable int id) {
		try {
			Ticket savedTicket = service.findById(id);
			return ApiResponse.CreateSuccess(savedTicket, Messages.TICKET_FOUND);
		} catch (Exception e) {
			return ApiResponse.CreateError(Messages.GENERIC_TICKET_NOT_FOUND);
		}
	}

	@GetMapping("/ticket-status/{status}")
	public ApiResponse findTicketCategory(@PathVariable String status) {
		try {
			List<Ticket> savedTicket = service.findTicketStatus(status);
			return ApiResponse.CreateSuccess(savedTicket, Messages.TICKET_FOUND);
		} catch (Exception e) {
			return ApiResponse.CreateError(Messages.GENERIC_TICKET_NOT_FOUND);
		}
	}

	@GetMapping("/ticket-category/{userID}")
	public ApiResponse findTicketStatus(@PathVariable int userID) {
		try {
			List<Ticket> savedTicket = service.findTicketCategory(userID);
			return ApiResponse.CreateSuccess(savedTicket, Messages.TICKET_FOUND);
		} catch (Exception e) {
			return ApiResponse.CreateError(Messages.GENERIC_TICKET_NOT_FOUND);
		}
	}


	@GetMapping("/ticket-category-by-user/{roleID}")
	public ApiResponse findAllTicketByUser(@PathVariable int roleID) {
		try {
			List<Ticket> savedTicket = service.findTicketCategoryByUserID(roleID);
			return ApiResponse.CreateSuccess(savedTicket, Messages.TICKET_FOUND);
		} catch (Exception e) {
			return ApiResponse.CreateError(Messages.GENERIC_TICKET_NOT_FOUND);
		}
	}
	
	@DeleteMapping("/delete/{id}")
	public ApiResponse deleteTicket(@PathVariable int id) {
		try {
			service.deleteById(id);
			return ApiResponse.CreateSuccess(null, Messages.TICKET_SUCCESSFULLY_DELETED);
		}catch(Exception e ){
			return ApiResponse.CreateError( Messages.GENERIC_TICKET_NOT_FOUND);
		}
		
	}
	
	@RequestMapping("/all")
	public ApiResponse retrieveAllTicket() {
		List<Ticket> ticketlist = service.getAllTicket();
		return ApiResponse.CreateSuccess(ticketlist, Messages.ALL_TICKET_SUCCESSFULLY__RETIEVE_);
	}

	@RequestMapping("/findTicketStatusByUserIdAndRoleId/{id}/{status}")
	public ApiResponse findTicketStatusByUserIdAndRoleId(@PathVariable int id,@PathVariable String status) {
		List<Ticket> ticketlist = service.findTicketStatusByUserIdAndRoleId(id,status);
		return ApiResponse.CreateSuccess(ticketlist, Messages.ALL_TICKET_SUCCESSFULLY__RETIEVE_);
	}

}
