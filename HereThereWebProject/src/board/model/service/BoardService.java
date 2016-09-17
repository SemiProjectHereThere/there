package board.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static common.JDBCTemplate.*;

import board.model.dao.BoardDao;
import board.model.vo.Board;

public class BoardService {

	public ArrayList<Board> selectAll() {
		ArrayList<Board> list = null;
		Connection con = getConnection();
		list = new BoardDao().selectAll(con);
		close(con);
		return list;
	}

	public ArrayList<Board> selectPartByLoc(String loc) {
		ArrayList<Board> list = null;
		Connection con = getConnection();
		list = new BoardDao().selectPartByLoc(con, loc);
		close(con);
		return list;
	}

	public ArrayList<Board> selectPartByCategory(String category) {
		ArrayList<Board> list = null;
		Connection con = getConnection();
		list = new BoardDao().selectPartByCategory(con, category);
		close(con);
		return list;
	}

	public ArrayList<Board> selectPartByPopular(String popular) {
		ArrayList<Board> list = null;
		Connection con = getConnection();
		list = new BoardDao().selectPartByPopular(con, popular);
		close(con);
		return list;
		}

	public ArrayList<Board> selectPartByStarPt(String starPt) {
		ArrayList<Board> list = null;
		Connection con = getConnection();
		list = new BoardDao().selectPartByStarPt(con, starPt);
		close(con);
		return list;
	}

	public ArrayList<Board> selectPartByCommentCnt(String commentCnt) {
		ArrayList<Board> list = null;
		Connection con = getConnection();
		list = new BoardDao().selectPartByCommentCnt(con, commentCnt);
		close(con);
		return list;
	}

	public ArrayList<Board> selectAll(String userId) {
		ArrayList<Board> list = null;
		Connection con = getConnection();
		list = new BoardDao().selectAll(con, userId);
		close(con);
		return list;
	}

	public ArrayList<Board> selectFavorite(String userId) {
		ArrayList<Board> list = null;
		Connection con = getConnection();
		list = new BoardDao().selectFavorite(con, userId);
		close(con);
		return list;
	}

	

}