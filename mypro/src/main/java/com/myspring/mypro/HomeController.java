package com.myspring.mypro;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.myspring.mypro.VO.MemberVO;
import com.myspring.mypro.service.HomeService;


@Controller
public class HomeController extends MultiActionController implements HomeControllerImpl{
	
	@Autowired
	private HomeService HomeService; 
	
	@Autowired
	MemberVO memberVO;
	
	//단순 site 구동용 코드
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView(viewName);
		
		return mav;
	}
	@RequestMapping(value="/planning", method=RequestMethod.GET)
	public ModelAndView planning(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView(viewName);
		
		return mav;
	}
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView(viewName);
		
		return mav;
	}
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public ModelAndView signup(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView(viewName);
		
		return mav;
	}
	@RequestMapping(value="/notice", method=RequestMethod.GET)
	public ModelAndView notice(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView(viewName);
		
		return mav;
	}	
	@RequestMapping(value="/popup", method=RequestMethod.GET)
	public ModelAndView popup(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView(viewName);
		
		return mav;
	}
	
	// site구동 + 로직구동
	@RequestMapping(value="/listMembers.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String viewName = getViewName(request);
		
		logger.info(viewName);
		logger.debug(viewName);
		
		List membersList = HomeService.listMembers();
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList", membersList);		
		
		return mav;
	}
	
	@RequestMapping(value="/addMember.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView addMember(@ModelAttribute("info") MemberVO memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		int addMember = HomeService.addMember(memberVO);
		
		// 3. ����Ʈ �������� �̵�
		request.setAttribute("signup", true);
		
		ModelAndView mav = new ModelAndView("redirect:/main.do");	
		
		return mav;
	}
	
	@RequestMapping(value="/delMember.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView delMember(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// 1. request �����´�.
		System.out.println("id = "+ id);
		
		// 2. memberService�� �޼��带 �߰� �Ѵ�.
		HomeService.delMember(id);
		
		// 3. ����Ʈ �������� �̵�
		ModelAndView mav = new ModelAndView("redirect:/listMembers.do");
		
		return mav;
	}
	
	@RequestMapping(value="/login", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView login(@ModelAttribute("member") MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView(viewName);
		
		memberVO = HomeService.login(member);
		
		if(memberVO!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", memberVO);
			session.setAttribute("isLogOn", true);
			
			mav.setViewName("redirect:/main.do");
			
			logger.info("not null");
			
		}else {
			logger.info("null");
			mav.setViewName("redirect:/main.do");
		}
		
		return mav;
	}

	@RequestMapping(value="/logout.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		// session ���� ���ֱ�
		session.removeAttribute("member"); 
		session.removeAttribute("isLogOn");
		
		mav.setViewName("redirect:/main.do");
		
		return mav;
	}
	
	// getViewName
	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		
		System.out.println("contextPath :: "+ contextPath);
		
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		// http://localhost:8090/member/listMember.do�� ��û��
		int begin = 0; //
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length(); // ��ü ��û�� �� ���̸� ����
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";"); // ��û uri�� ';'�� ���� ��� ';'���� ��ġ�� ����
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?"); // ��û uri�� '?'�� ���� ��� '?' ���� ��ġ�� ����
		} else {
			end = uri.length();
		}

		// http://localhost:8090/member/listMember.do�� ��û�� ���� '.do'�� ������
		// http://localhost:8090/member/listMember�� ���� ��,
		// �ٽ� http://localhost:8090/member/listMember���� �������� ù��° '/' ��ġ�� ���� ��, �� ����
		// listMember�� ���Ѵ�.
		String fileName = uri.substring(begin, end);
		if (fileName.indexOf(".") != -1) {
			fileName = fileName.substring(0, fileName.lastIndexOf(".")); // ��û���� �������� ���� '.'�� ��ġ�� ������, '.do' �տ������� ���ڿ���
																			// ����
		}
		if (fileName.lastIndexOf("/") != -1) {
			fileName = fileName.substring(fileName.lastIndexOf("/"), fileName.length()); // ��û���� �������� ���� '/'�� ��ġ�� ������,
																							// '/' ���������� ���ڿ��� ����
		}
		return fileName;
	}

}


