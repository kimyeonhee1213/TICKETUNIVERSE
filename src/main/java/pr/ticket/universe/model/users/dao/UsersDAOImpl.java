package pr.ticket.universe.model.users.dao;

import java.util.HashMap;
import java.util.Map;

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
	public UsersDTO loginCheck(String user_id) {
		return sqlSession.selectOne("users.loginCheck", user_id);
	}

	@Override
	public UsersDTO viewMember(UsersDTO dto) {
		return sqlSession.selectOne("users.viewUser", dto);
	}

	@Override
	public void logout(HttpSession session) {
		
	}

	@Override
	public void joinUser(UsersDTO dto) {
		sqlSession.insert("users.join", dto);
	}

	@Override
	public int idCheck(String user_id) throws Exception{
		int result = sqlSession.selectOne("users.idCheck",user_id);
		return result;
	}

	@Override
	public int emailCheck(String email) {
		int result = sqlSession.selectOne("users.emailCheck",email);
		return result;
	}

	@Override
	public String find_id(String name, String email) throws Exception {
		Map<String, String> map = new HashMap<>();
		map.put("name", name);
		map.put("email",email);
		return sqlSession.selectOne("users.findId", map);
		
	}


}
