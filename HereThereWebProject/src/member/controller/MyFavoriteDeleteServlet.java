package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class MyFavoriteDeleteServlet
 */
@WebServlet("/myFavoDel")
public class MyFavoriteDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyFavoriteDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String memberId = request.getParameter("memberId");
		String[] bdnos = request.getParameterValues("myFavoDels");
		/*for(int i = 0; i < bdnos.length; i++){
			System.out.println(bdnos[i]);
		}
		int[] boardNo = new int[bdnos.length];
		
		for(int i = 0; i<bdnos.length; i++){
		     boardNo[i] = Integer.parseInt(bdnos[i]);
		}*/
		
		int result = new MemberService().myFavoriteDelete(memberId, bdnos);
		
		RequestDispatcher view = null;
		if(result > 0){
			view = request.getRequestDispatcher("MyBoardList?memberId="+memberId+"&mySelect=1");
			view.forward(request, response);
		}else{
			view = request.getRequestDispatcher("board/boardError.jsp");
			request.setAttribute("code", "favoriteDel");
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
