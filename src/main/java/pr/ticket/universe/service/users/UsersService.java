package pr.ticket.universe.service.users;

import javax.servlet.http.HttpSession;

import pr.ticket.universe.model.users.dto.UsersDTO;

public interface UsersService {
	
	public boolean loginCheck(UsersDTO dto,HttpSession session);

	public UsersDTO viewUser(UsersDTO dto);
	
	public void logout(HttpSession session);
	
	public void joinUser(UsersDTO dto);

	public int idCheck(String user_id) throws Exception;

	public int emailCheck(String email);
}
