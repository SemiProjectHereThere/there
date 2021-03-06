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
	private String bdMap;				//게시글에 들어갈 지도 좌표 정보
	
	public Board(){}
	
	public Board(String bdLocation, String bdCategoey){
		super();
		this.bdLocation = bdLocation;
		this.bdCategory = bdCategoey;
	}

	public Board(String bdTitle, String bdContent, String bdWriter, String bdCategory, String bdLocation, String bdMap) {
		super();
		this.bdTitle = bdTitle;
		this.bdContent = bdContent;
		this.bdWriter = bdWriter;
		this.bdCategory = bdCategory;
		this.bdLocation = bdLocation;
		this.bdMap = bdMap;
	}

	public Board(String bdTitle, int bdNo, String bdContent, String bdCategory, String bdLocation, String bdMap) {
		super();
		this.bdTitle = bdTitle;
		this.bdNo = bdNo;
		this.bdContent = bdContent;
		this.bdCategory = bdCategory;
		this.bdLocation = bdLocation;
		this.bdMap = bdMap;
	}

	public Board(String bdTitle, int bdNo, String bdContent, String bdWriter, Date bdEnrollDate, String bdCategory,
			String bdLocation, int bdReadCnt, int bdCommentCnt, int bdStarPt, int bdShingoCnt, String bdMap) {
		super();
		this.bdTitle = bdTitle;
		this.bdNo = bdNo;
		this.bdContent = bdContent;
		this.bdWriter = bdWriter;
		this.bdEnrollDate = bdEnrollDate;
		this.bdCategory = bdCategory;
		this.bdLocation = bdLocation;
		this.bdReadCnt = bdReadCnt;
		this.bdCommentCnt = bdCommentCnt;
		this.bdStarPt = bdStarPt;
		this.bdShingoCnt = bdShingoCnt;
		this.bdMap = bdMap;
	}

	public Board(String bdLocation) {
		super();
		this.bdLocation = bdLocation;
	}

	public Board(int bdNo, int bdStarPt, String bdWriter) {
		super();
		this.bdNo = bdNo;
		this.bdStarPt = bdStarPt;
		this.bdWriter = bdWriter;
	}

	public Board(int bdNo) {
		super();
		this.bdNo = bdNo;
	}

	public String getBdTitle() {
		return bdTitle;
	}

	public void setBdTitle(String bdTitle) {
		this.bdTitle = bdTitle;
	}

	public int getBdNo() {
		return bdNo;
	}

	public void setBdNo(int bdNo) {
		this.bdNo = bdNo;
	}

	public String getBdContent() {
		return bdContent;
	}

	public void setBdContent(String bdContent) {
		this.bdContent = bdContent;
	}

	public String getBdWriter() {
		return bdWriter;
	}

	public void setBdWriter(String bdWriter) {
		this.bdWriter = bdWriter;
	}

	public Date getBdEnrollDate() {
		return bdEnrollDate;
	}

	public void setBdEnrollDate(Date bdEnrollDate) {
		this.bdEnrollDate = bdEnrollDate;
	}

	public String getBdCategory() {
		return bdCategory;
	}

	public void setBdCategory(String bdCategory) {
		this.bdCategory = bdCategory;
	}

	public String getBdLocation() {
		return bdLocation;
	}

	public void setBdLocation(String bdLocation) {
		this.bdLocation = bdLocation;
	}

	public int getBdReadCnt() {
		return bdReadCnt;
	}

	public void setBdReadCnt(int bdReadCnt) {
		this.bdReadCnt = bdReadCnt;
	}

	public int getBdCommentCnt() {
		return bdCommentCnt;
	}

	public void setBdCommentCnt(int bdCommentCnt) {
		this.bdCommentCnt = bdCommentCnt;
	}

	public int getBdStarPt() {
		return bdStarPt;
	}

	public void setBdStarPt(int bdStarPt) {
		this.bdStarPt = bdStarPt;
	}

	public int getBdShingoCnt() {
		return bdShingoCnt;
	}

	public void setBdShingoCnt(int bdShingoCnt) {
		this.bdShingoCnt = bdShingoCnt;
	}

	public String getBdMap() {
		return bdMap;
	}

	public void setBdMap(String bdMap) {
		this.bdMap = bdMap;
	}

	@Override
	public String toString() {
		return bdTitle + ", " + bdNo + ", " + bdContent + ", " + bdWriter
				+ ", " + bdEnrollDate + ", " + bdCategory + ", " + bdLocation
				+ ", " + bdReadCnt + ", " + bdCommentCnt + ", " + bdStarPt
				+ ", " + bdShingoCnt + ", " + bdMap;
	}

}
