package bean;

public class UserData {

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
	
	@Override
	public String toString() {
		return "UserData [id=" + id + ", name=" + name + ", post=" + post + ", main_address=" + main_address
				+ ", sub_address=" + sub_address + ", sex=" + sex + ", phone=" + phone + ", mobile=" + mobile
				+ ", email=" + email + ", classs=" + classs + "]";
	}

	public UserData(){
		
	}
	public UserData(String id, String name, String post, String main_address, String sub_address, String sex,
			String phone, String mobile, String email, String classs) {
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
	}

	/**
	 * User Id
	 * 
	 * @String
	 */

	public String getId() {
		return id;
	}

	/**
	 * User Name
	 * 
	 * @String
	 */
	public String getName() {
		return name;
	}

	/**
	 * User address post
	 * 
	 * @String
	 */
	public String getPost() {
		return post;
	}

	/**
	 * User Main address
	 * 
	 * @String
	 */
	public String getMain_address() {
		return main_address;
	}

	/**
	 * User sub address
	 * 
	 * @String
	 */
	public String getSub_address() {
		return sub_address;
	}

	/**
	 * User Email
	 * 
	 * @String
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * User Mobile
	 * 
	 * @String
	 */
	public String getMobile() {
		return mobile;
	}

	/**
	 * User Phone
	 * 
	 * @String
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * User Sex
	 * 
	 * @String
	 */
	public String getSex() {
		return sex;
	}

	/**
	 * User Class
	 * 
	 * @String
	 */
	public String getClasss() {
		return classs;
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
}
