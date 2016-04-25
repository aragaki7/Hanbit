package bean;

import java.sql.Date;

public class BoardData {

	private int num;
	private String id;
	private String title;
	private String content;
	private Date data;
	private Date time;
	private int count;

	public BoardData(int num, String id, String title, String content, Date data, Date time, int count) {
		this.num = num;
		this.id = id;
		this.title = title;
		this.content = content;
		this.data = data;
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
		return id;
	}

	/**
	 * Board time {@link BoardData}
	 * 
	 * @Date
	 */

	public Date getTime() {
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

	public Date getData() {
		return data;
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