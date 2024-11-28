package pr.ticket.universe.model.users.dao;

import java.util.List;


import pr.ticket.universe.model.users.dto.UsersDTO;

public interface UsersDAO {
	public List<UsersDTO> list();
}
