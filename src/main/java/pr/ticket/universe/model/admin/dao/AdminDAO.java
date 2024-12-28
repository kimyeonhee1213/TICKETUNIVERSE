package pr.ticket.universe.model.admin.dao;

import java.util.List;

import pr.ticket.universe.model.artist.dto.ArtistDTO;
import pr.ticket.universe.model.paging.dto.Criteria;

public interface AdminDAO {
	
	public List<ArtistDTO> list(Criteria cri) throws Exception;
	
	public int listCount(Criteria cri);
	
	// 아티스트 수정 페이지 이동
	public ArtistDTO selectOne(int artist_order);
	
	// 아티스트 삭제
	public int artistDelete(int artist_order);
}
