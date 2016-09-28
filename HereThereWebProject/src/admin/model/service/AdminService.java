package admin.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

import admin.model.dao.AdminDao;
import admin.model.vo.Admin;
import member.model.dao.MemberDao;
import member.model.vo.Member;

public class AdminService {

	public int mainUpdate(Admin admin) {
		Connection con = getConnection();
		int result = new AdminDao().mainUpdate(con, admin);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		return result;
	}

	public Admin selectOne(String memberId) {
		Connection con = getConnection();
		Admin admin = new AdminDao().selectOne(con, memberId);
		close(con);
		return admin;
	}

	public int seoulUpdate(Admin admin) {
		Connection con = getConnection();
		int result = new AdminDao().seoulUpdate(con, admin);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		return result;
	}

	public int daejeonUpdate(Admin admin) {
		Connection con = getConnection();
		int result = new AdminDao().daejeonUpdate(con, admin);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		return result;
	}

	public int gwangjuUpdate(Admin admin) {
		Connection con = getConnection();
		int result = new AdminDao().gwangjuUpdate(con, admin);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		return result;
	}

	public int busanUpdate(Admin admin) {
		Connection con = getConnection();
		int result = new AdminDao().busanUpdate(con, admin);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		return result;
	}

	public int ulsanUpdate(Admin admin) {
		Connection con = getConnection();
		int result = new AdminDao().ulsanUpdate(con, admin);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		return result;
	}

	public int daeguUpdate(Admin admin) {
		Connection con = getConnection();
		int result = new AdminDao().daeguUpdate(con, admin);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		return result;
	}

	public int jejuUpdate(Admin admin) {
		Connection con = getConnection();
		int result = new AdminDao().jejuUpdate(con, admin);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		return result;
	}

	public int incheonUpdate(Admin admin) {
		Connection con = getConnection();
		int result = new AdminDao().incheonUpdate(con, admin);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		return result;
	}

	public int mainSecUpdate(Admin admin) {
		Connection con = getConnection();
		int result = new AdminDao().mainSecUpdate(con, admin);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		return result;
	}


}
