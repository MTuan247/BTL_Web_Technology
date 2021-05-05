package Model;

public class Category {
	private int categoryID;
	private String Name;

	public Category(int categoryID, String name) {
		super();
		this.categoryID = categoryID;
		Name = name;
	}

	public int getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

}
