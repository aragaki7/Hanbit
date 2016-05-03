package bean;

import java.sql.Date;
import java.sql.Timestamp;

public class BoardData {

	private int num;
	private String name;
	private String title;
	private String content;
	private Date date;
	private Timestamp time;
	private int count;
 
	public BoardData() {
		// TODO Auto-generated constructor stub
	}
	
	public BoardData(int num, String name, String title, Date date, Timestamp time, int count) {
		this.num = num;
		this.name = name;
		this.title = title;
		this.date = date;
		this.time = time;
		this.count = count;
	}

	public BoardData(int num, String name, String title, String content, Date date, Timestamp time, int count) {
		this.num = num;
		this.name = name;
		this.title = title;
		this.content = content;
		this.date = date;
		this.time = time;
		this.count = count;
	}
	
	public int getNum() {
		return num;
	}  

	public String getName() {
		return name;
	}

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}

	public Date getDate() {
		return date;
	}

	public Timestamp getTime() {
		return time;
	}

	public int getCount() {
		return count;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "BoardData [num=" + num + ", name=" + name + ", title=" + title + ", content=" + content + ", date="
				+ date + ", time=" + time + ", count=" + count + "]";
	}


}
