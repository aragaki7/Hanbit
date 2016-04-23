package bean;

public class GreadeData {

	private String id;
	private int java;
	private int web;
	private int fw;

	public GreadeData(String id, int java, int web, int fw) {
		this.id = id;
		this.java = java;
		this.web = web;
		this.fw = fw;
	}

	/**
	 * Greade id
	 * 
	 * @String
	 */

	public String getId() {
		return id;
	}

	/**
	 * Greade java
	 * 
	 * @int
	 */

	public int getJava() {
		return java;
	}

	/**
	 * Greade web
	 * 
	 * @int
	 */

	public int getWeb() {
		return web;
	}

	/**
	 * Greade fw
	 * 
	 * @int
	 */

	public int getFw() {
		return fw;
	}
}
