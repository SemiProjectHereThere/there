package board.model.vo;

import java.sql.Date;
import java.util.ArrayList;

public class Board implements java.io.Serializable{
	
	private String bdTitle;			//게시글의 제목
	private int bdNo;				//각각의 게시글을 구별하는 게시글번호
	private String bdContent;		//게시글의 내용
	private String bdWriter;		//게시글 작성자의 아이디
	private Date bdEnrollDate;		//게시글 작성날짜
	private String bdCategory;		//게시글의 분류
	private String bdLocation;		//게시글의 지역
	private int bdReadCnt;			//게시글의 조회수
	private int bdCommentCnt;		//게시글의 댓글 갯수
	private int bdStarPt;			//게시글의 별점
	private int bdShingoCnt;		//게시글에 대한 신고 횟수
	private ArrayList<String> mapX;			//게시글에 들어갈 맵 x 좌표 리스트
	private ArrayList<String> mapY;			//게시글에 들어갈 맵 y 좌표 리스트 
	
	public Board(){}

	public Board(String bdTitle, String bdContent, String bdWriter, String bdCategory, String bdLocation,
			ArrayList mapX, ArrayList mapY) {
		super();
		this.bdTitle = bdTitle;
		this.bdContent = bdContent;
		this.bdWriter = bdWriter;
		this.bdCategory = bdCategory;
		this.bdLocation = bdLocation;
		mapX = new ArrayList<String>();
		mapY = new ArrayList<String>();
	}

	
	
	

	
	
	
	
	

}
