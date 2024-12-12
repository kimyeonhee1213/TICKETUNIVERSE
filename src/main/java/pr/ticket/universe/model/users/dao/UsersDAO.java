package pr.ticket.universe.model.users.dao;

import javax.servlet.http.HttpSession;

import pr.ticket.universe.model.users.dto.UsersDTO;

public interface UsersDAO {
	
	public UsersDTO loginCheck(String user_id);
	
	public UsersDTO viewMember(UsersDTO dto);
	
	public void logout(HttpSession session);

	public void joinUser(UsersDTO dto);

	public int idCheck(String user_id) throws Exception;

	public int emailCheck(String email);

	public String find_id(String name, String email) throws Exception;
}
