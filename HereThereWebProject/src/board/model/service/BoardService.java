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
		return list;
	}

	public ArrayList<Board> selectPartByLoc(String loc) {
		ArrayList<Board> list = null;
		Connection con = getConnection();
		list = new BoardDao().selectPartByLoc(con, loc);
		return list;
	}

	public ArrayList<Board> selectPartByCategory(String category) {
		ArrayList<Board> list = null;
		Connection con = getConnection();
		list = new BoardDao().selectPartByCategory(con, category);
		return list;
	}

	public ArrayList<Board> selectPartByPopular(String popular) {
		ArrayList<Board> list = null;
		Connection con = getConnection();
		list = new BoardDao().selectPartByPopular(con, popular);
		return list;
		}

	public ArrayList<Board> selectPartByStarPt(String starPt) {
		ArrayList<Board> list = null;
		Connection con = getConnection();
		list = new BoardDao().selectPartByStarPt(con, starPt);
		return list;
	}

	public ArrayList<Board> selectPartByCommentCnt(String commentCnt) {
		ArrayList<Board> list = null;
		Connection con = getConnection();
		list = new BoardDao().selectPartByCommentCnt(con, commentCnt);
		return list;
	}

	

}