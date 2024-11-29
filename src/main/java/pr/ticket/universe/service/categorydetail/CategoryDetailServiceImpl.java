package pr.ticket.universe.service.categorydetail;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import pr.ticket.universe.model.categorydetail.dao.CategoryDetailDAO;

@Service
public class CategoryDetailServiceImpl implements CategoryDetailService {
	@Inject
	CategoryDetailDAO categoryDetailDao;
}
