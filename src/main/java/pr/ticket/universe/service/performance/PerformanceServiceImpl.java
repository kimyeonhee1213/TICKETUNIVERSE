package pr.ticket.universe.service.performance;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import pr.ticket.universe.model.performance.dao.PerformanceDAO;
import pr.ticket.universe.model.performance.dto.PerformanceDTO;

@Service
public class PerformanceServiceImpl implements PerformanceService {
	
	@Inject
	PerformanceDAO performanceDao;

	@Override
	public PerformanceDTO detail(int pf_order) {
		return performanceDao.detail(pf_order);
	}
}
