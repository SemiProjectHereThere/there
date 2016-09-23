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
 * Servlet implementation class NoticeDetailServlet
 */
@WebServlet("/ndetail")
public class NoticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 공지글 상세보기 처리용 컨트롤러
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int noticeNo = Integer.parseInt(request.getParameter("noticeno"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		int endPg = Integer.parseInt(request.getParameter("endpg"));
		
		//조회수 1 증가 처리
		int result = new NoticeService().addReadCount(noticeNo);
		Notice notice = null;
		if(result > 0) // 조회수 1 증가 처리가 성공하면, 공지글 조회함
			notice = new NoticeService().selectOne(noticeNo);
		
		RequestDispatcher view = null;
		if(notice != null){
			view = request.getRequestDispatcher("notice/noticeDetailView.jsp");
			request.setAttribute("notice", notice);
			request.setAttribute("noticeno", noticeNo);
			request.setAttribute("pg", pg);
			request.setAttribute("endpg", endPg);
			view.forward(request, response);
		}else{
			//공지글 상세보기 에러페이지
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
