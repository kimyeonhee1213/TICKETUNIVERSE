package pr.ticket.universe.service.users;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import pr.ticket.universe.model.users.dao.UsersDAO;
import pr.ticket.universe.model.users.dto.UsersDTO;

@Service
public class UsersServiceImpl implements UsersService {

	@Inject
	UsersDAO usersDao;

	@Override
	public boolean loginCheck(UsersDTO dto, HttpSession session) {
		boolean result = usersDao.loginCheck(dto);
		if(result) {
			UsersDTO dto2 = viewMember(dto);
			session.setAttribute("user_id", dto2.getUser_id());
			session.setAttribute("name", dto2.getName());
		}
		return result;
	}

	@Override
	public UsersDTO viewMember(UsersDTO dto) {
		return usersDao.viewMember(dto);
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

}
