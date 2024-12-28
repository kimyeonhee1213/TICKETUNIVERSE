package pr.ticket.universe.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pr.ticket.universe.model.main.dto.MainDTO;
import pr.ticket.universe.model.users.dao.UsersDAO;
import pr.ticket.universe.model.users.dto.UsersDTO;
import pr.ticket.universe.service.main.MainService;
import pr.ticket.universe.service.users.UsersService;

@Controller
@RequestMapping("users/*")
public class UsersController {
	
	@Inject
	UsersService userService;
	@Inject
	UsersDAO userDao;
	@Inject
	BCryptPasswordEncoder passwordEncoder;
	@Inject
	MainService mainService;
	
	//로그인 페이지 이동
	@RequestMapping("login.do")
	public String login() {
		return "users/login";
	}
	
	// 로그인 처리
	@RequestMapping("loginCheck.do")
	public ModelAndView login_check(@ModelAttribute UsersDTO dto, MainDTO mainDTO, Model model, HttpSession session) {
		
		UsersDTO dto2 = userService.loginCheck(dto.getUser_id());
		ModelAndView mav = new ModelAndView();
		if(dto2 != null) { //id가 일치한다면
			//사용자가 입력한 비밀번호
			String passwd = dto.getPassword();
			//DB에서 가져온 비밀번호
			String db_passwd = dto2.getPassword();
			
			if(passwordEncoder.matches(passwd, db_passwd)) { //비밀번호가 일치하면 로그인
				session.setAttribute("user_id", dto2.getUser_id());
				session.setAttribute("name", dto2.getName());
				session.setAttribute("role", dto2.getRole());
				
				//main list 가져오기
				List<MainDTO> list = mainService.mainList(mainDTO);
				model.addAttribute("list", list);
				List<MainDTO> list2 = mainService.mainList2(mainDTO);
				model.addAttribute("list2", list2);
				
				mav.setViewName("main");
				mav.addObject("message", "success");
			}else { //일치하지 않으면 로그인 실패
				mav.setViewName("users/login"); //뷰에 전달할 값 
				mav.addObject("message", "error");
			}
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
	
	//회원가입 페이지 이동
	@RequestMapping("join.do")
	public String join() {
		return "users/join";
	}
	
	//회원가입 처리
	@RequestMapping("register.do")
	public String joinUser(@ModelAttribute UsersDTO dto, MainDTO mainDTO, Model model) {
		// 평문 비밀번호 암호화
		String cryptEncoderPw = passwordEncoder.encode(dto.getPassword());
		dto.setPassword(cryptEncoderPw);
		userService.joinUser(dto);
		
		//main list 가져오기
		List<MainDTO> list = mainService.mainList(mainDTO);
		model.addAttribute("list", list);
		List<MainDTO> list2 = mainService.mainList2(mainDTO);
		model.addAttribute("list2", list2);
		
		return "main";
	}
	
	//아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	public int idCheck(String user_id) throws Exception{
		int result = userService.idCheck(user_id);
		return result;
	}
	
	//이메일 중복 체크
	@ResponseBody
	@RequestMapping(value = "/emailCheck.do", method = RequestMethod.POST)
	public int emailCheck(String email) throws Exception{
		int result = userService.emailCheck(email);
		return result;
	}

	
	//아이디 찾기 페이지 이동
	@RequestMapping("findId.do")
	public String findId() {
		return "users/find_id";
	}
	
	//비밀번호 찾기 페이지 이동
	@RequestMapping("findPw.do")
	public String findPw() {
		return "users/find_pw";
	}
	
	//아이디 찾기 결과
	@RequestMapping("find_result_id.do")
	public String search_result_id(HttpServletResponse response, Model model, @RequestParam("name") String name,
			@RequestParam("email") String email) throws Exception {
		model.addAttribute("user_id", userService.find_id(response, name, email));
		return "users/find_result_id";
	}
	
	//비밀번호 변경 페이지 이동
	@RequestMapping("find_result_pw.do")
	public String checkInfo(HttpServletResponse response, @RequestParam Map<String, Object> paramMap) throws Exception{
		int result = userService.checkInfo(paramMap);
		if(result == 0) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('일치하는 정보가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		}else {
			return "users/find_result_pw";
		}
	}
	
	@RequestMapping("change_pw.do")
	public String changePw(HttpServletRequest request, @RequestParam Map<String, Object> paramMap) throws Exception {
		int result = userService.changePw(paramMap);
		if(result > 0) {
			request.setAttribute("msg", "비밀번호 변경에 성공했습니다.");
	        request.setAttribute("url", "/users/login.do");
		}else {
			request.setAttribute("msg", "비밀번호 변경에 성공했습니다.");
	        request.setAttribute("url", "/");
		}

		return "users/alert";
	}
	
}
