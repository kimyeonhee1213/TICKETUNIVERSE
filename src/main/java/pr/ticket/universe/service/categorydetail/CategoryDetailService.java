package pr.ticket.universe.service.categorydetail;

import java.util.List;

import pr.ticket.universe.model.performance.dto.PerformanceDTO;

public interface CategoryDetailService {

	List<PerformanceDTO> list(String category_id, String sub);

}
