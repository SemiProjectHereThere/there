package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;



/**
 * Servlet implementation class MemberSearchServlet
 */
@WebServlet("/MemberSearch")
public class MemberSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String search = request.getParameter("search");		// 검색종류
		String keyword = request.getParameter("keyword");	// 검색명	
		String userId = request.getParameter("userid");
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		ArrayList<Member> list = null;
		if(search.equals("id")){
			list = new MemberService().selectId(keyword);
		}else {
			list = new MemberService().selectName(keyword);
		}
	
		RequestDispatcher view = null;
		if(list != null){
			view = request.getRequestDispatcher("admin/adminMemberListView.jsp");
			request.setAttribute("list", list);
			request.setAttribute("userid", userId);
			request.setAttribute("pg", pg);
			view.forward(request, response);
		}else{
			
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
