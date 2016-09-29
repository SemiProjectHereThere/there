package notice.model.dao;

import java.sql.*;
import java.util.ArrayList;

import notice.model.vo.Notice;
import static common.JDBCTemplate.*;

public class NoticeDao {

	public ArrayList<Notice> selectList(Connection con) {
		ArrayList<Notice> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from adminboard order by adb_no";
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			boolean flag = true;
			while(rset.next()){
				if(flag == true){
					list = new ArrayList<Notice>();
					flag = false;
				}
				Notice n = new Notice();
				n.setNoticeNo(rset.getInt("adb_no"));
				n.setNoticeTitle(rset.getString("adb_title"));
				n.setNoticeWriter(rset.getString("adb_writer"));
				n.setNoticeContent(rset.getString("adb_content"));
				n.setNoticeDate(rset.getDate("adb_enrolldate"));
				n.setCountView(rset.getInt("adb_count"));
				
				list.add(n);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		return list;
	}

	public int deleteNotice(Connection con, int noticeNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String query = "delete from adminboard where adb_no = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int addReadCount(Connection con, int noticeNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String query = "update adminboard set adb_count = "
					+ "(select adb_count from adminboard where adb_no = ?) + 1"
					+ "where adb_no = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			pstmt.setInt(2, noticeNo);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public Notice selectOne(Connection con, int noticeNo) {
		Notice n = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from adminboard where adb_no = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()){
				n = new Notice();
				n.setNoticeNo(rset.getInt("adb_no"));
				n.setNoticeTitle(rset.getString("adb_title"));
				n.setNoticeWriter(rset.getString("adb_writer"));
				n.setNoticeContent(rset.getString("adb_content"));
				n.setNoticeDate(rset.getDate("adb_enrolldate"));
				n.setCountView(rset.getInt("adb_count"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return n;
	}

	public int insertNotice(Connection con, Notice notice) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String query = "insert into adminboard values(?, adminboard_seq.nextval, ?, ?, sysdate, 0)";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, notice.getNoticeTitle());
			pstmt.setString(2, notice.getNoticeContent());
			pstmt.setString(3, notice.getNoticeWriter());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int updateNotice(Connection con, Notice notice) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String query = "update adminboard set adb_title = ?, adb_content = ? where adb_no = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, notice.getNoticeTitle());
			pstmt.setString(2, notice.getNoticeContent());
			pstmt.setInt(3, notice.getNoticeNo());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int noticesDelete(Connection con, String[] noticeNoS) {
		int result = 0;
		
		if(noticeNoS != null){
			for(int i = 0; i < noticeNoS.length; i++){
				PreparedStatement pstmt = null;
				
				int noticeNo = Integer.parseInt(noticeNoS[i]);
				
				String query = "delete from adminboard where adb_no = ?";
				
				try {
					pstmt = con.prepareStatement(query);
					pstmt.setInt(1, noticeNo);
					
					result = pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				}finally{
					close(pstmt);
				}
			}
		}
		return result;
	}

}
