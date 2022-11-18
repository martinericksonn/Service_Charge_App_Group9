package service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.entity.Ticket;


@Repository
public interface TicketRepository extends JpaRepository<Ticket, Integer>	{
	

		
}
