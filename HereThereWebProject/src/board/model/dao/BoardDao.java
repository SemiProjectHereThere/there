package board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import board.model.vo.Board;
import board.model.vo.BoardS;
import board.model.vo.Comment;
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




	public ArrayList<Board> selectAll(Connection con, String userId) {
		// 전체게시물을 list에 저장하는 메소드
		// 전체게시물을 list에 저장하는 메소드
				ArrayList<Board> list = null;
				
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				
				String query = "select BD_NO, BD_TITLE, BD_CONTENT, BD_WRITER, BD_ENROLLDATE, BD_CATEGORY, "
								+ "BD_LOCATION, BD_COUNT, BD_COMMENT_COUNT, BD_STARPOINT, BD_SINGO, BD_MAP " +
								"from board, favorite where board.BD_NO = favorite.FA_BD_NO and favorite.FA_MB_ID = ?";		
				//등록순으로 정렬하여 list에 담는다. Board 테이블에서 userId로 select all함.
				
				try {
					pstmt = con.prepareStatement(query);
					pstmt.setString(1, userId);
					
					rset = pstmt.executeQuery();
					boolean flag = true;
					while(rset.next()){
						if(flag == true){
							list = new ArrayList<Board>();
							flag = false;
						}
						Board b = new Board();
						b.setBdNo(rset.getInt("bd_no"));
						b.setBdTitle(rset.getString("bd_title"));
						b.setBdContent(rset.getString("bd_content"));
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
					close(pstmt);
				}
				
				return list;			
	}

	public ArrayList<Board> selectFavorite(Connection con, String userId) {
		// 전체게시물을 list에 저장하는 메소드
		// 찜한게시물을 list에 저장하는 메소드
				ArrayList<Board> list = null;
				
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				
				String query = "select * from favorite, board where favorite.FA_BD_NO = board.BD_NO and favorite.FA_MB_ID = ? order by fa_bd_no desc";		//Favorite 테이블에서 userId로 select all함.
										//FA_BD_NO로 orderby해서 list에 담는다.
				try {
					pstmt = con.prepareStatement(query);
					pstmt.setString(1, userId);
					
					rset = pstmt.executeQuery();
					boolean flag = true;
					while(rset.next()){
						if(flag == true){
							list = new ArrayList<Board>();
							flag = false;
						}
						Board b = new Board();
						b.setBdNo(rset.getInt("bd_no"));
						b.setBdTitle(rset.getString("bd_title"));
						b.setBdContent(rset.getString("bd_content"));
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
					close(pstmt);
				}
				
				return list;		
	}

	public Board selectOne(Connection con, int boardNo) {
		// 게시물 세부정보를 board 객체에 저장하는 메소드
		Board b = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from board where bd_no = ?";		//board 테이블에서 boardNo로 select all함.
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				b = new Board();
				b.setBdNo(boardNo);
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
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return b;		
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
		String query = "update board set bd_title = ?, bd_content = ?, bd_category = ?" + 
						", bd_location = ?, bd_map = ? where bd_no = ?"; // update 쿼리 추가
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, board.getBdTitle());
			pstmt.setString(2, board.getBdContent());
			pstmt.setString(3, board.getBdCategory());
			pstmt.setString(4, board.getBdLocation());
			pstmt.setString(5, board.getBdMap());
			pstmt.setInt(6, board.getBdNo());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Comment> selectAllCm(Connection con, int boardNo) {
		ArrayList<Comment> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from bd_comment where cm_board_no=?";		
		
		boolean flag = true;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				if(flag == true){
					list = new ArrayList<Comment>();
					flag = false;
				}
				Comment c = new Comment();
				c.setCmBoardNo(boardNo);
				c.setCmWriter(rset.getString("cm_writer"));
				c.setCmContent(rset.getString("cm_content"));
				
				list.add(c);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	public ArrayList<Board> selectBoard(Connection con, Board board) {
		// 선택값을 list 에 담는메소드
				ArrayList<Board> list = null;
				
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				
				String query = "select * from board where BD_LOCATION = ? and BD_CATEGORY = ? ";		//등록순으로 정렬하여 list에 담는다.
				
				boolean flag = true;
				try {
					pstmt = con.prepareStatement(query);
					pstmt.setString(1, board.getBdLocation());
					pstmt.setString(2, board.getBdCategory());
					
					rset = pstmt.executeQuery();
					
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
					close(pstmt);
				}
				
				return list;
	}

	public ArrayList<Board> selectABoard(Connection con, Board board) {
		// 선택값을 list 에 담는메소드
		ArrayList<Board> list = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from board where BD_LOCATION = ? ";//등록순으로 정렬하여 list에 담는다.
		
		boolean flag = true;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, board.getBdLocation());
			
			rset = pstmt.executeQuery();
			
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
			close(pstmt);
		}
		
		return list;
	}


	public ArrayList<Board> selectPartByPopular(Connection con) {
		ArrayList<Board> list = null;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from board order by BD_COUNT desc";//등록순으로 정렬하여 list에 담는다.
		
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
	public ArrayList<Board> selectPartByPopular(Connection con, Board board) {
		//인기순별로 분류된 게시물을 list에 담는 메소드
		ArrayList<Board> list = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from board where BD_LOCATION = ? and BD_CATEGORY = ? order by BD_COUNT desc";		//등록순으로 정렬하여 list에 담는다.
		
		boolean flag = true;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, board.getBdLocation());
			pstmt.setString(2, board.getBdCategory());
			
			rset = pstmt.executeQuery();
			
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
			close(pstmt);
		}
		
		return list;		
		}

	public ArrayList<Board> selectMine(Connection con, String userId) {
		ArrayList<Board> list = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from board where bd_writer = ? order by bd_no desc";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			boolean flag = true;
			while(rset.next()){
				if(flag == true){
					list = new ArrayList<Board>();
					flag = false;
				}
				Board b = new Board();
				b.setBdNo(rset.getInt("bd_no"));
				b.setBdTitle(rset.getString("bd_title"));
				b.setBdContent(rset.getString("bd_content"));
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
			close(pstmt);
		}
		
		return list;
	}
	

	public ArrayList<Board> selectPartByStarPt(Connection con) {
		//별점순별로 분류된 게시물을 list에 담는 메소드
ArrayList<Board> list = null;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from board order by BD_STARPOINT desc";//등록순으로 정렬하여 list에 담는다.
		
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

	public ArrayList<Board> selectPartByStarPt(Connection con, Board board) {
		// 별점별
		ArrayList<Board> list = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from board where BD_LOCATION = ? and BD_CATEGORY = ? order by BD_STARPOINT desc";		//등록순으로 정렬하여 list에 담는다.
		
		boolean flag = true;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, board.getBdLocation());
			pstmt.setString(2, board.getBdCategory());
			
			rset = pstmt.executeQuery();
			
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
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Board> selectPartByEnrollDate(Connection con) {
ArrayList<Board> list = null;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from board order by BD_ENROLLDATE desc";//등록순으로 정렬하여 list에 담는다.
		
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

	public ArrayList<Board> selectPartByEnrollDate(Connection con, Board board) {
		// 등록일자별
		ArrayList<Board> list = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from board where BD_LOCATION = ? and BD_CATEGORY = ? order by BD_ENROLLDATE desc";		//등록순으로 정렬하여 list에 담는다.
		
		boolean flag = true;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, board.getBdLocation());
			pstmt.setString(2, board.getBdCategory());
			
			rset = pstmt.executeQuery();
			
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
			close(pstmt);
		}
		
		return list;
	}
	public ArrayList<Board> selectPartByCommentCnt(Connection con) {
		//댓글개수 순별로 분류된 게시물을 list에 담는 메소드
		ArrayList<Board> list = null;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from board order by BD_COMMENT_COUNT desc";//등록순으로 정렬하여 list에 담는다.
		
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

	public ArrayList<Board> selectPartByCommentCnt(Connection con, Board board) {
ArrayList<Board> list = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from board where BD_LOCATION = ? and BD_CATEGORY = ? order by BD_COMMENT_COUNT desc";		//등록순으로 정렬하여 list에 담는다.
		
		boolean flag = true;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, board.getBdLocation());
			pstmt.setString(2, board.getBdCategory());
			
			rset = pstmt.executeQuery();
			
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
			close(pstmt);
		}
		
		return list;
	}
