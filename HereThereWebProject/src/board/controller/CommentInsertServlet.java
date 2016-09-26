package board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import board.model.service.BoardService;
import board.model.vo.Comment;

/**
 * Servlet implementation class CommentInsertServlet
 */
@WebServlet("/cmInsert")
public class CommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				System.out.println("ddd");
				int bno = Integer.parseInt(request.getParameter("bno"));
				String writer = request.getParameter("writer");
				System.out.println(writer);
				String comment = request.getParameter("comment");		
				
				Comment cmt = new Comment(bno, writer, comment);
				
				int result = new BoardService().insertComment(cmt);
				JSONObject job = new JSONObject();
				if(result > 0){
					job.put("writer", writer);
					job.put("comment", comment);		
				}		
				//System.out.println(job.toJSONString());
				response.setContentType("application/json: charset=utf-8"); 
				PrintWriter out = response.getWriter();
				out.print(job.toJSONString());
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
