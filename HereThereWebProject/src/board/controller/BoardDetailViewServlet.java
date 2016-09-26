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
import board.model.vo.Comment;
import board.model.vo.Picture;

/**
 * Servlet implementation class BoardDetailViewServlet
 */
@WebServlet("/BoardDetailView")
public class BoardDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시판jsp에서 세부정보를 보기위해 게시물 제목 클릭시 작동되는 servlet
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		System.out.println(boardNo);
		
		Board board = new BoardService().selectOne(boardNo);
		ArrayList<Comment> list = new BoardService().selectAllCm(boardNo);
		
		RequestDispatcher view = null;
		if(board != null){
			view = request.getRequestDispatcher("board/boardDetailView.jsp");
			request.setAttribute("board", board);
			request.setAttribute("cmlist", list);
			view.forward(request, response);
		}else{
			view = request.getRequestDispatcher("board/boardError.jsp");
			request.setAttribute("code", "bdView");
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
