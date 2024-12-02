package pr.ticket.universe.service.users;

import javax.servlet.http.HttpSession;

import pr.ticket.universe.model.users.dto.UsersDTO;

public interface UsersService {
	
	public boolean loginCheck(UsersDTO dto,HttpSession session);

	public UsersDTO viewMember(UsersDTO dto);
	
	public void logout(HttpSession session);
}
