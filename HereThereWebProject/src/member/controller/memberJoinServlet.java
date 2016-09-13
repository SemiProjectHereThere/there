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
 * Servlet implementation class memberJoinServlet
 */
@WebServlet("/mjoin")
public class memberJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberJoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원 가입 처리용 컨트롤러
				//1. 전송값에 한글이 있을 경우, 문자 인코딩 처리
				request.setCharacterEncoding("utf-8");
				//2. 클라이언트로 보낼 정보에 한글이 포함되어 있을 경우도 인코딩 처리함
				response.setContentType("text/html; charset=utf-8");
				
				//3. 전송값 꺼내서 변수에 저장하기
				String memberId = request.getParameter("mbid");
				String memberPwd = request.getParameter("mbpwd");
				String memberName = request.getParameter("mbname");
				String email = request.getParameter("email");
				char gender = request.getParameter("gender").charAt(0);
				Date birthday = Date.valueOf(request.getParameter("birthdate"));
				String phone = request.getParameter("phone");
				
				
				//전송된 값이 2개 이상이면, 객체에 저장함
				Member member = new Member(memberId, memberPwd, memberName, email, gender, birthday, phone);
				
				//4. dao 객체 메소드 실행하고 결과 받음
				int result = new MemberService().memberInsert(member);
				
				//5. 받은 결과에 따라 뷰 선택해서 내보냄
				if(result > 0){
					response.sendRedirect("index.jsp");
				}else{
					//response.sendRedirect("member/memberError.jsp");
					RequestDispatcher rd = request.getRequestDispatcher("member/memberError.jsp");
					request.setAttribute("code", "mjoin");
					rd.forward(request, response);
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
