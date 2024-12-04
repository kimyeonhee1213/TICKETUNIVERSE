package pr.ticket.universe.service.main;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import pr.ticket.universe.model.main.dao.MainDAOImpl;
import pr.ticket.universe.model.main.dto.MainDTO;

@Service
public class MainServiceImpl implements MainService {

	@Inject
	MainDAOImpl mainDao;
	
	@Override
	public List<MainDTO> mainList(MainDTO mainDTO) {
		return mainDao.mainList(mainDTO);
	}

	@Override
	public List<MainDTO> mainList2(MainDTO mainDTO) {
		return mainDao.mainList2(mainDTO);
	}

}
