package member.model.service;

import member.model.dao.MemberDao;
import member.model.vo.Member;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

public class MemberService {
	public MemberService(){}

	public Member loginCheck(String memberId, String memberPwd) {
		Connection con = getConnection();
		Member member = new MemberDao().loginCheck(con, memberId, memberPwd);
		close(con);
		
		return member;
	}

	public int memberInsert(Member member) {
		Connection con = getConnection();
		int result = new MemberDao().memberInsert(con, member);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}

	public Member selectOne(String mbid) {
		Connection con = getConnection();
		Member member = new MemberDao().selectOne(con, mbid);
		close(con);
		return member;
	}

	public int memberUpdate(Member member) {
		Connection con = getConnection();
		int result = new MemberDao().memberUpdate(con, member);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}

	public int memberDelete(String[] mbIds) {
		Connection con = getConnection();
		int result = new MemberDao().memberDelete(con, mbIds);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<Member> selectAll() {
		Connection con = getConnection();
		ArrayList<Member> list = new MemberDao().selectAll(con);
		close(con);
		return list;
	}

	public int updateManager() {
		return 0;
	}

	public int coverUpdate(Member member) {
		Connection con = getConnection();
		int result = new MemberDao().coverUp(con, member);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		return result;
	}

	public int profileUpdate(Member member) {
		Connection con = getConnection();
		int result = new MemberDao().profileUp(con, member);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		return result;
	}

	public int coverDelete(String memberId) {
		Connection con = getConnection();
		int result = new MemberDao().coverDelete(con, memberId);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}

	public int profileDelete(String memberId) {
		Connection con = getConnection();
		int result = new MemberDao().profileDelete(con, memberId);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}

	public int memberModifyYN(String[] managerYN) {
		Connection con = getConnection();
		int result = new MemberDao().memberModifyYN(con, managerYN);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<Member> selectId(String keyword) {
		Connection con = getConnection();
		ArrayList<Member> list = new MemberDao().selectId(con, keyword);
		close(con);
		return list;
	}

	public ArrayList<Member> selectName(String keyword) {
		Connection con = getConnection();
		ArrayList<Member> list = new MemberDao().selectName(con, keyword);
		close(con);
		return list;
	}
}
