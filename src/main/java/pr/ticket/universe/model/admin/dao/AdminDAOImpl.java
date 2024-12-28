package pr.ticket.universe.model.admin.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import pr.ticket.universe.model.artist.dto.ArtistDTO;
import pr.ticket.universe.model.paging.dto.Criteria;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<ArtistDTO> list(Criteria cri) throws Exception {
		return sqlSession.selectList("artistList", cri);
	}

	@Override
	public int listCount(Criteria cri) {
		return sqlSession.selectOne("listCount", cri);
	}

	// 아티스트 수정 페이지 이동
	@Override
	public ArtistDTO selectOne(int artist_order) {
		return sqlSession.selectOne("selectOne", artist_order);
	}
	
	// 아티스트 삭제
	@Override
	public int artistDelete(int artist_order) {
		int res = sqlSession.delete("artistDelete", artist_order);
		return res;
	}



}
