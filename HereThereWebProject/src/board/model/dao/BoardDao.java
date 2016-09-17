package board.model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import board.model.vo.Board;
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

	public ArrayList<Board> selectPartByPopular(Connection con, String popular) {
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

	public ArrayList<Board> selectPartByStarPt(Connection con, String starPt) {
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

	public ArrayList<Board> selectPartByCommentCnt(Connection con, String commentCnt) {
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
}
