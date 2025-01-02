package pr.ticket.universe.service.categorydetail;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import pr.ticket.universe.model.categorydetail.dao.CategoryDetailDAO;
import pr.ticket.universe.model.performance.dto.PerformanceDTO;

@Service
public class CategoryDetailServiceImpl implements CategoryDetailService {
	@Inject
	CategoryDetailDAO categoryDetailDao;

	@Override
	public List<PerformanceDTO> list(String category_id, String sub) {
		if(sub.equals("0")) {
			return categoryDetailDao.list(category_id);
		}else {
			return categoryDetailDao.list(category_id, sub);
		}

	}
}
