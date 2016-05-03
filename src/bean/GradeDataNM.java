package bean;

public class GradeDataNM {

	private String id;
	private String name;
	private int java;
	private int web;
	private int fw;
	private String comm;
	
	public GradeDataNM(String id, String name, int java, int web, int fw, String comm) {
		this.id = id;
		this.name = name;
		this.java = java;
		this.web = web;
		this.fw = fw;
		this.comm = comm;
	}
	
	public GradeDataNM() {
	}

	public String getId() {
		return id;
	}
	
	public String getName() {
		return name;
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

	public void setName(String name) {
		this.name = name;
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

	@Override
	public String toString() {
		return "GradeDataNM [id=" + id + ", name=" + name + ", java=" + java + ", web=" + web + ", fw=" + fw + ", comm="
				+ comm + "]";
	}

	
}
