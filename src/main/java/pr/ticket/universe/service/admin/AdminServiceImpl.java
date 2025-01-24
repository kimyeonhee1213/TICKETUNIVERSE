package pr.ticket.universe.service.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import pr.ticket.universe.model.admin.dao.AdminDAOImpl;
import pr.ticket.universe.model.artist.dto.ArtistDTO;
import pr.ticket.universe.model.paging.dto.Criteria;
import pr.ticket.universe.util.FileUtils;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	AdminDAOImpl adminDao;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	@Override
	public List<ArtistDTO> list(Criteria cri) throws Exception {
		return adminDao.list(cri);
	}

	@Override
	public int listCount(Criteria cri) throws Exception {
		return adminDao.listCount(cri);
	}
	
	// 아티스트 수정 페이지 이동
	@Override
	public ArtistDTO detail(int artist_order) {
		return adminDao.detail(artist_order);
	}
	
	// 아티스트 수정
	@Override
	public int artistUpdate(ArtistDTO artistDTO) {
		return adminDao.artistUpdate(artistDTO);
	}
	
	// ARTIST MAX ID 조회
	@Override
	public ArtistDTO artistMaxId(ArtistDTO artistDTO) {
		return adminDao.artistMaxId(artistDTO);
	}
	
	// 아티스트 추가
	@Override
	public void artistInsert(ArtistDTO artistDTO, MultipartHttpServletRequest mpRequest) throws Exception {
		adminDao.artistInsert(artistDTO);

		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(artistDTO, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			adminDao.insertFile(list.get(i));
		}
	}

	// 아티스트 삭제
	@Override
	public int artistDelete(int artist_order) {
		return adminDao.artistDelete(artist_order);
	}

	// 아티스트 찜 저장
	@Override
	public void likeUp(String userId, String artistId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("artistId", artistId);
		System.out.println("좋아요 =================== " + map);
		adminDao.likeUp(map);
	}

	// 아티스트 찜 삭제
	@Override
	public void likeDown(String userId, String artistId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("artistId", artistId);
		adminDao.likeDown(map);
	}

	// 첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		return adminDao.selectFileList(bno);
	}




}
