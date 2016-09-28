package admin.model.vo;

public class Admin {

	private String adminId;
	private String originalName;
	private String renameName;
	private String originalMainName; //원래 메인사진이름
	private String renameMainName;	//새로 지은 메인사진이름
	private String originalMain2Name;
	private String renameMain2Name;
	private String originalSeoulName; //원래 메인사진이름
	private String renameSeoulName;	//새로 지은 메인사진이름
	private String originalDaejeonName; //원래 메인사진이름
	private String renameDaejeonName;	//새로 지은 메인사진이름
	private String originalGwangjuName; //원래 메인사진이름
	private String renameGwangjuName;	//새로 지은 메인사진이름
	private String originalBusanName; //원래 메인사진이름
	private String renameBusanName;	//새로 지은 메인사진이름
	private String originalUlsanName; //원래 메인사진이름
	private String renameUlsanName;	//새로 지은 메인사진이름
	private String originalDaeguName; //원래 메인사진이름
	private String renameDaeguName;	//새로 지은 메인사진이름
	private String originalJejuName; //원래 메인사진이름
	private String renameJejuName;	//새로 지은 메인사진이름
	private String originalIncheonName; //원래 메인사진이름
	private String renameIncheonName;	//새로 지은 메인사진이름
	private char cp;
	
	
	public Admin(){}

	public Admin(String adminId, String originalName, String renameName, String originalMainName, String renameMainName,
			String originalMain2Name, String renameMain2Name, String originalSeoulName, String renameSeoulName,
			String originalDaejeonName, String renameDaejeonName, String originalGwangjuName, String renameGwangjuName,
			String originalBusanName, String renameBusanName, String originalUlsanName, String renameUlsanName,
			String originalDaeguName, String renameDaeguName, String originalJejuName, String renameJejuName,
			String originalIncheonName, String renameIncheonName, char cp) {
		super();
		this.adminId = adminId;
		this.originalName = originalName;
		this.renameName = renameName;
		this.originalMainName = originalMainName;
		this.renameMainName = renameMainName;
		this.originalMain2Name = originalMain2Name;
		this.renameMain2Name = renameMain2Name;
		this.originalSeoulName = originalSeoulName;
		this.renameSeoulName = renameSeoulName;
		this.originalDaejeonName = originalDaejeonName;
		this.renameDaejeonName = renameDaejeonName;
		this.originalGwangjuName = originalGwangjuName;
		this.renameGwangjuName = renameGwangjuName;
		this.originalBusanName = originalBusanName;
		this.renameBusanName = renameBusanName;
		this.originalUlsanName = originalUlsanName;
		this.renameUlsanName = renameUlsanName;
		this.originalDaeguName = originalDaeguName;
		this.renameDaeguName = renameDaeguName;
		this.originalJejuName = originalJejuName;
		this.renameJejuName = renameJejuName;
		this.originalIncheonName = originalIncheonName;
		this.renameIncheonName = renameIncheonName;
		this.cp = cp;
	}





	public Admin(String adminId, String originalName, String renameName, char cp) {
		super();
		this.adminId = adminId;
		this.originalName = originalName;
		this.renameName = renameName;
		this.cp = cp;
	}

	
	public String getOriginalMain2Name() {
		return originalMain2Name;
	}

	public void setOriginalMain2Name(String originalMain2Name) {
		this.originalMain2Name = originalMain2Name;
	}

	public String getRenameMain2Name() {
		return renameMain2Name;
	}

	public void setRenameMain2Name(String renameMain2Name) {
		this.renameMain2Name = renameMain2Name;
	}

	public String getAdminId() {
		return adminId;
	}


	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}


	public String getOriginalName() {
		return originalName;
	}


	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}


	public String getRenameName() {
		return renameName;
	}


	public void setRenameName(String renameName) {
		this.renameName = renameName;
	}


	public String getOriginalMainName() {
		return originalMainName;
	}


	public void setOriginalMainName(String originalMainName) {
		this.originalMainName = originalMainName;
	}


	public String getRenameMainName() {
		return renameMainName;
	}


	public void setRenameMainName(String renameMainName) {
		this.renameMainName = renameMainName;
	}


	public String getOriginalSeoulName() {
		return originalSeoulName;
	}


	public void setOriginalSeoulName(String originalSeoulName) {
		this.originalSeoulName = originalSeoulName;
	}


	public String getRenameSeoulName() {
		return renameSeoulName;
	}


	public void setRenameSeoulName(String renameSeoulName) {
		this.renameSeoulName = renameSeoulName;
	}


	public String getOriginalDaejeonName() {
		return originalDaejeonName;
	}


	public void setOriginalDaejeonName(String originalDaejeonName) {
		this.originalDaejeonName = originalDaejeonName;
	}


	public String getRenameDaejeonName() {
		return renameDaejeonName;
	}


	public void setRenameDaejeonName(String renameDaejeonName) {
		this.renameDaejeonName = renameDaejeonName;
	}


	public String getOriginalGwangjuName() {
		return originalGwangjuName;
	}


	public void setOriginalGwangjuName(String originalGwangjuName) {
		this.originalGwangjuName = originalGwangjuName;
	}


	public String getRenameGwangjuName() {
		return renameGwangjuName;
	}


	public void setRenameGwangjuName(String renameGwangjuName) {
		this.renameGwangjuName = renameGwangjuName;
	}


	public String getOriginalBusanName() {
		return originalBusanName;
	}


	public void setOriginalBusanName(String originalBusanName) {
		this.originalBusanName = originalBusanName;
	}


	public String getRenameBusanName() {
		return renameBusanName;
	}


	public void setRenameBusanName(String renameBusanName) {
		this.renameBusanName = renameBusanName;
	}


	public String getOriginalUlsanName() {
		return originalUlsanName;
	}


	public void setOriginalUlsanName(String originalUlsanName) {
		this.originalUlsanName = originalUlsanName;
	}


	public String getRenameUlsanName() {
		return renameUlsanName;
	}


	public void setRenameUlsanName(String renameUlsanName) {
		this.renameUlsanName = renameUlsanName;
	}


	public String getOriginalDaeguName() {
		return originalDaeguName;
	}


	public void setOriginalDaeguName(String originalDaeguName) {
		this.originalDaeguName = originalDaeguName;
	}


	public String getRenameDaeguName() {
		return renameDaeguName;
	}


	public void setRenameDaeguName(String renameDaeguName) {
		this.renameDaeguName = renameDaeguName;
	}


	public String getOriginalJejuName() {
		return originalJejuName;
	}


	public void setOriginalJejuName(String originalJejuName) {
		this.originalJejuName = originalJejuName;
	}


	public String getRenameJejuName() {
		return renameJejuName;
	}


	public void setRenameJejuName(String renameJejuName) {
		this.renameJejuName = renameJejuName;
	}


	public String getOriginalIncheonName() {
		return originalIncheonName;
	}


	public void setOriginalIncheonName(String originalIncheonName) {
		this.originalIncheonName = originalIncheonName;
	}


	public String getRenameIncheonName() {
		return renameIncheonName;
	}


	public void setRenameIncheonName(String renameIncheonName) {
		this.renameIncheonName = renameIncheonName;
	}


	public char getCp() {
		return cp;
	}


	public void setCp(char cp) {
		this.cp = cp;
	}
	
	
	
	
	
}
