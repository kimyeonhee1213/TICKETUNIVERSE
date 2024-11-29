package pr.ticket.universe.service.performance;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import pr.ticket.universe.model.performance.dao.PerformanceDAO;

@Service
public class PerformanceServiceImpl implements PerformanceService {
	
	@Inject
	PerformanceDAO performanceDao;
}
