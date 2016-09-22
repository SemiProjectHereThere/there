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
		
		String query = "select * from board";		//등록순으로 정렬하여 list에 담는다.
		
		boolean flag = true;
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()){
				if(flag == true){
					list = new ArrayList<Board>();
					flag = false;
				}
				Board b = new Board();
				b.setBdNo(rset.getInt("bd_no"));
				b.setBdTitle(rset.getString("bd_title"));
				b.setBdContent(rset.getString("bd_Content"));
				b.setBdWriter(rset.getString("bd_writer"));
				b.setBdEnrollDate(rset.getDate("bd_enrolldate"));
				b.setBdCategory(rset.getString("bd_category"));
				b.setBdLocation(rset.getString("bd_location"));
				b.setBdReadCnt(rset.getInt("bd_count"));
				b.setBdCommentCnt(rset.getInt("bd_comment_count"));
				b.setBdStarPt(rset.getInt("bd_starpoint"));
				b.setBdShingoCnt(rset.getInt("bd_singo"));
				b.setBdMap(rset.getString("bd_map"));
				
				list.add(b);
			}
			
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
		String query = "insert into board values(BOARD_SEQ.NEXTVAL, ?, ?, ?, sysdate, ?, ?, 0, 0, 0, 0, ?)";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, board.getBdTitle());
			pstmt.setString(2, board.getBdContent());
			pstmt.setString(3, board.getBdWriter());
			pstmt.setString(4, board.getBdCategory());
			pstmt.setString(5, board.getBdLocation());
			pstmt.setString(6, board.getBdMap());
			
			result = pstmt.executeUpdate();
			
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
