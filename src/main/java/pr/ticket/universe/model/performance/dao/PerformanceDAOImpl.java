package pr.ticket.universe.model.performance.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PerformanceDAOImpl implements PerformanceDAO {
	
	@Inject
	SqlSession sqlSession;
}
