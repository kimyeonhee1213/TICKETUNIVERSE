package pr.ticket.universe.model.dibs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class DibsDAOImpl implements DibsDAO {
	@Inject
	SqlSession sqlSession;
}
