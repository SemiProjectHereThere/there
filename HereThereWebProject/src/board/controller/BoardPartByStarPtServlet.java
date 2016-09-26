package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;

/**
 * Servlet implementation class BoardPartByStarPtServlet
 */
@WebServlet("/BoardPartByStarPt")
public class BoardPartByStarPtServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardPartByStarPtServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시물페이지에서 별점별 분류부분을 클릭시 작동하는 servlet
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String location = request.getParameter("location");
		String category = request.getParameter("category");
		
		ArrayList<Board> list = null;
		switch(category){
		case "0" : list = new BoardService().selectPartByStarPt(); break;
		default : Board board = new Board(category, location);
				list = new BoardService().selectPartByStarPt(board); break;
		}
		
		//ArrayList<Board> list = new BoardService().selectPartByStarPt();
		
		if(list != null){
			//RequestDispatcer를 이용 게시물jsp로 list를 넘김.
			RequestDispatcher view = request.getRequestDispatcher("board/boardView.jsp");
			request.setAttribute("list", list);
			request.setAttribute("location", location);
			request.setAttribute("category", category);
			view.forward(request, response);
		}else{
			//db 불러오기 실패 페이지로 sendRedirect함.
			RequestDispatcher view = request.getRequestDispatcher("board/boardView.jsp");
			request.setAttribute("list", list);
			request.setAttribute("location", location);
			request.setAttribute("category", category);
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
