package pr.ticket.universe;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pr.ticket.universe.model.main.dto.MainDTO;
import pr.ticket.universe.service.main.MainService;

@Controller
public class HomeController {
	
	@Inject
	MainService mainService;
	
	@RequestMapping(value = "/", method=RequestMethod.GET)
	public String home(MainDTO mainDTO, Model model) {
		
		List<MainDTO> list = mainService.mainList(mainDTO);
		model.addAttribute("list", list);
		
		List<MainDTO> list2 = mainService.mainList2(mainDTO);
		model.addAttribute("list2", list2);
		
		return "main";
	}
	
}
