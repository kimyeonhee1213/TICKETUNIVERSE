package pr.ticket.universe.service.users;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pr.ticket.universe.model.users.dto.UsersDTO;

public interface UsersService {
	
	public UsersDTO loginCheck(String user_id);

	public UsersDTO viewUser(UsersDTO dto);
	
	public void joinUser(UsersDTO dto);

	public int idCheck(String user_id) throws Exception;

	public int emailCheck(String email);
	
	public String find_id(HttpServletResponse response,String name, String email) throws  Exception;

	public int checkInfo(Map<String,Object> paramMap) throws Exception;

	public int changePw(Map<String,Object> paramMap)throws Exception;

	public List<UsersDTO> info(String userId);

	public int updateInfo(UsersDTO dto);
}
