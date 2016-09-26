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
 * Servlet implementation class BoardPartByPopularServlet
 */
@WebServlet("/BoardPartByPopular")
public class BoardPartByPopularServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardPartByPopularServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시물페이지에서 인기별별 분류부분을 클릭시 작동하는 servlet
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		
		String location = request.getParameter("location");
		String category = request.getParameter("category");
		System.out.println(category);
		ArrayList<Board> list = null;
		switch(category){
		case "0" : list = new BoardService().selectPartByPopular(); break;
		default : Board board = new Board(category, location);
				list = new BoardService().selectPartByPopular(board); break;
		}
		
		
		
		//System.out.println(location + "location" + ", " + category + "category");
		
		
		
		
		
		if(list != null){
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
