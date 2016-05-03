package bean;

public class UserDataGrade {

	private String id;
	private String name;
	private String post;
	private String main_address;
	private String sub_address;
	private String sex;
	private String phone;
	private String mobile;
	private String email;
	private String classs;
	private int java;
	private int web;
	private int fw;
	public String getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getPost() {
		return post;
	}
	public String getMain_address() {
		return main_address;
	}
	public String getSub_address() {
		return sub_address;
	}
	public String getSex() {
		return sex;
	}
	public String getPhone() {
		return phone;
	}
	public String getMobile() {
		return mobile;
	}
	public String getEmail() {
		return email;
	}
	public String getClasss() {
		return classs;
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
	public void setId(String id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public void setMain_address(String main_address) {
		this.main_address = main_address;
	}
	public void setSub_address(String sub_address) {
		this.sub_address = sub_address;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setClasss(String classs) {
		this.classs = classs;
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
	public UserDataGrade(String id, String name, String post, String main_address, String sub_address, String sex,
			String phone, String mobile, String email, String classs, int java, int web, int fw) {
		super();
		this.id = id;
		this.name = name;
		this.post = post;
		this.main_address = main_address;
		this.sub_address = sub_address;
		this.sex = sex;
		this.phone = phone;
		this.mobile = mobile;
		this.email = email;
		this.classs = classs;
		this.java = java;
		this.web = web;
		this.fw = fw;
	}
	public UserDataGrade(){
		
	}
	}
