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

	public UserData(String id, String name, String post, String main_address, String sub_address, String sex,
			String phone, String mobile, String email) {
		this.id = id;
		this.name = name;
		this.post = post;
		this.main_address = main_address;
		this.sub_address = sub_address;
		this.sex = sex;
		this.phone = phone;
		this.mobile = mobile;
		this.email = email;
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
}
