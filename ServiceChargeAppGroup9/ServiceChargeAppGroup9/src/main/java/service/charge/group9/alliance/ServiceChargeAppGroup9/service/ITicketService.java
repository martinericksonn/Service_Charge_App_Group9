package service.charge.group9.alliance.ServiceChargeAppGroup9.service;

import java.io.BufferedReader;

import service.charge.group9.alliance.ServiceChargeAppGroup9.entity.Ticket;

public interface ITicketService {
	public int save(BufferedReader body);
	public String findById(final int id);
	public int update(final Ticket ticket);
	public int updateStatus(final Ticket ticket);
}
