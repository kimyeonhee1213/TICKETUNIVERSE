package pr.ticket.universe.model.users.dao;

import java.util.List;
import java.util.Map;

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

	public int find_pw(Map<String, Object> paramMap);

	public int changePw(Map<String, Object> paramMap);

	public List<UsersDTO> info(String userId);

	public int updateInfo(UsersDTO dto);
}
