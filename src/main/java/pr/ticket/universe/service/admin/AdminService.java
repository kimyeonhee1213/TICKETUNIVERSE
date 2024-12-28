package pr.ticket.universe.service.admin;

import java.util.List;

import pr.ticket.universe.model.artist.dto.ArtistDTO;
import pr.ticket.universe.model.paging.dto.Criteria;

public interface AdminService {
	
	List<ArtistDTO> list(Criteria cri) throws Exception;
	
	public int listCount(Criteria cri) throws Exception;
	
	// 아티스트 수정 페이지 이동
	public ArtistDTO selectOne(int artist_order);
	
	// 아티스트 삭제
	public int artistDelete(int artist_order);
}
