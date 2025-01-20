package pr.ticket.universe.service.users;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import pr.ticket.universe.model.users.dao.UsersDAO;
import pr.ticket.universe.model.users.dto.UsersDTO;

@Service
public class UsersServiceImpl implements UsersService {

	@Inject
	UsersDAO usersDao;
	
	@Inject
	BCryptPasswordEncoder passwordEncoder;

	@Override
	public UsersDTO loginCheck(String user_id) {
		return usersDao.loginCheck(user_id);
	}

	@Override
	public UsersDTO viewUser(UsersDTO dto) {
		return usersDao.viewMember(dto);
	}

	@Override
	public void joinUser(UsersDTO dto) {
		usersDao.joinUser(dto);
	}

	@Override
	public int idCheck(String user_id) throws Exception{
		int result = usersDao.idCheck(user_id);
		return result;
	}

	@Override
	public int emailCheck(String email) {
		int result = usersDao.emailCheck(email);
		return result;
	}

	@Override
	public String find_id(HttpServletResponse response, String name, String email) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String user_id = usersDao.find_id(name, email);
		
		if (user_id == null) {
			out.println("<script>");
			out.println("alert('일치하는 정보가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return user_id;
		}
	}

	@Override
	public int checkInfo(Map<String, Object> paramMap) throws Exception  {
		int result = usersDao.find_pw(paramMap);
		return result;
	}

	@Override
	public int changePw(Map<String ,Object> paramMap) throws Exception{
		String newPw = passwordEncoder.encode((String)paramMap.get("password"));
		paramMap.put("password", newPw);
		return usersDao.changePw(paramMap);
	}

	@Override
	public List<UsersDTO> info(String userId) {
		return usersDao.info(userId);
	}

	@Override
	public int updateInfo(UsersDTO dto) {
		return usersDao.updateInfo(dto);
	}

}
