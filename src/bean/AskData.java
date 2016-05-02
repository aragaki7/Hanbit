package bean;

import java.sql.Date;
import java.sql.Timestamp;

public class AskData {

	private int num;
	private String name;
	private String title;
	private String content;
	private Date date;
	private Timestamp time;

	public AskData(int num, String name, String title, Date date, Timestamp time) {
		this.num = num;
		this.name = name;
		this.title = title;
		this.date = date;
		this.time = time;
	}

	/**
	 * Ask num
	 * 
	 * {@link AskData}
	 * 
	 * @int
	 */

	public int getNum() {
		return num;
	}

	/**
	 * Ask id {@link AskData}
	 * 
	 * @String
	 */

	public String getId() {
		return name;
	}

	/**
	 * Ask time {@link AskData}
	 * 
	 * @Date
	 */

	public Timestamp getTime() {
		return time;
	}

	/**
	 * Ask content {@link AskData}
	 * 
	 * @date
	 */

	public String getContent() {
		return content;
	}

	/**
	 * Ask data {@link AskData}
	 * 
	 * @Date
	 */

	public Date getDate() {
		return date;
	}

	/**
	 * Ask title {@link AskData}
	 * 
	 * @String
	 */

	public String getTitle() {
		return title;
	}


}
