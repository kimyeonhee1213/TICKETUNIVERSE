package pr.ticket.universe.model.admin.dao;

import java.util.List;
import java.util.Map;


import pr.ticket.universe.model.artist.dto.ArtistDTO;
import pr.ticket.universe.model.paging.dto.Criteria;

public interface AdminDAO {
	
	public List<ArtistDTO> list(Criteria cri) throws Exception;
	
	public int listCount(Criteria cri);
	
	// 아티스트 수정 페이지 이동
	public ArtistDTO detail(int artist_order);
	
	// 아티스트 수정
	public int artistUpdate(ArtistDTO artistDTO);
	
	// ARTIST MAX ID 조회
	public ArtistDTO artistMaxId(ArtistDTO artistDTO);
	
	// 아티스트 추가
	public void artistInsert(ArtistDTO artistDTO) throws Exception;
	
	// 첨부파일 업로드
	public void insertFile(Map<String, Object> map) throws Exception;
	
	// 첨부파일 조회
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;
	
	// 아티스트 삭제
	public int artistDelete(int artist_order);
	
	// 아티스트 찜 저장
	public void likeUp(Map<String, Object> data);
	
	// 아티스트 찜 삭제
	public void likeDown(Map<String, Object> data);
	
}
