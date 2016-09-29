package board.model.vo;

public class Favorite implements java.io.Serializable{
	private String favoriteMbId; 	//게시글을 찜한 회원의 아이디
	private int favoriteBdNo;		//찜한 게시글의 번호
	private int favoriteNo;			//찜 테이블의 고유 번호
	
	public Favorite(){}

	public Favorite(String favoriteMbId, int favoriteBdNo, int favoriteNo) {
		super();
		this.favoriteMbId = favoriteMbId;
		this.favoriteBdNo = favoriteBdNo;
		this.favoriteNo = favoriteNo;
	}

	public String getFavoriteMbId() {
		return favoriteMbId;
	}

	public void setFavoriteMbId(String favoriteMbId) {
		this.favoriteMbId = favoriteMbId;
	}

	public int getFavoriteBdNo() {
		return favoriteBdNo;
	}

	public void setFavoriteBdNo(int favoriteBdNo) {
		this.favoriteBdNo = favoriteBdNo;
	}

	public int getFavoriteNo() {
		return favoriteNo;
	}

	public void setFavoriteNo(int favoriteNo) {
		this.favoriteNo = favoriteNo;
	}

	@Override
	public String toString() {
		return favoriteMbId + ", " + favoriteBdNo + ", "
				+ favoriteNo;
	}
	
	
}
