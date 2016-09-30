package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import admin.model.vo.Admin;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class AdminMainModifyServlet
 */
@WebServlet("/AdminMainModify")
public class AdminMainModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMainModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String memberId = request.getParameter("userid");
		String memberName = request.getParameter("username");
		
		Admin admin = new AdminService().selectOne(memberId);
		
		RequestDispatcher view = null;
		if(admin != null){
			view = request.getRequestDispatcher("adminMainModifyView.jsp");
			request.setAttribute("admin", admin);
			request.setAttribute("username", memberName);
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
