package com.vinhnd.final_module3.service;

import com.vinhnd.final_module3.entity.Product;
import com.vinhnd.final_module3.repository.IProductRepository;
import com.vinhnd.final_module3.repository.ProductRepository;

import java.util.Date;
import java.util.List;

public class ProductService implements IProductService{
    private IProductRepository repository = new ProductRepository();

    @Override
    public List<Product> findAllSearch(Date from, Date to, Integer top) {
        return repository.findAllSearch(from, to, top);
    }

    @Override
    public void add(Product product) {
        repository.add(product);
    }
}
