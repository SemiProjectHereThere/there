package board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.*;

import board.model.service.BoardService;
import board.model.vo.Comment;

/**
 * Servlet implementation class CommentListServlet
 */
@WebServlet("/cmList")
public class CommentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		ArrayList<Comment> list = new BoardService().selectAllCm(boardNo);
		
		//전송할 최종 json 객체
				JSONObject json = new JSONObject();
				JSONArray jarr = new JSONArray();
				
				for(Comment c : list){
					//한 사람의 정보를 저장할 json 객체
					JSONObject job = new JSONObject();
					job.put("writer", c.getCmWriter());
					//json에서 한글 깨짐을 막으려면, java.net.URLEncoder 클래스의 encode() 메소드로 인코딩 처리
//					job.put("content", URLEncoder.encode(c.getCmContent(), "UTF-8"));
					job.put("content", c.getCmContent());
					job.put("no", c.getCmNo());
					
					jarr.add(job);
				}
				
				json.put("list", jarr);
				response.setContentType("application/json"); 
				PrintWriter out = response.getWriter();
				out.print(json.toJSONString());
				out.flush();
				out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
