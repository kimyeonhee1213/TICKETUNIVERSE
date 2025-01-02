package pr.ticket.universe.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import pr.ticket.universe.model.performance.dto.PerformanceDTO;
import pr.ticket.universe.service.categorydetail.CategoryDetailService;
import pr.ticket.universe.service.performance.PerformanceService;

@Controller
@RequestMapping("perform/*")
public class PerformController {
	
	@Inject
	PerformanceService performanceService;
	
	@Inject
	CategoryDetailService categoryDetailService;
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//카테고리 분류 1차
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String getList(@RequestParam("category_id") String category_id, @RequestParam("sub") String sub, Model model) {
		List<PerformanceDTO> list = categoryDetailService.list(category_id, sub);
		model.addAttribute("list", list);
		return "perform/perform_list";
	}
	
   // 게시물 상세 페이지로 이동
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String getdetail(Model model, int pf_order) {
    	PerformanceDTO data = performanceService.detail(pf_order); 
    	model.addAttribute("data", data);
       return "perform/perform_detail";
    }
}
