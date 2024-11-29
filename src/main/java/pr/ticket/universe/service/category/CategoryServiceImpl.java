package pr.ticket.universe.service.category;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import pr.ticket.universe.model.category.dao.CategoryDAO;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Inject
	CategoryDAO categoryDao;
}
