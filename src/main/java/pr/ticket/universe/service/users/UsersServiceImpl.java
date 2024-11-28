package pr.ticket.universe.service.users;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import pr.ticket.universe.model.users.dao.UsersDAO;
import pr.ticket.universe.model.users.dto.UsersDTO;

@Service
public class UsersServiceImpl implements UsersService {

	@Inject
	UsersDAO usersDao;
	
	@Override
	public List<UsersDTO> list() {
		return usersDao.list();
	}

}
