package member.model.vo;

import java.sql.Date;

public class Member implements java.io.Serializable{
	public Member(){}
	
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String email;
	private char gender;
	private Date birthday;
	private String phone;
	private Date joinDate;
	private char managerYN;
	
	
	
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
