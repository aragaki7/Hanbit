package bean;

import java.sql.Date;
import java.sql.Timestamp;

public class BoardComm {
	private int num;
	private String id;
	private String content;
	private Date date;
	private Timestamp time;
	private int idx_fk;
	
	public BoardComm() {
	}
	public BoardComm(int num, String id, String content, Date date,
			Timestamp time, int idx_fk) {
		this.num = num;
		this.id = id;
		this.content = content;
		this.date = date;
		this.time = time;
		this.idx_fk = idx_fk;
	}
	public int getNum() {
		return num;
	}
	public String getId() {
		return id;
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
	public int getIdx_fk() {
		return idx_fk;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setId(String id) {
		this.id = id;
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
	public void setIdx_fk(int idx_fk) {
		this.idx_fk = idx_fk;
	}
	
	@Override
	public String toString() {
		return "BoardComm [num=" + num + ", id=" + id + ", content=" + content
				+ ", date=" + date + ", time=" + time + ", idx_fk=" + idx_fk
				+ "]";
	}
}
