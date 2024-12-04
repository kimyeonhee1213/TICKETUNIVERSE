package pr.ticket.universe.model.main.dao;

import java.util.List;

import pr.ticket.universe.model.main.dto.MainDTO;

public interface MainDAO {
	// 전체 공연 목록
	public List<MainDTO> mainList(MainDTO mainDTO);
	
	// 공연예정인 공연 목록
	public List<MainDTO> mainList2(MainDTO mainDTO);
}
