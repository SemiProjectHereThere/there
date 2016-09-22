package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.SendResult;

import board.model.service.BoardService;
import board.model.vo.Board;

/**
 * Servlet implementation class BoardInsertServlet
 */
@WebServlet(name = "BoardInsert", urlPatterns = { "/BoardInsert" })
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		//파라미터 부분
		String title = request.getParameter("title");
		String id = request.getParameter("id");
		String location = request.getParameter("location");
		String category = request.getParameter("category");
		String content = request.getParameter("smarteditor");
		String map = request.getParameter("xy");
		
		Board board = new Board(title, content, id, category, location, map);
		int result = new BoardService().insertBoard(board);
		
		if(result > 0){
			response.sendRedirect("index.jsp");
		}else{
			RequestDispatcher error = request.getRequestDispatcher("board/boardError.jsp");
			request.setAttribute("code", "BoardInsert");
			error.forward(request, response);
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
