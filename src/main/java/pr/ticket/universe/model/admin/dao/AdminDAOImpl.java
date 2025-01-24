package pr.ticket.universe.model.admin.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import pr.ticket.universe.model.artist.dto.ArtistDTO;
import pr.ticket.universe.model.paging.dto.Criteria;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<ArtistDTO> list(Criteria cri) throws Exception {
		
		// session에 있는 사용자 id값 가져오기
		ServletRequestAttributes servletRequestAttribute = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
	    HttpSession httpSession = servletRequestAttribute.getRequest().getSession(true);
	    
	    String user_id = (String) httpSession.getAttribute("user_id");
		System.out.println("세션에서 가져온 user_id ========== " + user_id);
		
		cri.setUser_id(user_id);
	    
		return sqlSession.selectList("artistList", cri);
	}

	@Override
	public int listCount(Criteria cri) {
		return sqlSession.selectOne("listCount", cri);
	}

	// 아티스트 수정 페이지 이동
	@Override
	public ArtistDTO detail(int artist_order) {
		return sqlSession.selectOne("admin.selectOne", artist_order);
	}
	
	// 아티스트 수정
	@Override
	public int artistUpdate(ArtistDTO artistDTO) {
		int res = 0;
		
		try {
			res = sqlSession.update("artistUpdate", artistDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	// ARTIST MAX ID 조회
	@Override
	public ArtistDTO artistMaxId(ArtistDTO artistDTO) {
		return sqlSession.selectOne("artistMaxId", artistDTO);
	}
	
	// 아티스트 추가
	@Override
	public void artistInsert(ArtistDTO artistDTO) throws Exception {
		sqlSession.insert("artistInsert", artistDTO);
	}
	
	// 첨부파일 업로드
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		sqlSession.insert("insertFile", map);
		
	}
	
	// 첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		return sqlSession.selectList("selectFileList", bno);
	}
	
	// 아티스트 삭제
	@Override
	public int artistDelete(int artist_order) {
		int res = sqlSession.delete("artistDelete", artist_order);
		return res;
	}

	// 아티스트 찜 저장
	@Override
	public void likeUp(Map<String, Object> data) {
		sqlSession.insert("likeUp", data);
		
	}

	// 아티스트 찜 삭제
	@Override
	public void likeDown(Map<String, Object> data) {
		sqlSession.delete("likeDown", data);
		
	}





}
