package member.model.dao;

import java.sql.*;
import java.util.ArrayList;

import member.model.vo.Member;

import static common.JDBCTemplate.*;

public class MemberDao {
	public MemberDao(){}
	
	//로그인 처리용 메소드
	public Member loginCheck(Connection con, String memberId, String memberPwd){
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from member where mb_id = ? and mb_pwd = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				member = new Member();
				member.setMemberId(memberId);
				member.setMemberPwd(memberPwd);
				member.setMemberName(rset.getString("mb_name"));
				member.setEmail(rset.getString("mb_email"));
				member.setGender(rset.getString("mb_gender").charAt(0));
				member.setBirthday(rset.getDate("mb_birthday"));
				member.setPhone(rset.getString("mb_phone"));
				member.setJoinDate(rset.getDate("mb_joinDate"));
				member.setManagerYN(rset.getString("mb_manager_yn").charAt(0));
				member.setOriginalCoverName(rset.getString("ORIGINAL_COVER"));
				member.setRenameCoverName(rset.getString("RENAME_COVER"));
				member.setOriginalProfileName(rset.getString("ORIGINAL_PROFILE"));
				member.setRenameProfileName(rset.getString("RENAME_PROFILE"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return member;
	}

	public int memberInsert(Connection con, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into member values (?, ?, ?, ?, ?, ?, ?, sysdate, 'N')";
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPwd());
			pstmt.setString(3, member.getMemberName());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, String.valueOf(member.getGender()));
			pstmt.setDate(6, member.getBirthday());
			pstmt.setString(7, member.getPhone());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}
	
