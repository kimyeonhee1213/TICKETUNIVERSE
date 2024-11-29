package pr.ticket.universe.model.artist.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ArtistDAOImpl implements ArtistDAO {
	@Inject
	SqlSession sqlSession;
}
