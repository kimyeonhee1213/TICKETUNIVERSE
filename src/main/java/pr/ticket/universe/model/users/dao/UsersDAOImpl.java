package pr.ticket.universe.model.users.dao;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import pr.ticket.universe.model.users.dto.UsersDTO;

@Repository
public class UsersDAOImpl implements UsersDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public boolean loginCheck(UsersDTO dto) {
		String name = sqlSession.selectOne("users.loginCheck", dto);
		return (name == null) ? false : true;
	}

	@Override
	public UsersDTO viewMember(UsersDTO dto) {
		return sqlSession.selectOne("users.viewUser", dto);
	}

	@Override
	public void logout(HttpSession session) {
		
	}


}
