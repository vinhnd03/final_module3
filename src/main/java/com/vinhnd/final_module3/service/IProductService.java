package com.vinhnd.final_module3.service;

import com.vinhnd.final_module3.entity.Product;

import java.util.Date;
import java.util.List;

public interface IProductService {
    List<Product> findAllSearch(Date from, Date to, Integer top);

    void add(Product product);
}
