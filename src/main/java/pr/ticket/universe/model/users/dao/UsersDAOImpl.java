package pr.ticket.universe.model.users.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import pr.ticket.universe.model.users.dto.UsersDTO;

@Repository
public class UsersDAOImpl implements UsersDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<UsersDTO> list() {
		return sqlSession.selectList("users.list");
	}

}
