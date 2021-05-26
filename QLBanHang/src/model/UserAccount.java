package model;

public class UserAccount {
	private String userID;
	private String name;
	private String username;
	private String password;
	private String tel;
	private String email;
	private boolean isAdmin;

	public UserAccount() {

	}
	
	public UserAccount(String userID, String name, String username, String password, String tel, String email) {
		super();
		this.userID = userID;
		this.name = name;
		this.username = username;
		this.password = password;
		this.tel = tel;
		this.email = email;
	}

	public UserAccount(String userID, String name, String username, String password) {
		this.userID = userID;
		this.name = name;
		this.username = username;
		this.password = password;
	}

	public UserAccount(String username, String password) {
		this.username = username;
		this.password = password;
	}

	public String getUserName() {
		return username;
	}

	public void setUserName(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
	
	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}