package notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet("/nlist")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 공지글 전체 조회 처리용 컨트롤러
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		ArrayList<Notice> list = new NoticeService().selectList();
		
		String userId = request.getParameter("userid");
		
		int pg = 0;
		if(request.getParameter("pg") == null){
			pg = (Integer)request.getAttribute("pg");
		}else if(request.getAttribute("pg") == null){
			pg = Integer.parseInt(request.getParameter("pg"));
		}
		
		String userName = (String)request.getParameter("username");
//		String userName = (String)request.getAttribute("username");
		String managerYN = (String)request.getParameter("manageryn");
//		String managerYN = (String)request.getAttribute("manageryn");
		
		RequestDispatcher view = request.getRequestDispatcher("notice/noticeListView.jsp");
		request.setAttribute("list", list);
		request.setAttribute("userId", userId);
		request.setAttribute("pg", pg);
		request.setAttribute("username", userName);
		request.setAttribute("manageryn", managerYN);
		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