//9.26 저녁수정 + 추가 BoardS
	public ArrayList<Board> selectCOBoard(Connection con, BoardS board) {
		// TODO Auto-generated method stub
		ArrayList<Board> list = null;
		
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		int category =  Integer.parseInt(board.getCategory());
		String option = board.getOption();
		String query = "";
		
		if(category != 0){
			switch(option){
			case "0" : query = "select * from board where BD_CATEGORY = ?"; break;
			case "1" : query = "select * from board where BD_CATEGORY = ? order by BD_COUNT desc"; break;
			case "2" : query = "select * from board where BD_CATEGORY = ? order by BD_STARPOINT desc"; break;
			case "3" : query = "select * from board where BD_CATEGORY = ? order by BD_ENROLLDATE desc"; break;
			case "4" : query = "select * from board where BD_CATEGORY = ? order by BD_COMMENT_COUNT desc"; break;
			}
		} else {

			switch(option){
			case "0" : query = "select * from board"; break;
			case "1" : query = "select * from board order by BD_COUNT desc"; break;
			case "2" : query = "select * from board order by BD_STARPOINT desc"; break;
			case "3" : query = "select * from board order by BD_ENROLLDATE desc"; break;
			case "4" : query = "select * from board order by BD_COMMENT_COUNT desc"; break;
			}
		}
		//String query = "select * from board where BD_LOCATION = ? ";//등록순으로 정렬하여 list에 담는다.

		boolean flag = true;
		try {
			if(category != 0){
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, board.getCategory());
				rset = pstmt.executeQuery();
			}else{
				stmt = con.createStatement();
				rset = stmt.executeQuery(query);
			}

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
			if(category != 0)
				close(pstmt);
			else
				close(stmt);
		}
		/*System.out.println("====================================");
		System.out.println(board.getOption());
		System.out.println("====================================");*/
		return list;
	}

	public ArrayList<Board> selectLCOBoard(Connection con, BoardS board) {
		// TODO Auto-generated method stub
		ArrayList<Board> list = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int category =  Integer.parseInt(board.getCategory());
		String option = board.getOption();
		String query = "";
		
		if(category != 0){
			switch(option){
			case "0" : query = "select * from board where BD_LOCATION = ? and BD_CATEGORY = ?"; break;
			case "1" : query = "select * from board where BD_LOCATION = ? and BD_CATEGORY = ? order by BD_COUNT desc"; break;
			case "2" : query = "select * from board where BD_LOCATION = ? and BD_CATEGORY = ? order by BD_STARPOINT desc"; break;
			case "3" : query = "select * from board where BD_LOCATION = ? and BD_CATEGORY = ? order by BD_ENROLLDATE desc"; break;
			case "4" : query = "select * from board where BD_LOCATION = ? and BD_CATEGORY = ? order by BD_COMMENT_COUNT desc"; break;
			}
		} else {
			switch(option){
			case "0" : query = "select * from board where BD_LOCATION = ?"; break;
			case "1" : query = "select * from board where BD_LOCATION = ? order by BD_COUNT desc"; break;
			case "2" : query = "select * from board where BD_LOCATION = ? order by BD_STARPOINT desc"; break;
			case "3" : query = "select * from board where BD_LOCATION = ? order by BD_ENROLLDATE desc"; break;
			case "4" : query = "select * from board where BD_LOCATION = ? order by BD_COMMENT_COUNT desc"; break;
			}
		}
		//String query = "select * from board where BD_LOCATION = ? ";//등록순으로 정렬하여 list에 담는다.
		
		boolean flag = true;
		try {
			pstmt = con.prepareStatement(query);
			if(category != 0){
				pstmt.setString(1, board.getLocation());
				pstmt.setString(2, board.getCategory());
			}else {
				pstmt.setString(1, board.getLocation());
			}
			
			rset = pstmt.executeQuery();
			
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
			close(pstmt);
		}
		
		return list;
	}
	
	public int insertComment(Connection con, Comment cmt) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into bd_comment values(?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, cmt.getCmWriter());
			pstmt.setInt(2, cmt.getCmBoardNo());
			pstmt.setString(3, cmt.getCmContent());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}
}