	//사용자 아이디를 이용한 회원 정보 조회용 메소드
	public Member selectOne(Connection con, String mbid) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from member where mb_id = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, mbid);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				member = new Member();
				member.setMemberId(mbid);
				member.setMemberPwd(rset.getString("mb_pwd"));
				member.setMemberName(rset.getString("mb_name"));
				member.setEmail(rset.getString("mb_email"));
				member.setGender(rset.getString("mb_gender").charAt(0));
				member.setBirthday(rset.getDate("mb_birthday"));
				member.setPhone(rset.getString("mb_phone"));
				member.setJoinDate(rset.getDate("mb_joindate"));
				member.setManagerYN(rset.getString("mb_manager_yn").charAt(0));
				member.setOriginalCoverName(rset.getString("ORIGINAL_COVER"));
				member.setRenameCoverName(rset.getString("RENAME_COVER"));
				member.setOriginalProfileName(rset.getString("ORIGINAL_PROFILE"));
				member.setRenameProfileName(rset.getString("RENAME_PROFILE"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return member;
	}

	public int memberUpdate(Connection con, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update member set mb_pwd=?, mb_name=?, mb_email=?, mb_gender=?" + 
						", mb_birthday=?, mb_phone=? where mb_id = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, member.getMemberPwd());
			pstmt.setString(2, member.getMemberName());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, String.valueOf(member.getGender()));
			pstmt.setDate(5, member.getBirthday());
			pstmt.setString(6, member.getPhone());
			pstmt.setString(7, member.getMemberId());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int memberDelete(Connection con, String mbIds) {
		int result = 0;
		
		PreparedStatement pstmt = null;
				
		String query = "delete from member where mb_id = ?";
				
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, mbIds);
					
			result = pstmt.executeUpdate();
					
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);	
		}
	
		return result;
	}
	
	public int membersDelete(Connection con, String[] mbIds) {
		int result = 0;
		
		if(mbIds != null){
			for(int i = 0; i < mbIds.length; i++){
				PreparedStatement pstmt = null;
				
				String query = "delete from member where mb_id = ?";
				
				try {
					pstmt = con.prepareStatement(query);
					pstmt.setString(1, mbIds[i]);
					
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

	public ArrayList<Member> selectAll(Connection con) {
		ArrayList<Member> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from member order by mb_manager_yn desc, mb_name";
		
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			int count = 1;
			while(rset.next()){
				if(count == 1){
					list = new ArrayList<Member>();
					count = 0;
				}
				Member member = new Member();
				member.setMemberId(rset.getString("mb_id"));
				member.setMemberPwd(rset.getString("mb_pwd"));
				member.setMemberName(rset.getString("mb_name"));
				member.setEmail(rset.getString("mb_email"));
				member.setGender(rset.getString("mb_gender").charAt(0));
				member.setBirthday(rset.getDate("mb_birthday"));
				member.setPhone(rset.getString("mb_phone"));
				member.setJoinDate(rset.getDate("mb_joindate"));
				member.setManagerYN(rset.getString("mb_manager_yn").charAt(0));
				member.setOriginalCoverName(rset.getString("ORIGINAL_COVER"));
				member.setRenameCoverName(rset.getString("RENAME_COVER"));
				member.setOriginalProfileName(rset.getString("ORIGINAL_PROFILE"));
				member.setRenameProfileName(rset.getString("RENAME_PROFILE"));
				
				list.add(member);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public int coverUp(Connection con, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update member set original_cover = ?, rename_cover = ? where mb_id = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, member.getOriginalCoverName());
			pstmt.setString(2, member.getRenameCoverName());
			pstmt.setString(3, member.getMemberId());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int profileUp(Connection con, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update member set ORIGINAL_PROFILE = ?, RENAME_PROFILE = ? where mb_id = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, member.getOriginalProfileName());
			pstmt.setString(2, member.getRenameProfileName());
			pstmt.setString(3, member.getMemberId());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int coverDelete(Connection con, String memberId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update member set original_cover = null, rename_cover = null where mb_id = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, memberId);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int profileDelete(Connection con, String memberId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update member set original_profile = null, rename_profile = null where mb_id = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, memberId);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int memberModifyYN(Connection con, String[] managerYN) {
		int result = 0;
		for(int i = 0; i < managerYN.length; i++){
			PreparedStatement pstmt = null;
			String[] str = managerYN[i].split(":");
			String userId = str[0];
			String yn = str[1];
			
			String query = "update member set mb_manager_yn=? where mb_id = ?";
			
			try {
				pstmt = con.prepareStatement(query);
				
				pstmt.setString(1, yn);
				pstmt.setString(2, userId);
				
				result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				close(pstmt);
			}
		}
		return result;
	}

	public ArrayList<Member> selectId(Connection con, String keyword) {
		ArrayList<Member> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from member where mb_id = ? order by mb_manager_yn desc, mb_name";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, keyword);
			rset = pstmt.executeQuery();
			
			int count = 1;
			while(rset.next()){
				if(count == 1){
					list = new ArrayList<Member>();
					count = 0;
				}
				Member member = new Member();
				member.setMemberId(rset.getString("mb_id"));
				member.setMemberPwd(rset.getString("mb_pwd"));
				member.setMemberName(rset.getString("mb_name"));
				member.setEmail(rset.getString("mb_email"));
				member.setGender(rset.getString("mb_gender").charAt(0));
				member.setBirthday(rset.getDate("mb_birthday"));
				member.setPhone(rset.getString("mb_phone"));
				member.setJoinDate(rset.getDate("mb_joindate"));
				member.setManagerYN(rset.getString("mb_manager_yn").charAt(0));
				member.setOriginalCoverName(rset.getString("ORIGINAL_COVER"));
				member.setRenameCoverName(rset.getString("RENAME_COVER"));
				member.setOriginalProfileName(rset.getString("ORIGINAL_PROFILE"));
				member.setRenameProfileName(rset.getString("RENAME_PROFILE"));
				
				list.add(member);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Member> selectName(Connection con, String keyword) {
		ArrayList<Member> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from member where mb_name like ? order by mb_manager_yn desc, mb_name";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "%" + keyword + "%");
			rset = pstmt.executeQuery();
			
			int count = 1;
			while(rset.next()){
				if(count == 1){
					list = new ArrayList<Member>();
					count = 0;
				}
				Member member = new Member();
				member.setMemberId(rset.getString("mb_id"));
				member.setMemberPwd(rset.getString("mb_pwd"));
				member.setMemberName(rset.getString("mb_name"));
				member.setEmail(rset.getString("mb_email"));
				member.setGender(rset.getString("mb_gender").charAt(0));
				member.setBirthday(rset.getDate("mb_birthday"));
				member.setPhone(rset.getString("mb_phone"));
				member.setJoinDate(rset.getDate("mb_joindate"));
				member.setManagerYN(rset.getString("mb_manager_yn").charAt(0));
				member.setOriginalCoverName(rset.getString("ORIGINAL_COVER"));
				member.setRenameCoverName(rset.getString("RENAME_COVER"));
				member.setOriginalProfileName(rset.getString("ORIGINAL_PROFILE"));
				member.setRenameProfileName(rset.getString("RENAME_PROFILE"));
				
				list.add(member);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int idcheck(Connection con, String mbid) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select count(*) as count from member where mb_id = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, mbid);
			rset = pstmt.executeQuery();
			if(rset.next()){
				result = rset.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}


}
