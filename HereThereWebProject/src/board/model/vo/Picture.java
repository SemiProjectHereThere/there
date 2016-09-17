package board.model.vo;

public class Picture {

	private String originalName;
	private String reName;
	
	public Picture(){}

	public Picture(String originalName, String reName) {
		super();
		this.originalName = originalName;
		this.reName = reName;
	}

	public String getOriginalName() {
		return originalName;
	}

	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}

	public String getReName() {
		return reName;
	}

	public void setReName(String reName) {
		this.reName = reName;
	}
	
	@Override
	public String toString(){
		return originalName + ", " + reName;
	}
}
