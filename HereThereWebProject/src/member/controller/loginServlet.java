package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.dao.MemberDao;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/login")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//전송온 값들 추출
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		
		//추출한 값을 모델로 넘기고 결과를 받음
		Member member = new MemberService().loginCheck(memberId, memberPwd);
		
		//리턴된 결과를 가지고 성공/실패에 대한 뷰를 선택해서 내 보냄
		if(member != null){ //로그인 성공시 
			//세션을 이용해 로그인 상태를 관리할 경우
			HttpSession session = request.getSession(); //새로 생성
			System.out.println("session id : " + session.getId());
			//session.setAttribute("loginName", userName);
			session.setAttribute("member", member);
					
			//response.sendRedirect("member/loginSucess.jsp");
			response.sendRedirect("index.jsp");
		}else{
			//response.sendRedirect("member/memberError.jsp");
			RequestDispatcher rd = request.getRequestDispatcher("member/memberError.jsp");
			request.setAttribute("code", "login");
			rd.forward(request, response);
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
}
