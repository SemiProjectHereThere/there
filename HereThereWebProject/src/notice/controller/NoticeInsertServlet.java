package notice.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeInsertServlet
 */
@WebServlet("/ninsert")
public class NoticeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 새 공지글 등록 처리용 컨트롤러
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String noticeTitle = request.getParameter("title");
		String noticeWriter = request.getParameter("userid");
		String noticeContent = request.getParameter("smarteditor");
		String userName = request.getParameter("username");
		String managerYN = request.getParameter("manageryn");
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		Notice notice = new Notice(noticeWriter, noticeTitle, noticeContent);
		int result = new NoticeService().insertNotice(notice);
		
		if(result > 0){
			RequestDispatcher view = request.getRequestDispatcher("nlist");
			request.setAttribute("username", userName);
			request.setAttribute("manageryn", managerYN);
			request.setAttribute("userid", noticeWriter);
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
