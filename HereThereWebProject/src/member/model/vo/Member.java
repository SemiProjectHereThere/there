package member.model.vo;

import java.sql.Date;

public class Member implements java.io.Serializable{
	public Member(){}
	
	private String memberId; //회원의 아이디
	private String memberPwd; //회원의 비밀번호
	private String memberName; //회원의 이름
	private String email; //회원의 이메일
	private char gender; //회원의 성별
	private Date birthday; //회원의 생년월일
	private String phone; //회원의 전화번호
	private Date joinDate;  //회원의 가입날짜
	private char managerYN; //회원의 매니저 여부
	private String originalCoverName; //회원 원래 커버사진이름
	private String renameCoverName;	//새로 지은 회원 커버사진이름
	private String originalProfileName; //회원 원래 프로필사진이름
	private String renameProfileName;	//새로 지은 회원 프로필사진이름
	
	
	
	public Member(String memberId, String memberPwd, String memberName, String email, char gender, Date birthday,
			String phone) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.email = email;
		this.gender = gender;
		this.birthday = birthday;
		this.phone = phone;
	}

	public Member(String memberId, String memberPwd, String memberName, String email, char gender, Date birthday,
			String phone, Date joinDate, char managerYN) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.email = email;
		this.gender = gender;
		this.birthday = birthday;
		this.phone = phone;
		this.joinDate = joinDate;
		this.managerYN = managerYN;
	}

	public Member(String memberId, String originalCoverName, String renameCoverName) {
		super();
		this.memberId = memberId;
		this.originalCoverName = originalCoverName;
		this.renameCoverName = renameCoverName;
	}

	public String getOriginalCoverName() {
		return originalCoverName;
	}

	public void setOriginalCoverName(String originalCoverName) {
		this.originalCoverName = originalCoverName;
	}

	public String getRenameCoverName() {
		return renameCoverName;
	}

	public void setRenameCoverName(String renameCoverName) {
		this.renameCoverName = renameCoverName;
	}

	public String getOriginalProfileName() {
		return originalProfileName;
	}

	public void setOriginalProfileName(String originalProfileName) {
		this.originalProfileName = originalProfileName;
	}

	public String getRenameProfileName() {
		return renameProfileName;
	}

	public void setRenameProfileName(String renameProfileName) {
		this.renameProfileName = renameProfileName;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public char getManagerYN() {
		return managerYN;
	}

	public void setManagerYN(char managerYN) {
		this.managerYN = managerYN;
	}

	@Override
	public String toString() {
		return memberId + ", " + memberPwd + ", " + memberName + ", "
				+ email + "," + gender + ", " + birthday + ", " + phone + ", "
				+ joinDate + ", " + managerYN;
	}
	
	
}
