package Model;

public class UserAccount {
	private String userID;
	private String name;
	private String userName;
	private String password;
	private String tel;
	private String email;
	private boolean isAdmin;

	public UserAccount() {

	}
	
	

	public UserAccount(String userID, String name, String userName, String password, String tel, String email) {
		super();
		this.userID = userID;
		this.name = name;
		this.userName = userName;
		this.password = password;
		this.tel = tel;
		this.email = email;
	}



	public UserAccount(String userID, String name, String userName, String password) {
		this.userID = userID;
		this.name = name;
		this.userName = userName;
		this.password = password;
	}

	public UserAccount(String userName, String password) {
		this.userName = userName;
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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