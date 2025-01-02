package pr.ticket.universe.model.categorydetail.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import pr.ticket.universe.model.performance.dto.PerformanceDTO;

@Repository
public class CategoryDetailDAOImpl implements CategoryDetailDAO {
	@Inject
	SqlSession sqlSession;

	@Override
	public List<PerformanceDTO> list(String category_id) {
		return sqlSession.selectList("category.list", category_id);
	}

	@Override
	public List<PerformanceDTO> list(String category_id, String sub) {
		Map<String, String> map = new HashMap<>();
		map.put("category_id",category_id);
		map.put("sub", sub);
		return sqlSession.selectList("category.list2", map);
	}
}
