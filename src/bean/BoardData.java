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

	public BoardData(int num, String name, String title, Date date, Timestamp time, int count) {
		this.num = num;
		this.name = name;
		this.title = title;
		this.date = date;
		this.time = time;
		this.count = count;
	}

	/**
	 * Board num
	 * 
	 * {@link BoardData}
	 * 
	 * @int
	 */

	public int getNum() {
		return num;
	}

	/**
	 * Board id {@link BoardData}
	 * 
	 * @String
	 */

	public String getId() {
		return name;
	}

	/**
	 * Board time {@link BoardData}
	 * 
	 * @Date
	 */

	public Timestamp getTime() {
		return time;
	}

	/**
	 * Board content {@link BoardData}
	 * 
	 * @date
	 */

	public String getContent() {
		return content;
	}

	/**
	 * Board data {@link BoardData}
	 * 
	 * @Date
	 */

	public Date getDate() {
		return date;
	}

	/**
	 * Board title {@link BoardData}
	 * 
	 * @String
	 */

	public String getTitle() {
		return title;
	}

	/**
	 * Board count {@link BoardData}
	 * 
	 * @int
	 */

	public int getCount() {
		return count;
	}

}
