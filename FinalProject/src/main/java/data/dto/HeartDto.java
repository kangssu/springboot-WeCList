package data.dto;

import org.apache.ibatis.type.Alias;

@Alias("hdto")
public class HeartDto {
	private String class_heart;
	private String idx;
	private String num;
	
	
	
	@Override
	public String toString() {
		return "HeartDto [class_heart=" + class_heart + ", idx=" + idx + ", num=" + num + "]";
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	
	public String getClass_heart() {
		return class_heart;
	}
	public void setClass_heart(String class_heart) {
		this.class_heart = class_heart;
	}
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
}
