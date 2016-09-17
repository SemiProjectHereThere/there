package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;

/**
 * Servlet implementation class BoardPartByLocServlet
 */
@WebServlet("/BoardPartByLoc")
public class BoardPartByLocServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardPartByLocServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//index 페이지에서 지역별 분류 사진부분을 클릭시 작동하는 servlet
		//게시물jsp에서 카테고리별 분류에서 지역부분 클릭시 같이 사용됨.
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String loc = request.getParameter("loc");
		
		ArrayList<Board> list = new BoardService().selectPartByLoc(loc);
		
		if(list != null){
			//RequestDispatcer를 이용 게시물jsp로 list를 넘김.
		}else{
			//db 불러오기 실패 페이지로 sendRedirect함.
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
