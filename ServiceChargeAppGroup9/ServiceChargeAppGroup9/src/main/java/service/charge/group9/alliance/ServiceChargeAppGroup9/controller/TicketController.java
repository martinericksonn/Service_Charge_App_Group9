package service.charge.group9.alliance.ServiceChargeAppGroup9.controller;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.PostMapping;

public class TicketController {

	
	
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
