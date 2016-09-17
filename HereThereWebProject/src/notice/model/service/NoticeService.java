package notice.model.service;

import java.sql.*;
import java.util.*;

import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;
import static common.JDBCTemplate.*;

public class NoticeService {

	public ArrayList<Notice> selectList() {
		Connection con = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectList(con);
		close(con);
		return list;
	}

	public int noticeDelete(int noticeNo) {
		Connection con = getConnection();
		int result = new NoticeDao().deleteNotice(con, noticeNo);
		if(result > 0 ){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}

	public int addReadCount(int noticeNo) {
		Connection con = getConnection();
		int result = new NoticeDao().addReadCount(con, noticeNo);
		if(result > 0 ){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}

	public Notice selectOne(int noticeNo) {
		Connection con = getConnection();
		Notice notice = new NoticeDao().selectOne(con, noticeNo);
		close(con);
		return notice;
	}

	public int insertNotice(Notice notice) {
		Connection con = getConnection();
		int result = new NoticeDao().insertNotice(con, notice);
			if(result > 0){
				commit(con);
			}else{
				rollback(con);
			}
			close(con);
		return result;
	}

	public int updateNotice(Notice notice) {
		Connection con = getConnection();
		int result = new NoticeDao().updateNotice(con, notice);
		if(result > 0 ){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}

	
}
