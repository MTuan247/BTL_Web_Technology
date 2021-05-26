package Model;

public class UserAccount {
	private String userID;
	private String Name;
	private String userName;
	private String password;
	private boolean isAdmin;

	public UserAccount() {

	}

	public UserAccount(String userID, String name, String userName, String password) {
		this.userID = userID;
		this.Name = name;
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
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
	
	

}