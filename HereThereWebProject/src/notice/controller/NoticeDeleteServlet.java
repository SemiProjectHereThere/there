package notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;

/**
 * Servlet implementation class NoticeDeleteServlet
 */
@WebServlet("/ndelete")
public class NoticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 공지글 삭제 처리용 컨트롤러
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int noticeNo = Integer.parseInt(request.getParameter("noticeno"));
		String[] noticeNoS = request.getParameterValues("delete");
		int pg = Integer.parseInt(request.getParameter("pg"));
		String userId = request.getParameter("userid");
		String userName = request.getParameter("username");
		String managerYN = request.getParameter("manageryn");
		
		int result1 = new NoticeService().noticeDelete(noticeNo);
		int result2 = new NoticeService().noticesDelete(noticeNoS);
		
		if(result1 > 0 || result2 > 0){
			RequestDispatcher view = request.getRequestDispatcher("nlist");
			request.setAttribute("userid", userId);
			request.setAttribute("pg", pg);	
			request.setAttribute("username", userName);
			request.setAttribute("mangeryn", managerYN);
			view.forward(request, response);
		}else{
			//에러
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
