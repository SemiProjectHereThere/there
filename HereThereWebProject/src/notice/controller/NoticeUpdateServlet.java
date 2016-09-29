package notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet("/nupdate")
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 공지글 수정 처리용 컨트롤러
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int noticeNo = Integer.parseInt(request.getParameter("noticeno"));
		String noticeTitle = request.getParameter("title");
		String noticeContent = request.getParameter("upsmart");
		String userName = request.getParameter("username");
		String userId = request.getParameter("userid");
		String managerYN = request.getParameter("manageryn");
		int pg = Integer.parseInt(request.getParameter("pg"));
		System.out.println(pg);
		
		Notice notice = new Notice(noticeNo, noticeTitle, noticeContent);
		int result = new NoticeService().updateNotice(notice);
		
		if(result > 0){
			RequestDispatcher view = request.getRequestDispatcher("nlist");
			request.setAttribute("userid", userId);
			request.setAttribute("pg", pg);
			request.setAttribute("username", userName);
			request.setAttribute("manageryn", managerYN);
			view.forward(request, response);
			
		}else{
			RequestDispatcher view = request.getRequestDispatcher("notice/noticeError.jsp");
			request.setAttribute("code", "nupdate");
			view.forward(request, response);
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
