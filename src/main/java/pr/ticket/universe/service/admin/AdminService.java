package pr.ticket.universe.service.admin;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import pr.ticket.universe.model.artist.dto.ArtistDTO;
import pr.ticket.universe.model.paging.dto.Criteria;

public interface AdminService {
	
	List<ArtistDTO> list(Criteria cri) throws Exception;
	
	public int listCount(Criteria cri) throws Exception;
	
	// 아티스트 수정 페이지 이동
	public ArtistDTO detail(int artist_order);
	
	// 아티스트 수정
	public int artistUpdate(ArtistDTO artistDTO);
	
	// ARTIST MAX ID 조회
	public ArtistDTO artistMaxId(ArtistDTO artistDTO);
	
	// 아티스트 추가
	public void artistInsert(ArtistDTO artistDTO, MultipartHttpServletRequest mpRequest) throws Exception;
	
	// 아티스트 삭제
	public int artistDelete(int artist_order);
	
	// 아티스트 찜 저장
	public void likeUp(String userId, String artistId);
	
	// 아티스트 찜 삭제
	public void likeDown(String userId, String artistId);
	
	// 첨부파일 조회
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;
	
}
