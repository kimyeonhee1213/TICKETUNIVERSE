package pr.ticket.universe.controller;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pr.ticket.universe.model.artist.dto.ArtistDTO;
import pr.ticket.universe.model.paging.dto.Criteria;
import pr.ticket.universe.model.paging.dto.PageMaker;
import pr.ticket.universe.service.admin.AdminService;

@Controller
@RequestMapping("admin/*")
public class AdminController {
	
	@Inject
	AdminService adminService;
	
	// 아티스트 관리 페이지 이동
	@RequestMapping("adminArtist.do")
	public ModelAndView adminArtist(ArtistDTO artistDTO, ModelAndView mv, Criteria cri) throws Exception {
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(adminService.listCount(cri)); // 총 아티스트 수 셋팅
		
		// view에 페이징 처리를 위한 조건 및 그에 맞는 리스트 전송
		mv.addObject("pageMaker", pageMaker);
		mv.addObject("data", adminService.list(cri));
		
		mv.setViewName("admin/admin_artist");
		
		return mv;
	}
	
	// 아티스트 수정 페이지 이동
	@RequestMapping("adminArtistUpdatePage.do")
	public String artistUpdatePage(Model model, int artist_order) {
		
		model.addAttribute("artistDTO", adminService.selectOne(artist_order));
		
		return "admin/admin_artistUpdate";
	}
	
	// 아티스트 삭제
	@RequestMapping("artistDelete.do")
	public String artistDelete(int artist_order) throws Exception {
		
		adminService.artistDelete(artist_order);
		
		return "redirect:adminArtist.do";
	}
	
}
