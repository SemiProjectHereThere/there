package board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import board.model.service.BoardService;
import board.model.vo.Board;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MyBoardListServlet
 */
@WebServlet("/MyBoardList")
public class MyBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyBoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 마이페이지에서 전체보기부분 클릭시 작동하는 servlet
		
				request.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");
				String memberId = request.getParameter("memberId");
				String mySelect = request.getParameter("mySelect");
				//System.out.println(mySelect + ", " + memberId);
				
				ArrayList<Board>list = null;
				Member member = null;
				
				switch(mySelect){
				case "0":list = new BoardService().selectAll(memberId);
						 member = new MemberService().selectOne(memberId);break;
				case "1":list = new BoardService().selectFavorite(memberId); 
						 member = new MemberService().selectOne(memberId); break;
				case "2":list = new BoardService().selectMine(memberId); 
						 member = new MemberService().selectOne(memberId); break;
				}
				
				RequestDispatcher view = null;
				if(list != null){
					view = request.getRequestDispatcher("myInfo?memberid="+memberId);
					request.setAttribute("list", list);
					request.setAttribute("member", member);
					request.setAttribute("mySelect", mySelect);
					view.forward(request, response);
				}else{
					view = request.getRequestDispatcher("myInfo?memberid="+memberId);
					request.setAttribute("list", list);
					request.setAttribute("member", member);
					view.forward(request, response);
					/*view = request.getRequestDispatcher("board/boardError.jsp");
					request.setAttribute("code", "mylist");
					view.forward(request, response);*/
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
