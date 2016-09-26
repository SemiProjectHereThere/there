package board.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static common.JDBCTemplate.*;

import board.model.dao.BoardDao;
import board.model.vo.Board;
import board.model.vo.Comment;
import board.model.vo.Picture;

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

	public Board selectOne(int boardNo) {
		Board board = null;
		Connection con = getConnection();
		board = new BoardDao().selectOne(con, boardNo);
		close(con);
		return board;
	}

	public ArrayList<Picture> selectPicAll(int boardNo) {
		ArrayList<Picture> list = null;
		Connection con = getConnection();
		list = new BoardDao().selectPicAll(con, boardNo);
		close(con);
		return list;
	}

	public int insertBoard(Board board) {
		Connection con = getConnection();
		int result = new BoardDao().insertBoard(con, board);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}

	public int deleteBoard(int boardNo) {
		Connection con = getConnection();
		int result = new BoardDao().deleteBoard(con, boardNo);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}

	public int updateBoard(Board board) {
		Connection con = getConnection();
		int result = new BoardDao().updateBoard(con, board);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<Comment> selectAllCm(int boardNo) {
		ArrayList<Comment> list = null;
		Connection con = getConnection();
		list = new BoardDao().selectAllCm(con, boardNo);
		close(con);
		return list;
	}
	public ArrayList<Board> selectBoard(Board board) {
		ArrayList<Board> list = null;
		Connection con = getConnection();
		list = new BoardDao().selectBoard(con, board);
		close(con);
		return list;
	}

	public ArrayList<Board> selectABoard(Board board) {
		ArrayList<Board> list = null;
		Connection con = getConnection();
		list = new BoardDao().selectABoard(con, board);
		close(con);
		return list;
	}

	public ArrayList<Board> selectPartByPopular() {
		ArrayList<Board> list = null;
		Connection con = getConnection();
		list = new BoardDao().selectPartByPopular(con);
		close(con);
		return list;
	}

	public ArrayList<Board> selectPartByPopular(Board board) {
		ArrayList<Board> list = null;
		Connection con = getConnection();
		list = new BoardDao().selectPartByPopular(con, board);
		close(con);
		return list;
	}
				
	public ArrayList<Board> selectMine(String userId) {
		Connection con = getConnection();
		ArrayList<Board> list = null;
		list = new BoardDao().selectMine(con, userId);
		close(con);
		return list;
	}
	
	public ArrayList<Board> selectPartByStarPt() {
		ArrayList<Board> list = null;
		Connection con = getConnection();
		list = new BoardDao().selectPartByStarPt(con);
		close(con);
		return list;
	}

	public ArrayList<Board> selectPartByStarPt(Board board) {
		ArrayList<Board> list = null;
		Connection con = getConnection();
		list = new BoardDao().selectPartByStarPt(con, board);
		close(con);
		return list;
	}

	public ArrayList<Board> selectPartByEnrollDate() {
		ArrayList<Board> list = null;
		Connection con = getConnection();
		list = new BoardDao().selectPartByEnrollDate(con);
		close(con);
		return list;
	}

	public ArrayList<Board> selectPartByEnrollDate(Board board) {
		ArrayList<Board> list = null;
		Connection con = getConnection();
		list = new BoardDao().selectPartByEnrollDate(con, board);
		close(con);
		return list;
	}
	public ArrayList<Board> selectPartByCommentCnt() {
		ArrayList<Board> list = null;
		Connection con = getConnection();
		list = new BoardDao().selectPartByCommentCnt(con);
		close(con);
		return list;
	}
	public ArrayList<Board> selectPartByCommentCnt(Board board) {
		ArrayList<Board> list = null;
		Connection con = getConnection();
		list = new BoardDao().selectPartByCommentCnt(con, board);
		close(con);
		return list;
	}
	
	
				
	

}