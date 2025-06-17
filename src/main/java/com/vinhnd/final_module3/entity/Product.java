package com.vinhnd.final_module3.entity;

public class Product {
    private int id;
    private String name;
    private int price;
    private float discount;
    private int stock;

    public Product() {
    }

    public Product(int id, String name, int price, float discount, int stock) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.discount = discount;
        this.stock = stock;
    }

    public Product( String name, int price, float discount, int stock) {
        this.name = name;
        this.price = price;
        this.discount = discount;
        this.stock = stock;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
}
