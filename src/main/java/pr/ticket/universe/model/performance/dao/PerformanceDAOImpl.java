package pr.ticket.universe.model.performance.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import pr.ticket.universe.model.performance.dto.PerformanceDTO;

@Repository
public class PerformanceDAOImpl implements PerformanceDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public PerformanceDTO detail(int pf_order) {
		return sqlSession.selectOne("perform.detail", pf_order);
	}
}
