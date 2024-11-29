package pr.ticket.universe.service.dibs;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import pr.ticket.universe.model.dibs.dao.DibsDAO;

@Service
public class DibsServiceImpl implements DibsService {
	@Inject
	DibsDAO dibsDao;
}
