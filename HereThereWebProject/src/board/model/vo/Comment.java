package board.model.vo;

public class Comment implements java.io.Serializable{
	private int cmBoardNo;			//댓글이 쓰여진 게시글의 번호
	private String cmWriter;		//댓글 작성자
	private String cmContent;		//댓글의 내용
	private int cmNo;				//댓글의 기본키
	
	public Comment(){}

	public Comment(int cmBoardNo, String cmWriter, String cmContent) {
		super();
		this.cmBoardNo = cmBoardNo;
		this.cmWriter = cmWriter;
		this.cmContent = cmContent;
	}

	public Comment(int cmBoardNo, String cmWriter, String cmContent, int cmNo) {
		super();
		this.cmBoardNo = cmBoardNo;
		this.cmWriter = cmWriter;
		this.cmContent = cmContent;
		this.cmNo = cmNo;
	}

	public int getCmBoardNo() {
		return cmBoardNo;
	}

	public void setCmBoardNo(int cmBoardNo) {
		this.cmBoardNo = cmBoardNo;
	}

	public String getCmWriter() {
		return cmWriter;
	}

	public void setCmWriter(String cmWriter) {
		this.cmWriter = cmWriter;
	}

	public String getCmContent() {
		return cmContent;
	}

	public void setCmContent(String cmContent) {
		this.cmContent = cmContent;
	}

	public int getCmNo() {
		return cmNo;
	}

	public void setCmNo(int cmNo) {
		this.cmNo = cmNo;
	}

	@Override
	public String toString() {
		return cmBoardNo + ", " + cmWriter + ", " + cmContent + ", "
				+ cmNo;
	}
	
	
	
	
}
