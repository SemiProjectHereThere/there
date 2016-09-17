package board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import board.model.vo.Board;
import board.model.vo.Picture;

import static common.JDBCTemplate.*;

public class BoardDao {

	public ArrayList<Board> selectAll(Connection con) {
		// 전체게시물을 list에 저장하는 메소드
		ArrayList<Board> list = null;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "";		//등록순으로 정렬하여 list에 담는다.
		
		Board bd = null;
		try {
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public ArrayList<Board> selectPartByLoc(Connection con, String loc) {
		//지역별로 분류된 게시물을 list에 담는 메소드
		ArrayList<Board> list = null;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "";		//등록순으로 정렬하여 list에 담는다.
		
		Board bd = null;
		try {
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public ArrayList<Board> selectPartByCategory(Connection con, String category) {
		//카테고리별로 분류된 게시물을 list에 담는 메소드
		ArrayList<Board> list = null;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "";		//등록순으로 정렬하여 list에 담는다.
		
		Board bd = null;
		try {
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		
		return list;	
		
	}

	public ArrayList<Board> selectPartByPopular(Connection con) {
		//인기순별로 분류된 게시물을 list에 담는 메소드
		ArrayList<Board> list = null;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "";		//등록순으로 정렬하여 list에 담는다.
		
		Board bd = null;
		try {
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		
		return list;		
		}

	public ArrayList<Board> selectPartByStarPt(Connection con) {
		//별점순별로 분류된 게시물을 list에 담는 메소드
		ArrayList<Board> list = null;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "";		//등록순으로 정렬하여 list에 담는다.
		
		Board bd = null;
		try {
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		
		return list;		
	}

	public ArrayList<Board> selectPartByCommentCnt(Connection con) {
		//댓글개수 순별로 분류된 게시물을 list에 담는 메소드
		ArrayList<Board> list = null;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "";		//등록순으로 정렬하여 list에 담는다.
		
		Board bd = null;
		try {
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		
		return list;		
	}

	public ArrayList<Board> selectAll(Connection con, String userId) {
		// 전체게시물을 list에 저장하는 메소드
		ArrayList<Board> list = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "";		//등록순으로 정렬하여 list에 담는다. Board 테이블에서 userId로 select all함.
		
		Board bd = null;
		try {
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return list;		
	}

	public ArrayList<Board> selectFavorite(Connection con, String userId) {
		// 전체게시물을 list에 저장하는 메소드
		ArrayList<Board> list = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "";		//Favorite 테이블에서 userId로 select all함.
								//FA_BD_NO로 orderby해서 list에 담는다.
		
		Board bd = null;
		try {
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return list;		
	}

	public Board selectOne(Connection con, int boardNo) {
		// 게시물 세부정보를 board 객체에 저장하는 메소드
		Board board = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "";		//board 테이블에서 boardNo로 select all함.
		
		try {
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return board;		
	}

	public ArrayList<Picture> selectPicAll(Connection con, int boardNo) {
		// 사진 세부정보를 ArrayList 객체에 저장하는 메소드
		ArrayList<Picture> list = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "";		//사진 테이블에서 boardNo로 original, rename select함.
								//Picture 객체에 저장 후 리스트에 객체를 저장
		
		try {
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return list;	
		}

	public int insertBoard(Connection con, Board board) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String query = "insert into board values()";
		
		try {
			pstmt = con.prepareStatement(query);
			// pstmt.setString() 추가
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public int deleteBoard(Connection con, int boardNo) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String query = "delete from board where bd_no = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public int updateBoard(Connection con, Board board) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String query = ""; // update 쿼리 추가
		
		try {
			pstmt = con.prepareStatement(query);
			// pstmt.setString() 추가
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}
}
