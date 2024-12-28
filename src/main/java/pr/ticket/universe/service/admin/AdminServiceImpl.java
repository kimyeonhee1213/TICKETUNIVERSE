package pr.ticket.universe.service.admin;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import pr.ticket.universe.model.admin.dao.AdminDAOImpl;
import pr.ticket.universe.model.artist.dto.ArtistDTO;
import pr.ticket.universe.model.paging.dto.Criteria;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	AdminDAOImpl adminDao;

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
	public ArtistDTO selectOne(int artist_order) {
		return adminDao.selectOne(artist_order);
	}

	// 아티스트 삭제
	@Override
	public int artistDelete(int artist_order) {
		return adminDao.artistDelete(artist_order);
	}



}
