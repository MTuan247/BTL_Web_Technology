package Model;

public class Product {

	private String productID;
	private String name;
	private String image;
	private String description;
	private float price;
	private float sale;
	private int available;
	private boolean isInCart = false;

	public Product() {

	}

	public Product(String productID, String name, float price) {
		this.productID = productID;
		this.name = name;
		this.price = price;
	}

	public Product(String productID, String name, String image, String description, float price, float sale,
			int available) {
		super();
		this.productID = productID;
		this.name = name;
		this.image = image;
		this.description = description;
		this.price = price;
		this.sale = sale;
		this.available = available;
	}

	public String getID() {
		return productID;
	}

	public void setID(String productID) {
		this.productID = productID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getProductID() {
		return productID;
	}

	public void setProductID(String productID) {
		this.productID = productID;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public float getSale() {
		return sale;
	}

	public void setSale(float sale) {
		this.sale = sale;
	}

	public boolean isInCart() {
		return isInCart;
	}

	public void setInCart(boolean isInCart) {
		this.isInCart = isInCart;
	}

	public int getAvailable() {
		return available;
	}

	public void setAvailable(int available) {
		this.available = available;
	}

}