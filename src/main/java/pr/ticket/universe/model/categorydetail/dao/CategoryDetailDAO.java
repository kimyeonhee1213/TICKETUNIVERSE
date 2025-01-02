package pr.ticket.universe.model.categorydetail.dao;

import java.util.List;

import pr.ticket.universe.model.performance.dto.PerformanceDTO;

public interface CategoryDetailDAO {

	List<PerformanceDTO> list(String category_id);

	List<PerformanceDTO> list(String category_id, String sub);

}
