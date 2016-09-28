package admin.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import admin.model.service.AdminService;
import admin.model.vo.Admin;

/**
 * Servlet implementation class AdminDaeguPicUpServlet
 */
@WebServlet("/AdminDaeguPicUp")
public class AdminDaeguPicUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDaeguPicUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		//파일용량
		int sizeLimit = 1024 * 1024 * 5;
		//저장할 폴더 지정
		String savePath = "C:\\Users\\Administrator\\git\\there\\HereThereWebProject\\Web\\MainPguploadfiles"; 
		
		String originalFileName = null;
		String renameFileName = null;
		
		/*long currentTime = System.currentTimeMillis();
		SimpleDateFormat formatFileName = new SimpleDateFormat("yyyyMMddHHmmss");*/
		
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		
		String memberId = multi.getParameter("memberid");
		originalFileName = multi.getFilesystemName("coverfile");
		
		//바꿀 이름 만들기
		renameFileName = /*formatFileName.format(new java.sql.Date(currentTime))*/memberId + "daegu" + "."
						+ originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
		//기록 저장된 파일명 바꾸기 : 저장된 파일을 file 객체로 만듦
		File saveFile = new File(savePath + "\\" + originalFileName);
		//실패한 경우, 강제로 바꿈... 바꿀 이름에 대한 파일 만들고 원본 파일 복사 후, 원본 삭제
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
		char cp = 'c';
		Admin admin = new Admin(memberId, originalFileName, savePath + "\\" + renameFileName, cp);
		int result = new AdminService().daeguUpdate(admin);
		
		
		if(result > 0){
			response.sendRedirect("AdminMainModify?userid="+admin.getAdminId());
		}else{
			
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
