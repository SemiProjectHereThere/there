package admin.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import admin.model.vo.Admin;
import member.model.vo.Member;

public class AdminDao {

	public int mainUpdate(Connection con, Admin admin) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update picture set MAIN_ORIGINAL_NAME = ?, MAIN_RENAME = ? where ADMIN_ID = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, admin.getOriginalName());
			pstmt.setString(2, admin.getRenameName());
			pstmt.setString(3, admin.getAdminId());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public Admin selectOne(Connection con, String memberId) {
		Admin admin = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from picture where admin_id = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				admin = new Admin();
				admin.setAdminId(memberId);
				admin.setOriginalMainName(rset.getString("main_original_name"));
				admin.setRenameMainName(rset.getString("main_rename"));
				admin.setOriginalSeoulName(rset.getString("seoul_original_name"));
				admin.setRenameSeoulName(rset.getString("seoul_rename"));
				admin.setOriginalDaejeonName(rset.getString("daejeon_original_name"));
				admin.setRenameDaejeonName(rset.getString("daejeon_rename"));
				admin.setOriginalGwangjuName(rset.getString("gwangju_original_name"));
				admin.setRenameGwangjuName(rset.getString("gwangju_rename"));
				admin.setOriginalBusanName(rset.getString("busan_original_name"));
				admin.setRenameBusanName(rset.getString("busan_rename"));
				admin.setOriginalUlsanName(rset.getString("ulsan_original_name"));
				admin.setRenameUlsanName(rset.getString("ulsan_rename"));
				admin.setOriginalDaeguName(rset.getString("daegu_original_name"));
				admin.setRenameDaeguName(rset.getString("daegu_rename"));
				admin.setOriginalJejuName(rset.getString("jeju_original_name"));
				admin.setRenameJejuName(rset.getString("jeju_rename"));
				admin.setOriginalIncheonName(rset.getString("incheon_original_name"));
				admin.setRenameIncheonName(rset.getString("incheon_rename"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return admin;
	}

	public int seoulUpdate(Connection con, Admin admin) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update picture set seoul_ORIGINAL_NAME = ?, seoul_RENAME = ? where ADMIN_ID = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, admin.getOriginalName());
			pstmt.setString(2, admin.getRenameName());
			pstmt.setString(3, admin.getAdminId());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int daejeonUpdate(Connection con, Admin admin) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update picture set daejeon_ORIGINAL_NAME = ?, daejeon_RENAME = ? where ADMIN_ID = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, admin.getOriginalName());
			pstmt.setString(2, admin.getRenameName());
			pstmt.setString(3, admin.getAdminId());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int gwangjuUpdate(Connection con, Admin admin) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update picture set gwangju_ORIGINAL_NAME = ?, gwangju_RENAME = ? where ADMIN_ID = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, admin.getOriginalName());
			pstmt.setString(2, admin.getRenameName());
			pstmt.setString(3, admin.getAdminId());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int busanUpdate(Connection con, Admin admin) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update picture set busan_ORIGINAL_NAME = ?, busan_RENAME = ? where ADMIN_ID = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, admin.getOriginalName());
			pstmt.setString(2, admin.getRenameName());
			pstmt.setString(3, admin.getAdminId());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int ulsanUpdate(Connection con, Admin admin) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update picture set ulsan_ORIGINAL_NAME = ?, ulsan_RENAME = ? where ADMIN_ID = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, admin.getOriginalName());
			pstmt.setString(2, admin.getRenameName());
			pstmt.setString(3, admin.getAdminId());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int daeguUpdate(Connection con, Admin admin) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update picture set daegu_ORIGINAL_NAME = ?, daegu_RENAME = ? where ADMIN_ID = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, admin.getOriginalName());
			pstmt.setString(2, admin.getRenameName());
			pstmt.setString(3, admin.getAdminId());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int jejuUpdate(Connection con, Admin admin) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update picture set jeju_ORIGINAL_NAME = ?, jeju_RENAME = ? where ADMIN_ID = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, admin.getOriginalName());
			pstmt.setString(2, admin.getRenameName());
			pstmt.setString(3, admin.getAdminId());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int incheonUpdate(Connection con, Admin admin) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update picture set incheon_ORIGINAL_NAME = ?, incheon_RENAME = ? where ADMIN_ID = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, admin.getOriginalName());
			pstmt.setString(2, admin.getRenameName());
			pstmt.setString(3, admin.getAdminId());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int mainSecUpdate(Connection con, Admin admin) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update picture set MAIN2_ORIGINAL_NAME = ?, MAIN2_RENAME = ? where ADMIN_ID = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, admin.getOriginalName());
			pstmt.setString(2, admin.getRenameName());
			pstmt.setString(3, admin.getAdminId());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

}
