package pr.ticket.universe.controller;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public ModelAndView adminArtist(ArtistDTO artistDTO, ModelAndView mv, Criteria cri, HttpSession session)
			throws Exception {

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(adminService.listCount(cri)); // 총 아티스트 수 셋팅

		// view에 페이징 처리를 위한 조건 및 그에 맞는 리스트 전송
		mv.addObject("pageMaker", pageMaker);
		mv.addObject("data", adminService.list(cri));

		// session에 있는 id값 가져오기
		String userId = (String) session.getAttribute("user_id");
		System.out.println("userId=====================" + userId);
		mv.addObject("userId", userId);
		
		mv.setViewName("admin/admin_artist");

		return mv;
	}
	
	// 아티스트 디테일 페이지 이동(회원)
	@RequestMapping("adminArtistDetailPage.do")
	public String artistDetailPage(Model model, int artist_order) {

		/* model.addAttribute("artistDTO", adminService.selectOne(artist_order)); */
		ArtistDTO data = adminService.detail(artist_order);
		model.addAttribute("data", data);

		return "admin/admin_artistDetail";
	}

	// 아티스트 수정 페이지 이동(관리자)
	@RequestMapping("adminArtistUpdatePage.do")
	public String artistUpdatePage(Model model, int artist_order) {

		/* model.addAttribute("artistDTO", adminService.selectOne(artist_order)); */
		ArtistDTO data = adminService.detail(artist_order);
		model.addAttribute("data", data);

		return "admin/admin_artistUpdate";
	}

	// 아티스트 수정
	@RequestMapping("artistUpdate.do")
	public String artistUpdate(ArtistDTO artistDTO, RedirectAttributes ra) {

		int result = adminService.artistUpdate(artistDTO);

		if (result > 0) {
			ra.addFlashAttribute("alertMsg", "수정되었습니다.");
			return "redirect:adminArtistUpdatePage.do?artist_order=" + artistDTO.getArtist_order();
		} else {
			ra.addFlashAttribute("alertMsg", "수정 실패하였습니다.");
			return "redirect:adminArtistUpdatePage.do";
		}

	}

	// 아티스트 추가 페이지 이동
	@RequestMapping("artistInsertPage.do")
	public ModelAndView artistInsertPage(ArtistDTO artistDTO, ModelAndView mv) {
		mv.addObject("data", adminService.artistMaxId(artistDTO));
		mv.setViewName("admin/admin_artistInsert");

		return mv;
	}

	// 아티스트 추가
	@RequestMapping("artistInsert.do")
	public String artistInsert(ArtistDTO artistDTO, MultipartHttpServletRequest mpRequest) throws Exception {

		adminService.artistInsert(artistDTO, mpRequest);

		return "redirect:adminArtist.do";
	}

	// 아티스트 삭제
	@RequestMapping("artistDelete.do")
	public String artistDelete(int artist_order, RedirectAttributes ra) throws Exception {

		int result = adminService.artistDelete(artist_order);

		if (result > 0) {
			ra.addFlashAttribute("alertMsg", "삭제되었습니다.");
			return "redirect:adminArtist.do";
		} else {
			ra.addFlashAttribute("alertMsg", "삭제 실패하였습니다.");
			return "redirect:adminArtist.do";
		}

	}

	// 아티스트 찜
	@RequestMapping(value="likeUp.do", method=RequestMethod.POST)
	@ResponseBody
	public void likeUp(@RequestBody HashMap<String, Object> map) {
		
		String userId = (String) map.get("userId");
		String artistId = (String) map.get("artistId");
		
		adminService.likeUp(userId, artistId);
	}
	
	// 아티스트 찜 삭제
	@RequestMapping(value="likeDown.do", method=RequestMethod.POST)
	@ResponseBody
	public void likeDown(@RequestBody HashMap<String, Object> map) {
		
		String userId = (String) map.get("userId");
		String artistId = (String) map.get("artistId");
		
		adminService.likeDown(userId, artistId);
	}
	
}
