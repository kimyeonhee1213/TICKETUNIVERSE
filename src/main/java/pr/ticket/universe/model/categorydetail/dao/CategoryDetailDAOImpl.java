package pr.ticket.universe.model.categorydetail.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDetailDAOImpl implements CategoryDetailDAO {
	@Inject
	SqlSession sqlSession;
}
