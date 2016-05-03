package bean;

public class GreadeData {

	private String id;
	private int java;
	private int web;
	private int fw;
	private String comm;
	
	public GreadeData(String id, int java, int web, int fw, String comm) {
		this.id = id;
		this.java = java;
		this.web = web;
		this.fw = fw;
		this.comm = comm;
	}
	
	public String getId() {
		return id;
	}

	public int getJava() {
		return java;
	}

	public int getWeb() {
		return web;
	}

	public int getFw() {
		return fw;
	}

	public String getComm() {
		return comm;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setJava(int java) {
		this.java = java;
	}

	public void setWeb(int web) {
		this.web = web;
	}

	public void setFw(int fw) {
		this.fw = fw;
	}

	public void setComm(String comm) {
		this.comm = comm;
	}

	
}
