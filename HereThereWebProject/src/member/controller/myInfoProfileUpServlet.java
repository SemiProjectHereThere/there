package member.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class myInfoProfileUpServlet
 */
@WebServlet("/profileUp")
public class myInfoProfileUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myInfoProfileUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int sizeLimit = 1024 * 1024 * 5;
		
		String savePath = "C:\\Users\\남슬비아\\git\\there\\HereThereWebProject\\Web\\uploadfiles";
		String originalFileName = null;
		String renameFileName = null;
		
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		
		String memberId = multi.getParameter("memberid");
		originalFileName = multi.getFilesystemName("profilefile");
		
		renameFileName = memberId + "profile" + "." + originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
		File saveFile = new File(savePath + "\\" + originalFileName);
		File newFile = new File(savePath + "\\" + renameFileName);
		if(!saveFile.renameTo(newFile)){
			int read = 0;
			byte[] buf = new byte[1024];
			FileInputStream fin = new FileInputStream(saveFile);
			FileOutputStream fout = new FileOutputStream(newFile);
			
			while((read = fin.read(buf, 0, buf.length)) != -1){
				fout.write(buf);
			}
			fin.close();
			fout.close();
			saveFile.delete();
		}
		Member member = new Member(memberId, originalFileName, savePath + "\\" + renameFileName);
		int result = new MemberService().profileUpdate(member);
		
		if(result > 0){
			response.sendRedirect("myInfo?memberId="+memberId);
		}else{
			RequestDispatcher view = request.getRequestDispatcher("member/memberError.jsp");
			request.setAttribute("code", "Profileup");
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
