package bean;

import java.sql.Date;
import java.sql.Timestamp;

public class NoticeData {

	private int num;
	private String name;
	private String title;
	private String content;
	private Date data;
	private Timestamp time;
	private int count;

	public NoticeData(int num, String name, String title, Date data, Timestamp time, int count) {
		this.num = num;
		this.name = name;
		this.title = title;
		this.data = data;
		this.time = time;
		this.count = count;
	}

	/**
	 * Board num
	 * 
	 * {@link NoticeData}
	 * 
	 * @int
	 */

	public int getNum() {
		return num;
	}

	/**
	 * Board id {@link NoticeData}
	 * 
	 * @String
	 */

	public String getId() {
		return name;
	}

	/**
	 * Board time {@link NoticeData}
	 * 
	 * @Date
	 */

	public Timestamp getTime() {
		return time;
	}

	/**
	 * Board content {@link NoticeData}
	 * 
	 * @date
	 */

	public String getContent() {
		return content;
	}

	/**
	 * Board data {@link NoticeData}
	 * 
	 * @Date
	 */

	public Date getData() {
		return data;
	}

	/**
	 * Board title {@link NoticeData}
	 * 
	 * @String
	 */

	public String getTitle() {
		return title;
	}

	/**
	 * Board count {@link NoticeData}
	 * 
	 * @int
	 */

	public int getCount() {
		return count;
	}

}