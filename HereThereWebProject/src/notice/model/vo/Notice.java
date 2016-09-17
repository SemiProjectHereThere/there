package notice.model.vo;

import java.sql.Date;

public class Notice implements java.io.Serializable{
	private int noticeNo;
	private String noticeTitle;
	private String noticeWriter;
	private String noticeContent;
	private Date noticeDate;
	private int countView;
	
	public Notice() {
		super();
	}

	public Notice(String noticeWriter, String noticeTitle, String noticeContent) {
		super();
		this.noticeWriter = noticeWriter;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
	}

	public Notice(int noticeNo, String noticeTitle, String noticeWriter, String noticeContent, Date noticeDate,
			int countView) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeWriter = noticeWriter;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.countView = countView;
	}

	public Notice(int noticeNo, String noticeTitle, String noticeContent) {
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public int getCountView() {
		return countView;
	}

	public void setCountView(int countView) {
		this.countView = countView;
	}
	
	
}
