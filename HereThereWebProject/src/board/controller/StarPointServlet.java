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
 * Servlet implementation class StarPointServlet
 */
@WebServlet("/starstar")
public class StarPointServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StarPointServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		//파라미터
		int starpoint = Integer.parseInt(request.getParameter("score"));
		//String starpoint = request.getParameter("star");
		int starbno = Integer.parseInt(request.getParameter("starbno"));
		String starww = request.getParameter("starww");
		
		//System.out.println(starpoint + "," + starbno + ", " + starww);
		
		/*Board boardgom = new Board(starbno, starww);
		int resultgom = new BoardService().gomStarPt(boardgom);*/

		Board board = new Board(starbno, starpoint, starww);
		int result = new BoardService().insertStarPt(board);
		
		Board board1 = new Board(starbno);
		int point = new BoardService().pointgo(board1);

		if(result > 0){
			response.sendRedirect("BoardDetailView?boardNo=" + starbno);
		
		}else{
			response.sendRedirect("BoardDetailView?boardNo=" + starbno);
			

			
			//RequestDispatcher error = request.getRequestDispatcher("board/boardError.jsp");
			//request.setAttribute("gom", "no");
			//error.forward(request, response);
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
