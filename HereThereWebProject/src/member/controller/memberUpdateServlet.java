package member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.dao.MemberDao;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class memberUpdateServlet
 */
@WebServlet("/mupdate")
public class memberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원 정보 수정 처리용 컨트롤러
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String memberId= request.getParameter("mbid");
		String memberPwd = request.getParameter("mbpwd");
		String memberName = request.getParameter("mbname");
		String email = request.getParameter("email");
		char gender = request.getParameter("gender").charAt(0);
		Date birthday = Date.valueOf(request.getParameter("birthdate"));
		String phone = request.getParameter("phone");
		
		
		//전송된 값이 2개 이상이면, 객체에 저장함
		Member member = new Member(memberId, memberPwd, memberName, email, gender, birthday, phone);
		
		int result = new MemberService().memberUpdate(member);
		
		if(result > 0){
			response.sendRedirect("index.jsp");
		}else{
			RequestDispatcher error = request.getRequestDispatcher("member/memberError.jsp");
			request.setAttribute("code", "mupdate");
			error.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
