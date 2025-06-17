package com.vinhnd.final_module3.repository;

import com.vinhnd.final_module3.entity.Product;
import com.vinhnd.final_module3.util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

public class ProductRepository implements IProductRepository{
    private static final String FIND_ALL_SEARCH =
            "select sp.*, sum(dhct.so_luong) as tong_sl_dat from san_pham sp  " +
                    "left join don_hang_chi_tiet dhct on sp.id = dhct.id_san_pham " +
                    "left join don_hang dh on dh.id = dhct.id_don_hang ";

    private static final String ADD_NEW =
            "insert into san_pham(ten, gia, giam_gia, ton_kho) values (?,?,?,?)";
    @Override
    public List<Product> findAllSearch(Date from, Date to, Integer top) {
        List<Product> productList = new ArrayList<>();
        String sql = FIND_ALL_SEARCH;

        if(from != null || to != null){
            sql += " where ";

            if(from != null){
                sql += " ngay_dat >= ? ";
            }

            if(to != null){
                if(from != null){
                    sql += " and ";
                }
                sql += " ngay_dat <= ? ";
            }
        }

        sql += " group by sp.id order by tong_sl_dat desc ";

        if(top != null){
            sql += " limit ? ";
        }

        try (Connection connection = DatabaseUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)){

            if(from != null){
                statement.setDate(1,  new java.sql.Date(from.getTime()));
                if(to != null){
                    statement.setDate(2,  new java.sql.Date(to.getTime()));
                    if(top != null) statement.setInt(3, top);
                }else{
                     if(top != null) statement.setInt(2, top);
                }
            }else{
                if(to != null){
                    statement.setDate(1,  new java.sql.Date(to.getTime()));
                    if(top != null) statement.setInt(2, top);
                }else{
                    if(top != null) statement.setInt(1, top);
                }
            }
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                Product product = new Product();
                product.setDiscount(resultSet.getFloat("giam_gia"));
                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("ten"));
                product.setStock(resultSet.getInt("ton_kho"));
                product.setPrice(resultSet.getInt("gia"));

                productList.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return productList;
    }

    @Override
    public void add(Product product) {
        try (Connection connection = DatabaseUtil.getConnection();
            PreparedStatement statement = connection.prepareStatement(ADD_NEW)){

            statement.setString(1, product.getName());
            statement.setInt(2, product.getPrice());
            statement.setFloat(3, product.getDiscount());
            statement.setInt(4, product.getStock());

            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
