package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class MembersDeleteServlet
 */
@WebServlet("/MembersDelete")
public class MembersDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MembersDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
	
		String userId = request.getParameter("userid");
		int pg = Integer.parseInt(request.getParameter("pg"));
		String[] mbId = request.getParameterValues("delete");
		String[] yn = request.getParameterValues("manager");
		
		int result1 = new MemberService().memberModifyYN(yn);
		int result2 = new MemberService().membersDelete(mbId);
		
		
		RequestDispatcher view = null;
		if(result1 > 0 || result2 > 0){
			view = request.getRequestDispatcher("mall");
			request.setAttribute("userid", userId);
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
