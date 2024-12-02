package pr.ticket.universe.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pr.ticket.universe.model.users.dao.UsersDAO;
import pr.ticket.universe.model.users.dto.UsersDTO;
import pr.ticket.universe.service.users.UsersService;

@Controller
@RequestMapping("users/*")
public class UsersController {
	
	@Inject
	UsersService userService;
	UsersDAO userDao;
	
	//로그인 페이지 이동
	@RequestMapping("login.do")
	public String login() {
		return "users/login";
	}
	
	// 로그인 처리
	@RequestMapping("loginCheck.do")
	public ModelAndView login_check(@ModelAttribute UsersDTO dto, HttpSession session) {
		//로그인이 성공 true, 실패 false
		boolean result = userService.loginCheck(dto, session);
		ModelAndView mav = new ModelAndView();
		if(result == true) {
			//성공인 경우
			mav.setViewName("main");
			mav.addObject("message", "success");
			System.out.println("로그인 성공");
		}else {
			mav.setViewName("users/login");
			//뷰에 전달할 값
			mav.addObject("message", "error");
			System.out.println("로그인 실패");
		}
		return mav;
	}
	
	//로그아웃 처리
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session) {
		userService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("users/login");
		mav.addObject("msg","logout");
		return mav;
	}
	
}
