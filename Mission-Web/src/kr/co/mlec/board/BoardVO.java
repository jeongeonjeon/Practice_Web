package kr.co.mlec.board;

/*
 * 자바빈즈 클래스(VO클래스)
 */

public class BoardVO {
	
	private int no;
	private String title;
	private String writer;
	public BoardVO() {
		super();
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	
	

}
