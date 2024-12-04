package pr.ticket.universe.model.main.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import pr.ticket.universe.model.main.dto.MainDTO;

@Repository
public class MainDAOImpl implements MainDAO {

	@Inject
	private SqlSession sqlSession;
	
	// 전체 공연 목록
	@Override
	public List<MainDTO> mainList(MainDTO mainDTO) {
		
		return sqlSession.selectList("mainList", mainDTO);
	}

	@Override
	public List<MainDTO> mainList2(MainDTO mainDTO) {
		
		return sqlSession.selectList("mainList2", mainDTO);
	}

}
