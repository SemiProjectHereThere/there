package board.model.vo;

import java.util.*;

public class BoardS {
	private String location;
	private String category;
	private String option;
	
	public BoardS(){}
	
	public BoardS(String location, String category, String option){
		super();
		this.location = location;
		this.category = category;
		this.option = option;
	}
	public BoardS(String category, String option){
		super();
		this.category = category;
		this.option = option;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}
	
}
