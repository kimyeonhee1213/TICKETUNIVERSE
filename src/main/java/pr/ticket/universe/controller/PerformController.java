package pr.ticket.universe.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pr.ticket.universe.model.performance.dto.PerformanceDTO;
import pr.ticket.universe.service.performance.PerformanceService;

@Controller
@RequestMapping("perform/*")
public class PerformController {
	
	@Inject
	PerformanceService performanceService;
	
   // 게시물 상세 페이지로 이동
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String getdetail(Model model, int pf_order) {
    	PerformanceDTO data = performanceService.detail(pf_order); 
    	model.addAttribute("data", data);
       return "perform/perform_detail";
    }
}
