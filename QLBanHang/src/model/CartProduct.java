package model;

public class CartProduct extends Product {
	private int num = 1;

	public CartProduct(String productID, String name, String image, String description, float price, float sale,
			int available) {
		super(productID, name, image, description, price, sale, available);
		// TODO Auto-generated constructor stub
	}

	public CartProduct(String productID, String name, String image, String description, float price, float sale,
			int available, int num) {
		super(productID, name, image, description, price, sale, available);
		this.num = num;
	}
	
	public CartProduct() {
		// TODO Auto-generated constructor stub
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	
	
}
