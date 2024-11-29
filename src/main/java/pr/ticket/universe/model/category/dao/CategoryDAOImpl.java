package pr.ticket.universe.model.category.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAOImpl implements CategoryDAO {
	@Inject
	SqlSession sqlSession;
}
