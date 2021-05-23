package Model;

public class OrderProduct {
    private String orderProductID;
    private String orderID;
    private String productID;
    private int num;

    public OrderProduct() {
    }

    public OrderProduct(String orderID, String productID, int num) {
        this.orderID = orderID;
        this.productID = productID;
        this.num = num;
    }

    public OrderProduct(String orderProductID, String orderID, String productID, int num) {
        this.orderProductID = orderProductID;
        this.orderID = orderID;
        this.productID = productID;
        this.num = num;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getOrderProductID() {
        return orderProductID;
    }

    public void setOrderProductID(String orderProductID) {
        this.orderProductID = orderProductID;
    }
}
