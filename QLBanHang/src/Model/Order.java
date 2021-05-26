package Model;

public class Order {
    private String orderID;
    private String userID;
    private String fullName;
    private String phoneNumber;
    private String address;
    private double totalMoney;
    private boolean status;
    private String createdDate;

    public Order() {
    }

    public Order(String userID, String fullName, String phoneNumber, String address, double totalMoney, boolean status, String createdDate) {
        this.userID = userID;
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.totalMoney = totalMoney;
        this.status = status;
        this.createdDate = createdDate;
    }

    public Order(String orderID, String userID, String fullName, String phoneNumber, String address, double totalMoney, boolean status, String createdDate) {
        this.orderID = orderID;
        this.userID = userID;
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.totalMoney = totalMoney;
        this.status = status;
        this.createdDate = createdDate;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }
}
