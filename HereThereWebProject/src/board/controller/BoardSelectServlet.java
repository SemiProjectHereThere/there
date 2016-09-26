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
 * Servlet implementation class BoardSelectServlet
 */
@WebServlet("/boardselect")
public class BoardSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// boardselect servlet BoardView 에서 넘어온 value 값 추출
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		//파라미터 부분
		String location = request.getParameter("boardVLocation");
		String category = request.getParameter("boardVCategory");
		//System.out.println(location + "location" + ", " + category + "category");
		
		ArrayList<Board> list = null;
		/*if(category == "0"){
			System.out.println("hi");
		}*/
			/*Board board = new Board(location);
			list = new BoardService().selectABoard(board);
			System.out.println(list + "if");*/
		//}else{
			//System.out.println(list + "else");
		Board board = null;
		switch(category){
		case "0" :  board = new Board(location);
					list = new BoardService().selectABoard(board); break;
		default : board = new Board(location, category);
					list = new BoardService().selectBoard(board); break;
		}
			//----Board board = new Board(category, location);
			//System.out.println(board);
			/*ArrayList<Board>*/ //----list = new BoardService().selectBoard(board);
			//System.out.println(list);
		//}
		
		if(list != null){
			RequestDispatcher view = request.getRequestDispatcher("board/boardView.jsp");
			request.setAttribute("list", list);
			request.setAttribute("location", location);
			request.setAttribute("category", category);
			view.forward(request, response);
		}else{
			//db 불러오기 실패 페이지로 sendRedirect함.
			switch(location){
			case "0" : list = new BoardService().selectAll(); break;
			//default : list = new BoardService().selectBoard(board); break;
			}
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
