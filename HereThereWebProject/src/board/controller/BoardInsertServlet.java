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
		String content = request.getParameter("content");
		String mapinfo = request.getParameter("xy");
		
		ArrayList<String> x = new ArrayList<String>();
		ArrayList<String> y = new ArrayList<String>();
		String mapArr[] = mapinfo.split("/");
		for(int i=0; i<mapArr.length; i++){
			x.add(mapArr[i].substring(mapArr[i].indexOf("(")+1, mapArr[i].indexOf(",")));
			y.add(mapArr[i].substring(mapArr[i].indexOf(",")+1, mapArr[i].indexOf(")")));
		}
		
		
		
		System.out.println(title + "," + id + "," + location + "," + category + "," + content + "," + mapinfo);
		
		Board board = new Board();
		int result = new BoardService().insertBoard(board);
		
		if(result > 0){
			//성공시 게시판 리스트로 sendRedirect
		}else{
			//실패시 RequestDispatcher
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
