package board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import board.model.service.BoardService;
import board.model.vo.Board;

/**
 * Servlet implementation class MyBoardPartByFavoriteServlet
 */
@WebServlet("/MyBoardPartByFavorite")
public class MyBoardPartByFavoriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyBoardPartByFavoriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 마이페이지에서 찜한게시물부분 클릭시 작동하는 servlet
		
		String memberId = request.getParameter("memberid");
				
				ArrayList<Board> list = new BoardService().selectFavorite(memberId);
				/*Iterator iter = list.iterator();
				for(Board b : list){
					while(iter.hasNext()){
						System.out.println(iter.next());
					}
				}*/

				//전송할 최종 json 객체
				JSONObject json = new JSONObject();
				JSONArray jarr = new JSONArray();
				
				
				for(Board b : list){
					//하나의 게시물 정보를 저장할 json 객체
					JSONObject job = new JSONObject();
					job.put("bdNo", b.getBdNo());
					job.put("bdTitle", URLEncoder.encode(b.getBdTitle(), "UTF-8"));
					job.put("bdContent", URLEncoder.encode(b.getBdContent(), "UTF-8"));
					job.put("bdWriter", b.getBdWriter());
					job.put("bdEnrolldate", b.getBdEnrollDate().toString());
					job.put("bdCategory", b.getBdCategory());
					job.put("bdLocation", b.getBdLocation());
					job.put("bdCount", b.getBdReadCnt());
					job.put("bdCommentCnt", b.getBdCommentCnt());
					job.put("bdStar", b.getBdStarPt());
					job.put("bdSingo", b.getBdShingoCnt());
					job.put("bdMap", b.getBdMap());
					
					jarr.add(job);
				}
				
				json.put("list", jarr);
				//System.out.println(json.toJSONString());
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
