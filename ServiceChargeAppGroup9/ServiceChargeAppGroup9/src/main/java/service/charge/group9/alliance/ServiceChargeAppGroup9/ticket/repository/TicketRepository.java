package service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import service.charge.group9.alliance.ServiceChargeAppGroup9.ticket.entity.Ticket;

import java.util.List;


@Repository
public interface TicketRepository extends JpaRepository<Ticket, Integer>	{

    @Query(value ="SELECT * FROM ticket where ticket.status = ?1 ", nativeQuery = true)
    List<Ticket> findTicketStatus(String status);

//    Select ticket.ticketID,ticket.userID,ticket.categoryID,
//    ticket.userID,ticket.status,ticket.subject,
//    ticket.description,ticket.date
//    FROM ticket
//    JOIN userrole
//    on ticket.categoryID = userrole.userRoleID
//    Join roles
//    on roles.roleID = userrole.roleID
//    where roles.roleID = 1001;
    @Query(value = "Select ticket.ticketID,ticket.userID,ticket.categoryID,ticket.userID ,ticket.status,ticket.subject ,ticket.description,ticket.date  FROM ticket  JOIN userrole on ticket.categoryID = userrole.userRoleID  Join roles on roles.roleID = userrole.roleID where roles.roleID = ?1", nativeQuery = true)
    List<Ticket> findTicketCategory(int roleID);
}


